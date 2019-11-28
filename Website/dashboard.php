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
<html>
<head>
    <title>Área do Cliente</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <style> body{color: #303030; max-width: 100%; overflow-y: scroll; } </style>
    <link rel="stylesheet" type="text/css" href="css/modal.css">
    <script async type="text/javascript" src="js/modalnovo.js"></script>

</head>
<body>  
    <?php 
        include 'conexao.php';
        $id = $_SESSION['id'];
        $sqlselect = "select * from vendas where venclicod = '$id'";
        $resultado = mysqli_query($conexao,$sqlselect);
    ?>

    <nav class="nav navbar-default" style="background-color: #303030;">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" style="color: white;" href="./menuprincipal">Meu mega negócio</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="logoff.php"><button class="btn-danger">Logout</button></a></li>
            </ul>            
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div id="myModal" class="modal col-md-4">
                <!-- Modal content -->
				<div class="modal-content">
					<span class="close">&times;</span>
					<?php
					$sqlstring = "select * from clientes where clicod = '$id'";
					$sqlquery = mysqli_query($conexao, $sqlstring);
					while($row = mysqli_fetch_array($sqlquery)){ ?>
					<h4>Nome: <?php echo $row['clinome']; ?></h4>
					<h4>Telefone: <?php echo $row['clifone']; ?></h4>
					<h4>Endereço: <?php echo $row['cliendereco']; ?></h4>
					<h4>CPF: <?php echo $row['clicpf']; ?></h4>
					<?php } ?>
                </div>
            </div>
            <br><br>
            <div class="col-md">
                <ol><button id="myBtn" class="btn btn-danger">Ver dados</button></ol>
            </div>                       
            <div class="card col-md-6" style="top:25px;">
                <h1>Informações do cliente</h1><br>    
                <h3>Seja bem vindo <?php echo $_SESSION['nome']; ?></h3>      
                <?php   
                    include('conexao.php');
                    $id = $_SESSION['id'];
                    $somaTotal = "select SUM(ventotal) as ValorSomado from vendas where venclicod='$id'";
                    $resultadoSoma = mysqli_query($conexao,$somaTotal);
                ?>
                <?php  while ($soma=mysqli_fetch_array($resultadoSoma)) { ?>
                <h4>
                    Você já comprou um total de: R$
                    <?php 
                        if (empty($soma['ValorSomado'])) {
                            echo "0,00";
                        }else{
                            echo $soma['ValorSomado']; 
                        } 
                    ?>
                </h4>
                <?php } ?>
                <?php $soma_valores = 0; ?>
                <?php while($row = mysqli_fetch_array($resultado)){ ?>
                <?php 
                    echo "<h4>" . 'Código da compra: '. $row['vencod']. '</br>';
					echo 'Data da compra: '. $row['vendataven']. '</br>';
					echo 'Total: R$'. $row['ventotal']. '</br>';
						if(empty($row['vendesconto'])){
					    	echo 'Valor descontos: R$0,00'. '</br>';
						}else{
							echo 'Valor descontos: R$'. $row['vendesconto']. "</h4>" . '</br>';
						}
                    $soma_valores = $soma_valores + $row['ventotal']; 
                ?>                             
                <?php } ?>
            </div>
        </div>
    </div>
</body>
</html>