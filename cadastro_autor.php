<?php 

// Projeto de DB da biblioteca Instante
// Professor: Coradini
// Devs: Fernando josé, Doug e Renato

include_once ("conexao.php");

$autor = $_POST['autor'];
$nacionalidade = $_POST['pais'];
$query_select_autores = "SELECT nome_autor FROM tb_autores WHERE nome_autor = '$autor'";
$result_autores = mysqli_query($connect,$query_select_autores);
$num_linha = mysqli_num_rows($result_autores);

if($autor == "" || $autor == null){
      echo"<script language='javascript' type='text/javascript'>
          alert('O campo precisa ser preenchido! ');window.location.
          href='cadastro_autores.html'</script>";

    }else{

      if($num_linha>0){

        echo"<script language='javascript' type='text/javascript'>
          alert('Esse Autor já foi cadastrado! ');window.location.
          href='cadastro_autores.html'</script>";
        die();

      }else{

        $query = "INSERT INTO `tb_autores`(`nome_autor`, `tb_nacionalidade_id_nacionalidade`) VALUES ('$autor',".$nacionalidade.")";
        $insert = mysqli_query($connect,$query);

        if($insert){
          echo"<script language='javascript' type='text/javascript'>
          alert('Autor cadastrado com sucesso!');window.location.
          href='cadastro_autores.html'</script>";

        }else{

          echo $query;
         
          /*echo"<script language='javascript' type='text/javascript'>
          alert('Não foi possível cadastrar esse Autor, tente novamente!');window.location
          .href='cadastro_autores.html'</script>";*/
        }
      }
    }

?>