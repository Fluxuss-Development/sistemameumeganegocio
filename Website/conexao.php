<?php
$host="db4free.net";
$user="meganegocio";
$pass="07172002Pedro#Sampaio";
$banco="meumeganegocio";

$conexao = mysqli_connect($host,$user,$pass,$banco);

$db = mysqli_select_db($conexao,$banco);

@mysqli_set_charset($conexao,"utf8");


?>