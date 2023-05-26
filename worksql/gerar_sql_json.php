<?php
  // Recupera os dados do formulário
  $nome = $_POST['nome'];
  $preco = $_POST['preco'];
  $descricao = $_POST['descricao'];
  
  // Define o nome do arquivo a ser gerado
  $arquivo_sql = "produto.sql";
  $arquivo_json = "produto.json";
  
  // Cria o arquivo SQL
  $conteudo_sql = "INSERT INTO produtos (nome, preco, descricao) VALUES ('$nome', $preco, '$descricao');";
  file_put_contents($arquivo_sql, $conteudo_sql);
  
  // Cria o arquivo JSON
  $produto = array(
    'nome' => $nome,
    'preco' => $preco,
    'descricao' => $descricao
  );
  $conteudo_json = json_encode($produto);
  file_put_contents($arquivo_json, $conteudo_json);
  
  // Redireciona para a página de sucesso
  header("Location: sucesso.php");
?>
