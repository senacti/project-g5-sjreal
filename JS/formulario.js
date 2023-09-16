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
		case "first_name":
			validarForm(expresiones.nombre, e.target, 'group__name');
		break;
		case "second_name":
			validarForm(expresiones.nombre, e.target, 'group__2name');
		break;
		case "last_name":
			validarForm(expresiones.nombre, e.target, 'group__apellido');
		break;
		case "second_last_name":
			validarForm(expresiones.nombre, e.target, 'group__2apellido');
		break;
		case "document_number":
			validarForm(expresiones.documento, e.target, 'group__documento');
		break;
		case "age":
			validarForm(expresiones.edad, e.target, 'group__edad');
		break;
		case "phone":
			validarForm(expresiones.telefono, e.target, 'group__telefono');
		break;
		case "email":
			validarForm(expresiones.correo, e.target, 'group__email');
		break;
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
	e.preventDefault();
    if (/*campos.first_name && campos.second_name 
		&& campos.last_name && campos.second_last_name 
		&& campos.document_number && campos.phone 
		&& campos.email && campos.username && campos.password*/
		true) {
		formulario.reset();
		document.getElementById('mensaje_exitoso').classList.add('mensaje_exito-activo');
	} else {
	
	}
});