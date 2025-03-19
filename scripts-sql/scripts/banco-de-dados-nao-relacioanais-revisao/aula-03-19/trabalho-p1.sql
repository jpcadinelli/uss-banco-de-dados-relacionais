-- Criação do banco de dados
CREATE DATABASE leituraECompanhia;
USE leituraECompanhia;

-- Criação das tabelas
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100),
    nacionalidade VARCHAR(50)
);

CREATE TABLE editoras (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    id_autor INT,
    id_editora INT,
    ano_publicacao INT,
    preco DECIMAL(10, 2),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_editora) REFERENCES editoras(id_editora)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    data_venda DATE,
    quantidade INT,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

-- Inserção de dados
INSERT INTO autores (nome_autor, nacionalidade) VALUES
('Autor A', 'Brasileiro'),
('Autor B', 'Americano'),
('Autor C', 'Inglês'),
('Autor D', 'Francês'),
('Autor E', 'Espanhol'),
('Autor F', 'Brasileiro'),
('Autor G', 'Italiano'),
('Autor H', 'Alemão'),
('Autor I', 'Russo'),
('Autor J', 'Japonês');

INSERT INTO editoras (nome_editora, cidade) VALUES
('Editora X', 'Rio de Janeiro'),
('Editora Y', 'São Paulo'),
('Editora Z', 'Nova York'),
('Editora W', 'Londres'),
('Editora V', 'Paris'),
('Editora U', 'Madrid'),
('Editora T', 'Roma'),
('Editora S', 'Berlim'),
('Editora R', 'Moscou'),
('Editora Q', 'Tóquio');

INSERT INTO livros (titulo, id_autor, id_editora, ano_publicacao, preco) VALUES
('Livro 1', 1, 1, 2005, 50.00),
('Livro 2', 2, 2, 2010, 45.00),
('Livro 3', 3, 3, 2015, 60.00),
('Livro 4', 4, 4, 2008, 55.00),
('Livro 5', 5, 5, 2020, 70.00),
('Livro 6', 6, 6, 2018, 65.00),
('Livro 7', 7, 7, 2012, 40.00),
('Livro 8', 8, 8, 2011, 30.00),
('Livro 9', 9, 9, 2022, 80.00),
('Livro 10', 10, 10, 2021, 90.00);

INSERT INTO vendas (id_livro, data_venda, quantidade, valor_total) VALUES
(1, '2023-01-15', 10, 500.00),
(2, '2023-02-20', 5, 225.00),
(3, '2023-03-10', 8, 480.00),
(4, '2023-01-25', 6, 330.00),
(5, '2023-02-28', 12, 840.00),
(6, '2023-03-05', 7, 455.00),
(7, '2023-01-30', 9, 360.00),
(8, '2023-02-18', 4, 120.00),
(9, '2023-03-15', 15, 1200.00),
(10, '2023-03-20', 20, 1800.00);

-- Consultas
-- 1. Liste todos os livros com seus respectivos autores e editoras.
SELECT livros.titulo, autores.nome_autor, editoras.nome_editora
FROM livros
JOIN autores ON livros.id_autor = autores.id_autor
JOIN editoras ON livros.id_editora = editoras.id_editora;

-- 2. Mostre o total de vendas por livro.
SELECT livros.titulo, SUM(vendas.valor_total) AS total_vendas
FROM vendas
JOIN livros ON vendas.id_livro = livros.id_livro
GROUP BY livros.titulo;

-- 3. Liste os autores que têm mais de 2 livros publicados.
SELECT autores.nome_autor, COUNT(livros.id_livro) AS quantidade_livros
FROM autores
JOIN livros ON autores.id_autor = livros.id_autor
GROUP BY autores.nome_autor
HAVING COUNT(livros.id_livro) > 2;

-- 4. Mostre o valor total de vendas por editora.
SELECT editoras.nome_editora, SUM(vendas.valor_total) AS total_vendas
FROM vendas
JOIN livros ON vendas.id_livro = livros.id_livro
JOIN editoras ON livros.id_editora = editoras.id_editora
GROUP BY editoras.nome_editora;

-- 5. Liste os livros publicados após o ano de 2010.
SELECT titulo
FROM livros
WHERE ano_publicacao > 2010;
