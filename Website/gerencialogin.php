<?php
include './conexao.php';
$cpf =  empty($_POST['edt_cpf'])? '' : ($_POST['edt_cpf']);

if (empty($cpf)){
}
else{
    $cpf = mysqli_real_escape_string($conexao,$cpf);
    $sqlselect = "select * from clientes where clicpf='$cpf'";
    $result = mysqli_query($conexao, $sqlselect);
    if (mysqli_num_rows($result) == 1){
        $row = mysqli_fetch_array($result); 
        session_start();
        $_SESSION['cpf']=$cpf;
        $_SESSION['nome']=$row['clinome'];
        $_SESSION['id']=$row['clicod'];
        header('location:dashboard');
    }else{
    session_start();   
    $_SESSION['msg'] = '<div class = "alert alert-danger">CPF Inválido</div>';      
    //header('location:login');  
    
    }
}
?>