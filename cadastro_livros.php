<?php 

// Projeto de DB da biblioteca Instante
// Professor: Coradini
// Devs: Fernando josé, Doug e Renato

include_once ("conexao.php");

$titulo = $_POST['titulo'];
$autores = $_POST['autores'];
$editora = $_POST['editora'];
$categoria = $_POST['categoria'];
$ano = $_POST['ano'];
$ISBN = $_POST['ISBN'];
$query_select = "SELECT titulo FROM tb_livros WHERE titulo = '$titulo'";
$select = mysqli_query($connect,$query_select);
$num_linha = mysqli_num_rows($select);

if($titulo == "" || $titulo == null){
      echo"<script language='javascript' type='text/javascript'>
          alert('O campo precisa ser preenchido! ');window.location.
          href='cadastro_livros2.php'</script>";

    }else{

      if($num_linha>0){

        echo"<script language='javascript' type='text/javascript'>
          alert('Esse Livro já foi cadastrado! ');window.location.
          href='cadastro_livros2.php'</script>";
        die();

      }else{

        $query = "INSERT INTO tb_livros (titulo,editora,tb_categorias_id_categoria,ano,ISBN) VALUES ('$titulo','$editora','$categoria','$ano','$ISBN')";
        $insert = mysqli_query($connect,$query);
        $ult_cadastro = mysqli_insert_id($connect);

        foreach ($autores as $autor) {

          $query = "INSERT INTO tb_livros_has_tb_autores VALUES ('$ult_cadastro','$autor')";
          $insert = mysqli_query($connect,$query);
          }
       

        if($insert){
          echo"<script language='javascript' type='text/javascript'>
          alert('Livro cadastrado com sucesso!');window.location.
          href='cadastro_livros2.php'</script>";

        }else{
          echo"<script language='javascript' type='text/javascript'>
          alert('Não foi possível cadastrar esse Livro, tente novamente!');window.location
          .href='cadastro_livros2.php'</script>";
        }
      }
    }

?>