<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de registro</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="styleRegistro.css">
</head>

<body class="body">
    <main class="main" style="background-image: url(app/assets/images/imagendifuminada.png);">

        <header class="header-module">
            <div class="header-module__logo">
                <img src="app/assets/images/Logo-proyecto(1).png" alt="Hotel Logo">
                <h1>Hotel San Jose Real</h1>
            </div>
            <nav class="header-module__nav">
                <ul class="header-module__list">
                    <li>
                        <a class="list-item">
                            <span class="material-symbols-outlined list-item__icon">
                                home
                            </span>
                            <p class="list-item__label">Home</p>
                        </a>
                    </li>
                    <li>
                        <a class="list-item">
                            <span class="material-symbols-outlined list-item__icon">
                                person
                            </span>
                            <p class="list-item__label">Iniciar sesion</p>
                        </a>
                    </li>
                    <li>
                        <a class="list-item">
                            <span class="material-symbols-outlined list-item__icon">
                                person_check
                            </span>
                            <p class="list-item__label">Registro</p>
                        </a>
                    </li>
                    <li>
                        <a class="list-item">
                            <span class="material-symbols-outlined list-item__icon">
                                checkbook
                            </span>
                            <p class="list-item__label">Reservas</p>
                        </a>
                    </li>
                </ul>
                <ul class="header-module__list">
                    <li>
                        <a class="list-item">
                            <span class="material-symbols-outlined list-item__icon">
                                open_in_new
                            </span>
                            <p class="list-item__label">Sobre</p>
                        </a>
                    </li>
                    <li>
                        <a class="list-item">
                            <span class="material-symbols-outlined list-item__icon">
                                bed
                            </span>
                            <p class="list-item__lab">Habitaciones</p>
                        </a>
                    </li>
                    <li>
                        <a class="list-item">
                            <span class="material-symbols-outlined list-item__icon">
                                loyalty
                            </span>
                            <p class="list-item__label">Planes</p>
                        </a>
                    </li>
                    <li>
                        <a class="list-item">
                            <span class="material-symbols-outlined list-item__icon">
                                rate_review
                            </span>
                            <p class="list-item__label">Opiniones</p>
                        </a>
                    </li>

                </ul>
            </nav>
        </header>

        <div class="container">
            <h2>Formulario de registro</h2>
    
                <form action="" method="post" id="formulario" class="formulario">
                    <ul class="grid">
    
                        <li id="group__name">
                            <label class="validar" id="" for="first_name">Nombre:</label>
                            <div class="primer_nombre">
                                <input class="validar_input" type="text" id="first_name" name="first_name" required>
                                <span class="material-symbols-outlined message-item">check_circle</span>
                                <span class="material-symbols-outlined message-item" id="false_symbols">
                                    cancel
                                </span>
                            </div>
                            <p class="mensaje_error">los nombres solo pueden estar compuestos de letras y espacios</p>
                        </li>
    
                        <li id="group__apellido">
                            <label class="validar" id="" for="last_name">Apellido:</label>
                            <div class="apellido">
                                <input class="validar_input" type="text" id="last_name" name="last_name" required>
                                <span class="material-symbols-outlined message-item">check_circle</span>
                                <span class="material-symbols-outlined message-item" id="false_symbols">cancel</span>
                            </div>
                            <p class="mensaje_error">los apellidos solo pueden estar compuestos de letras y espacios</p>
                        </li>
    
                        <li id="group__tipoDocumento">
                            <label class="validar" id="" for="document_type">Tipo de Documento:</label>                        
                                <div class="select-class">
                                    <select id="document_type" name="document_type" required>
                                        <option value="">Seleccione</option>
                                        <option value="Cédula de Ciudadanía">Cédula de Ciudadanía</option>
                                        <option value="Tarjeta de Identidad">Tarjeta de Identidad</option>
                                        <option value="Cedula extranjera">Cedula de extranjería</option>
                                        <option value="Pasaporte">Pasaporte</option>
                                    </select>
                                </div>                    
                        </li>
    
                        <li id="group__documento">
                            <label class="validar" id="" for="document_number">Nro. de Documento:</label>
                            <div class="numero_documento">
                                <input class="validar_input" type="text" id="document_number" name="document_number" required>
                                <span class="material-symbols-outlined message-item">check_circle</span>
                                <span class="material-symbols-outlined message-item" id="false_symbols">cancel</span>
                            </div>
                            <p class="mensaje_error">El número de documento tiene entre 6 y 10 dígitos</p>
                        </li>
    
                        <li id="group__telefono">
                            <label class="validar" id="" for="phone">Teléfono:</label>
                            <div class="telefono">
                                <input class="validar_input" type="text" id="phone" name="phone" required>
                                <span class="material-symbols-outlined message-item">check_circle</span>
                                <span class="material-symbols-outlined message-item" id="false_symbols">cancel</span>
                            </div>
                            <p class="mensaje_error">Ingrese un número válido</p>
                        </li>
    
                        <li id="group__email">
                            <label class="validar" id="" for="email">Email:</label>
                            <div class="e-mail">
                                <input class="validar_input" type="email" id="email" name="email" required>
                                <span class="material-symbols-outlined message-item">check_circle</span>
                                <span class="material-symbols-outlined message-item" id="false_symbols">cancel</span>
                            </div>
                            <p class="mensaje_error">Ingrese un correo válido</p>
                        </li>
    
                        <li id="group__user">
                            <label class="validar" id="" for="username">Usuario:</label>
                            <div class="usuario">
                                <input class="validar_input" type="text" id="username" name="username" required>
                                <span class="material-symbols-outlined message-item">check_circle</span>
                                <span class="material-symbols-outlined message-item" id="false_symbols">cancel</span>
                            </div>
                            <p class="mensaje_error">El usuario tiene que ser de 4 a 16 carateres y solo puede contener letras, numeros, guión y guión bajo</p>
                        </li>
    
                        <li id="group__password">
                            <label class="validar" id="" for="password">Contraseña:</label>
                            <div class="contraseña">
                                <input class="validar_input" type="password" id="password" name="password" required>
                                <span class="material-symbols-outlined message-item">check_circle</span>
                                <span class="material-symbols-outlined message-item" id="false_symbols">cancel</span>
    
                            </div>
                            <p class="mensaje_error">La contraseña debe contener de 8 a 20 digitos, al menos 1 mayúscula, 1 minúscula, 1 número y 1 caracter especial como @$!%*?&</p>
                        </li>
    
                        <li class="li-buttons">
                            <button type="submit" class="btn btn-login">Registrarse</button>
                        </li>
    
                        <li class="li-buttons">
                            <button type="button" class="btn btn-cancel" onclick="showLoginForm()">Cancelar
                                registro</button>
                        </li>
                        
                    </ul>
                </form>
    
        </div>

    </main>


    <script src="formulario.js"></script>
</body>

</html>