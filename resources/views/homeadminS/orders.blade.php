<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders</title>
    <link rel="icon" type="image/png" href="{{ asset('images/favicon.png') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f8f9fc;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        .main-content {
            flex: 1;
            padding: 20px;
        }

        .order-header {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .link-share {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 25px;
        }

        .linkan-url {
            background: #f5f5f5;
            padding: 8px 15px;
            border-radius: 5px;
            flex-grow: 1;
            color: #666;
            font-weight: 600;
            font-size: 16px;
            border: 1px solid #e0e0e0;
        }

        .btn-share {
            background-color: #FFA86A;
            border: none;
            padding: 8px 18px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            color: #fff;
            font-size: 15px;
            box-shadow: 0 2px 6px rgba(255,168,106,0.08);
        }

        .order-content {
            display: flex;
            gap: 30px;
        }

        .product-orders {
            flex: 1.2;
            background-color: #fff;
            border-radius: 12px;
            padding: 25px 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
            min-width: 350px;
        }

        .order-details {
            flex: 1;
            background-color: #fff;
            border-radius: 12px;
            padding: 25px;
            color: #333;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .order-details h3 {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .detail-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .detail-item:last-child {
            border-bottom: none;
        }

        .detail-label {
            color: #666;
            font-weight: 600;
        }

        .detail-value {
            color: #333;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 14px;
            font-weight: 600;
        }

        .status-success {
            background-color: #e6f4ea;
            color: #1e7e34;
        }

        .status-failed {
            background-color: #fbe9e7;
            color: #d32f2f;
        }

        .status-pending {
            background-color: #fff3e0;
            color: #f57c00;
        }

        .order-item {
            display: flex;
            align-items: center;
            background-color: #f7f7f7;
            padding: 12px 16px;
            border-radius: 8px;
            margin-top: 12px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.03);
            gap: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .order-item:hover {
            background-color: #f0f0f0;
        }

        .order-item .product-image {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            object-fit: cover;
        }

        .order-item .product-info {
            flex: 1;
        }

        .order-item .product-title {
            font-size: 16px;
            font-weight: 600;
            color: #444;
            margin-bottom: 4px;
        }

        .order-item .product-meta {
            font-size: 14px;
            color: #666;
        }

        .order-item .btn-detail {
            background-color: #FFA86A;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .order-item .btn-detail:hover {
            background-color: #ff9a4f;
        }

        .product-orders h3 {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .filter-bar {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .filter-bar input[type="date"] {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #e0e0e0;
            font-size: 14px;
        }

        .btn-download {
            background-color: #FFA86A;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
            font-size: 18px;
        }

        select {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #e0e0e0;
            margin-bottom: 10px;
        }

        .search-bar {
            margin-bottom: 10px;
            display: flex;
            gap: 5px;
        }

        .search-bar input {
            flex: 1;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #e0e0e0;
        }

        .empty-detail {
            text-align: center;
            padding: 40px 20px;
        }

        .empty-detail .icon-detail {
            font-size: 54px;
            margin-bottom: 18px;
            color: #666;
        }

        .empty-detail p {
            color: #444;
            font-size: 17px;
        }

        .empty-detail strong {
            color: #222;
        }

        .loading {
            text-align: center;
            padding: 20px;
            color: #666;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            color: #666;
            font-style: italic;
        }

        .error {
            text-align: center;
            padding: 20px;
            color: #d32f2f;
        }

        .debug-info {
            margin-top: 10px;
            padding: 10px;
            background-color: #f5f5f5;
            border-radius: 4px;
            font-size: 12px;
            text-align: left;
        }

        .debug-info p {
            margin: 5px 0;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        @include('homeadminS.sidebar.sidebar')
        <div class="main-content">
            <div class="header">
                <h2 class="order-header">Order History</h2>
            </div>

            <div class="link-share">
                <div class="linkan-url">
                    <a href="{{ url('/linkan.id/' . Auth::user()->username) }}" style="color: #FF9040;">
                        {{ url('/linkan.id/' . Auth::user()->username) }}
                    </a>
                </div>
                <button class="btn-share">Share</button>
            </div>
            <div class="order-content">
                <div class="product-orders">
                    <h3>Product Orders</h3>
                    <div class="filter-bar">
                        <input type="date" id="dateFilter">
                    </div>
                    <select id="statusFilter">
                        <option value="">All Transaction</option>
                        <option value="success">Success</option>
                        <option value="pending">Pending</option>
                        <option value="failed">Failed</option>
                    </select>
                    <div class="search-bar">
                        <input type="text" value="Product Title" readonly>
                        <input type="text" id="searchInput" placeholder="Search by product title or buyer name">
                    </div>
                    @foreach($transactions as $transaction)
                    <div class="order-item" data-id="{{ $transaction->id }}" data-status="{{ $transaction->status }}" data-date="{{ $transaction->created_at->format('Y-m-d') }}">
                        <img src="{{ asset('storage/' . $transaction->product->image) }}" alt="{{ $transaction->product->title }}" class="product-image">
                        <div class="product-info">
                            <div class="product-title">{{ $transaction->product->title }}</div>
                            <div class="product-meta">
                                {{ $transaction->buyer_name }} • {{ $transaction->created_at->format('d M Y') }}
                            </div>
                        </div>
                        <button class="btn-detail" onclick="loadOrderDetail({{ $transaction->id }})">Detail</button>
                    </div>
                    @endforeach
                </div>
                <div class="order-details" id="orderDetails">
                    <div class="empty-detail">
                        <div class="icon-detail">📋</div>
                        <p>Your transaction detail will appear here.<br>
                        Click <strong>Detail</strong> button on the left side</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function loadOrderDetail(id) {
            // Ambil status filter saat ini
            const currentStatus = $('#statusFilter').val();
            const currentDate = $('#dateFilter').val();
            const currentSearch = $('#searchInput').val().trim();

            // Tambahkan parameter filter ke request
            $.get(`/homeadminS/orders/${id}`, {
                status: currentStatus,
                date: currentDate,
                search: currentSearch
            }, function(data) {
                const detail = data;
                const statusClass = {
                    'success': 'status-success',
                    'failed': 'status-failed',
                    'pending': 'status-pending'
                }[detail.status] || '';

                const html = `
                    <h3>Order Details</h3>
                    <div class="detail-item">
                        <span class="detail-label">Product</span>
                        <span class="detail-value">${detail.product.title}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Buyer Name</span>
                        <span class="detail-value">${detail.buyer_name}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Buyer Email</span>
                        <span class="detail-value">${detail.buyer_email}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Quantity</span>
                        <span class="detail-value">${detail.qty}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Total Price</span>
                        <span class="detail-value">Rp ${detail.total_price}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Status</span>
                        <span class="detail-value">
                            <span class="status-badge ${statusClass}">${detail.status}</span>
                        </span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Date</span>
                        <span class="detail-value">${new Date(detail.created_at).toLocaleString()}</span>
                    </div>
                `;
                $('#orderDetails').html(html);
            });
        }

        // Filter functionality
        let filterTimeout;
        $('#statusFilter, #dateFilter, #searchInput').on('change keyup', function() {
            // Reset order details ke tampilan awal
            $('#orderDetails').html(`
                <div class="empty-detail">
                    <div class="icon-detail">📋</div>
                    <p>Your transaction detail will appear here.<br>
                    Click <strong>Detail</strong> button on the left side</p>
                </div>
            `);

            clearTimeout(filterTimeout);
            filterTimeout = setTimeout(function() {
                const status = $('#statusFilter').val();
                const date = $('#dateFilter').val();
                const search = $('#searchInput').val().trim();

                // Tampilkan loading state
                $('.product-orders').append('<div class="loading">Loading...</div>');

                // Hapus pesan "tidak ada transaksi" yang mungkin ada
                $('.no-data, .error').remove();

                // Siapkan data untuk request
                const requestData = {};
                if (status) requestData.status = status;
                if (date) requestData.date = date;
                if (search) requestData.search = search;

                // Kirim request ke server
                $.ajax({
                    url: '/homeadminS/orders',
                    method: 'GET',
                    data: requestData,
                    success: function(response) {
                        // Hapus loading state
                        $('.loading').remove();
                        
                        // Update tampilan dengan data baru
                        const $orderList = $('.product-orders');
                        $orderList.find('.order-item').remove();

                        if (response.transactions && response.transactions.length > 0) {
                            response.transactions.forEach(function(transaction) {
                                const statusClass = {
                                    'success': 'status-success',
                                    'failed': 'status-failed',
                                    'pending': 'status-pending'
                                }[transaction.status] || '';

                                const html = `
                                    <div class="order-item" data-id="${transaction.id}" data-status="${transaction.status}" data-date="${transaction.created_at}">
                                        <img src="/storage/${transaction.product.image}" alt="${transaction.product.title}" class="product-image">
                                        <div class="product-info">
                                            <div class="product-title">${transaction.product.title}</div>
                                            <div class="product-meta">
                                                ${transaction.buyer_name} • ${new Date(transaction.created_at).toLocaleDateString()}
                                            </div>
                                        </div>
                                        <button class="btn-detail" onclick="loadOrderDetail(${transaction.id})">Detail</button>
                                    </div>
                                `;
                                $orderList.append(html);
                            });
                        } else {
                            // Hapus semua order-item yang ada sebelum menampilkan pesan tidak ada data
                            $('.order-item').remove();
                            
                            let debugInfo = '';
                            if (response.debug) {
                                debugInfo = `
                                    <div class="debug-info">
                                        <p>User ID: ${response.debug.user_id}</p>
                                        <p>Query: ${response.debug.query}</p>
                                        <p>Bindings: ${JSON.stringify(response.debug.bindings)}</p>
                                        <p>Count: ${response.debug.count}</p>
                                        <p>Active Filters:</p>
                                        <ul>
                                            ${Object.entries(response.debug.filters)
                                                .filter(([_, value]) => value)
                                                .map(([key, value]) => `<li>${key}: ${value}</li>`)
                                                .join('')}
                                        </ul>
                                    </div>
                                `;
                            }
                            $orderList.append(`
                                <div class="no-data">
                                    <div class="empty-detail">
                                        <div class="icon-detail">📋</div>
                                        <p>Belum ada transaksi dengan status ini</p>
                                    </div>
                                </div>
                            `);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', error);
                        $('.loading').remove();
                        $('.product-orders').append(`
                            <div class="error">
                                Error loading data
                                <div class="debug-info">
                                    <p>Status: ${status}</p>
                                    <p>Error: ${error}</p>
                                </div>
                            </div>
                        `);
                    }
                });
            }, 300);
        });
    </script>
</body>
</html>