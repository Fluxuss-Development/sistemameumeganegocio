<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<?php
    include 'gerencialogin.php';
?>
    <head>
        <title>Login do Cliente</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/animate.min.css">
   
        
        <style>
            .container{
                margin-top: 100px;
                align-items: center;
                color: white;
                font-family: Arial;
            }
            
            body{background-color:#303030;}
            #cpf{resize: none; height: 35px;}
            
           
        </style>
        <script src="js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
    </head>
    <body>
        <script src="javascript/jquery.js"></script>
        <script>  
            
        </script>

    <center>
        <form method="post">
            <div class="container">  
                               
                <div class="form-group">
                    <div class="row wow slideInLeft animated slideInLeft">

                        <div class="col-md-12">
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
                            <br><label>CPF</label>
                            <textarea type="text" maxlength="11" id="cpf" onkeypress="return isNumberKey(event)" class="form-control" name="edt_cpf" placeholder="Entre com seu CPF" required></textarea>
                    
                        <div class="col-md-4"></div>
                            <br><button type="submit" class="btn btn-danger">Logar</button><br><br>
                            <a href="index.html" class="btn btn-warning">Voltar</a> 
                    </div>
                  
                </div>
                
            </div>
            
                
        </form>
    </center>
        
    </body>
</html>
