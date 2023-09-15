const formulario = document.getElementById('formulario');

const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
	usuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
	nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
	password: /^.{4,12}$/, // 4 a 12 digitos.
	correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
	telefono: /^\d{7,14}$/ // 7 a 14 numeros.
}

const validarFormulario = (e) => {
	switch (e.target.name) {
		case "first_name":
			validarForm(expresiones.nombre, e.target, 'nombre');
		break;
		case "second_name":
			validarForm(expresiones.nombre, e.target, 'segundo_nombre');
		case "last_name":
			validarForm(expresiones.nombre, e.target, 'apellido');
		break;
		case "second_last_name":
			validarForm(expresiones.nombre, e.target, 'segundo_apellido');
		/*case "document_type":
			validarForm(expresiones.nombre, e.target, 'tipo_documento');
		break;*/
		case "document_number":
			validarForm(expresiones.nombre, e.target, 'numero_documento');
		break;
		case "age":
			validarForm(expresiones.nombre, e.target, 'edad');
		break;
		case "gender":
			validarForm(expresiones.nombre, e.target, 'genero');
		break;
		case "email":
			validarForm(expresiones.nombre, e.target, 'e-mail');
		break;
		case "username":
			validarForm(expresiones.nombre, e.target, 'usuario');
		break;
		case "password":
			validarForm(expresiones.nombre, e.target, 'contraseña');
		break;
	}
}

const validarForm = (expresion, input, campo) => {
	if (expresion.test(input.value)) {
		document.getElementById(campo).classList.remove('invalid');
		document.getElementById(campo).classList.add('valid');
		
	} else {
		document.getElementById(campo).classList.add('invalid');
		document.getElementById(campo).classList.remove('valid');
	}
}

inputs.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);
	input.addEventListener('blur', validarFormulario);	
});

formulario.addEventListener('submit', (e) => {
	e.preventDefault();
});