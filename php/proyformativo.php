<?php
/******** realiza la conexion *****************************************************/
include("conexion.php");

/************ asigna las variables***********************************************/  
$opcion = $_POST['opcion'];
$datos = array();

/*********************************************************************************/
switch ($opcion) {
	case 'crearCliente':
		//ASIGNO LOS VALORES AL ARRAY
		$datos[0]= $_POST['nombre'];
		$datos[1]= $_POST['numCel'];
		//INSERTO LA CONSULTA EN LA VARIABLE
		$consulta = 'INSERT INTO clientes (nombre, numCel) VALUES (?,?)';
		actualizarRegistro($consulta); 
	break;

	case 'verificarCliente':
		$consulta = 'SELECT * FROM clientes WHERE numCel = ?';
		$datos[0] = $_POST['numCel'];
		leerDatos($consulta);
		break;

	case 'consultarPlan':
		$consulta = 'SELECT * FROM planes WHERE tipoPlan = ?';
		$datos[0] = $_POST['plan'];
		leerDatos($consulta);
		break;

	case 'registrarPlan':
		$datos[0] =$_POST['idPlan'];
		$datos[1] =$_POST['idCliente'];
		$fecha= date("Y-m-d H:i:s");//obtiene la fecha actual
		$consulta = "INSERT INTO clientesinteresados (idPlan, idCliente, FechaRegistro) VALUES (?,?,'$fecha')";
		actualizarRegistro($consulta);
		break;

	case 'enviarCorreo':
		$nombre = $_POST['nombre'];
		$correo = $_POST['correo'];
		$mensaje = $_POST['mensaje'];
		$cabecera = "From:".$nombre."<".$correo.">";

		if (mail("info@edalcas.com","Aplicacion Edalcas",$mensaje,$cabecera)) {
			echo "Mensaje enviado exitosamente";
		}else{
			echo "Error al enviar correo";
		}
		break;

	case 'consultarImagenesSlide':
		$consulta = "SELECT * FROM imagenesslide";
		leerDatos($consulta);
}

/********************************************************************************/	



/*** REALIZA LA CONSULTA(insertar) EN LA BASE DE DATOS Y DEVUELVE EL NUMERO DE FILAS AFECTADAS *****/

function actualizarRegistro($consulta){
	global $pdo, $datos;
	//PREPARO LA CONSULTA Y LA GUARDO EN LA VARIABLE
	$stmt = $pdo->prepare($consulta);

	// HAGO EL RECORRIDO PARA ASIGNAR EL VALOR A CADA UNO
	for($i = 0;$i<count($datos);$i++){
		$stmt->bindparam($i+1, $datos[$i]);
	}

	$stmt->execute();

	//CUENTA CUANTAS FILAS FUERON AFECTADAS
	$cuenta = $stmt->rowCount();
	//DEVUELVO LA RESPUESTA CON JSON
	echo json_encode($cuenta,JSON_UNESCAPED_UNICODE); 
}

/*** REALIZA LA CONSULTA(select) Y DEVUELVE LA INFORMACION ENCONTRADA *******************/
function leerDatos($consulta){
	global $pdo, $datos;

	$stmt = $pdo->prepare($consulta);

	for($i = 0;$i<count($datos);$i++){
		$stmt->bindparam($i+1, $datos[$i]);
	}

	$stmt->execute();

	$rows = $stmt->fetchAll();

	echo json_encode($rows,JSON_UNESCAPED_UNICODE); 
}

?>
