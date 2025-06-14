<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DigitalProduct;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Midtrans\Snap;
use App\Models\Transaction;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendDigitalProductMail;
use Illuminate\Support\Facades\DB;

class DigitalProductController extends Controller
{


public function show($id)
{
    $product = DigitalProduct::findOrFail($id);
    $user = $product->user; // relasi user() di model DigitalProduct
    $appearance = $user->appearance;
     // Reset qty jadi 1 setiap buka halaman
    session(["cart.qty.$id" => 1]);

    return view('public.product-detail', compact('product', 'user', 'appearance'));
}


    public function create()
    {
        return view('homeadminS.digital-product');
    }

    public function store(Request $request)
    {
        $request->validate([
            'image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'platform_type' => 'required|string|in:upload,dropbox,gdrive,other',
            'platform_url' => 'nullable|url|required_if:platform_type,dropbox,gdrive,other',
            'platform_file' => 'nullable|file|mimes:pdf,zip,rar|required_if:platform_type,upload',
            'price' => 'required|numeric',
            'sale_price' => 'nullable|numeric',
            'has_quantity_limit' => 'nullable|boolean',
            'quantity' => 'nullable|integer|required_if:has_quantity_limit,1',
            'button_text' => 'required|string',
        ]);

        $data = $request->only([
            'title', 'description', 'platform_type', 'platform_url',
            'price', 'sale_price', 'has_quantity_limit', 'quantity', 'button_text'
        ]);

        $data['user_id'] = Auth::id(); // ID user yang sedang login

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('product_images', 'public');
            $data['image'] = $imagePath;
        }

        if ($request->platform_type === 'upload' && $request->hasFile('platform_file')) {
            $filePath = $request->file('platform_file')->store('digital_products', 'public');
            $data['platform_file'] = $filePath;
        }

        $data['has_quantity_limit'] = $request->has('has_quantity_limit');

        DigitalProduct::create($data);

        return redirect()->route('mylinkan')->with('success', 'Digital product added successfully!');
    }

    public function edit($id)
    {
        $product = DigitalProduct::where('id', $id)
            ->where('user_id', auth()->id())
            ->firstOrFail();
            
        return view('homeadminS.digital-product', compact('product'));
    }
    
    public function update(Request $request, $id)
    {
        $product = DigitalProduct::findOrFail($id);
        
        $request->validate([
            'image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'platform_type' => 'required|string|in:upload,dropbox,gdrive,other',
            'platform_url' => 'nullable|url|required_if:platform_type,dropbox,gdrive,other',
            'platform_file' => 'nullable|file|mimes:pdf,zip,rar',
            'price' => 'required|numeric',
            'sale_price' => 'nullable|numeric',
            'has_quantity_limit' => 'nullable|boolean',
            'quantity' => 'nullable|integer|min:1',
            'button_text' => 'required|string',
        ]);

        $data = $request->only([
            'title', 'description', 'platform_type', 'platform_url',
            'price', 'sale_price', 'has_quantity_limit', 'quantity', 'button_text'
        ]);

        // Jika has_quantity_limit tidak dicentang, set quantity ke null
        if (!$request->has('has_quantity_limit')) {
            $data['has_quantity_limit'] = false;
            $data['quantity'] = null;
        }

        // Jika platform_type adalah upload dan ada file baru
        if ($request->platform_type === 'upload' && $request->hasFile('platform_file')) {
            // Hapus file lama jika ada
            if ($product->platform_file) {
                Storage::disk('public')->delete($product->platform_file);
            }
            $filePath = $request->file('platform_file')->store('digital_products', 'public');
            $data['platform_file'] = $filePath;
        } else if ($request->platform_type !== 'upload') {
            // Jika platform_type bukan upload, hapus file yang ada
            if ($product->platform_file) {
                Storage::disk('public')->delete($product->platform_file);
                $data['platform_file'] = null;
            }
        }

        if ($request->hasFile('image')) {
            // Hapus gambar lama jika ada
            if ($product->image) {
                Storage::disk('public')->delete($product->image);
            }
            $imagePath = $request->file('image')->store('product_images', 'public');
            $data['image'] = $imagePath;
        }

        $product->update($data);

        return redirect()->route('mylinkan')->with('success', 'Produk berhasil diperbarui!');
    }
    

    public function destroy($id)
    {
        $product = DigitalProduct::findOrFail($id);
        $product->delete();

        return redirect()->back()->with('success', 'Produk berhasil dihapus.');
    }

    public function updateQty(Request $request)
{
    $request->validate([
        'product_id' => 'required|integer',
        'qty' => 'required|integer|min:1'
    ]);

    session()->put("cart.qty.{$request->product_id}", $request->qty);

    return response()->json(['status' => 'success']);
}

public function checkout(Request $request, $id)
{
    $product = DigitalProduct::findOrFail($id);

    // Ambil qty dari session jika tidak ada permintaan POST
    $qty = $request->isMethod('post')
        ? $request->qty
        : session("cart.qty.$id", 1);

    // Konfigurasi Midtrans
    \Midtrans\Config::$serverKey = 'SB-Mid-server-qbA7U8pOrHFCGy-0LlFclqIG';
    \Midtrans\Config::$isProduction = false;
    \Midtrans\Config::$isSanitized = true;
    \Midtrans\Config::$is3ds = true;

    // Generate Snap Token
    $orderId = 'ORDER-' . uniqid();

    $params = [
        'transaction_details' => [
            'order_id' => $orderId,
            'gross_amount' => $product->price * $qty,
        ],
        'customer_details' => [
            'first_name' => $request->input('name', 'Guest'),
            'email' => $request->input('email', 'guest@example.com'),
        ],
        'item_details' => [[
            'id' => $product->id,
            'price' => $product->price,
            'quantity' => $qty,
            'name' => $product->title,
        ]],
    ];

    try {
        $snapToken = \Midtrans\Snap::getSnapToken($params);
    } catch (\Exception $e) {
        return back()->with('error', 'Gagal membuat pembayaran: ' . $e->getMessage());
    }

    if ($request->isMethod('post')) {
        $request->validate([
            'email' => 'required|email',
            'name' => 'required|string',
            'qty' => 'required|integer|min:1',
        ]);

        // Simpan transaksi ke database setelah validasi
        Transaction::create([
            'order_id' => $orderId,
            'product_id' => $product->id,
            'buyer_name' => $request->name,
            'buyer_email' => $request->email,
            'qty' => $qty,
            'total_price' => $product->price * $qty,
            'status' => 'pending'
        ]);

        return view('public.checkout', [
            'product' => $product,
            'snapToken' => $snapToken,
            'savedQty' => $qty,
        ]);
    }

    return view('public.checkout', [
        'product' => $product,
        'snapToken' => $snapToken,
        'savedQty' => $qty,
    ]);
}
public function midtransCallback(Request $request)
{
    \Midtrans\Config::$serverKey = 'SB-Mid-server-qbA7U8pOrHFCGy-0LlFclqIG';
    \Midtrans\Config::$isProduction = false;

    $notif = new \Midtrans\Notification();

    $transaction = $notif->transaction_status;
    $orderId = $notif->order_id;

    \Log::info('Midtrans Callback - Transaction Status: ' . $transaction);
    \Log::info('Midtrans Callback - Order ID: ' . $orderId);

    $trx = Transaction::where('order_id', $orderId)->first();

    if (!$trx) {
        \Log::error('Midtrans Callback - Transaction not found for order ID: ' . $orderId);
        return response()->json(['error' => 'Transaction not found'], 404);
    }

    // Ubah status dari Midtrans ke status yang kita gunakan
    if ($transaction == 'capture' || $transaction == 'settlement') {
        $trx->status = 'success';
        $trx->save();

        \Log::info('Midtrans Callback - Updating transaction status to success');
        \Log::info('Midtrans Callback - Transaction ID: ' . $trx->id);
        \Log::info('Midtrans Callback - Amount: ' . $trx->total_price);

        // Update balance seller
        $product = $trx->product;
        $seller = $product->user;
        
        \Log::info('Midtrans Callback - Updating seller balance');
        \Log::info('Midtrans Callback - Seller ID: ' . $seller->id);
        \Log::info('Midtrans Callback - Amount to add: ' . $trx->total_price);
        
        // Update balance seller
        DB::table('users')
            ->where('id', $seller->id)
            ->increment('balance', $trx->total_price);

        // Kirim email produk digital
        $product = $trx->product;
        $link = $product->platform_type === 'upload'
            ? asset('storage/' . $product->platform_file)
            : $product->platform_url;

        Mail::raw("Terima kasih telah membeli produk digital. Berikut link download Anda:\n\n$link", function ($message) use ($trx) {
            $message->to($trx->buyer_email)
                    ->subject('Produk Digital Anda');
        });
    }

    return response()->json(['message' => 'Callback processed']);
}
public function storeTransaction(Request $request)
{
    $data = $request->validate([
        'order_id' => 'required|string|unique:transactions',
        'transaction_status' => 'required|string',
        'product_id' => 'required|integer|exists:digital_products,id',
        'buyer_email' => 'required|email',
        'buyer_name' => 'required|string',
        'qty' => 'required|integer|min:1',
        'total_price' => 'required|numeric'
    ]);

    \Log::info('Store Transaction - Initial Status: ' . $data['transaction_status']);

    // Ubah status dari Midtrans ke status yang kita gunakan
    $status = $data['transaction_status'];
    if ($status === 'capture' || $status === 'settlement') {
        $status = 'success';
    } else if ($status === 'pending') {
        $status = 'pending';
    } else {
        $status = 'failed';
    }

    \Log::info('Store Transaction - Converted Status: ' . $status);

    $transaction = Transaction::create([
        'order_id' => $data['order_id'],
        'status' => $status,
        'product_id' => $data['product_id'],
        'buyer_email' => $data['buyer_email'],
        'buyer_name' => $data['buyer_name'],
        'qty' => $data['qty'],
        'total_price' => $data['total_price'],
    ]);

    \Log::info('Store Transaction - Created Transaction ID: ' . $transaction->id);

    // Jika transaksi berhasil, update balance seller
    if ($status === 'success') {
        $product = DigitalProduct::find($data['product_id']);
        $seller = $product->user;
        
        \Log::info('Store Transaction - Updating seller balance');
        \Log::info('Store Transaction - Seller ID: ' . $seller->id);
        \Log::info('Store Transaction - Amount to add: ' . $data['total_price']);
        
        // Update balance seller
        DB::table('users')
            ->where('id', $seller->id)
            ->increment('balance', $data['total_price']);
    }

    $product = \App\Models\DigitalProduct::find($data['product_id']);
    Mail::to($transaction->buyer_email)->send(
        new SendDigitalProductMail($product, $transaction->buyer_name, $transaction)
    );

    return response()->json(['success' => true, 'message' => 'Transaction stored & email sent']);
}




}