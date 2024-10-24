CREATE SCHEMA aula3_ex1;

USE aula3_ex1;

# Aula 3
# Exercício 1

/* Professor */
CREATE TABLE professor (
    id     BIGINT NOT NULL AUTO_INCREMENT,
    nome   VARCHAR(150)                  ,
    rua    VARCHAR(255)                  ,
    cidade VARCHAR(150)                  ,
        CONSTRAINT pk_professor PRIMARY KEY (id)
);

/* Aluno */
CREATE TABLE aluno (
    id     BIGINT NOT NULL AUTO_INCREMENT,
    nome   VARCHAR(150)                  ,
    rua    VARCHAR(255)                  ,
    cidade VARCHAR(150)                  ,
        CONSTRAINT pk_aluno PRIMARY KEY (id)
);

/* Disciplina */
CREATE TABLE disciplina (
    id               BIGINT NOT NULL AUTO_INCREMENT,
    nome             VARCHAR(150)                  ,
    nome_curso       VARCHAR(150)                  ,
    quantidade_aulas INTEGER                       ,
        CONSTRAINT pk_disciplina PRIMARY KEY (id)
);

/* Matrícula */
CREATE TABLE matricula (
    id            BIGINT NOT NULL AUTO_INCREMENT,
    id_aluno      BIGINT NOT NULL,
    id_disciplina BIGINT NOT NULL,
    ano           VARCHAR(4),
        CONSTRAINT pk_matricula PRIMARY KEY (id),
        CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id),
        CONSTRAINT fk_matricula_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id)
);

/* Professor Disciplina */
CREATE TABLE  professor_disciplina (
    id            BIGINT NOT NULL AUTO_INCREMENT,
    id_disciplina BIGINT NOT NULL,
    id_professor  BIGINT NOT NULL,
    ano           VARCHAR(4),
        CONSTRAINT pk_professor_disciplina PRIMARY KEY (id),
        CONSTRAINT fk_professor_disciplina_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id),
        CONSTRAINT fk_professor_disciplina_professor FOREIGN KEY (id_professor) REFERENCES professor(id)
);

# Consultas passadas pelo professor em sala
SELECT * FROM aluno
    WHERE cidade IN ('São Paulo');

SELECT COUNT(*) AS contador FROM aluno
    WHERE cidade IN ('São Paulo');

SELECT * FROM professor;

UPDATE professor SET cidade = 'São Paulo' WHERE id = 3;

SELECT aluno.* FROM aluno
    JOIN matricula m on aluno.id = m.id_aluno
    JOIN disciplina d on d.id = m.id_disciplina
    WHERE d.id = 25;

# Vários inputs para testar as consultas
-- Inserindo dados na tabela professor
INSERT INTO professor (nome, rua, cidade) VALUES
('Ana Silva', 'Av. das Flores', 'São Paulo'),
('Bruno Costa', 'Rua dos Limoeiros', 'Rio de Janeiro'),
('Carla Santos', 'Rua da Esperança', 'Belo Horizonte'),
('David Almeida', 'Praça da Liberdade', 'Curitiba'),
('Elena Martins', 'Rua dos Eucaliptos', 'Porto Alegre'),
('Fernando Lima', 'Rua do Sol', 'Recife'),
('Gabriela Rocha', 'Av. da Paz', 'Fortaleza'),
('Henrique Ferreira', 'Rua dos Girassóis', 'Salvador'),
('Isabela Torres', 'Av. dos Trabalhadores', 'Manaus'),
('Jorge Mendes', 'Rua da Amizade', 'Natal'),
('Karla Nunes', 'Rua do Bosque', 'Florianópolis'),
('Lucas Pereira', 'Av. do Comércio', 'São Luís'),
('Marta Andrade', 'Rua da Alegria', 'Teresina'),
('Nicolas Gomes', 'Rua das Palmeiras', 'João Pessoa'),
('Olivia Souza', 'Praça da Cultura', 'Campo Grande'),
('Paulo Santos', 'Rua das Orquídeas', 'Maceió'),
('Quiteria Almeida', 'Rua da Integração', 'Aracaju'),
('Ricardo Lima', 'Av. do Trabalhador', 'Belém'),
('Sofia Martins', 'Rua dos Cravos', 'Vitória'),
('Tiago Mendes', 'Av. dos Pássaros', 'São José'),
('Ursula Ribeiro', 'Rua do Sorriso', 'Sorocaba'),
('Vinícius Rocha', 'Praça da Liberdade', 'Cuiabá'),
('Wanda Lopes', 'Rua dos Coqueiros', 'Pelotas'),
('Xavier Campos', 'Av. da Amizade', 'Londrina'),
('Yara Oliveira', 'Rua das Acácias', 'Juiz de Fora'),
('Zeca Martins', 'Av. do Futuro', 'Uberlândia'),
('Aline Costa', 'Rua da Sabedoria', 'Belo Horizonte'),
('Bruno Silva', 'Rua das Estrelas', 'São Paulo'),
('Cecília Almeida', 'Av. do Conhecimento', 'Curitiba'),
('Daniela Nascimento', 'Rua da Inovação', 'Rio de Janeiro'),
('Eduardo Fernandes', 'Rua da Sustentabilidade', 'Recife');

-- Inserindo dados na tabela aluno
INSERT INTO aluno (nome, rua, cidade) VALUES
('André Cardoso', 'Rua do Conhecimento', 'São Paulo'),
('Beatriz Lima', 'Av. das Águas', 'Rio de Janeiro'),
('Carlos Martins', 'Rua do Progresso', 'Belo Horizonte'),
('Diana Torres', 'Av. da Amizade', 'Curitiba'),
('Elias Ferreira', 'Rua da Felicidade', 'Porto Alegre'),
('Fábio Gomes', 'Rua da Esperança', 'Recife'),
('Giovanna Rocha', 'Av. das Palmeiras', 'Fortaleza'),
('Hugo Alves', 'Rua do Sol', 'Salvador'),
('Isis Santana', 'Praça da Cultura', 'Manaus'),
('João Pedro', 'Rua das Orquídeas', 'Natal'),
('Karine Silva', 'Av. da Paz', 'Florianópolis'),
('Leonardo Nunes', 'Rua dos Girassóis', 'São Luís'),
('Michele Souza', 'Rua da Alegria', 'Teresina'),
('Natan Oliveira', 'Rua dos Eucaliptos', 'João Pessoa'),
('Olga Martins', 'Praça da Liberdade', 'Campo Grande'),
('Pedro Henrique', 'Av. dos Trabalhadores', 'Maceió'),
('Quintino Mendes', 'Rua dos Cravos', 'Aracaju'),
('Rafaela Lima', 'Rua do Bosque', 'Belém'),
('Samuel Rocha', 'Av. do Futuro', 'Vitória'),
('Tatiane Ferreira', 'Rua das Flores', 'São José'),
('Ulisses Ribeiro', 'Rua do Sorriso', 'Sorocaba'),
('Vanessa Almeida', 'Praça da Cultura', 'Cuiabá'),
('Walter Torres', 'Rua da Integração', 'Pelotas'),
('Xena Costa', 'Rua dos Coqueiros', 'Londrina'),
('Yuri Mendes', 'Av. das Estrelas', 'Juiz de Fora'),
('Zélia Santos', 'Rua do Progresso', 'Uberlândia'),
('Alexandre Gomes', 'Rua da Inovação', 'São Paulo'),
('Bruna Costa', 'Av. da Felicidade', 'Rio de Janeiro'),
('Cristina Nascimento', 'Rua da Liberdade', 'Belo Horizonte'),
('Diego Almeida', 'Rua do Conhecimento', 'Curitiba'),
('Eduarda Lima', 'Av. da Sabedoria', 'Recife');

-- Inserindo dados na tabela disciplina
INSERT INTO disciplina (nome, nome_curso, quantidade_aulas) VALUES
('Matemática Avançada', 'Engenharia', 45),
('História do Brasil', 'Ciências Humanas', 40),
('Química Orgânica', 'Farmácia', 50),
('Programação em Python', 'Tecnologia', 30),
('Teoria da Computação', 'Ciência da Computação', 35),
('Biologia Celular', 'Biomedicina', 55),
('Física Clássica', 'Engenharia Física', 60),
('Literatura Brasileira', 'Letras', 25),
('Arte e Cultura', 'Artes', 20),
('Administração Financeira', 'Administração', 40),
('Economia Política', 'Economia', 30),
('Ética e Cidadania', 'Direito', 45),
('Engenharia de Software', 'Tecnologia', 50),
('Gestão de Projetos', 'Administração', 35),
('Comunicação Social', 'Comunicação', 30),
('Redes de Computadores', 'Tecnologia', 40),
('Antropologia Cultural', 'Ciências Sociais', 25),
('Filosofia Moderna', 'Filosofia', 20),
('Estatística Aplicada', 'Ciências Atuariais', 30),
('Psicologia do Desenvolvimento', 'Psicologia', 35),
('Ciência dos Dados', 'Tecnologia', 50),
('Educação Física', 'Educação', 40),
('Sociologia da Educação', 'Educação', 35),
('Inglês para Negócios', 'Letras', 30),
('Desenvolvimento Sustentável', 'Ciências Ambientais', 45),
('Técnicas de Pesquisa', 'Ciências Humanas', 40),
('Introdução à Filosofia', 'Filosofia', 30),
('Marketing Digital', 'Administração', 45),
('História da Arte', 'Artes', 50),
('Análise de Sistemas', 'Ciência da Computação', 40),
('Empreendedorismo', 'Administração', 35);

-- Inserindo dados na tabela matricula
INSERT INTO matricula (id_aluno, id_disciplina, ano) VALUES
(1, 1, '2020'),
(2, 2, '2021'),
(3, 3, '2022'),
(4, 4, '2023'),
(5, 5, '2024'),
(6, 6, '2020'),
(7, 7, '2021'),
(8, 8, '2022'),
(9, 9, '2023'),
(10, 10, '2024'),
(11, 11, '2020'),
(12, 12, '2021'),
(13, 13, '2022'),
(14, 14, '2023'),
(15, 15, '2024'),
(16, 16, '2020'),
(17, 17, '2021'),
(18, 18, '2022'),
(19, 19, '2023'),
(20, 20, '2024'),
(21, 21, '2020'),
(22, 22, '2021'),
(23, 23, '2022'),
(24, 24, '2023'),
(25, 25, '2024'),
(26, 26, '2020'),
(27, 27, '2021'),
(28, 28, '2022'),
(29, 29, '2023'),
(30, 30, '2024'),
(31, 31, '2024'),
(1, 25, '2021'),
(2, 26, '2020'),
(3, 27, '2022'),
(4, 28, '2023'),
(5, 29, '2024'),
(6, 30, '2020'),
(7, 31, '2021');

-- Inserindo dados na tabela professor_disciplina
INSERT INTO professor_disciplina (id_disciplina, id_professor, ano) VALUES
(1, 1, '2020'),
(2, 2, '2021'),
(3, 3, '2022'),
(4, 4, '2023'),
(5, 5, '2024'),
(6, 6, '2020'),
(7, 7, '2021'),
(8, 8, '2022'),
(9, 9, '2023'),
(10, 10, '2024'),
(11, 11, '2020'),
(12, 12, '2021'),
(13, 13, '2022'),
(14, 14, '2023'),
(15, 15, '2024'),
(16, 16, '2020'),
(17, 17, '2021'),
(18, 18, '2022'),
(19, 19, '2023'),
(20, 20, '2024'),
(21, 21, '2020'),
(22, 22, '2021'),
(23, 23, '2022'),
(24, 24, '2023'),
(25, 25, '2024'),
(26, 26, '2020'),
(27, 27, '2021'),
(28, 28, '2022'),
(29, 29, '2023'),
(30, 30, '2024'),
(31, 31, '2024');