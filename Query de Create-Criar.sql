-- Forma de criar o schema, conjunto de caracteres e collation para insensibilidade de acentos.
-- Pode Rodar sem problemas, só apertar CTRL + A e rodar a query que cria, está na ordem correta
CREATE SCHEMA IF NOT EXISTS `db_testetrabalho` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- Aqui é para usar o database criado
USE `db_testetrabalho` ;

-- Tabela de Telefone
CREATE TABLE Telefone (
    Telefone_PK INT PRIMARY KEY,
    Telefone VARCHAR(15) NOT NULL
);

-- Tabela de Cliente
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Cpf VARCHAR(11) NOT NULL UNIQUE,
    Email VARCHAR(30) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
	DataNascimento VARCHAR(10) NOT NULL,
    Senha VARCHAR(30) NOT NULL,
    fk_Telefone_PK INT,
    CONSTRAINT fk_telefone_cliente FOREIGN KEY (fk_Telefone_PK) REFERENCES Telefone(Telefone_PK) ON DELETE CASCADE ON UPDATE NO ACTION
);

-- Tabela de Endereco
CREATE TABLE Endereco (
    ID_Endereco INT PRIMARY KEY,
    Numero VARCHAR(10) NOT NULL,
    Bairro VARCHAR(20) NOT NULL,
    Cidade VARCHAR(20) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    Rua VARCHAR(40) NOT NULL,
    fk_ID_Cliente INT NOT NULL,
    CONSTRAINT fk_cliente_endereco FOREIGN KEY (fk_ID_Cliente) REFERENCES Cliente(ID_Cliente) ON DELETE CASCADE ON UPDATE NO ACTION
);

-- Tabela de Pedido
CREATE TABLE Pedido (
    ID_Pedido VARCHAR(15) PRIMARY KEY,
    Status_Pedido VARCHAR(25) NOT NULL,
    QuantidadePedido INT NOT NULL,
    fk_ID_Cliente INT NOT NULL,
    CONSTRAINT fk_cliente_pedido FOREIGN KEY (fk_ID_Cliente) REFERENCES Cliente(ID_Cliente) ON DELETE CASCADE ON UPDATE NO ACTION
);

-- Tabela de Administrador
CREATE TABLE Administrador (
    ID_Adm INT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Cpf VARCHAR(11) NOT NULL UNIQUE
);

-- Tabela de Estoque
CREATE TABLE Estoque (
    ID_Estoque INT PRIMARY KEY,
    Quantidade INT NOT NULL,
    fk_ID_Adm INT NOT NULL,
    CONSTRAINT fk_gerente_estoque FOREIGN KEY (fk_ID_Adm) REFERENCES Administrador(ID_Adm) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabela de Produto
CREATE TABLE Produto (
    ID_Produto INT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Descricao VARCHAR(45) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    fk_ID_Estoque INT NOT NULL,
    CONSTRAINT fk_estoque_produto FOREIGN KEY (fk_ID_Estoque) REFERENCES Estoque(ID_Estoque) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabela de Pedido_Produto (Tabela associativa)
CREATE TABLE Pedido_Produto (
    fk_ID_Pedido VARCHAR(15),
    fk_ID_Produto INT,
    PRIMARY KEY (fk_ID_Pedido, fk_ID_Produto),
    CONSTRAINT fk_pedido_pedido_produto FOREIGN KEY (fk_ID_Pedido) REFERENCES Pedido(ID_Pedido) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT fk_produto_pedido_produto FOREIGN KEY (fk_ID_Produto) REFERENCES Produto(ID_Produto) ON DELETE CASCADE ON UPDATE NO ACTION
);

-- Tabela de Entrega
CREATE TABLE Entrega (
    ID_Entrega INT PRIMARY KEY,
    Data_Entrega VARCHAR(20) NOT NULL,
    fk_ID_Endereco INT NOT NULL,
    fk_ID_Pedido VARCHAR(15),
    CONSTRAINT fk_endereco_entrega FOREIGN KEY (fk_ID_Endereco) REFERENCES Endereco(ID_Endereco) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT fk_pedido_entrega FOREIGN KEY (fk_ID_Pedido) REFERENCES Pedido(ID_Pedido) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabela de Hardware
CREATE TABLE Hardware (
    fk_ID_Produto INT PRIMARY KEY,
    Categoria VARCHAR(15) NOT NULL,
    Fabricante VARCHAR(15) NOT NULL,
    CONSTRAINT fk_produto_hardware FOREIGN KEY (fk_ID_Produto) REFERENCES Produto(ID_Produto) ON DELETE CASCADE ON UPDATE NO ACTION
);

-- Tabela de Acessorios
CREATE TABLE Acessorios (
    fk_ID_Produto INT PRIMARY KEY,
    Tipo VARCHAR(20) NOT NULL,
    Modelo VARCHAR(20) NOT NULL,
    CONSTRAINT fk_produto_acessorios FOREIGN KEY (fk_ID_Produto) REFERENCES Produto(ID_Produto) ON DELETE CASCADE ON UPDATE NO ACTION
);