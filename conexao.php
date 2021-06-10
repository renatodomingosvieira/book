<?php 

$servidor = 'localhost:3306';
$usuario = "root";
$senha = '';
$banco = 'mydb';

$connect = mysqli_connect($servidor,$usuario,$senha,$banco);

if (!$connect) {

	die ("Falha na conexão: ". mysqli_connect_error ());

	}

 ?>