<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php
    include './conexao.php';
    session_start();
    if ((!isset($_SESSION['cpf']) == true ) and (!isset($_SESSION['nome']) == true) /*and (!isset($_SESSION['id'])==true)*/){
    unset($_SESSION['cpf']);
    unset($_SESSION['nome']);
    header('location: login');
	}
                            
?>
<html lang="pt-BR">
    <head>
        <title>Página principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/animate.min.css">

        <link rel="stylesheet" href="css/onsenui.css">
        <link rel="stylesheet" href="css/onsen-css-components.min.css">
        <script src="js/onsenui.min.js"></script>
        <style type="text/css">
            
            body{ color: #303030; overflow-y: scroll;}

            
        </style>
    </head>
    <body>
        <?php
            
        ?>
        <nav class="nav navbar-default" style="background-color: #303030;">
            <div class="container">
                <div class="navbar-header">
                   <a class="navbar-brand" style="color: white;">Meu mega negócio</a>
                </div>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="produtos" style="color: white;">Produtos</a></li>
                    <li><a href="contato" style="color: white;">Sobre nós</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
						<li><a href="dashboard" style="color: white;">Voltar ao perfil</a></li>
                </ul>
            </div>
            
        </nav>
        
        <div class="container">
            <div class="row">
                <div class="col-md-4"
						<br><br><br>
						<center>
						<img src="Imagens/icon.png" class="animated infinite bounce img-responsive" width="50px" height="50px">
						<img src="Imagens/logotipo_sem_fundo_dark.png" class="img-responsive">
						</center>
			    </div>
		
                <div class="col-md-4">
					<br><br><br><br>	
				</div>
				<div class="col-md-8">
					<br><br><br><br>
				</div>
				 <div class="col-md-8">
					<div style="height: 200px; padding: 1px 0 0 0;">
                      <div class="card" style="background-color: #303030; ">
                        <h2 class="card__title" style="color: white;">Meu Mega Negócio.</h2>
                        <div class="card__content" style="color: white;"><h3>O objetivo desse trabalho é apresentar uma solução de desenvolvimento de um sistema de gerenciamento de vendas de código aberto que visa auxiliar o empresário e seus funcionários a gerenciar as vendas de sua empresa, empregando ferramentas e metodologias que auxiliem nessa função.</h3></div>
                      </div>
                    </div>
                    
				 </div>
				</div>
				<div class="col-md-8">
						
				</div>
				
        </div>

    </body>
</html>
