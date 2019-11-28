<?php 
session_start();
unset($_SESSION['cpf']);
unset($_SESSION['nome']);
//session_destroy();
header('location:login');

 ?>