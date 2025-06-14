<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appearance - Linkan</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f6fa;
        }
        .container {
    display: flex;
    min-height: 100vh;
    overflow: hidden;
}

        .main-content {
            flex: 1;
            padding: 20px;
        }

        .url-section {
            background: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .url-input-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .url-input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #f8f9fa;
            color: #666;
        }

        .share-button {
            background: none;
            border: none;
            color: #FF9040;
            cursor: pointer;
            padding: 8px;
            font-size: 16px;
        }

        .content-section {
    display: flex;
    gap: 20px;
    height: 100vh;
}

.left-panel {
    flex: 2;
    max-height: 100vh;
    overflow-y: auto;
    padding-right: 10px;
}

.left-panel form {
    display: flex;
    flex-direction: column;
    min-height: 100%;
    gap: 20px;
    padding-bottom: 100px; /* Tambahkan ini agar tombol tidak mentok */
}


.save-button {
    align-self: center; /* Tombol di tengah */
    background: #FF9040; /* Warna fallback */
    color: white;
    border: none;
    padding: 12px 30px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 20px;
    transition: background-color 0.3s ease;
}


        .right-panel {
            flex: 1;
            min-width: 300px;
        }

        .card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .card-title {
            font-size: 18px;
            color: #333;
            margin-bottom: 15px;
        }
        
        .card-priview {
            font-size: 16px;
            color: #333;
            margin-bottom: 15px;
            text-align: center;
        }

        .banner-section {
            border: 2px dashed #ddd;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* posisi horizontal tengah */
            justify-content: center; /* opsional: posisi vertikal tengah */
        }

        .banner-section i {
            font-size: 40px;
            color: #ddd;
            margin-bottom: 10px;
        }

        .banner-text {
            color: #666;
            margin-bottom: 15px;
        }

        .upload-button {
            background: #FF9040;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .profile-section {
            text-align: center;
            padding: 20px 0;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: #f8f9fa;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            overflow: hidden;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-image i {
            font-size: 40px;
            color: #ddd;
        }

        .profile-name {
            width: 80%;
            margin: 0 auto 10px;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .bio-section textarea {
            width: 100%;
            height: 100px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            resize: vertical;
            margin-top: 10px;
        }

        .preview-section {
            background: #eee;
            padding: 20px;
            border-radius: 10px;
            width: 400px; /* Lebar yang lebih besar */
            height: fit-content;
            position: sticky;
            top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .preview-phone {
            width: 375px; /* iPhone 11/12/13 width */
            height: 812px; /* iPhone 11/12/13 height */
            border-radius: 40px;
            padding: 20px;
            background: white;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .preview-screen {
            width: 100%;
            height: 100%;
            background: #f8f9fa;
            border-radius: 30px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow-y: auto;
        }

        .preview-banner {
            width: 100%;
            height: 120px;
            background: #ddd;
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .preview-banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .preview-profile {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #ddd;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .preview-profile img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .preview-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            text-align: center;
        }

        .preview-bio {
            font-size: 14px;
            color: #666;
            text-align: center;
            margin-bottom: 15px;
            padding: 0 20px;
            line-height: 1.4;
        }

        .preview-social-links {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .preview-social-links a {
            font-size: 20px;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .preview-social-links a:hover {
            opacity: 0.8;
        }

        .preview-products {
            width: 100%;
            padding: 10px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .preview-product-item {
            background: white;
            border-radius: 8px;
            padding: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }

        .preview-product-item:hover {
            transform: translateY(-2px);
        }

        .preview-product-image {
            width: 40px;
            height: 40px;
            background: #FFE5D3;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            flex-shrink: 0;
        }

        .preview-product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .preview-product-info {
            flex: 1;
            min-width: 0;
        }

        .preview-product-title {
            font-size: 14px;
            color: #333;
            margin-bottom: 2px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .preview-product-button {
            background: #FF9040;
            color: white;
            padding: 4px 12px;
            border-radius: 4px;
            font-size: 12px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            flex-shrink: 0;
        }

        .preview-product-button:hover {
            opacity: 0.9;
        }


        .save-button:hover {
            opacity: 0.9;
        }

        .theme-options {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
            gap: 10px;
            margin-top: 10px;
        }

        .theme-option {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .theme-option.active {
            border-color: #FF9040;
        }

        @media (max-width: 768px) {
            .content-section {
                flex-direction: column;
            }

            .right-panel {
                min-width: 100%;
            }
        }
        .preview-name,
        .preview-bio,
        .preview-screen button {
            transition: all 0.3s ease;
        }

        .popup-modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    z-index: 1000;
    display: flex;
    justify-content: center;
    align-items: center;
}

.popup-content {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    position: relative;
    min-width: 300px;
}

.close-btn {
    position: absolute;
    top: 8px;
    right: 12px;
    font-size: 24px;
    cursor: pointer;
}

.social-btn {
    margin: 5px;
    padding: 8px 14px;
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 20px;
    cursor: pointer;
    font-size: 14px;
}
.social-btn i {
    margin-right: 6px;
}
.social-input {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 10px;
}
.social-input i {
    font-size: 18px;
}
.social-input input {
    flex: 1;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 6px;
}

.remove-social {
    background: none;
    border: none;
    color: #888;
    font-size: 27px;
    cursor: pointer;
    margin-left: 8px;
    line-height: 1;
    padding: 4px;
}
.remove-social:hover {
    color: red;
}


    </style>
</head>
<body>
    <div class="container">
        @include('homeadminS.sidebar.sidebar')

        <div class="main-content">
            <div class="url-section">
                <div class="url-input-group">
                    <input type="text" class="url-input"value="My Linkan: {{ url('linkan.id/' . Auth::user()->username) }}"readonly>
                    <button class="share-button" onclick="copyToClipboard('http://localhost:8000/linkan.id/{{ Auth::user()->username }}')">
                        <i class="fas fa-share-alt"></i>
                    </button>
                </div>
            </div>

           <form action="{{ route('appearance.update') }}" method="POST" enctype="multipart/form-data">


                @csrf
                <div class="content-section">
                    <div class="left-panel">
                        <!-- Banner -->
                        <div class="card">
                            <h2 class="card-title">Banner</h2>
                            <div class="banner-section">
                            @if($appearance && $appearance->banner)
    <img src="{{ asset('storage/' . $appearance->banner) }}" alt="Banner"
         style="width: 589px; height: 233px; object-fit: cover; margin-bottom: 15px;" id="previewBanner">
    <input type="hidden" name="delete_banner" id="deleteBanner" value="0">
    <button type="button" onclick="confirmDeleteBanner()" class="upload-button" style="background-color: red; color: white;">
        Hapus Banner
    </button>
                                @else
                                    <i class="fas fa-image"></i>
                                    <p class="banner-text">Optimize banner size 1056 x 638 px</p>
                                @endif
                                <input type="file" name="banner" id="bannerInput" style="display: none;" accept="image/*">
                                <button type="button" class="upload-button" onclick="document.getElementById('bannerInput').click()">Upload Image</button>
                            </div>
                        </div>

                        <!-- Profile -->
                        <div class="card">
                            <h2 class="card-title">Profile</h2>
                            <div class="profile-section">
                               <div class="profile-image" onclick="openProfilePopup()">
                                    @if($appearance && $appearance->profile_image)
                                        <img src="{{ asset('storage/' . $appearance->profile_image) }}" alt="Profile" id="previewProfileImage">
                                    @else
                                        <i class="fas fa-user" id="defaultProfileIcon"></i>
                                    @endif
                                </div>
                                <input type="file" name="profile_image" id="profileImageInput" style="display: none;" accept="image/*">
                                <input type="text" name="name" class="profile-name" placeholder="Your Name" value="{{ $appearance ? $appearance->name : Auth::user()->name }}" id="inputName">
                                <div class="bio-section">
                                    <textarea name="bio" placeholder="Write your bio here..." id="inputBio">{{ $appearance ? $appearance->bio : '' }}</textarea>
                                </div>
                                <!-- 🎨 Color Picker -->
<div style="display: flex; align-items: center; gap: 10px; margin-top: 10px;">
    <label for="colorPicker">Customize Color:</label>
    <input type="color" id="colorPicker" name="themeColor" value="{{ $appearance ? $appearance->theme_color : '#FF9040' }}">

   <input type="hidden" name="theme_color" id="themeColor" value="{{ $appearance ? $appearance->theme_color : '#FF9040' }}">
</div>

                            </div>
                        </div>
 <!-- Social Media Links -->
<div class="card">
    <h2 class="card-title">Social Links</h2>

    <!-- Tombol Pilih Platform -->
    <div id="social-buttons" style="margin-bottom: 10px;">
        @foreach(['instagram','tiktok','whatsapp','linkedin','facebook','website','twitter','youtube','telegram','email','discord'] as $platform)
            <button type="button" class="social-btn" data-platform="{{ $platform }}">
                <i class="{{
                    [
                        'instagram'=>'fab fa-instagram',
                        'tiktok'=>'fab fa-tiktok',
                        'whatsapp'=>'fab fa-whatsapp',
                        'linkedin'=>'fab fa-linkedin',
                        'facebook'=>'fab fa-facebook',
                        'website'=>'fas fa-globe',
                        'twitter'=>'fab fa-twitter',
                        'youtube'=>'fab fa-youtube',
                        'telegram'=>'fab fa-telegram',
                        'email'=>'fas fa-envelope',
                        'discord'=>'fab fa-discord'
                    ][$platform]
                }}"></i>
                {{ ucfirst($platform) }}
            </button>
        @endforeach
    </div>

    <!-- Input yang akan muncul -->
    <div id="social-link-inputs">
        @foreach(['instagram','tiktok','whatsapp','linkedin','facebook','website','twitter','youtube','telegram','email','discord'] as $platform)
            <div class="social-input" data-platform="{{ $platform }}"
                 style="{{ ($appearance && $appearance->$platform) ? '' : 'display:none;' }}">
                <i class="{{
                    [
                        'instagram'=>'fab fa-instagram',
                        'tiktok'=>'fab fa-tiktok',
                        'whatsapp'=>'fab fa-whatsapp',
                        'linkedin'=>'fab fa-linkedin',
                        'facebook'=>'fab fa-facebook',
                        'website'=>'fas fa-globe',
                        'twitter'=>'fab fa-twitter',
                        'youtube'=>'fab fa-youtube',
                        'telegram'=>'fab fa-telegram',
                        'email'=>'fas fa-envelope',
                        'discord'=>'fab fa-discord'
                    ][$platform]
                }}"></i>
                <input
                    type="{{ $platform=='email' ? 'email' : 'url' }}"
                    id="input{{ ucfirst($platform) }}"
                    name="{{ $platform }}"
                    placeholder="{{ ucfirst($platform) }} {{ $platform=='email' ? 'Address' : 'URL' }}"
                    value="{{ $appearance->$platform ?? '' }}"
                >
                <button type="button" class="remove-social" title="Hapus">&times;</button>
            </div>
        @endforeach
    </div>
</div>


    <!-- Theme -->
   <div class="card">
    <h2 class="card-title">Theme</h2>
    <div class="theme-options" id="themeOptions"
         style="display: grid; grid-template-columns: repeat(5, 1fr); gap: 16px;">

        @php
            $themes = ['blue ocean.png', 'city light.png', 'clasic.png', 'desert.png', 'green flower.png', 'pink candy.png', 'playstation abstract.png','sunset.png', 'mountain.png','library.png','news paper.png'];
        @endphp

        @foreach ($themes as $theme)
            <div style="text-align: center;">
                <img src="{{ asset('images/previewt/' . $theme) }}"
                     data-bg="{{ asset('images/background/' . $theme) }}"
                     data-name="{{ $theme }}"
                     class="theme-preview"
                     style="width: 100px; height: 70px; object-fit: cover; cursor: pointer; border: 2px solid transparent; border-radius: 8px; transition: transform 0.2s;">
                <div style="font-size: 13px; margin-top: 6px; color: #333;">
                    {{ ucwords(str_replace(['-', '_'], ' ', pathinfo($theme, PATHINFO_FILENAME))) }}
                </div>
            </div>
        @endforeach

    </div>
    <input type="hidden" name="background_color" id="backgroundColor" value="{{ $appearance ? $appearance->background_color : '' }}">
</div>


<div style="display: flex; justify-content: center; margin-top: 20px;">
    <button type="submit" class="save-button"
        style="background-color: #FF9040">
        Save Changes
    </button>
</div>
  </form>
  <!-- Modal Profile Popup -->
<div id="profilePopup" class="popup-modal" style="display: none;">
    <div class="popup-content">
        <span class="close-btn" onclick="closeProfilePopup()">&times;</span>
        
        @if($appearance && $appearance->profile_image)
            <button type="button" class="upload-button" onclick="document.getElementById('profileImageInput').click()">Upload Image</button>
           <input type="hidden" name="delete_profile_image" id="deleteProfileImage" value="0">
    <button type="button" onclick="confirmDeleteProfileImage()" class="upload-button" style="background-color: red; color: white; margin-top: 10px;">
        Hapus Foto Profil
    </button>
        @else
            <button type="button" class="upload-button" onclick="document.getElementById('profileImageInput').click()">Upload Image</button>
        @endif
    </div>
</div>

                    </div>

                    <!-- Preview -->

                  
                        <div class="preview-section">
                              <div class="right-panel">
                         <div class="preview-header">
                           <h2 class="card-priview">Preview</h2>
                        </div>
                            <div class="preview-phone">
                                <div class="preview-screen" id="previewScreen">
                                    @if($appearance && $appearance->banner)
                                        <div class="preview-banner">
                                          <img src="{{ asset('storage/' . $appearance->banner) }}" alt="Banner" id="previewPhoneBanner" style="width: 100%; aspect-ratio: 1056 / 638; object-fit: cover; border-radius: 10px; margin-bottom: 20px;">

                                        </div>
                                    @endif
                                    <div class="preview-profile" id="previewPhoneProfile">
                                        @if($appearance && $appearance->profile_image)
                                            <img src="{{ asset('storage/' . $appearance->profile_image) }}" alt="Profile">
                                        @else
                                            <i class="fas fa-user"></i>
                                        @endif
                                    </div>
                                    <div class="preview-name" id="livePreviewName" style="color: {{ $appearance ? $appearance->theme_color : '#FF9040' }}">{{ $appearance ? $appearance->name : Auth::user()->name }}</div>
                                    <div class="preview-bio" id="livePreviewBio" style="color: {{ $appearance ? $appearance->theme_color : '#FF9040' }}">{{ $appearance ? $appearance->bio : '' }}</div>
                                    <div class="preview-social-links" id="livePreviewSocialLinks">
                                     @if($appearance && $appearance->instagram)
    <a href="{{ $appearance->instagram }}" target="_blank"><i class="fab fa-instagram"></i></a>
@endif
@if($appearance && $appearance->tiktok)
    <a href="{{ $appearance->tiktok }}" target="_blank"><i class="fab fa-tiktok"></i></a>
@endif
@if($appearance && $appearance->whatsapp)
    <a href="{{ $appearance->whatsapp }}" target="_blank"><i class="fab fa-whatsapp"></i></a>
@endif
@if($appearance && $appearance->linkedin)
    <a href="{{ $appearance->linkedin }}" target="_blank"><i class="fab fa-linkedin"></i></a>
@endif
@if($appearance && $appearance->facebook)
    <a href="{{ $appearance->facebook }}" target="_blank"><i class="fab fa-facebook"></i></a>
@endif
@if($appearance && $appearance->website)
    <a href="{{ $appearance->website }}" target="_blank"><i class="fas fa-globe"></i></a>
@endif
@if($appearance && $appearance->twitter)
    <a href="{{ $appearance->twitter }}" target="_blank"><i class="fab fa-twitter"></i></a>
@endif
@if($appearance && $appearance->youtube)
    <a href="{{ $appearance->youtube }}" target="_blank"><i class="fab fa-youtube"></i></a>
@endif
@if($appearance && $appearance->telegram)
    <a href="{{ $appearance->telegram }}" target="_blank"><i class="fab fa-telegram"></i></a>
@endif
@if($appearance && $appearance->email)
    <a href="mailto:{{ $appearance->email }}"><i class="fas fa-envelope"></i></a>
@endif
@if($appearance && $appearance->discord)
    <a href="{{ $appearance->discord }}" target="_blank"><i class="fab fa-discord"></i></a>
@endif

                                    </div>
                                    @if($digitalProducts && $digitalProducts->count() > 0)
                                        <div class="preview-products">
                                            @foreach($digitalProducts as $product)
                                                <div class="preview-product-item">
                                                    <div class="preview-product-image">
                                                        @if($product->image)
                                                            <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->title }}">
                                                        @else
                                                            <i class="fas fa-file-alt"></i>
                                                        @endif
                                                    </div>
                                                    <div class="preview-product-info">
                                                        <div class="preview-product-title">{{ $product->title }}</div>
                                                    </div>
                                                    <a href="{{ route('track.click', ['link_id' => Auth::user()->username, 'target' => $product->platform_url ?? '#']) }}" class="preview-product-button" style="background-color: {{ $appearance ? $appearance->theme_color : '#FF9040' }}" target="_blank">{{ $product->button_text ?? 'Beli' }}</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    @endif
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
        </div>
    </div>
<script>
    function openProfilePopup() {
    document.getElementById('profilePopup').style.display = 'flex';
}

function closeProfilePopup() {
    document.getElementById('profilePopup').style.display = 'none';
}

    function confirmDeleteProfileImage() {
    if (confirm('Yakin ingin menghapus foto profil?')) {
        document.getElementById('deleteProfileImage').value = 1;
        document.querySelector('form').submit();
    }
}

    function confirmDeleteBanner() {
    if (confirm('Yakin ingin menghapus banner?')) {
        document.getElementById('deleteBanner').value = 1;
        document.querySelector('form').submit();
    }
}
function copyToClipboard(text) {
            navigator.clipboard.writeText(text).then(() => {
                alert('Link copied to clipboard!');
            }).catch(err => {
                console.error('Failed to copy text: ', err);
            });
        }
document.addEventListener('DOMContentLoaded', function () {
    const colorPicker = document.getElementById('colorPicker');
    const themeColorInput = document.getElementById('themeColor');
    const backgroundColorInput = document.getElementById('backgroundColor');
    const previewName = document.getElementById('livePreviewName');
    const previewBio = document.getElementById('livePreviewBio');
    const previewButtons = document.querySelectorAll('.preview-product-button');
    const previewSocialLinks = document.getElementById('livePreviewSocialLinks');
    const saveButton = document.querySelector('.save-button');
 // Placeholder sesuai platform
const placeholderMap = {
    instagram: 'https://instagram.com/',
    tiktok: 'https://tiktok.com/',
    whatsapp: 'https://wa.me/08xxxxxxxxxx',
    linkedin: 'https://linkedin.com/in/username',
    facebook: 'https://facebook.com/username',
    website: 'https://yourwebsite.com',
    twitter: 'https://twitter.com/username',
    youtube: 'https://youtube.com/@channel',
    telegram: 'https://t.me/username',
    email: 'Your email',
    discord: 'https://discord.gg/invitecode'
};

// Toggle tampil input saat klik tombol platform
document.querySelectorAll('.social-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const p = btn.dataset.platform;
        const inputDiv = document.querySelector(`.social-input[data-platform="${p}"]`);
        
        if (inputDiv) {
            // Toggle tampilkan/hidden input
            inputDiv.style.display = inputDiv.style.display === 'none' ? 'flex' : 'none';

            // Ambil elemen input dan set placeholder sesuai map
            const input = inputDiv.querySelector('input');
            if (input && placeholderMap[p]) {
                input.placeholder = placeholderMap[p];
            }
            updateSocialPreview();
    updatePreviewColor(document.getElementById('themeColor').value);
        }
    });
});


    // Hapus satu social-input
    document.querySelectorAll('.remove-social').forEach(btn => {
        btn.addEventListener('click', () => {
            const div = btn.closest('.social-input');
            if (div) {
                // kosongkan nilai dan sembunyikan
                const inp = div.querySelector('input');
                inp.value = '';
                div.style.display = 'none';
            }
        });
    });

    // Live preview (sama cara Anda pakai untuk Instagram)
    function updateSocialPreview() {
        const container = document.getElementById('livePreviewSocialLinks');
        container.innerHTML = '';

        ['instagram','tiktok','whatsapp','linkedin','facebook','website','twitter','youtube','telegram','email','discord']
        .forEach(p => {
            const val = document.getElementById(`input${p.charAt(0).toUpperCase()+p.slice(1)}`).value;
            if (val) {
                const icon = document.createElement('i');
                icon.className = {
                    instagram: 'fab fa-instagram',
                    tiktok:    'fab fa-tiktok',
                    whatsapp:  'fab fa-whatsapp',
                    linkedin:  'fab fa-linkedin',
                    facebook:  'fab fa-facebook',
                    website:   'fas fa-globe',
                    twitter:   'fab fa-twitter',
                    youtube:   'fab fa-youtube',
                    telegram:  'fab fa-telegram',
                    email:     'fas fa-envelope',
                    discord:   'fab fa-discord'
                }[p];
                const a = document.createElement('a');
                a.href = val;
                a.target = '_blank';
                a.appendChild(icon);
                container.appendChild(a);
            }
        });
    }

    // Bind event untuk semua input
    ['Instagram','Tiktok','Whatsapp','Linkedin','Facebook','Website','Twitter','Youtube','Telegram','Email','Discord']
    .forEach(name => {
        const el = document.getElementById(`input${name}`);
        if (el) el.addEventListener('input', updateSocialPreview);
    });
    // Terapkan background dari database saat halaman dimuat ulang
const currentBackground = "{{ $appearance ? $appearance->background_color : '' }}";
if (currentBackground) {
    const matchedTheme = document.querySelector(`.theme-preview[data-name="${currentBackground}"]`);
    if (matchedTheme) {
        const bgUrl = matchedTheme.getAttribute('data-bg');
        const previewScreen = document.getElementById('previewScreen');
        previewScreen.style.backgroundImage = `url('${bgUrl}')`;
        previewScreen.style.backgroundSize = 'cover';
        previewScreen.style.backgroundPosition = 'center';

        // Tambahkan border aktif
        matchedTheme.style.border = "2px solid #FF9040";
    }
}


    function updatePreviewColor(color) {
        previewName.style.color = color;
        previewBio.style.color = color;
        previewButtons.forEach(btn => btn.style.backgroundColor = color);
        themeColorInput.value = color;
        colorPicker.value = color;

        if (previewSocialLinks) {
            previewSocialLinks.querySelectorAll('a i').forEach(icon => {
                icon.style.color = color;
            });
        }
    }

    colorPicker.addEventListener('input', function () {
        updatePreviewColor(this.value);
    });

    updatePreviewColor(themeColorInput.value);

    // Preview banner
    document.getElementById('bannerInput').addEventListener('change', function(e) {
        const reader = new FileReader();
        reader.onload = function(event) {
            const img = document.getElementById('previewPhoneBanner');
            if (img) {
                img.src = event.target.result;
            } else {
                const screen = document.getElementById('previewScreen');
                const newImg = document.createElement('img');
                newImg.src = event.target.result;
                newImg.id = "previewPhoneBanner";
           newImg.style = "width: 100%; aspect-ratio: 589 / 233; object-fit: cover; border-radius: 10px; margin-bottom: 20px;";

                screen.insertBefore(newImg, screen.firstChild);
            }
        };
        reader.readAsDataURL(e.target.files[0]);
    });

    // Preview profile image
    document.getElementById('profileImageInput').addEventListener('change', function(e) {
        const reader = new FileReader();
        reader.onload = function(event) {
            const previewProfile = document.getElementById('previewPhoneProfile');
            previewProfile.innerHTML = `<img src="${event.target.result}" alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">`;
            document.querySelector('.profile-image').innerHTML = `<img src="${event.target.result}" alt="Profile">`;
        };
        reader.readAsDataURL(e.target.files[0]);
    });

    // Live preview name and bio
    document.getElementById('inputName').addEventListener('input', function() {
        previewName.textContent = this.value;
    });
    document.getElementById('inputBio').addEventListener('input', function() {
        previewBio.textContent = this.value;
    });

   // Live preview social links
function updateSocialPreview() {
    const platforms = [
        { id: 'inputInstagram', icon: 'fab fa-instagram' },
        { id: 'inputTiktok', icon: 'fab fa-tiktok' },
        { id: 'inputWhatsapp', icon: 'fab fa-whatsapp' },
        { id: 'inputLinkedin', icon: 'fab fa-linkedin' },
        { id: 'inputFacebook', icon: 'fab fa-facebook' },
        { id: 'inputWebsite', icon: 'fas fa-globe' },
        { id: 'inputTwitter', icon: 'fab fa-twitter' },
        { id: 'inputYoutube', icon: 'fab fa-youtube' },
        { id: 'inputTelegram', icon: 'fab fa-telegram' },
        { id: 'inputEmail', icon: 'fas fa-envelope', isEmail: true },
        { id: 'inputDiscord', icon: 'fab fa-discord' },
    ];

    const container = document.getElementById('livePreviewSocialLinks');
    container.innerHTML = '';

    platforms.forEach(platform => {
        const input = document.getElementById(platform.id);
        if (input && input.value) {
            const href = platform.isEmail ? `mailto:${input.value}` : input.value;
            container.innerHTML += `<a href="${href}" target="_blank"><i class="${platform.icon}"></i></a>`;
        }
    });
}

// Tambahkan event listener untuk semua input
[
    'inputInstagram', 'inputTiktok', 'inputWhatsapp', 'inputLinkedin',
    'inputFacebook', 'inputWebsite', 'inputTwitter', 'inputYoutube',
    'inputTelegram', 'inputEmail', 'inputDiscord'
].forEach(id => {
    const input = document.getElementById(id);
    if (input) {
        input.addEventListener('input', updateSocialPreview);
    }
});


    // Pilihan background tema (gambar)
    document.querySelectorAll('.theme-preview').forEach(img => {
        img.addEventListener('click', function () {
            const bgUrl = this.getAttribute('data-bg');
            const bgName = this.getAttribute('data-name');

            // Simpan nilai ke input hidden
            backgroundColorInput.value = bgName;

            // Terapkan background ke preview
            const previewScreen = document.getElementById('previewScreen');
            previewScreen.style.backgroundImage = `url('${bgUrl}')`;
            previewScreen.style.backgroundSize = 'cover';
            previewScreen.style.backgroundPosition = 'center';

            // Tambahkan border active
            document.querySelectorAll('.theme-preview').forEach(tp => {
                tp.style.border = "2px solid transparent";
            });
            this.style.border = "2px solid #FF9040";
        });
    });
});
</script>

</body>
</html>
