<?php
$host = 'blraqjbcamdniyldcytz-mysql.services.clever-cloud.com';
$db   = 'blraqjbcamdniyldcytz';
$user = 'uwroz7dlf6hnf6rg';
$pass = 'a4QQFeXEY5NjNAyAJFng';
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
