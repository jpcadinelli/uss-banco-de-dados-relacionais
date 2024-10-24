CREATE SCHEMA aula1_ex3;

USE aula1_ex3;

-- Exercício 3 --
CREATE TABLE cidade (
  id bigint NOT NULL ,
  nome varchar(150)  ,
    CONSTRAINT pk_cidade PRIMARY KEY (id)
);

CREATE TABLE  empregado (
    id bigint NOT NULL ,
    nome varchar(150)  ,
    rua blob           ,
    id_cidade bigint   ,
        CONSTRAINT pk_empregado PRIMARY KEY (id),
        CONSTRAINT fk_empregado_cidade FOREIGN KEY (id_cidade) REFERENCES cidade (id)
);

CREATE TABLE companhia (
  id bigint NOT NULL ,
  nome varchar(150)  ,
  id_cidade bigint   ,
    CONSTRAINT pk_companhia PRIMARY KEY (id),
    CONSTRAINT fk_companhia_cidade FOREIGN KEY (id_cidade) REFERENCES cidade (id)
);

CREATE TABLE trabalha (
  id bigint NOT NULL  ,
  salario numeric     ,
  id_empregado bigint ,
  id_companhia bigint ,
    CONSTRAINT pk_trabalha PRIMARY KEY (id),
    CONSTRAINT fk_trabalha_empregado FOREIGN KEY (id_empregado) REFERENCES empregado (id),
    CONSTRAINT fk_trabalha_companhia FOREIGN KEY (id_companhia) REFERENCES companhia (id)
);

CREATE TABLE gerente (
  id bigint NOT NULL  ,
  id_empregado bigint ,
  id_companhia bigint ,
    CONSTRAINT pk_gerente PRIMARY KEY (id),
    CONSTRAINT fk_gerente_empregado FOREIGN KEY (id_empregado) REFERENCES empregado (id),
    CONSTRAINT fk_gerente_companhia FOREIGN KEY (id_companhia) REFERENCES companhia (id)
);

INSERT INTO cidade (id, nome) VALUES
(1, 'São Paulo'),
(2, 'Rio de Janeiro'),
(3, 'Belo Horizonte'),
(4, 'Curitiba'),
(5, 'Porto Alegre');

INSERT INTO empregado (id, nome, rua, id_cidade) VALUES
(1, 'João Silva', 'Rua A, 123', 1),
(2, 'Maria Oliveira', 'Rua B, 456', 2),
(3, 'Pedro Santos', 'Rua C, 789', 3),
(4, 'Ana Costa', 'Rua D, 101', 4),
(5, 'Lucas Lima', 'Rua E, 202', 5);

INSERT INTO companhia (id, nome, id_cidade) VALUES
(1, 'Companhia A', 1),
(2, 'Companhia B', 2),
(3, 'Companhia C', 3),
(4, 'Companhia D', 4),
(5, 'Companhia E', 5);

INSERT INTO trabalha (id, salario, id_empregado, id_companhia) VALUES
(1, 3000.00, 1, 1),
(2, 3500.00, 2, 2),
(3, 4000.00, 3, 3),
(4, 4500.00, 4, 4),
(5, 2500.00, 5, 5);

INSERT INTO gerente (id, id_empregado, id_companhia) VALUES
(1, 1, 1),
(2, 2, 2);