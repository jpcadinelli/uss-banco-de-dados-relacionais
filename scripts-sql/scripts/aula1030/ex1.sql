CREATE DATABASE IF NOT EXISTS aula4_ex1;
USE aula4_ex1;

-- Tabela Cliente
CREATE TABLE cliente (
    cpf INTEGER PRIMARY KEY,
    nome VARCHAR(60),
    dtNasc DATE,
        CONSTRAINT pk_cliente PRIMARY KEY cliente (cpf)
);

-- Tabela Modelo
CREATE TABLE modelo (
    codMod INTEGER PRIMARY KEY,
    Desc_2 VARCHAR(40)
);

-- Tabela Veiculo
CREATE TABLE veiculo (
    placa VARCHAR(8) PRIMARY KEY,
    Modelo_codMod INTEGER,
    Cliente_cpf INTEGER,
    cor VARCHAR(
