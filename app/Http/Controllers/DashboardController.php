<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\Models\DigitalProduct;
use App\Models\User;

class DashboardController extends Controller
{
    public function beranda()
    {
        $user = Auth::user();

        // Debug: Log user ID
        \Log::info('Dashboard - Calculating earnings for user ID: ' . $user->id);

        // Ambil produk digital milik user
        $digitalProducts = DigitalProduct::where('user_id', $user->id)->get();
        $totalProducts = $digitalProducts->count();

        // Ambil semua transaksi untuk debugging
        $allTransactions = DB::table('transactions')
            ->join('digital_products', 'transactions.product_id', '=', 'digital_products.id')
            ->where('digital_products.user_id', $user->id)
            ->select('transactions.*', 'digital_products.title')
            ->get();

        // Log semua transaksi (termasuk yang tidak success)
        \Log::info('Dashboard - All transactions for user:');
        foreach ($allTransactions as $transaction) {
            \Log::info("Transaction ID: {$transaction->id}, Status: {$transaction->status}, Amount: {$transaction->total_price}, Product: {$transaction->title}, Created: {$transaction->created_at}");
        }

        // Ambil total views dan clicks berdasarkan link_id (username)
        $totalViews = DB::table('link_views')
            ->where('link_id', $user->username)
            ->count();

        $totalClicks = DB::table('link_clicks')
            ->where('link_id', $user->username)
            ->count();

        // Debug untuk memastikan data
        \Log::info('Dashboard - Total Views: ' . $totalViews);
        \Log::info('Dashboard - Username: ' . $user->username);

        // Ambil data lifetime orders (hanya transaksi yang berhasil)
        $lifetimeOrders = DB::table('transactions')
            ->join('digital_products', 'transactions.product_id', '=', 'digital_products.id')
            ->where('digital_products.user_id', $user->id)
            ->where('transactions.status', 'success')
            ->sum('transactions.qty');

        \Log::info('Dashboard - Lifetime Orders Calculation: ' . $lifetimeOrders);

        // Ambil semua transaksi yang berhasil
        $successTransactions = DB::table('transactions')
            ->join('digital_products', 'transactions.product_id', '=', 'digital_products.id')
            ->where('digital_products.user_id', $user->id)
            ->where('transactions.status', 'success')
            ->select('transactions.*', 'digital_products.title')
            ->get();

        // Log transaksi yang berhasil
        \Log::info('Dashboard - Successful transactions:');
        foreach ($successTransactions as $transaction) {
            \Log::info("Success Transaction ID: {$transaction->id}, Amount: {$transaction->total_price}, Product: {$transaction->title}, Created: {$transaction->created_at}");
        }

        // Hitung total pendapatan dari transaksi yang berhasil
        $totalEarnings = (float)DB::table('transactions')
            ->join('digital_products', 'transactions.product_id', '=', 'digital_products.id')
            ->where('digital_products.user_id', $user->id)
            ->where('transactions.status', 'success')
            ->sum('transactions.total_price');

        // Debug: Log hasil perhitungan
        \Log::info('Dashboard - Total Earnings Calculation: ' . $totalEarnings);
        \Log::info('Dashboard - Raw SQL Query: ' . DB::table('transactions')
            ->join('digital_products', 'transactions.product_id', '=', 'digital_products.id')
            ->where('digital_products.user_id', $user->id)
            ->where('transactions.status', 'success')
            ->toSql());
        \Log::info('Dashboard - Query Bindings: ' . json_encode([
            'user_id' => $user->id,
            'status' => 'success'
        ]));

        // Update balance di tabel users jika berbeda dengan total pendapatan
        $currentBalance = (float)(DB::table('users')->where('id', $user->id)->value('balance') ?? 0);
        if ($currentBalance != $totalEarnings) {
            \Log::info("Dashboard - Updating balance from {$currentBalance} to {$totalEarnings}");
            DB::table('users')
                ->where('id', $user->id)
                ->update(['balance' => $totalEarnings]);
        }

        // Debug: Log final values
        \Log::info('Dashboard - Final Values:');
        \Log::info('totalEarnings: ' . $totalEarnings);
        \Log::info('currentBalance: ' . $currentBalance);
        \Log::info('lifetimeOrders: ' . $lifetimeOrders);

        return view('homeadminS.beranda', compact(
            'totalProducts',
            'totalViews',
            'totalClicks',
            'lifetimeOrders',
            'totalEarnings'
        ));
    }

    public function getChartData(Request $request)
    {
        $user = Auth::user();

        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');

        // Jika tanggal tidak diberikan, ambil 7 hari terakhir
        try {
            $startDate = $startDate ? Carbon::parse($startDate) : Carbon::now()->subDays(6);
            $endDate = $endDate ? Carbon::parse($endDate) : Carbon::now();
        } catch (\Exception $e) {
            // Jika parsing gagal, set default
            $startDate = Carbon::now()->subDays(6);
            $endDate = Carbon::now();
        }

        // Batasi range maksimal 30 hari
        if ($startDate->diffInDays($endDate) > 30) {
            $endDate = $startDate->copy()->addDays(30);
        }

        $dates = [];
        $views = [];
        $clicks = [];

        $currentDate = $startDate->copy();

        while ($currentDate <= $endDate) {
            $dates[] = $currentDate->format('d M');

            $viewCount = DB::table('link_views')
                ->where('link_id', $user->username)
                ->whereDate('created_at', $currentDate)
                ->count();

            $clickCount = DB::table('link_clicks')
                ->where('link_id', $user->username)
                ->whereDate('created_at', $currentDate)
                ->count();

            $views[] = $viewCount;
            $clicks[] = $clickCount;

            $currentDate->addDay();
        }

        return response()->json([
            'labels' => $dates,
            'views' => $views,
            'clicks' => $clicks,
            'start_date' => $startDate->format('Y-m-d'),
            'end_date' => $endDate->format('Y-m-d')
        ]);
    }

    public function getDigitalProducts()
    {
        $user = Auth::user();

        $digitalProducts = DigitalProduct::where('user_id', $user->id)
            ->select('id', 'title', 'price', 'created_at')
            ->latest()
            ->get();

        return response()->json([
            'total' => $digitalProducts->count(),
            'products' => $digitalProducts
        ]);
    }

    // Fungsi untuk mencatat CLICK
    public function trackClick(Request $request)
    {
        $linkId = $request->query('link_id');
        $target = $request->query('target');

        // Validasi URL target
        if (!filter_var($target, FILTER_VALIDATE_URL)) {
            abort(400, 'Invalid target URL');
        }

        // Dapatkan user berdasarkan username
        $user = User::where('username', $linkId)->first();
        if (!$user) {
            abort(404, 'User not found');
        }

        // Debug untuk memastikan data
        \Log::info('Tracking Click:');
        \Log::info('Link ID: ' . $linkId);
        \Log::info('Target URL: ' . $target);
        \Log::info('IP Address: ' . $request->ip());
        \Log::info('User Agent: ' . $request->header('User-Agent'));

        // Catat click ke database
        DB::table('link_clicks')->insert([
            'link_id' => $linkId,
            'ip_address' => $request->ip(),
            'user_agent' => $request->header('User-Agent'),
            'created_at' => now(),
            'updated_at' => now()
        ]);

        return redirect()->to($target);
    }
}
