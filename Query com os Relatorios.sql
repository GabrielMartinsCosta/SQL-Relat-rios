-- TABELAS DE CONSULTAS/RELATÓRIOS CONTEXTUALIZADOS --

-- Relatório 01
-- Relatório Cliente para Pedido
-- De forma contextualizada: A empresa quer que uma listagem seja criada
-- onde nesta listagem é realizada a coleta de dados de cada cliente
-- mostrando nome, email, cpf e seus pedidos, incluindo o ID do pedido, status, quantidade e valor total
SELECT cliente.Nome AS 'Nome do Cliente', cliente.Email, cliente.CPF, pedido.ID_Pedido AS 'ID do Pedido', pedido.Status_Pedido AS 'Status do Pedido', pedido.QuantidadePedido AS 'Quantidade de Produtos no Pedido', SUM(produto.Preco) AS 'Valor Total'
FROM Cliente cliente
JOIN Pedido pedido ON cliente.ID_Cliente = pedido.fk_ID_Cliente
JOIN Pedido_Produto pedidopr ON pedido.ID_Pedido = pedidopr.fk_ID_Pedido
JOIN Produto produto ON pedidopr.fk_ID_Produto = produto.ID_Produto
GROUP BY pedido.ID_Pedido, pedido.Status_Pedido, pedido.QuantidadePedido, cliente.Nome, cliente.Email;

-- Relatório 02
-- De forma contextualizada: A empresa quer listar todos os produtos que existem no estoque
-- mostrando o id do estoque(a seção que o produto está inserido), a quantidade, nome, valor unitário e valor total
-- assim como demonstra a categoria
SELECT estoque.ID_Estoque AS 'Seção do Estoque-ID', estoque.Quantidade, produto.Nome, produto.Preco, (estoque.Quantidade * produto.Preco) AS 'Valor Total', 'Hardware' AS 'Categoria'
FROM Estoque estoque
JOIN Produto produto ON estoque.ID_Estoque = produto.fk_ID_Estoque
JOIN Hardware hardware ON produto.ID_Produto = hardware.fk_ID_Produto
GROUP BY estoque.ID_Estoque, estoque.Quantidade, produto.Nome, produto.Preco 
UNION 
SELECT estoque.ID_Estoque, estoque.Quantidade, produto.Nome, produto.Preco, (estoque.Quantidade * produto.Preco) AS 'Valor Total', 'Acessórios' AS 'Categoria'
FROM Estoque estoque
JOIN Produto produto ON estoque.ID_Estoque = produto.fk_ID_Estoque
JOIN Acessorios acessorio ON produto.ID_Produto = acessorio.fk_ID_Produto
GROUP BY estoque.ID_Estoque, estoque.Quantidade, produto.Nome, produto.Preco;

-- Relatório 03
-- De forma contexualizada a empresa quer que demonstre todos os produtos no estoque
-- distribuidos pela categoria que eles se encaixam e a quantidade de cada produto vendido
SELECT 'Hardware' AS 'Categoria', produto.Nome, COUNT(pedidopr.fk_ID_Produto) AS 'Quantidade Vendida'
FROM Produto produto
INNER JOIN Hardware hardware ON produto.ID_Produto = hardware.fk_ID_Produto
INNER JOIN Pedido_Produto pedidopr ON produto.ID_Produto = pedidopr.fk_ID_Produto
GROUP BY produto.Nome UNION
SELECT 
'Acessórios' AS 'Categoria', produto.Nome, COUNT(pedidopr.fk_ID_Produto) AS 'Quantidade Vendida'
FROM Produto produto
INNER JOIN Acessorios acessorios ON produto.ID_Produto = acessorios.fk_ID_Produto
INNER JOIN Pedido_Produto pedidopr ON produto.ID_Produto = pedidopr.fk_ID_Produto
GROUP BY produto.Nome;

-- Relatório 04
-- Neste relatório contextualizado a empresa quer identificar quais pedidos
-- feitos pelos clientes estão em processamento
SELECT pedido.ID_Pedido, pedido.Status_Pedido AS'Status do Pedido', cliente.Nome, cliente.CPF, pedido.QuantidadePedido
FROM Pedido pedido
JOIN Cliente cliente ON pedido.fk_ID_Cliente = cliente.ID_Cliente
WHERE pedido.Status_Pedido = 'Em Processamento';

-- Relatório 05
-- Assim como o relatório 4, neste a empresa quer saber quais são os pedidos cancelados
SELECT pedido.ID_Pedido AS 'ID do Pedido', pedido.Status_Pedido AS 'Status do Pedido', cliente.Nome, cliente.CPF, pedido.QuantidadePedido
FROM Pedido pedido
JOIN Cliente cliente ON pedido.fk_ID_Cliente = cliente.ID_Cliente
WHERE pedido.Status_Pedido = 'Cancelado';

-- Relatório 06
-- Aqui a empresa quer saber quais foram os clientes que mais gastaram na loja, organizados
-- de forma decrescente
SELECT cliente.Nome ,SUM(produto.Preco) AS 'Valor Total Gasto na Loja'
FROM Cliente cliente
INNER JOIN Pedido pedido ON cliente.ID_Cliente = pedido.fk_ID_Cliente
INNER JOIN Pedido_Produto pedidopr ON pedido.ID_Pedido = pedidopr.fk_ID_Pedido
INNER JOIN Produto produto ON pedidopr.fk_ID_Produto = produto.ID_Produto
GROUP BY cliente.Nome
ORDER BY SUM(produto.Preco) DESC;

-- Relatório 07
-- Neste relatório a empresa quer listar todos os pedidos que foram entregues
-- Assim como qual cliente fez os pedidos, para qual endereço e qual data
SELECT pedido.ID_Pedido AS 'ID do Pedido', pedido.Status_Pedido AS 'Status do Pedido', entrega.Data_Entrega AS 'Data de Entrega', endereco.Rua, endereco.Numero, endereco.Cidade, endereco.Estado, produto.Nome AS 'Produtos', cliente.CPF, cliente.Nome
FROM Pedido pedido
INNER JOIN Entrega entrega ON pedido.ID_Pedido = entrega.fk_ID_Pedido
INNER JOIN Endereco endereco ON entrega.fk_ID_Endereco = endereco.ID_Endereco
INNER JOIN Pedido_Produto pedidopr ON pedido.ID_Pedido = pedidopr.fk_ID_Pedido
INNER JOIN Produto produto ON pedidopr.fk_ID_Produto = produto.ID_Produto
JOIN Cliente cliente ON pedido.fk_ID_Cliente = cliente.ID_Cliente
WHERE pedido.Status_Pedido = 'Entregue';

-- Relatório 08
-- Neste relatório a empresa lista todos os produtos de Hardware
-- nela a empresa quer saber quais fabricantes e categorias os produtos pertencem
SELECT hardware.Categoria AS 'Categoria de Hardware', hardware.Fabricante, produto.Nome
FROM Hardware hardware
JOIN Produto produto ON hardware.fk_ID_Produto = produto.ID_Produto;

-- Relatório 09
-- Parecido com o relatório 08, neste a empresa quer fazer para os produtos de Acessórios
SELECT acessorio.Tipo AS 'Tipo de Acessorio', acessorio.Modelo, produto.Nome
FROM Acessorios acessorio
JOIN Produto produto ON acessorio.fk_ID_Produto = produto.ID_Produto;

-- Relatório 10
-- Neste relatório a empresa quer listar quantos pedidos foram realizados por Estado no país
SELECT endereco.Estado, COUNT(pedido.ID_Pedido) AS 'Quantidade de Pedidos por Estado'
FROM Pedido pedido
JOIN Cliente cliente ON pedido.fk_ID_Cliente = cliente.ID_Cliente
JOIN Endereco endereco ON cliente.ID_Cliente = endereco.fk_ID_Cliente
GROUP BY endereco.Estado
ORDER BY 'Quantidade de Pedidos' DESC;

-- Relatório 11
-- Como ultimo relatório do projeto decidimos por tentar criar o subquery usando inner join
-- Este relatório lista os clientes que possuem mais de um endereço cadastrado na base de dados.
-- Ele exibe o nome do cliente, a quantidade de endereços diferentes que ele possui e lista os endereços.
SELECT cliente.Nome AS 'Nome do Cliente', endereco.ID_Endereco AS 'ID do Endereço', endereco.Rua AS 'Rua', endereco.Cidade AS 'Cidade', endereco.Estado AS 'Estado'
FROM Cliente cliente
INNER JOIN Endereco endereco ON cliente.ID_Cliente = endereco.fk_ID_Cliente
INNER JOIN (
    SELECT fk_ID_Cliente
    FROM Endereco
    GROUP BY fk_ID_Cliente
    HAVING COUNT(*) > 1
) cliente_enderecos ON cliente.ID_Cliente = cliente_enderecos.fk_ID_Cliente;









