<?php 
    include 'conexao.php';
	session_start();
	if ((!isset($_SESSION['nomef']) == true) and (!isset($_SESSION['idf']) == true)) {
    unset($_SESSION['idf']);
    unset($_SESSION['nomef']);
    header('location: login');
}
?>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!--Ajustar site-->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/animate.min.css">
        <link rel="stylesheet" href="css/onsen-css-components.min.css">
        <link rel="stylesheet" href="css/onsenui.css">
        <script src="js/onsenui.min.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <style> body{ color: #303030; overflow-y: scroll; overflow-x: hidden;} </style>
        <script>
            //var esc = getElementsById('esconde');
            $(function() {
            $('#esconde').click(function(e) {
            e.preventDefault();
            el = $(this).data('element');
            $(el).toggle();
            });
            });
        </script>
    </head>
    <body>
        <?php 
            include ('conexao.php');
            $buscar = empty($_POST["buscar"])? '' :($_POST["buscar"]);
            $buscar = mysqli_real_escape_string($conexao,$buscar);
            $sqlselect = "select prodcod, prodnome, prodvalor, prodquantidade, proimagurloudir, prodlucro, prodativo, subcatnome,subcatdescricao, catid, subcatativa from produtos inner join subcategoria on prodsubcategoria = subcatcod and prodnome like '%$buscar%'";
            $resultado = mysqli_query($conexao,$sqlselect);
            mysqli_close($conexao);
        ?>
        <nav class="nav navbar-default" style="background-color: #303030;">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#" style="color: white;">Meu mega negócio</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="logoffadmin" style="color: white;"><button class="btn-danger">Logout</button></a></li>
                </ul>
            </div>
        </nav>
        <div class="container">    
            <div class="row">
                <div class="animated bounceInRight col-md-4" style="top: 40px;">	                    
                    <h3><?php echo 'Seja bem vindo '. $_SESSION['nomef']; ?></h3>
                </div>
                <div class="col-md-12">
                       
                </div>
            </div>
                     
                <div class="animated bounceInRight col-md-12" style="top: 45px;"> 
                    <h4>Gerenciamento de Produtos</h4>
                     <form method="post" action="dashboardadmin">
                     <div class="form-group">
                        <div class="col-md-4">
                            <input type="text" name="buscar" class="form-control search-input search-input--material" id="busca" placeholder="Buscar produtos...">
                            <br>  
                        </div>
                        <div class="col-md-12" style="top:8px;">
                          <button type="submit" class="btn btn-danger">Buscar</button>
                        </div>
                    </div>
                </form>
                    <?php while($row = mysqli_fetch_array($resultado)){ ?>
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
                <?php echo "<h4 class='animated bounceInRight'>" . $row ['prodnome'] . "</h4>";?>
                <?php if ($row['proimagurloudir'] == "") {?>
            <div class="card animated bounceInRight" style="background-color: white;">
                <img src="Imagens/logotipo.png" class="img-responsive"><br>
                <div id="minhaDiv<?php echo $row['prodcod']; ?>" style="display:none;"><?php
                    echo 'Código do produto: '. $row['prodcod']; ?><br> 
                    Quantidade em estoque: <?php echo $row['prodquantidade']; ?><br>    
                    Preço do produto:R$<?php echo $row['prodvalor']; ?><br> 
                    Descrição:<?php echo $row['subcatdescricao']; ?>
                    
                        <form action="gerenciaimagensdeprodutos" class="form-group" method="POST" enctype="multipart/form-data">
                            <label>Selecione a imagem do produto.</label>
                            <input type="text" style="display: none;" name="prodcod" value="<?=$row['prodcod']?>">
                            <input type="file" multiple name="arquivo" class="form-control btn btn-success">
                            <input type="text" name="remover" value="n" style="display: none;"><br>
                            <input type="submit" value="Fazer upload" class="btn-warning"> 
                        </form>     
                </div>
            
                        <button class="esconde<?php echo $row['prodcod']; ?> btn btn-danger" data-element="#minhaDiv<?php echo $row['prodcod']; ?>">Mostrar mais</button>
                            
            </div>    
                <?php }else{   ?>
                <div class="card animated bounceInRight" style="background-color: white;">
                <img src="<?php echo $row['proimagurloudir']; ?>" class="img-responsive"><br> 
                    <div id="minhaDiv<?php echo $row['prodcod']; ?>" style="display:none">
                        <?php echo 'Código do produto: '. $row['prodcod']; ?><br>
                        Quantidade em estoque: <?php echo $row['prodquantidade']; ?><br>    
                    Preço do produto:R$<?php echo $row['prodvalor']; ?><br> 
                    Descrição:<?php echo $row['subcatdescricao']; ?>
                    
                            <form action="gerenciaimagensdeprodutos" method="POST" enctype="multipart/form-data">
                                <input type="text" name="prodcod" value="<?php echo $row['prodcod']; ?>" style="display: none;">
                                <input type="text" name="remover" value="remover" style="display: none;">
                                <input type="submit" value="Remover Imagem" class="btn-warning">              
                            </form><br>
                    </div>
                        <button class="esconde<?php echo $row['prodcod']; ?> btn btn-danger" data-element="#minhaDiv<?php echo $row['prodcod']; ?>">Mostrar mais</button>
                </div>
                <?php } ?>


               </center> 
            </div>
            <?php } ?>
        </div>
    </div>
  </body>
</html>