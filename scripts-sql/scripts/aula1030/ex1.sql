CREATE DATABASE IF NOT EXISTS aula4_ex1;
USE aula4_ex1;

-- Tabela Cliente
CREATE TABLE cliente (
    cpf INTEGER,
    nome VARCHAR(60),
    dtNasc DATE,
        CONSTRAINT pk_cliente PRIMARY KEY cliente (cpf)
);

-- Tabela Modelo
CREATE TABLE modelo (
    codMod INTEGER,
    desc_2 VARCHAR(40),
        CONSTRAINT pk_modelo PRIMARY KEY modelo(codMod)
);

-- Tabela Veiculo
CREATE TABLE veiculo (
    placa         VARCHAR(8),
    modelo_codMod INTEGER,
    cliente_cpf   INTEGER,
    cor           VARCHAR(20),
        CONSTRAINT pk_veiculo PRIMARY KEY veiculo (placa),
        CONSTRAINT fk_veiculo_modelo FOREIGN KEY (modelo_codMod) REFERENCES modelo (codMod),
        CONSTRAINT fk_veiculo_cliente FOREIGN KEY (cliente_cpf) REFERENCES cliente (cpf)
);

-- Tabela Patio
CREATE TABLE patio (
    num INTEGER,
    ender VARCHAR(40),
    capacidade INTEGER,
        CONSTRAINT pk_patio PRIMARY KEY patio(num)
);

-- Tabela Estaciona
CREATE TABLE estaciona (
    cod INTEGER,
    patio_num INTEGER,
    veiculo_placa VARCHAR(8),
    dtEntrada VARCHAR(10),
    dtSaida VARCHAR(10),
    hrEntrada VARCHAR(10),
    hrSaida VARCHAR(10),
        CONSTRAINT pk_estaciona PRIMARY KEY estaciona(cod),
        CONSTRAINT fk_estaciona_patio FOREIGN KEY (patio_num) REFERENCES patio(num),
        CONSTRAINT fk_estaciona_veiculo FOREIGN KEY (veiculo_placa) REFERENCES veiculo(placa)
);