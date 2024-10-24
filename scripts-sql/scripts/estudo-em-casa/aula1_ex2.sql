CREATE SCHEMA aula1_ex2;

USE aula1_ex2;

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
