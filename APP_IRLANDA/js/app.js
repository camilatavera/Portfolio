var form = document.getElementById('formulario');
var nombre = document.getElementById('nombre');
var apellido = document.getElementById('apellido');
var email = document.getElementById('mail');
var telefono = document.getElementById('telefono');

form.addEventListener('submit', e => {
	e.preventDefault();
	
	validarEntradas();
});


function validarEntradas() {
	// trim to remove the whitespaces
	var nombreValor = nombre.value.trim();
	var apellidoValor = apellido.value.trim();
	var emailValor = mail.value.trim();
	var telefonoValor = telefono.value.trim();
	
     //NOMBRE
	if(nombreValor ===" ")
    {
		setErrorFor(nombre, 'Noi puede dejar el usuairo en blanco');
	} 

    //APELLIDO
    if(apellidoValor ===" ")
    {
		setErrorFor(apellido, 'Noi puede dejar el usuairo en blanco');
	} 
	
    //MAIL
	if(emailValor === '') 
    {
		setErrorFor(email, 'No puede dejar el email en blanco');
	} 
    else if (!isEmail(emailValor)) 
    {
		setErrorFor(email, 'No ingreso un email válido');
	} 
	
    //TELEFONO
	if(telefonoValor === '') 
    {
		setErrorFor(telefono, 'telefono no debe ingresar en blanco.');
	} 

	if(nombreValor!=null && apellidoValor!=null && emailValor!=null && telefonoValor!=null){
		location.reload();
	}
   
	
	
}



function setError(input, message) {
	const formControl = input.parentElement; /*el div que contiene la entrada y label de nombre*/
	const small = formControl.querySelector('small');
	small.innerText = message;
}



function isEmail(email) {
	return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}

function isPhoneNumber(telefono){

    var aux=telefono.trim();
    var cantNumeros = aux.a

}

href

