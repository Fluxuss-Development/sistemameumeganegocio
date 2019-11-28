<!DOCTYPE html>
<html>
<head>
<?php
    include './conexao.php';
    session_start();
    if ((!isset($_SESSION['cpf']) == true ) and (!isset($_SESSION['nome']) == true)/* and (!isset($_SESSION['id'])==true)*/){
    unset($_SESSION['cpf']);
    unset($_SESSION['nome']);
    header('location: login');
	}
                            
?>
	<title>Produtos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
          <link rel="stylesheet" href="css/onsenui.css">
          <link rel="stylesheet" href="css/onsen-css-components.min.css">
           <link rel="stylesheet" type="text/css" href="css/animate.min.css">
          <script src="js/onsenui.min.js"></script>
        <style>
            body{ color: #303030; overflow-y: scroll;}
        </style>
</head>
<body>
    <?php
        include './conexao.php';
    
        $buscar = empty($_POST["buscar"])? '' :($_POST["buscar"]);
    
        $buscar = mysqli_real_escape_string($conexao,$buscar);
    
        if(empty($buscar)){
          $sqlselect = "select prodcod,prodnome,prodvalor,prodquantidade,proimagurloudir,prodativo,subcatdescricao from produtos,subcategoria where subcatcod = prodsubcategoria and prodativo = 1 and proimagurloudir IS NOT NULL";
        }else{
		  $sqlselect = "select prodcod,prodnome,prodvalor,prodquantidade,proimagurloudir,prodativo,subcatdescricao from produtos,subcategoria where subcatcod = prodsubcategoria and prodativo = 1 and proimagurloudir IS NOT NULL and prodnome like '$buscar'";
        }  
        
    
     $resultado = mysqli_query($conexao,$sqlselect);
     
     
    ?>
    <nav class="nav navbar-default" style="background-color: #303030;">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" style="color: white;" href="menuprincipal">Menu</a>
            </div>
            <ul class="nav navbar-nav navbar-left">

                
            </ul>
           
        </div>
        
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Produtos disponíveis</h1><br>
                <form method="post" action="produtos">
                     <div class="form-group">
                        <div class="col-md-4">
                            <input type="text" name="buscar" class="form-control search-input search-input--material" id="busca" placeholder="Buscar produtos...">
                            <br>  
                        </div>
                        <div class="col-md-4" style="top:8px;">
                          <button type="submit" class="btn btn-danger">Buscar</button>
                        </div>
                        <div class="col-md-4">
                            
                        </div>
                        
                    </div>
                </form>
            </div>
                 <script type="text/javascript" src="js/bootstrap.min.js"></script>
                  <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
                  <script type="text/javascript" src="js/jquery.js"></script>
                  <script type="text/javascript" src="js/ajax.js"></script>                    

               
            <?php
                while($row = mysqli_fetch_array($resultado)){
            ?>
            <div class="col-md-4">
               <center>
                  <script type="text/javascript">                          
                            $(function() {
                            $(".esconde<?php echo $row['prodcod']; ?>").click(function(e) {
                            e.preventDefault();
                            el = $(this).data('element');
                            $(el).toggle();
                            });
                            });
                 </script> 
                <br><br><br>
                <?php
                //echo $row ['prodcod'];
                echo "<h4 class='animated bounceInRight'>" . $row ['prodnome'] . "</h4>";
                ?>
                
                     <?php 
                            if ($row['proimagurloudir'] == "") {?>
                                <img src="Imagens/logotipo.png" class="img-responsive"><br>
                                <div id="minhaDiv<?php echo $row['prodcod']; ?>" style="display:none"><?php
                                 echo 'Código do produto: '. $row['prodcod']; ?>
                                </div>
                                <button class="esconde<?php echo $row['prodcod']; ?> btn btn-danger" data-element="#minhaDiv<?php echo $row['prodcod']; ?>">Mostrar mais</button>
                          <?php  
                            }else{   ?>
                                  <div class="card animated bounceInRight" style="background-color: white;">
                                     <img src="<?php echo $row['proimagurloudir']; ?>" class="img-responsive"><br> 
                                        <div id="minhaDiv<?php echo $row['prodcod']; ?>" style="display:none">
                                            <?php  // echo 'Código do produto: '. $row['prodcod'] . "</br>"; 
                                                    echo "Valor do produto: R$" . $row['prodvalor'] . "</br>";
                                                    echo "Quantidade disponível: " .$row['prodquantidade'] . "</br>";
													echo "Descrição: " .$row['subcatdescricao'];
													
											 ?>
                                            
                                            <form action="gerenciaimagensdeprodutos" method="POST" enctype="multipart/form-data">
                                            <input type="text" name="prodcod" value="<?php echo $row['prodcod']; ?>" style="display: none;">
                                       
                                    
                                </form> 
                                <br>
                                        </div>
                                <button class="esconde<?php echo $row['prodcod']; ?> btn btn-danger" data-element="#minhaDiv<?php echo $row['prodcod']; ?>">Mostrar mais</button>
                            </div>
                         <?php    }    ?>


               </center> 
            </div>
            <?php

            }
            ?>
        </div>
    </div>
  

</body>
</html>