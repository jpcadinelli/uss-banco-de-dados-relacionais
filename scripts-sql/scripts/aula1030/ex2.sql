CREATE SCHEMA aula4_ex2;
USE aula4_ex2;

# Questão 2:
CREATE TABLE tipo_cliente (
    id INT,
    descricao VARCHAR(50),
        CONSTRAINT PK_TIPO_CLIENTE PRIMARY KEY (id)
);

CREATE TABLE cliente (
    id INT,
    nome VARCHAR(50),
    idade INT,
    tp_cliente INT,
    endereco VARCHAR(150),
        CONSTRAINT PK_CLIENTE PRIMARY KEY (id),
        CONSTRAINT FK_TP_CLIENTE FOREIGN KEY (tp_cliente) REFERENCES tipo_cliente (id)
);

CREATE TABLE dependente (
    id INT,
    nome VARCHAR(50),
    idade INT,
    id_cliente INT,
        CONSTRAINT PK_CLIENTE PRIMARY KEY (id),
        CONSTRAINT FK_CLIENTE FOREIGN KEY (id_cliente) REFERENCES cliente (id)
);

INSERT INTO tipo_cliente VALUES (1, 'NOVO');
INSERT INTO tipo_cliente VALUES (2, 'FIDELIZADO');
INSERT INTO tipo_cliente VALUES (3, 'PROBLEMÁTICO');

INSERT INTO cliente VALUES (1, 'JOÃO', 30, 1, 'RUA ABC');
INSERT INTO cliente VALUES (2, 'PAULO', 32, 2, 'RUA 123');
INSERT INTO cliente VALUES (3, 'JOSÉ', 40, 2, 'RUA HJY');
INSERT INTO cliente VALUES (4, 'MARIA', 27, 1, 'RUA AAA');
INSERT INTO cliente VALUES (5, 'CLAUDIA', 28, 1, 'RUA KKK');
INSERT INTO cliente VALUES (6, 'MARIANA', 22, 2, 'RUA LLL');
INSERT INTO cliente VALUES (7, 'JULIANA', 30, 2, 'RUA OOO');

INSERT INTO dependente VALUES (1, 'JOÃOZINHO', 12, 1);
INSERT INTO dependente VALUES (2, 'MARIAZINHA', 10, 1);
INSERT INTO dependente VALUES (3, 'PAULINHO', 12, 2);
INSERT INTO dependente VALUES (4, 'JOAQUINA', 10, 2);
INSERT INTO dependente VALUES (5, 'PAULINHO', 12, 3);
INSERT INTO dependente VALUES (6, 'ZEZINHO', 8, 4);

# Respostas
-- 1) Com o banco de dados implementado, crie os scripts com os índices necessários para as tabelas acima.
CREATE INDEX idx_cliente_tp_cliente ON cliente(tp_cliente);
CREATE INDEX idx_dependente_id_cliente ON dependente(id_cliente);

-- 2) Responda (construindo consultas SQL que atendam a solicitação):
-- a) Quantos dependentes temos cadastrados para os clientes que são considerados:
    -- (i) Novos
SELECT COUNT(d.id) AS dependentes_novos
FROM dependente d
JOIN cliente c ON d.id_cliente = c.id
WHERE c.tp_cliente = 1;

    -- (ii) Fidelizados
SELECT COUNT(d.id) AS dependentes_fidelizados
FROM dependente d
JOIN cliente c ON d.id_cliente = c.id
WHERE c.tp_cliente = 2;

    -- (iii) Problemáticos;
SELECT COUNT(d.id) AS dependentes_problematicos
FROM dependente d
JOIN cliente c ON d.id_cliente = c.id
WHERE c.tp_cliente = 3;

-- b) Quantos clientes menores de 30 anos temos cadastrados;
SELECT COUNT(id) AS clientes_menores_30
FROM cliente
WHERE idade < 30;

-- c) Dos clientes Novos, quantos dependentes tem mais de 10 anos;
SELECT COUNT(d.id) AS dependentes_maiores_10_novos
FROM dependente d
JOIN cliente c ON d.id_cliente = c.id
WHERE c.tp_cliente = 1 AND d.idade > 10;

-- d) Quais são os dependentes do Cliente Paulo;
SELECT d.id, d.nome, d.idade
FROM dependente d
JOIN cliente c ON d.id_cliente = c.id
WHERE c.nome = 'PAULO';