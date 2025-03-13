CREATE DATABASE lojaOnline;
USE lojaOnline;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO clientes (nome, email) VALUES
('Ana Souza', 'ana@email.com'),
('Carlos Lima', 'carlos@email.com'),
('Fernanda Ribeiro', 'fernanda@email.com'),
('João Santos', 'joao@email.com'),
('Mariana Costa', 'mariana@email.com'),
('Roberto Alves', 'roberto@email.com'),
('Sofia Mendes', 'sofia@email.com'),
('Thiago Oliveira', 'thiago@email.com'),
('Vanessa Martins', 'vanessa@email.com'),
('Wagner Ferreira', 'wagner@email.com');

INSERT INTO produtos (nome, preco) VALUES
('Celular', 1500.00),
('Notebook', 3500.00),
('Tablet', 1200.00),
('Monitor', 800.00),
('Teclado', 150.00),
('Mouse', 90.00),
('Impressora', 700.00),
('Headset', 250.00),
('Câmera', 1100.00),
('Smartwatch', 600.00);

INSERT INTO pedidos (cliente_id, produto_id, quantidade, data_pedido) VALUES
(1, 2, 1, '2024-01-10'),
(2, 3, 2, '2024-01-11'),
(3, 1, 1, '2024-01-12'),
(4, 5, 3, '2024-01-15'),
(5, 6, 2, '2024-01-17'),
(6, 7, 1, '2024-01-18'),
(7, 8, 2, '2024-01-19'),
(8, 4, 1, '2024-01-20'),
(9, 9, 2, '2024-01-21'),
(10, 10, 1, '2024-01-22');

# Responda estas questões utilizando subquery
# Questão 1: Listar os pedidos onde a quantidade comprada foi maior que a quantidade média de todos os pedidos.
SELECT p.* FROM pedidos AS p WHERE p.quantidade > (SELECT AVG(p2.quantidade) FROM pedidos p2);

# Questão 2: Exibir os clientes que fizeram pelo menos um pedido.
SELECT c.* FROM clientes AS c WHERE id IN (SELECT DISTINCT cliente_id FROM pedidos);

# Questão 3: Mostrar os produtos que custam mais do que a média dos preços dos produtos disponíveis.
SELECT p.* FROM produtos AS p WHERE p.preco > (SELECT AVG(p2.preco) FROM produtos AS p2);

# Questão 4: Exibir os nomes dos clientes e a quantidade total de pedidos que cada um fez. Somente exibir clientes que
# tenham feito mais de um pedido.
SELECT nome, total_pedidos FROM (
    SELECT c.nome, COUNT(p.id) AS total_pedidos
    FROM clientes c
    JOIN pedidos p ON c.id = p.cliente_id
    GROUP BY c.id
) AS subquery
WHERE total_pedidos > 1;

# Questão 5: Listar os produtos mais caros que o produto mais barato comprado por qualquer cliente.
SELECT p.* FROM produtos AS p
           WHERE p.preco > (SELECT MIN(p2.preco) FROM produtos AS p2
                                                 WHERE p2.id IN (SELECT p3.produto_id FROM pedidos AS p3));