
<head>
		<meta charset="UTF-8">
		<title>Acervo</title>
		<link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
	</head>
	<body>
		<a href="index.html"><img src="img/back.png" width="30px"></a>
		<div class="container-acervo">
		<h1>Acervo</h1>

		
<?php 

// Projeto de DB da biblioteca Instante
// Professor: Coradini
// Devs: Fernando josé, Doug e Renato


include_once ("conexao.php");

//$query_select ="SELECT * FROM tb_livros as A JOIN tb_categorias as B on A.tb_categorias_id_categoria = B.id_categoria ORDER BY titulo asc";

$query2 = "SELECT * FROM tb_livros AS A /*
	INNER JOIN tb_livros_has_tb_autores AS B
	  ON (A.id_livro = B.id_livro)
	INNER JOIN  tb_autores as C
	  ON (B.id_autor = C.id_autor)
	*/INNER JOIN tb_categorias AS D
	  ON (A.tb_categorias_id_categoria = D.id_categoria)
	  ORDER BY titulo asc";

$query3 = "SELECT * FROM tb_livros_has_tb_autores AS D 
INNER JOIN  tb_autores AS E  ON D.id_autor  = E.id_autor ORDER BY E.nome_autor ";

$result2 = mysqli_query($connect,$query3);


$result = mysqli_query($connect,$query2) or die (mysqli_error($connect));

if (!$result) {

	die ("Falha na conexão: ". mysqli_connect_error ());

	} else {

		echo "  Conectado com sucesso ao acervo! <br><br><br>";

	}

$autor = [];

while ($row = mysqli_fetch_array($result2)) {

	$autor[]= $row;
}


while ($row = mysqli_fetch_array($result)) {

echo "<br>";
echo "<b>Código:</b> ".$row['id_livro']."<br>";
echo "<b>Titulo</b>: ".$row['titulo']."<br>";

foreach ($autor as $key => $value) {
	
	if ($value['id_livro'] == $row['id_livro']){

		echo "<b>Autor:</b> ".$value['nome_autor']."<br>";
	}
}



echo "<b>Editora:</b> ".$row['editora']."<br>";
echo "<b>Categoria:</b> ".$row['nome']."<br>";
echo "<b>Ano: </b>".$row['ano']."<br>";
echo "<b>ISBN: </b>".$row['ISBN']."<br>";
echo "<br>";

echo "<a class='link_botaoedit' href='editar.php?id_livro=".$row['id_livro']."'>EDITAR</a>";
echo "<a class='link_botao' href='deletar.php?id_livro=".$row['id_livro']."'>DELETAR</a>";
echo "<hr>";

}


?>
</div>