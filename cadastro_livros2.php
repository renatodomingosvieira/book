<?php	

//chamar os dados dos autores dentro de um array!

include_once ("conexao.php");

$query = "SELECT id_autor, nome_autor FROM tb_autores";
$result = mysqli_query($connect,$query);


?>





<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastro de livros</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
	</head>
	<body>
		<a href="index.html"><img src="img/back.png" width="30px"></a>
		<div class="container_livro">
			<div class="titulo_livro">			
				<h1>Cadastro de Livros</h1> 
			</div>
			<div class="formulario">
			<form action="cadastro_livros.php" method="POST">
					<div class="input_titulo">
						<label>Titulo:</label>
						<input type="text" class ="input_text" name="titulo" id="titulo" required placeholder="Digite o nome do livro">
					</div>
					<div class="input_autor1">
						<label>Autores:</label>
						<div class="div-selectmulti">
							  <select name="autores[]" id="autor" multiple>
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
						<input type="text" class ="input_text" name="editora" id="editora" required placeholder="Digite a Editora">
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
						<input type="text" class ="input_text" name="ano" id="ano" required placeholder="Digite o ano de Lançamento">
					</div>
					<div class="input_ISBN">
						<label>ISBN:</label>
						<input type="text" class ="input_text" name="ISBN" id="ISBN" required placeholder="Digite o código ISBN">
					</div>
					<input type="submit" class="botao" value="Cadastrar">
			</form>
		</div>
	</body>
</html>