<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurante Elegante</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            width: 100%;
            top: 0;
            left: 0;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        .login {
            background: gold;
            padding: 8px 15px;
            border-radius: 5px;
        }
        .hero {
            height: 100vh;
            width: 100%;
            background-image: url('{{ asset('images/portada.jpg') }}');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            font-size: 2em;
        }
        .upload-form {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(0, 0, 0, 0.7);
            padding: 10px;
            border-radius: 5px;
        }
        .upload-form input {
            color: white;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="#">Inicio</a>
            <a href="#">Menú</a>
            <a href="#">Reservas</a>
            <a href="#">Contacto</a>
        </div>
        <a href="#" class="login">Login</a>
    </div>
    <div class="hero">
        <h1>Bienvenido a Nuestro Restaurante</h1>
    </div>

    <!-- Formulario para cambiar la imagen de portada -->
    <form action="{{ route('upload.portada') }}" method="POST" enctype="multipart/form-data" class="upload-form">
        @csrf
        <input type="file" name="imagen" required>
        <button type="submit">Subir Imagen</button>
    </form>

    @if(session('success'))
        <p style="color: green; text-align: center;">{{ session('success') }}</p>
    @endif

</body>

</html>
