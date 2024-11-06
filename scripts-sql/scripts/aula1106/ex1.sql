CREATE SCHEMA aula5_ex1;
USE aula5_ex1;

CREATE TABLE empresas (
    id_empresa BIGINT AUTO_INCREMENT,
    nome VARCHAR(100),
        CONSTRAINT pk_empresa PRIMARY KEY empresas(id_empresa)
);

CREATE TABLE programadores (
    id_programador BIGINT AUTO_INCREMENT,
    id_empresa BIGINT,
    nome VARCHAR(100),
        CONSTRAINT pk_programador PRIMARY KEY programadores(id_programador),
        CONSTRAINT fk_programadores_empresas FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);

CREATE TABLE linguagens (
    id_linguagens BIGINT AUTO_INCREMENT,
    nome VARCHAR(100),
        CONSTRAINT pk_linguagens PRIMARY KEY linguagens(id_linguagens)
);

CREATE TABLE programadores_linguagens (
    id_linguagens BIGINT,
    id_programador BIGINT,
        CONSTRAINT fk_programadores_linguagens_linguagens FOREIGN KEY (id_linguagens) REFERENCES linguagens(id_linguagens),
        CONSTRAINT fk_programadores_linguagens_programadores FOREIGN KEY (id_programador) REFERENCES programadores(id_programador)
);

# Inserts feitos pelo GPT
-- Tabela empresas
INSERT INTO empresas (nome) VALUES
('Tech Solutions'),
('Code Masters'),
('Future Innovations');

-- Tabela programadores
INSERT INTO programadores (id_empresa, nome) VALUES
(1, 'Alice Santos'),
(1, 'Bruno Costa'),
(2, 'Carla Martins'),
(2, 'Daniel Oliveira'),
(3, 'Eduarda Lima'),
(3, 'Fernando Souza');

-- Tabela linguagens
INSERT INTO linguagens (nome) VALUES
('JavaScript'),
('Python'),
('Java'),
('C#'),
('Ruby'),
('PHP');

-- Tabela programadores_linguagens
INSERT INTO programadores_linguagens (id_programador, id_linguagens) VALUES
(1, 1),  -- Alice Santos conhece JavaScript
(1, 2),  -- Alice Santos conhece Python
(2, 3),  -- Bruno Costa conhece Java
(2, 4),  -- Bruno Costa conhece C#
(3, 2),  -- Carla Martins conhece Python
(3, 5),  -- Carla Martins conhece Ruby
(4, 3),  -- Daniel Oliveira conhece Java
(4, 6),  -- Daniel Oliveira conhece PHP
(5, 1),  -- Eduarda Lima conhece JavaScript
(6, 4);  -- Fernando Souza conhece C#

# Consultas Exercícios
# 1)
SELECT p.nome FROM programadores p
JOIN programadores_linguagens pl ON p.id_programador = pl.id_programador
JOIN linguagens l ON pl.id_linguagens = l.id_linguagens
WHERE l.nome = 'PHP';
# Resposta do professor
SELECT p.nome as Programadores, e.nome as Empresa
FROM programadores p
JOIN empresas e on e.id_empresa = p.id_empresa
JOIN programadores_linguagens pl ON p.id_programador = pl.id_programador
JOIN linguagens l ON pl.id_linguagens = l.id_linguagens
WHERE l.nome = 'PHP';