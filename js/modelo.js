/* Contiene las clases del Modelo*/

class Cliente {
	constructor(){
		this.nombre = "";
		this.numCel = 0;
		this.idCliente = 0;
	}

	//inserta datos en las propiedades
	setData(datos){
		for (var nombAtrib in datos){
			this[nombAtrib] = datos[nombAtrib];
		}
	}

	getData(){
		let nArray = {'nombre':this.nombre,'numCel':this.numCel, 'idCliente':this.idCliente};
		return nArray;
	}

	verificarCliente(){
		let datos = cliente.getData();
		datos ['opcion'] = 'verificarCliente'
		ejecutarAjax(datos, verificarClienteRespuesta);	
	}

	crearCliente(){
		let datos = cliente.getData();
		datos ['opcion'] = 'crearCliente'
		ejecutarAjax(datos, crearClienteRespuesta);
	}

	enviarCorreo(data){
		let datos = {};
		datos = data;
		datos ['opcion'] = 'enviarCorreo'
		ejecutarAjax(datos, enviarCorreoRespuesta)
	}
}

class Plan{
	constructor(){
		this.tipoPlan ="";
		this.idPlan = 0;
		this.precio = 0;
		this.anchoBanda = "";
		this.obsequio = "";
		this.obsequio2 = "";
	}

	//inserta datos en las propiedades
	setData(datos){
		for (var nombAtrib in datos){
			this[nombAtrib] = datos[nombAtrib];
		}
	}

	getData(){
		let nArray = {'tipoPlan':this.tipoPlan,'idPlan':this.idPlan, 'oferta':this.oferta,
					'precio':this.precio, 'anchoBanda':this.anchoBanda, 'obsequio':this.obsequio, 'obsequio2': this.obsequio2};
		return nArray;
	}
}

