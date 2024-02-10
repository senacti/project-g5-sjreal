const formulario = document.getElementById('formulario');

const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
	usuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
	nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
	documento: /^\d{6,10}$/, // 1 a 20 numeros.
	password: /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/, // 8 a 20 digitos, 1 mayuscula, 1 minuscula, 1 numero y 1 caracter especial.
	correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
	telefono: /^\d{10}$/, // 7 a 14 numeros.
	edad: /^(0?[1-9]|[1-9][0-9]|1[01][0-9]|120)$/ // De 0 a 120 años.
}

const campos = {
	first_name: false,
	second_name: false,
	last_name: false,
	second_last_name: false,
	document_number: false,
	phone: false,
	email: false,
	username: false,
	password: false
}

const validarFormulario = (e) => {
	switch (e.target.name) {
		case "username":
			validarForm(expresiones.usuario, e.target, 'group__user');
		break;
		case "password":
			validarForm(expresiones.password, e.target, 'group__password');
		break;
	}
}

const validarForm = (expresion, input, campo) => {
	if (expresion.test(input.value)) {
		document.getElementById(campo).classList.remove('group_invalido');
		document.getElementById(campo).classList.add('group_valido');
		campos[input.name] = true;
	} else {
		document.getElementById(campo).classList.add('group_invalido');
		document.getElementById(campo).classList.remove('group_valido');
		campos[input.name] = false;
	}
}

inputs.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);
	input.addEventListener('blur', validarFormulario);	
});

formulario.addEventListener('submit', (e) => {
        
    if ( campos.username==true && campos.password==true) {
		formulario.reset();
		document.getElementById('mensaje_exitoso').classList.add('mensaje_exito-activo');
        document.getElementById('false_symbols').classList.remove('grupo_invalido');
        document.getElementById('false_symbols').classList.add('grupo_valido');
        var btn = document.getElementById('iniciar-sesion');

        btn.addEventListener('click', function() {
        window.location.href = "dashboard.html";
        });
	} else {
        formulario.reset();
        document.getElementById('mensaje_fail').classList.add('grupo_invalido');
	}
});

/*Boton para redirigir al dasboard*/

// username
//password
function validarCredenciales() {
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	console.log(username);
	console.log(password);
	var usernameCorrecto = "admin";
	var passwordCorrecto = "*Admin123";

	if (username == usernameCorrecto && password == passwordCorrecto) {
		console.log(usernameCorrecto);
		console.log(passwordCorrecto);
		// Si las credenciales son correctas, redirigir al usuario a otra página

		// document.getElementById("../vistashtml/inicio/login.html").href = "../vistashtml/dashboard/administrador/inicio.html";
		// location.href("C:/Users/esteb/Desktop/ProjectoSena/project-g5-sjreal/app/vistashtml/dashboard/administrador/inicio.html");
		window.location.assign = "../../dashboard/administrador/inicio.html";
		// window.location.assign = "app/vistahtml/dashboard/inicio.html";
		// window.location.replace = "vistashtml/dashboard/administrador/inicio.html";

		// document.getElementById("enlacePagina").style.display = "inline";
	} else {
		alert("Usuario o contraseña incorrectos. Por favor, inténtalo de nuevo.");
	}
}