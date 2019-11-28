<?php
    include './conexao.php';
    session_start();
    if ((!isset($_SESSION['cpf']) == true ) and (!isset($_SESSION['nome']) == true) /*and (!isset($_SESSION['id'])==true)*/){
    unset($_SESSION['cpf']);
    unset($_SESSION['nome']);
    header('location: login');
	}
                            
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sobre nós!</title>
</head>
<body>
    
</body>
</html>