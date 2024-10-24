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

SELECT * FROM aluno
    WHERE rua IN ('A', 'B');

SELECT COUNT(*) AS contador FROM aluno
    WHERE rua IN ('A', 'B');

INSERT INTO aluno(nome, rua, cidade) VALUES
        ('Pedro', 'B', 'Valença'),
        ('João', 'C', 'Valença'),
        ('João Pedro', 'A', 'Valença'),
        ('Ana', 'D', 'Valença'),
        ('Heloisa', 'E', 'Valença');

-- Inserindo dados na tabela Professor
INSERT INTO professor (nome, rua, cidade) VALUES
    ('Ana Silva', 'Rua A', 'São Paulo'),
    ('João Pereira', 'Rua B', 'São Paulo'),
    ('Maria Oliveira', 'Rua C', 'Rio de Janeiro'),
    ('Carlos Santos', 'Rua D', 'Belo Horizonte'),
    ('Fernanda Lima', 'Rua E', 'Curitiba');

-- Inserindo dados na tabela Aluno
INSERT INTO aluno (nome, rua, cidade) VALUES
    ('Lucas Souza', 'Rua F', 'Valença'),
    ('Camila Costa', 'Rua G', 'Valença'),
    ('Rafael Almeida', 'Rua H', 'Valença'),
    ('Juliana Rocha', 'Rua I', 'Valença'),
    ('Tiago Martins', 'Rua J', 'Valença');

-- Inserindo dados na tabela Disciplina
INSERT INTO disciplina (nome, nome_curso, quantidade_aulas) VALUES
    ('Matemática', 'Engenharia', 60),
    ('Física', 'Engenharia', 45),
    ('Química', 'Ciências', 30),
    ('História', 'Humanas', 40),
    ('Programação', 'Tecnologia', 50);

-- Inserindo dados na tabela Matrícula
INSERT INTO matricula (id_aluno, id_disciplina, ano) VALUES
    (1, 1, '2024'),
    (1, 2, '2024'),
    (2, 1, '2024'),
    (3, 3, '2024'),
    (4, 4, '2024');

-- Inserindo dados na tabela Professor Disciplina
INSERT INTO professor_disciplina (id_disciplina, id_professor, ano) VALUES
    (1, 1, '2024'),
    (2, 2, '2024'),
    (3, 3, '2024'),
    (4, 4, '2024'),
    (5, 5, '2024');

SELECT * FROM professor;

UPDATE professor SET rua = 'Rua W' WHERE id = 3;

SELECT aluno.* FROM aluno
    JOIN matricula m on aluno.id = m.id_aluno
    JOIN disciplina d on d.id = m.id_disciplina
    WHERE d.id = 1;