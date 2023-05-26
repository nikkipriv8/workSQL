<?php
// configurações de conexão com o banco de dados
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "nome_do_banco_de_dados";

// cria uma conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

// verifica se a conexão foi estabelecida com sucesso
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// consulta SQL para puxar todos os dados de todas as tabelas
$sql = "SELECT * FROM Empresas_de_Jogos;
        SELECT * FROM Clientes;
        SELECT * FROM Pedidos;
        SELECT * FROM Itens_do_Pedido;
        SELECT * FROM Produtos;
        SELECT * FROM Categorias_de_Produtos;
        SELECT * FROM Produtos_por_Categoria;
        SELECT * FROM Funcionarios;
        SELECT * FROM Departamentos;
        SELECT * FROM Funcionarios_por_Departamento;
        SELECT * FROM Gerentes_de_Departamento;";

// executa a consulta e armazena o resultado em uma variável
if ($conn->multi_query($sql)) {
    do {
        // armazena o resultado em uma variável
        if ($result = $conn->store_result()) {
            // exibe os dados em forma de tabela HTML
            echo "<table>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                foreach ($row as $key => $value) {
                    echo "<td>" . $value . "</td>";
                }
                echo "</tr>";
            }
            echo "</table>";
            $result->free();
        }
        // avança para o próximo resultado, se houver
    } while ($conn->more_results() && $conn->next_result());
} else {
    echo "Erro na consulta: " . $conn->error;
}

// fecha a conexão com o banco de dados
$conn->close();
?>