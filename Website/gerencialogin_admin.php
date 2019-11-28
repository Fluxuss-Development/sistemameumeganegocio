<?php 
include ('./conexao.php');
$nome = empty($_POST['edt_nome'])? '' : ($_POST['edt_nome']);
$senha = empty($_POST['edt_senha'])? '' : ($_POST['edt_senha']);
	if (empty($nome)) {

	}else{
		$nome = mysqli_real_escape_string($conexao,$nome);
		$senha = mysqli_real_escape_string($conexao,$senha);
		$sqlselect = "select * from empresario where empnome='$nome' and empsenha = md5('$senha') and empativo = 1;";
		$result = mysqli_query($conexao,$sqlselect);
		if (mysqli_num_rows($result) == 1) {
			$row = mysqli_fetch_array($result);
			session_start();
			$_SESSION['nomef'] = $row['empnome'];
			$_SESSION['idf'] = $row['empcod'];			
			header('location:dashboardadmin');
		}else{
			  session_start();   
			  $_SESSION['msg'] = '<div class = "alert alert-danger">Nome ou senha inválidos</div>';
			  //header('location:admin');  
		}

	}


?>