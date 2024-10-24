CREATE SCHEMA aula1_ex1;

USE aula1_ex1;

-- Exercício 1 --
CREATE TABLE peca (
  id bigint NOT NULL,
  nome varchar(50),
    CONSTRAINT pk_peca PRIMARY KEY (id)
);

CREATE TABLE projeto (
  id bigint NOT NULL,
  nome varchar(50),
  data timestamp,
    CONSTRAINT pk_projeto PRIMARY KEY (id)
);

CREATE TABLE peca_projeto (
  id bigint NOT NULL,
  id_peca bigint NOT NULL,
  id_projeto bigint NOT NULL,
    CONSTRAINT pk_projeto PRIMARY KEY (id),
    CONSTRAINT fk_peca_projeto_peca FOREIGN KEY (id_peca) REFERENCES peca (id),
    CONSTRAINT fk_peca_projeto_projeto FOREIGN KEY (id_projeto) REFERENCES projeto (id)
);

CREATE TABLE pessoa (
  id bigint NOT NULL,
  primeiro_nome varchar(50),
  ultimo_nome varchar(50),
  cpf varchar(11),
  endereco blob,
  data timestamp,
    CONSTRAINT pk_pessoa PRIMARY KEY (id)
);

CREATE TABLE projeto_pessoa (
  id bigint NOT NULL,
  id_projeto bigint NOT NULL,
  id_pessoa bigint NOT NULL,
    CONSTRAINT pk_pessoa PRIMARY KEY (id),
    CONSTRAINT fk_projeto_pessoa_projeto FOREIGN KEY (id_projeto) REFERENCES projeto (id),
    CONSTRAINT fk_projeto_pessoa_pessoa FOREIGN KEY (id_pessoa) REFERENCES pessoa (id)
);

INSERT INTO peca (id, nome) VALUES
(1, 'Roda'),
(2, 'Motor'),
(3, 'Chassi'),
(4, 'Bateria'),
(5, 'Farol');

INSERT INTO projeto (id, nome, data) VALUES
(1, 'Projeto A', '2024-01-01 10:00:00'),
(2, 'Projeto B', '2024-02-01 11:00:00'),
(3, 'Projeto C', '2024-03-01 12:00:00');

INSERT INTO peca_projeto (id, id_peca, id_projeto) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 1, 3),
(6, 5, 3);

INSERT INTO pessoa (id, primeiro_nome, ultimo_nome, cpf, endereco, data) VALUES
(1, 'João', 'Silva', '12345678901', 'Rua A, 123', '2024-01-01 10:00:00'),
(2, 'Maria', 'Oliveira', '23456789012', 'Rua B, 456', '2024-02-01 11:00:00'),
(3, 'Carlos', 'Pereira', '34567890123', 'Rua C, 789', '2024-03-01 12:00:00');

INSERT INTO projeto_pessoa (id, id_projeto, id_pessoa) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 3);