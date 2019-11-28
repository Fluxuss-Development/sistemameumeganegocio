<!DOCTYPE html>
<html>
<head>
	<title>Login do empresário</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/animate.min.css">
	  <meta name="viewport" content="width=device-width, initial-scale=1"> <!--Ajustar site-->
	<style>
		body{background-color: #303030; color: white;}
		#nom{resize: none; height:35px;}
		#sen{resize: none; height:35px;}
	</style>
    <script src="js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
</head>
<body>
	<?php 
		include 'gerencialogin_admin.php';
    ?> 
	<center>	
		<form method="post">	
			<div class="container">

				<div class="form-group">
					<div class="row wow slideInLeft animated slideInLeft">
						
						<div class="col-md-12">
							<br><br><br>
							<img src="Imagens/icon.png" class="animated infinite bounce img-responsive" width="50px" height="50px">
							<img src="Imagens/logotipo_sem_fundo.png" class="img-responsive" width="300px" height="480px"><br>
						</div>
						<div class="col-md-4">

						</div>
						<div class="col-md-4">
							 <?php
                                if (empty($_SESSION['msg'])) {
                                    echo "";                                    
                                }else{
                                    echo $_SESSION['msg'];    
                                }
                              ?>
							<br><label>Nome</label>
							<textarea id="nom" maxlength="100" class="form-control" name="edt_nome" placeholder="Digite seu nome..." required></textarea>
							<br><label>Senha</label>
							<input type="password" id="sen" maxlength="100" class="form-control" name="edt_senha" placeholder="Digite sua senha..." required>
							<br><button type="submit" class="btn btn-danger">Logar</button><br><br>
							<a href="index.html" class="btn btn-warning" id="btn">Voltar</a>
						</div>	
					</div>
				</div>		
			</div>
		</form>
	</center>
</body>
</html>