<?php 

// Projeto de DB da biblioteca Instante
// Professor: Coradini
// Devs: Fernando josé, Doug e Renato

include_once ("conexao.php");

$id_livro = $_GET['id_livro'];

$query1 = "DELETE FROM tb_livros_has_tb_autores WHERE id_livro = $id_livro";
$query2 = "DELETE FROM tb_livros WHERE id_livro = $id_livro";

$deletar = mysqli_query($connect,$query1);
$deletar = mysqli_query($connect,$query2);

header("Location: acervo.php");


      


?>