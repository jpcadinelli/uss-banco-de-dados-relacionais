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

-- Exercício 2 --
CREATE TABLE tamanho (
    id bigint NOT NULL ,
    nome varchar(150)  ,
        CONSTRAINT pk_tamanho PRIMARY KEY (id)
);

CREATE TABLE pizza (
    id bigint NOT NULL ,
    nome varchar(150)  ,
    valor numeric      ,
    id_tamanho bigint  ,
        CONSTRAINT pk_pizza PRIMARY KEY (id),
        CONSTRAINT fk_tamanho FOREIGN KEY (id_tamanho) REFERENCES tamanho (id)
);

CREATE TABLE ingrediente (
    id bigint NOT NULL ,
    nome varchar(100)  ,
        CONSTRAINT pk_ingrediente PRIMARY KEY (id)
);

CREATE TABLE pizza_ingrediente (
    id bigint NOT NULL ,
    id_pizza bigint NOT NULL ,
    id_ingrediente bigint NOT NULL ,
    quantidade numeric ,
        CONSTRAINT pk_pizza_ingrediente PRIMARY KEY (id),
        CONSTRAINT fk_pizza_ingrediente_pizza FOREIGN KEY (id_pizza) REFERENCES pizza (id),
        CONSTRAINT fk_pizza_ingrediente_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES ingrediente (id)
);

INSERT INTO tamanho (id, nome) VALUES
(1, 'Pequena'),
(2, 'Média'),
(3, 'Grande');

INSERT INTO ingrediente (id, nome) VALUES
(1, 'Queijo'),
(2, 'Tomate'),
(3, 'Pepperoni'),
(4, 'Cebola'),
(5, 'Azeitona');

INSERT INTO pizza (id, nome, valor, id_tamanho) VALUES
(1, 'Margherita', 25.00, 1),
(2, 'Pepperoni', 30.00, 2),
(3, 'Vegetariana', 35.00, 3);

INSERT INTO pizza_ingrediente (id, id_pizza, id_ingrediente, quantidade) VALUES
(1, 1, 1, 200),
(2, 1, 2, 100),
(3, 2, 1, 200),
(4, 2, 3, 150),
(5, 3, 1, 200),
(6, 3, 2, 100),
(7, 3, 4, 50),
(8, 3, 5, 30);

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