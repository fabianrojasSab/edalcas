/******************************* VISTA ******************************************/
class Vista {
	constructor(){

	}
	/*************** CARGA LA PLANTILLA PRINCIPAL *******************************/
	cargarInicio(plantilla){
		let template = document.getElementById(plantilla);

		if (template){
			var clon = template.content.cloneNode(true);
			document.getElementById("cuerpo").innerHTML ="";
			document.getElementById("cuerpo").appendChild(clon);
		}
	}

    /***** CAPTURA LOS DATOS DEL FORMULARIO Y LOS DEVUELVE EN UN ARREGLO ***********/
    capturarDatos(formulario){
        let form = document.getElementById(formulario).elements;
        let nArray = {};
        for ( var i = 0; i < form.length; i++){
            if (form[i].tagName == "INPUT"||"TEXTAREA")
                nArray[form[i].name] = form[i].value;
        }
        return nArray;
    }

    /************ CARGA LA PLANTILLA Y ASIGA UN NUMERO EN POSACTUAL *********************/
    cargarPlantilla(plantilla, numeroBoton){
        let template = document.getElementById(plantilla);

        if (template){
            let clon = template.content.cloneNode(true);
            document.getElementById("cuerpo").innerHTML ="";
            document.getElementById("cuerpo").appendChild(clon);
            posActual = numeroBoton; //le asigna el numero del boton para cambiar el color de los bnts
           
            vista.mostrarNombreTelefono();
        }

        if (plantilla ==='inicio'){
        	slideActivo = true;
        }else {
        	slideActivo = false;
        }
    }

    /********************** MUESTRA LOS BOTONES ******************************************/
    mostrarBotonesPie(){
        document.getElementById("pie").style.display="block";
        document.getElementById("botones").style.display="block";
    }

    /****************************** LIMPIA EL DIV ******************************************/
	limpiarDiv(nombreDiv){
		document.getElementById(nombreDiv).innerHTML ="";
	}
	
	/************************************* MOSTRAR NOMBRE Y TELEFONO ***************************/
	mostrarNombreTelefono(){
        let datos = cliente.getData();
		var txt = "<ul><li>Nombre: "+datos["nombre"]+"</li><li>Telefono: "+datos["numCel"]+"</li></ul>"
		document.getElementById("destinoNombreTelefono").innerHTML = txt;
	}

	/******************** MUESTRA EL PLAN CONSULTADO POR EL CONTROLADOR ****************/
	mostrarPlanes(datos){
		let txt ="";
		for (let i =0; i< datos.length; i++){
				txt += "<p class='planes'> precio:"+datos[i]['precio']+"<br>"
				txt += "ancho de banda:"+datos[i]['anchoBanda']+"<br>"
				txt += "obsequio:"+datos[i]['obsequio']+"<br>"
                txt += "<i onclick='registrarPlan("+datos[i]['idPlan']+")' class='fa fa-star fa-4x' aria-hidden='true'></i></p>"
		}
		document.getElementById(destino).innerHTML = txt
	}

    /******************************** MUESTRA LAS IMAGENES EN EL SLIDE ************************/
    mostrarImagenesSlide(datos){
        let txt = "";
            txt += "<div class='mySlides' id='mySlides1'><img src="+datos[0]['nombreImagen']+"></div>"
            txt += "<div class='mySlides' ><img src="+datos[1]['nombreImagen']+"></div>"
            txt += "<div class='mySlides' ><img src="+datos[2]['nombreImagen']+"></div>"
            txt += "<div class='mySlides' ><img src="+datos[3]['nombreImagen']+"></div>"
            txt += "<div class='mySlides' ><img src="+datos[4]['nombreImagen']+"></div>"
            txt += "<div class='mySlides' ><img src="+datos[5]['nombreImagen']+"></div>"
            txt += "<button  id='btnizq' onclick='correrSlide(-2)'> <img src=''></button>"
            txt += "<button  id='btnder' onclick='correrSlide(0)'> <img src=''></button>"
        document.getElementById("w3").innerHTML = txt;
    }

	/***************************************** SLIDE ******************************************/
	slide() {
		if(slideActivo){
		  var i;
		  var x = document.getElementsByClassName("mySlides");
		  if (slideIndex >= x.length) {slideIndex = 0}    
		  if (slideIndex < 0) {slideIndex = x.length -1}
		  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";  
		  }
		  x[slideIndex++].style.display = "block";  

		}
	}

	/******************* VALIDA LOS DATOS DEL FORMULARIO DADO ***********************/
	validarDatosForm(form){
		let elements = document.getElementById(form).elements;
		let msj = 'ok';
		for(let i = 0; i < elements.length; i++) { 
			let field_type = elements[i].type.toLowerCase();
			switch(field_type) {
				case "text": 
				case "textarea":
			    case "hidden":
					if(elements[i].value.length == 0)
						msj = 'Los campos deben contener texto'; 
					break;

				case "password": 
					if(elements[i].value.length < 5)
						msj = 'El password debe tener al menos cinco caracteres'; 
					break;
			    case "email":
			    	if(this.isEmail(elements[i].value))
						msj = 'No es un correo electronico valido'; 
					break;

				case "select-one":
				case "select-multi":
		            		elements[i].selectedIndex = -1;
					if(elements[i].selectedIndex < 0)
						msj = 'Debe seleccionar una opción'; 
					break;

				case "number": 
					if(elements[i].value < 1)
						msj = 'Debe digitar un numero positivo, mayor a cero'; 
					break;

				default: 
					break;
			}
	    }
	    return msj;
	}

	isEmail(email) {
		var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		return regex.test(email);
	}

	/*cambiarColorBotones(){
	 	switch (posActual){
	    case "0":
	        document.getElementById("boton1").style.backgroundColor = "#084B8A";
	        document.getElementById("boton1").style.color = "white";
	        if (botonAnterior){
	        	document.getElementById(botonAnterior).style.backgroundColor = "white";
	        	document.getElementById(botonAnterior).style.color = "black";
	        }
	        botonAnterior = "boton1"
	        break;
	    case "1":
	        document.getElementById("boton2").style.backgroundColor = "#084B8A";
	        document.getElementById("boton2").style.color = "white";
	        document.getElementById(botonAnterior).style.backgroundColor = "white";
	        document.getElementById(botonAnterior).style.color = "black";
	        botonAnterior = "boton2"
	        break;
	    case "2":
	        document.getElementById("boton3").style.backgroundColor = "#084B8A";
	        document.getElementById("boton3").style.color = "white";
	        document.getElementById(botonAnterior).style.backgroundColor = "white";
	        document.getElementById(botonAnterior).style.color = "black";
	        botonAnterior = "boton3"
	    }
	}*/

}