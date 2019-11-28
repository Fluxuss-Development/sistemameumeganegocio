<?php
  include ('conexao.php');
  $prodcod = (!isset($_POST['prodcod'])) ? '0' : $_POST['prodcod'];
 //faz a parada de alterar o arquivo de imagem do produto'
  $remover = (!isset($_POST['remover'])) ? 'n' : $_POST['remover'];
echo $remover;


if($_POST['remover'] == "remover"){
    $sql_code = "update produtos set proimagurloudir = NULL where prodcod = '$prodcod' ";
    if($conexao->query($sql_code)){
      $msg = "Arquivo enviado com sucesso!";
        echo '<script language="javascript">';
        echo 'alert("A Imagem do produto foi removida com sucesso ! e o produto não é mais visível na página inicial !")';
        echo '</script>';
        header("location: dashboardadmin");
    }else{
       $msg = "Falha ao enviar arquivo."; 
    } 
}else{
  list($largura, $altura) = getimagesize($_FILES["arquivo"]["tmp_name"]);

  if($largura=="" || $altura ==""){
    header("location: dashboardadmin");
    exit;
  }
  echo 'ENTROU NO ELSE';
  $msg = false;
  if(isset($_FILES['arquivo'])){
    $extensao = strtolower(substr($_FILES['arquivo']['name'], -4)); //pega a extensao do arquivo
    $novo_nome = md5(time()) . $extensao; //define o nome do arquivo
    $diretorio = "./Imagens/"; //define o diretorio para onde enviaremos o arquivo
    move_uploaded_file($_FILES['arquivo']['tmp_name'], $diretorio.$novo_nome); //efetua o upload
    $novo_nome = "./Imagens/". $novo_nome; //renomeia para o novo diretório
    $sql_code = "update produtos set proimagurloudir = '$novo_nome' where prodcod = '$prodcod' ";
    echo 'ENTROU sql';
    if($conexao->query($sql_code)){
      $msg = "Arquivo enviado com sucesso!";
        echo '<script language="javascript">';
        echo 'alert("Imagem de produto vinculada com sucesso ! agora o produto esta visível para todos seus clientes na página inicial !")';
        echo '</script>';
        header("location: dashboardadmin");
    }else{
       $msg = "Falha ao enviar arquivo."; 
    }  
  }
 }
  header("location: dashboardadmin");
?>