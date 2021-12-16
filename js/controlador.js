/********************************************************
 	PROYECTO: Edalcas
 	PROGRAMA: controlador.js
 	MODIFICADO: OCT/21/2018
 	ver: 2.0
*********************************************************/
var posActual = 0;
var botonAnterior ="";
var destino = ""; //variable para la plantilla destino del plan a mostrar
var nombreBtn = ""; // nombre para los botones de planes
var vista = new Vista();	
var cliente = new Cliente();
var plan = new Plan();
var copiaPlanes = null; //guarda una copia del div#contenedorPlanes

var slideActivo = false;
var slideIndex = 0;
var slide = window.setInterval(vista.slide, 3000);

vista.slide(slideIndex);

/***************** CARGA LA PLANTILLA LOGIN *************************************/
window.onload = function() {
	vista.cargarInicio("login");
};

/************** VALIDA LOS DATOS Y LOS CAPTURA SI ESTAN BIEN ****************/
function validarIngreso(){
	let respuestaValidar = vista.validarDatosForm("datos");
	if(respuestaValidar=="ok"){
		cliente.setData(vista.capturarDatos("datos"));
		cliente.verificarCliente();
	}else{
		alert(respuestaValidar);
	}
};

/*************** CALLBACK VERIFICAR CLIENTE CREA EL CLIENTE SI NO EXISTE **************/
function verificarClienteRespuesta(datos){
	cliente.setData(datos[0]);
	if (datos.length === 0 ){
		cliente.crearCliente();
	}
	vista.cargarPlantilla('inicio','0');
	vista.mostrarBotonesPie();
	consultarImagenesSlide();
}	

/********************************** CALLBACK CREAR CLIENTE *****************************/
function crearClienteRespuesta(datos){
	if (datos>0) {
		alert("registro creado");
	}else {alert("no se pudo crear registro");}
};

/******************************** FUNCIONES PARA MOSTRAR PLANTILLAS *************************/
function mostrarInicio(plantilla, numeroBoton){
	vista.cargarPlantilla(plantilla, numeroBoton);
	 $('nav').toggleClass('active')
	 consultarImagenesSlide();
}

function mostrarPlanes(plantilla, numeroBoton){
	vista.cargarPlantilla(plantilla, numeroBoton);
	 $('nav').toggleClass('active')
}

function mostrarContactenos(plantilla, numeroBoton){
	vista.cargarPlantilla(plantilla, numeroBoton);
	 $('nav').toggleClass('active')
}

/*********** CONSULTA EL PLAN EN LA BD SEGUN EL PARAMETRO PLAN **********************************/
function consultarPlan(divDestino, plan){
	let datos = {}
	datos ['opcion'] = 'consultarPlan';
	datos ['plan'] = plan;
	destino = divDestino;
	ejecutarAjax(datos, consultarPlanRespuesta);
}

/*************************** CALLBACK CONSULTAR PLANES *******************/
function consultarPlanRespuesta(datos){
	vista.mostrarPlanes(datos);//funcion en vista que muestra los planes
}

/*********************************** SLIDE ***************************************/
function correrSlide(n) {
	slideActivon = true;
	slideIndex += n;
	vista.slide();
}

/***************************** REGISTRAR PLAN ***********************************/
function registrarPlan(idPlan) {
	let datos = cliente.getData();
	let x = idPlan
	datos['idPlan'] = x;
	datos['opcion'] = "registrarPlan";
	ejecutarAjax(datos,registrarPlanRespuesta);
}

/***************************** CALLBACK REGISTRAR PLAN****************************/
function registrarPlanRespuesta(datos){
	if (datos) {
		alert("Plan Registrado");
	}else {alert("No se pudo resgistrar el plan");}
}

/***************************** ENVIAR CORREO DE CONTACTO *************************/
function enviarCorreo(){
	let respuestaValidar = vista.validarDatosForm("correo");
	if(respuestaValidar=="ok"){
		let x = vista.capturarDatos("correo");
		cliente.enviarCorreo(x);
	}else{
		alert(respuestaValidar);
	}
}

/***************** CALLBACK ENVIAR CORREO ***************************************/
function enviarCorreoRespuesta(){

}

/*************************** BOTONES NAV ***************************************/
$(document).ready(function(){
	$('.menu-toggle').click(function(){
		$('nav').toggleClass('active')
	})
})

/******************************** CONSULTA LA IMAGENES DEL SLIDE ****************/
function consultarImagenesSlide(){
	let datos = {};
	datos ['opcion'] = 'consultarImagenesSlide';
	ejecutarAjax(datos,consultarImagenesSlideRespuesta);
}

/*********************** CALLBACK IMAGENES SLIDE ************************************/
function consultarImagenesSlideRespuesta(datos){
	vista.mostrarImagenesSlide(datos);
}


/*******************************************************************************/
function salir(){
	var resp = window.confirm("esta seguro que desea salir?");
	if (resp === false);
	else location.reload();
};


function ejecutarAjax(datos, funcionRetorno){
	$.ajax({
		url: 'php/proyformativo.php',
		data: datos,
		type: 'post',

		success : function(response){
			var resp = JSON.parse(response);
			funcionRetorno(resp);
		},

		error: function(xhr){
            alert("An error occured: " + xhr.status + " " + xhr.statusText);
        }
	});
};

