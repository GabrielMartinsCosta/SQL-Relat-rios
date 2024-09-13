-- TABELAS DE INSERT/POPULAR AS TABELAS CRIADAS --

-- Da mesma maneira que a Query de Create pode rodar sem problemas
-- aqui funciona também, se der CTRL+A e clicar para rodar os inserts
-- ele preenche tudo, sem erro

-- Insere dados na tabela Telefone que será usado na Tabela Cliente
INSERT INTO Telefone (Telefone_PK, Telefone) VALUES 
(1, '937466310'),
(2, '956731901'),
(3, '987544331'),
(4, '987421701'),
(5, '965732813'),
(6, '975632112'),
(7, '987431701'),
(8, '999883744'),
(9, '985447306'),
(10, '988996732'),
(11, '976321606'),
(12, '986311701');

-- Insere dados na Tabela Cliente
INSERT INTO Cliente (ID_Cliente, Cpf, Email, Nome, DataNascimento, Senha, fk_Telefone_PK) VALUES 
(1, '12345678909', 'joao.silva@gmail.com', 'João Silva', '01/01/1990', 'senhateste1', 1),
(2, '10987654321', 'lucas.souza@yahoo.com', 'Lucas Souza', '15/05/1985', 'abcde', 2),
(3, '32165498709', 'maria.oliveira@hotmail.com', 'Maria Oliveira', '30/10/1992', 'testeopa', 3),
(4, '98765432109', 'paulo.lima@gmail.com', 'Paulo Lima', '25/03/1980', '123456', 4),
(5, '74185296309', 'ana.santos@yahoo.com', 'Ana Santos', '20/07/1995', '155433', 5),
(6, '36925814709', 'carlos.pereira@hotmail.com', 'Carlos Pereira', '12/12/1988', '223344', 6),
(7, '15975348609', 'julia.martins@gmail.com', 'Julia Martins', '09/09/1991', '334455', 7),
(8, '95135748609', 'marcos.rocha@yahoo.com', 'Marcos Rocha', '11/11/1982', '445566', 8),
(9, '85296374109', 'fernanda.alves@hotmail.com', 'Fernanda Alves', '04/04/1983', '556677', 9),
(10, '75395148609', 'ricardo.silva@gmail.com', 'Ricardo Silva', '08/08/1979', '667788', 10),
(11, '63215148609', 'josuejonasa@gmail.com', 'Josué Jonas', '06/06/1994', 'senhajosue', 11),
(12, '15907884373', 'gabrielmcosta@gmail.com', 'Gabriel Martins', '02/02/1987', 'miASn3R7', 12);


-- Insere dados na Tabela Endereco, usa a FK do Cliente
INSERT INTO Endereco (ID_Endereco, Numero, Bairro, Cidade, Estado, CEP, Rua, fk_ID_Cliente) VALUES 
(1, '123', 'Centro', 'Rio de Janeiro', 'RJ', '20040020', 'Rua da Assembléia', 1),
(2, '456', 'Copacabana', 'Rio de Janeiro', 'RJ', '22021010', 'Rua Barata Ribeiro', 2),
(3, '789', 'Jardins', 'São Paulo', 'SP', '01415000', 'Avenida Paulista', 3),
(4, '101', 'Vila Mariana', 'São Paulo', 'SP', '04105000', 'Rua Domingos de Morais', 4),
(5, '112', 'Savassi', 'Belo Horizonte', 'MG', '30140110', 'Avenida Cristóvão Colombo', 5),
(6, '131', 'Funcionários', 'Belo Horizonte', 'MG', '30130160', 'Rua Pernambuco', 6),
(7, '415', 'Moinhos de Vento', 'Porto Alegre', 'RS', '90570050', 'Rua Padre Chagas', 7),
(8, '162', 'Cidade Baixa', 'Porto Alegre', 'RS', '90050000', 'Rua Lima e Silva', 8),
(9, '193', 'Batel', 'Curitiba', 'PR', '80240000', 'Avenida Batel', 9),
(10, '204', 'Centro', 'Curitiba', 'PR', '80010010', 'Rua XV de Novembro', 10),
(11, '51', 'Maracanã', 'Rio de Janeiro', 'RJ', '20271030', 'Rua Morais e Silva', 12),
(12, '104', 'Catumbi', 'Rio de Janeiro', 'RJ', '20251030', 'Rua Itapiru', 2),
(13, '42', 'Laranjeiras', 'Rio de Janeiro', 'RJ', '20010070', 'Rua Marquesa de Santos', 12),
(14, '60', 'Vila Isabel', 'Rio de Janeiro', 'RJ', '20480320', 'Rua Felipe Camarão', 11);

-- Insere dados na Tabela Administrador
INSERT INTO Administrador (ID_Adm, Nome, Cpf) VALUES 
(1, 'Admin Gabriel', '15930478783'),
(2, 'Adm Alexandre', '07819434633'),
(3, 'Admin Teste1', '33344455566'),
(4, 'Admin Teste2', '44455566677'),
(5, 'Admin Teste3', '55566677788'),
(6, 'Admin Teste4', '66677788899'),
(7, 'Admin Teste5', '77788899900'),
(8, 'Admin Teste6', '88899900011'),
(9, 'Admin Teste7', '99900011122'),
(10, 'Admin Teste8', '00011122233');

-- Insere dados na tabela Estoque, utiliza a FK do Adm
INSERT INTO Estoque (ID_Estoque, Quantidade, fk_ID_Adm) VALUES 
(1, 10, 1),
(2, 15, 1),
(3, 5, 1),
(4, 20, 1),
(5, 8, 1),
(6, 25, 2),
(7, 18, 2),
(8, 12, 2),
(9, 7, 2),
(10, 22, 2),
(11, 30, 3),
(12, 25, 3),
(13, 20, 3),
(14, 35, 3),
(15, 15, 4),
(16, 40, 4),
(17, 10, 4),
(18, 50, 4),
(19, 5, 5),
(20, 60, 5);

-- Insere os dados na Tabela Produto
INSERT INTO Produto (ID_Produto, Nome, Descricao, Preco, fk_ID_Estoque) VALUES 
(1, 'Processador i7', 'Processador Intel Core i7', 1500.00, 1),
(2, 'Memória RAM Corsair 16GB', 'Memória DDR4 16GB da Corsair', 800.00, 2),
(3, 'HD Seagate 1TB', 'HD Interno Seagate 1TB', 300.00, 3),
(4, 'SSD Samsung 500GB', 'SSD Interno Samsung 500GB', 500.00, 4),
(5, 'Placa Mãe Asus', 'Placa Mãe Asus ATX', 700.00, 5),
(6, 'Fonte Cooler Master 600W', 'Fonte de Alimentação CM 600W', 400.00, 6),
(7, 'Placa de Vídeo RTX3060', 'Placa de Vídeo Nvidia RTX3060', 2000.00, 7),
(8, 'Placa de Vídeo RX6750', 'Placa de Vídeo AMD RX6750', 2500.00, 8),
(9, 'Processador Ryzen 5', 'Processador AMD Ryzen 5', 1300.00, 9),
(10, 'Memória RAM Kingston 16GB', 'Memória RAM Kingston', 600.00, 10),
(11, 'Mouse DeathAdder V2', 'Mouse Gamer Razer DeathAdder V2', 150.00, 11),
(12, 'Teclado G Pro X', 'Teclado Mecânico Logitech GProX', 1250.00, 12),
(13, 'Fone de Ouvido Cloud II', 'Fone de Ouvido HyperX Cloud II', 500.00, 13),
(14, 'Monitor Avoc 24GL600F', 'Monitor Full HD Avoc', 900.00, 14),
(15, 'Mouse MX Master 3', 'Mouse MX Master 3', 150.00, 15),
(16, 'Teclado BlackWidow Elite', 'Teclado Mecânico Razer BlackWidow Elite', 1100.00, 16),
(17, 'Fone de Ouvido WH-1000XM4', 'Fone de Ouvido Sony', 100.00, 17),
(18, 'Monitor Zowie 12401klc', 'Monitor Full HD Zowie 12401klc', 2200.00, 18),
(19, 'Mouse G502 Hero', 'Mouse Logitech G502 Hero', 200.00, 19),
(20, 'Teclado K95 RGB Platinum', 'Teclado Corsair Mecânico K9', 600.00, 20);


-- Insere dados na Tabela Pedido
INSERT INTO Pedido (ID_Pedido, Status_Pedido, QuantidadePedido, fk_ID_Cliente) VALUES 
('PED001', 'Em Processamento', 3, 1),
('PED002', 'Entregue', 2, 1),
('PED003', 'Cancelado', 4, 2),
('PED004', 'Em Processamento', 5, 2),
('PED005', 'Em Processamento', 2, 5),
('PED006', 'Entregue', 3, 5),
('PED007', 'Cancelado', 2, 7),
('PED008', 'Em Processamento', 4, 8),
('PED009', 'Entregue', 5, 9),
('PED010', 'Em Processamento', 2, 10),
('PED011', 'Em Processamento', 2, 3),
('PED012', 'Entregue', 3, 6),
('PED013', 'Cancelado', 1, 4),
('PED014', 'Em Processamento', 4, 7),
('PED015', 'Entregue', 2, 1),
('PED016', 'Cancelado', 3, 3),
('PED017', 'Em Processamento', 5, 7),
('PED018', 'Entregue', 2, 8),
('PED019', 'Cancelado', 4, 9),
('PED020', 'Em Processamento', 3, 10);

-- Insere dados na Tabela Pedido_Produto, que é uma Tabela Associativa
-- Cada pedido possui uma quantidade de produtos diferente
INSERT INTO Pedido_Produto (fk_ID_Pedido, fk_ID_Produto) VALUES 
('PED001', 1), ('PED001', 2), ('PED001', 6),
('PED002', 4),
('PED003', 11), ('PED003', 7), ('PED003', 8), ('PED003', 3),
('PED004', 10), ('PED004', 1), ('PED004', 2), ('PED004', 6), ('PED004', 9),
('PED005', 2), ('PED005', 6),
('PED006', 3), ('PED006', 13), ('PED006', 9),
('PED007', 14), ('PED007', 1),
('PED008', 2), ('PED008', 12), ('PED008', 1), ('PED008', 5),
('PED009', 6), ('PED009', 3), ('PED009', 15), ('PED009', 17), ('PED009', 10),
('PED010', 1), ('PED010', 12),('PED010', 20),('PED010', 18),
('PED011', 19), ('PED011', 12),
('PED012', 13), ('PED012', 7), ('PED012', 11),
('PED013', 16),
('PED014', 3), ('PED014', 7), ('PED014', 19), ('PED014', 20),
('PED015', 11), ('PED015', 3),
('PED016', 7), ('PED016', 14), ('PED016', 15),
('PED017', 16), ('PED017', 11), ('PED017', 13), ('PED017', 6), ('PED017', 8),('PED017', 4),
('PED018', 14), ('PED018', 12),
('PED019', 13), ('PED019', 7), ('PED019', 11), ('PED019', 9),
('PED020', 2), ('PED020', 5), ('PED020', 6);

-- Insere dados na tabela Entrega
-- colocamos a descriçao de cada pedido e seu status comentada para faciltiar leitura.
INSERT INTO Entrega (ID_Entrega, Data_Entrega, fk_ID_Endereco, fk_ID_Pedido) VALUES 
(1, '08/07/24', 1, 'PED001'), -- Pedido 1 (Em Processamento)
(2, '11/06/24', 1, 'PED002'), -- Pedido 2 (Entregue)
(3, '07/08/24', 2, 'PED003'), -- Pedido 3 (Cancelado)
(4, '04/07/24', 2, 'PED004'), -- Pedido 4 (Em Processamento)
(5, '05/07/24', 5, 'PED005'), -- Pedido 5 (Em Processamento)
(6, '18/06/24', 5, 'PED006'), -- Pedido 6 (Entregue)
(7, '07/07/24', 7, 'PED007'), -- Pedido 7 (Cancelado)
(8, '08/07/24', 8, 'PED008'), -- Pedido 8 (Em Processamento)
(9, '21/06/24', 9, 'PED009'), -- Pedido 9 (Entregue)
(10, '10/07/24', 10, 'PED010'), -- Pedido 10 (Em Processamento)
(11, '11/07/24', 3, 'PED011'), -- Pedido 11 (Em Processamento)
(12, '23/06/24', 6, 'PED012'), -- Pedido 12 (Entregue)
(13, '13/07/24', 4, 'PED013'), -- Pedido 13 (Cancelado)
(14, '14/07/24', 7, 'PED014'), -- Pedido 14 (Em Processamento)
(15, '24/06/24', 1, 'PED015'), -- Pedido 15 (Entregue)
(16, '16/07/24', 3, 'PED016'), -- Pedido 16 (Cancelado)
(17, '17/07/24', 7, 'PED017'), -- Pedido 17 (Em Processamento)
(18, '27/06/24', 8, 'PED018'), -- Pedido 18 (Entregue)
(19, '19/07/24', 9, 'PED019'), -- Pedido 19 (Cancelado)
(20, '20/07/24', 10, 'PED020'); -- Pedido 20 (Em Processamento)

-- Insere dados na Tabela Hardware
INSERT INTO Hardware (fk_ID_Produto, Categoria, Fabricante) VALUES 
(1, 'Processador', 'Intel'),
(2, 'Memória RAM', 'Corsair'),
(3, 'HD', 'Seagate'),
(4, 'SSD', 'Samsung'),
(5, 'Placa Mãe', 'Asus'),
(6, 'Fonte', 'Cooler Master'),
(7, 'Placa de Vídeo', 'Nvidia'),
(8, 'Placa de Vídeo', 'AMD'),
(9, 'Processador', 'AMD'),
(10, 'Memória RAM', 'Kingston');

-- Insere dados na Tabela Acessorios
INSERT INTO Acessorios (fk_ID_Produto, Tipo, Modelo) VALUES 
(11, 'Mouse', 'DeathAdder V2'),
(12, 'Teclado', 'G Pro X'),
(13, 'Fone de Ouvido', 'Cloud II'),
(14, 'Monitor', 'Avoc 24GL600F'),
(15, 'Mouse', 'MX Master 3'),
(16, 'Teclado', 'BlackWidow Elite'),
(17, 'Fone de Ouvido', 'WH-1000XM4'),
(18, 'Monitor', 'Zowie 12401klc'),
(19, 'Mouse', 'G502 Hero'),
(20, 'Teclado', 'K95 RGB Platinum');