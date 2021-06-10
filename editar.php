<?php	

//chamar os dados dos autores dentro de um array!

include_once ("conexao.php");

$livro = $_GET['id_livro'];

$query2 = "SELECT * FROM tb_livros, tb_autores WHERE id_livro = $livro ";

$result = mysqli_query($connect,$query2);
$row = mysqli_fetch_assoc($result);


?>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Editar livro</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
	</head>
	<body>
		<a href="index.html"><img src="img/back.png" width="30px"></a>
		<div class="container_livro">
			<div class="titulo_livro">			
				<h1>Editar Livro!</h1> 
			</div>
			<div class="formulario">
			<form action="editar_livro.php" method="POST">
					<input type="hidden" style="display:none" class ='input_text' name='id_livro' id='id_livro' value="<?php echo $row['id_livro'] ?>">
					<div class="input_titulo">
						<label>Titulo:</label>
						<input type='text' class ='input_text' name='titulo' id='titulo' required value="<?php echo $row['titulo'] ?>">
					</div>
					<div class="input_autor1">
						<label>Autores:</label>
						<div class="div-selectmulti">
							  <select name="autores[]" id="autor" required multiple>
							   <?php 

							 while ($obj = mysqli_fetch_object($result)) {
      								  printf ("<option value=".$obj->id_autor.">".$obj->nome_autor."</option>");
    								}

    						?>
							  </select>
						</div>
					</div>
					<p>Mantenha pressionado o botão Ctrl (Windows) ou Comando (Mac) para selecionar várias opções</p>
					<div class="input_editora">
						<label>Editora:</label>
						<input type="text" class ="input_text" name="editora" id="editora" required value="<?php echo $row['editora'] ?>">
					</div>
					<div class="input_categoria">
						<label>Categoria:</label>
						<div class="div-select">
						<select name="categoria" id="categoria">
							<option value="1">Autoajuda</option>
							    <option value="2">Romance</option>
							    <option value="3">Literatura Estrangeira</option>
							    <option value="4">Administração</option>
							    <option value="5">Literatura Nacional</option>
							  </select>
						</div>
					</div>
					<div class="input_ano">
						<label>Ano de Lançamento:</label>
						<input type="text" class ="input_text" name="ano" id="ano" required value="<?php echo $row['ano'] ?>">
					</div>
					<div class="input_ISBN">
						<label>ISBN:</label>
						<input type="text" class ="input_text" name="ISBN" id="ISBN" required value="<?php echo $row['ISBN'] ?>">
					</div>
					<input type="submit" class="botao" value="ALTERAR">
			</form>

		</div>
	</body>
</html>



if ($connect) {
	
	$edit_usuario = mysqli_query ($connect, "UPDATE tb_livros SET senha='$senha_cookie' WHERE login = '$login_cookie';");

	if ($edit_usuario) {
		header("Location: index.html");
	} else {

		die("Erro: ". mysqli_error($connect));

	}

}else {

	die("ERRO: ". mysqli_error($connect));
}

mysqli_close($connect);

?>