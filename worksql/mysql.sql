CREATE TABLE Empresas_de_Jogos (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sede VARCHAR(255) NOT NULL,
    fundação DATE NOT NULL,
    receita_anual DECIMAL(10, 2) NOT NULL,
    número_de_funcionários INT NOT NULL,
    descrição TEXT
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Itens_do_Pedido (
    id_item_pedido INT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Categorias_de_Produtos (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao TEXT
);

CREATE TABLE Produtos_por_Categoria (
    id_produto INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_produto, id_categoria),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_categoria) REFERENCES Categorias_de_Produtos(id_categoria)
);

CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    data_contratacao DATE NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(255) NOT NULL
);

CREATE TABLE Funcionarios_por_Departamento (
    id_funcionario INT NOT NULL,
    id_departamento INT NOT NULL,
    PRIMARY KEY (id_funcionario, id_departamento),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE Gerentes_de_Departamento (
    id_departamento INT NOT NULL,
    id_funcionario INT NOT NULL,
    PRIMARY KEY (id_departamento),
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);