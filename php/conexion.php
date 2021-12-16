<?php
$host = 'biwshojlq7viry0rd5oz-mysql.services.clever-cloud.com';
$db   = 'biwshojlq7viry0rd5oz';
$user = 'u2r3cm175mwzd0er';
$pass = 'HYHCgRYadrq4Nqd37V8z';
$charset = 'utf8mb4';

/******************************/
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
	PDO::ATTR_ERRMODE             => PDO::ERRMODE_EXCEPTION,
	PDO::ATTR_DEFAULT_FETCH_MODE  => PDO::FETCH_ASSOC,
	PDO::ATTR_EMULATE_PREPARES    => false,
];
try{
	$pdo = new PDO($dsn, $user, $pass, $options);
}catch(\PDOException $e) {
	throw new \PDOException($e->getMessage(), (int)$e->getCode());
}
?>