<?php 

// Projeto de DB da biblioteca Instante
// Professor: Coradini
// Devs: Fernando josé, Doug e Renato

include_once ("conexao.php");

$id_livro = $_POST['id_livro'];
$titulo = $_POST['titulo'];
$autores = $_POST['autores'];
$editora = $_POST['editora'];
$categoria = $_POST['categoria'];
$ano = $_POST['ano'];
$ISBN = $_POST['ISBN'];

$query1 = "DELETE FROM tb_livros_has_tb_autores WHERE id_livro = $id_livro";
$insert1 = mysqli_query($connect,$query1);

$query2 = "UPDATE tb_livros SET titulo='$titulo', editora='$editora', tb_categorias_id_categoria='$categoria', ano='$ano', ISBN='$ISBN' WHERE id_livro= $id_livro ";


$insert2 = mysqli_query($connect,$query2);


foreach ($autores as $autor) {

          $query3 = "INSERT INTO tb_livros_has_tb_autores VALUES ('$id_livro','$autor')";
          $insert3 = mysqli_query($connect,$query3);
          }

header("Location: acervo.php");




?>