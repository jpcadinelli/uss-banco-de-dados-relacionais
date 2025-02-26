CREATE DATABASE Biblioteca;
USE Biblioteca;

-- Tabela de Autores
CREATE TABLE Autores (
id_autor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
nacionalidade VARCHAR(50)
);
-- Tabela de Livros
CREATE TABLE Livros (
id_livro INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(200) NOT NULL,
ano_publicacao VARCHAR(100) NOT NULL,
id_autor INT,
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);
-- Tabela de Clientes
CREATE TABLE Clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
telefone VARCHAR(15)
);
-- Tabela de Empréstimos
CREATE TABLE Emprestimos (
id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
id_livro INT,
data_emprestimo DATE NOT NULL,
data_devolucao DATE,
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
);

-- Inserindo Autores
INSERT INTO Autores (nome, nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('J.K. Rowling', 'Britânica'),
('George Orwell', 'Britânico');
-- Inserindo Livros
INSERT INTO Livros (titulo, ano_publicacao, id_autor) VALUES
('Dom Casmurro', '1899', 1),
('Harry Potter e a Pedra Filosofal', '1997', 2),
('1984', '1949', 3);
-- Inserindo Clientes
INSERT INTO Clientes (nome, email, telefone) VALUES
('Ana Souza', 'ana@email.com', '11987654321'),
('Carlos Pereira', 'carlos@email.com', '11976543210'),
('Mariana Lima', 'mariana@email.com', '11965432109');
-- Inserindo Empréstimos
INSERT INTO Emprestimos (id_cliente, id_livro, data_emprestimo,
data_devolucao) VALUES
(1, 1, '2024-02-01', '2024-02-10'),
(2, 2, '2024-02-05', NULL),
(3, 3, '2024-02-08', NULL);

# ATIVIDADE DE AULA 26/02
# Questão 1:
-- Inserindo mais Autores
INSERT INTO Autores (nome, nacionalidade) VALUES
('Jane Austen', 'Britânica'),
('Gabriel García Márquez', 'Colombiano'),
('J.R.R. Tolkien', 'Britânico'),
('Margaret Atwood', 'Canadense'),
('Chimamanda Ngozi Adichie', 'Nigeriana');

-- Inserindo mais Livros
INSERT INTO Livros (titulo, ano_publicacao, id_autor) VALUES
('Orgulho e Preconceito', '1813', 4),
('Cem Anos de Solidão', '1967', 5),
('O Senhor dos Anéis', '1954', 6),
('O Conto da Aia', '1985', 7),
('Americanah', '2013', 8);

-- Inserindo mais Clientes
INSERT INTO Clientes (nome, email, telefone) VALUES
('José Silva', 'jose@email.com', '11954321098'),
('Paula Oliveira', 'paula@email.com', '11943210987'),
('Lucas Fernandes', 'lucas@email.com', '11932109876'),
('Julia Santos', 'julia@email.com', '11921098765'),
('Marcelo Alves', 'marcelo@email.com', '11910987654');

-- Inserindo mais Empréstimos
INSERT INTO Emprestimos (id_cliente, id_livro, data_emprestimo, data_devolucao) VALUES
(1, 4, '2024-03-01', '2024-03-15'),
(2, 5, '2024-03-10', NULL),
(3, 6, '2024-03-12', '2024-03-22'),
(4, 7, '2024-03-18', NULL),
(5, 8, '2024-03-20', '2024-04-01');

# Questão 2:
SELECT L.*
    FROM Livros AS L
    LEFT JOIN Emprestimos E on L.id_livro = E.id_livro
    WHERE E.data_devolucao IS NOT NULL
    OR E.id_livro IS NULL
    GROUP BY L.id_livro;

# Questão 3:
SELECT * FROM Clientes;

# Questão 4:
SELECT * FROM Emprestimos WHERE data_devolucao IS NULL;

# Questão 5:
SELECT L.*, A.nome as Autor FROM Livros AS L INNER JOIN Autores A on L.id_autor = A.id_autor;

# Questão 6:
SELECT C.*, L.titulo AS Livro
    FROM Clientes AS C
    JOIN Emprestimos E on C.id_cliente = E.id_cliente
    JOIN Livros L on L.id_livro = E.id_livro;

# Questão 7:
SELECT A.nome, COUNT(L.id_livro) AS quantidade_livros
    FROM Autores A
    JOIN Livros l ON A.id_autor = L.id_autor
    GROUP BY A.nome
    ORDER BY quantidade_livros DESC
    LIMIT 1;

# Questão 8:
SELECT C.* FROM Clientes C JOIN Emprestimos E on C.id_cliente = E.id_cliente WHERE data_devolucao IS NULL;

# Questão 9:
SELECT C.* FROM Clientes C LEFT JOIN Emprestimos E on C.id_cliente = E.id_cliente WHERE E.id_cliente IS NULL;

# Questão 10:
SELECT AVG(DATEDIFF(data_devolucao, data_emprestimo)) AS Media FROM Emprestimos WHERE data_devolucao IS NOT NULL;

# Questão 11:
SELECT L.* FROM Livros L JOIN Emprestimos E on L.id_livro = E.id_livro ORDER BY E.data_emprestimo LIMIT 1;

# Questão 12:
SELECT C.nome AS nome_cliente, L.titulo AS titulo_livro
    FROM Clientes C
    INNER JOIN Emprestimos E ON C.id_cliente = E.id_cliente
    INNER JOIN Livros L ON E.id_livro = L.id_livro;

SELECT A.nome AS nome_autor, L.titulo AS titulo_livro
    FROM Autores A
    LEFT JOIN Livros L ON A.id_autor = L.id_autor;

SELECT C.nome AS nome_cliente, E.data_emprestimo
FROM Clientes C
RIGHT JOIN Emprestimos E ON C.id_cliente = E.id_cliente;

SELECT A.nome AS nome_autor, L.titulo AS titulo_livro
    FROM Autores A
    FULL JOIN Livros L ON A.id_autor = L.id_autor;
# Pesquisei e achei que o MySQL não aceita o FULL JOIN como o de cima, portanto usei o UNION.
SELECT A.nome AS nome_autor, L.titulo AS titulo_livro
    FROM Autores A
    LEFT JOIN Livros l ON A.id_autor = L.id_autor
    UNION
    SELECT A.nome AS nome_autor, L.titulo AS titulo_livro
    FROM Autores A
    RIGHT JOIN Livros L ON L.id_autor = L.id_autor;