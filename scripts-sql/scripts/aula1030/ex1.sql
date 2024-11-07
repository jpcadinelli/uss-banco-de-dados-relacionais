CREATE DATABASE IF NOT EXISTS aula4_ex1;
USE aula4_ex1;

-- Tabela Cliente
CREATE TABLE cliente (
    cpf BIGINT,
    nome VARCHAR(60),
    dtNasc DATE,
        CONSTRAINT pk_cliente PRIMARY KEY cliente (cpf)
);

-- Tabela Modelo
CREATE TABLE modelo (
    codMod BIGINT,
    desc_2 VARCHAR(40),
        CONSTRAINT pk_modelo PRIMARY KEY modelo(codMod)
);

-- Tabela Veiculo
CREATE TABLE veiculo (
    placa         VARCHAR(8),
    modelo_codMod BIGINT,
    cliente_cpf   BIGINT,
    cor           VARCHAR(20),
        CONSTRAINT pk_veiculo PRIMARY KEY veiculo (placa),
        CONSTRAINT fk_veiculo_modelo FOREIGN KEY (modelo_codMod) REFERENCES modelo (codMod),
        CONSTRAINT fk_veiculo_cliente FOREIGN KEY (cliente_cpf) REFERENCES cliente (cpf)
);

-- Tabela Patio
CREATE TABLE patio (
    num BIGINT,
    ender VARCHAR(40),
    capacidade BIGINT,
        CONSTRAINT pk_patio PRIMARY KEY patio(num)
);

-- Tabela Estaciona
CREATE TABLE estaciona (
    cod BIGINT,
    patio_num BIGINT,
    veiculo_placa VARCHAR(8),
    dtEntrada VARCHAR(10),
    dtSaida VARCHAR(10),
    hrEntrada VARCHAR(10),
    hrSaida VARCHAR(10),
        CONSTRAINT pk_estaciona PRIMARY KEY estaciona(cod),
        CONSTRAINT fk_estaciona_patio FOREIGN KEY (patio_num) REFERENCES patio(num),
        CONSTRAINT fk_estaciona_veiculo FOREIGN KEY (veiculo_placa) REFERENCES veiculo(placa)
);

# Inserts gerados pelo GPT
-- Inserindo dados na tabela Cliente
INSERT INTO cliente (cpf, nome, dtNasc) VALUES
(10100100100, 'Ana Silva', '1985-02-14'),
(10200200200, 'Bruno Souza', '1990-08-23'),
(10300300300, 'Carlos Almeida', '1978-12-01'),
(10400400400, 'Diana Santos', '1995-06-15'),
(10500500500, 'Eduardo Costa', '1982-10-11'),
(10600600600, 'Fernanda Pereira', '1993-05-27'),
(10700700700, 'Gabriel Lima', '1987-03-09'),
(10800800800, 'Helena Martins', '2000-07-25'),
(10900900900, 'Igor Rocha', '1991-01-22'),
(11001001000, 'Juliana Ribeiro', '1989-11-30'),
(11101101100, 'Lucas Mendes', '1975-04-18'),
(11201201200, 'Mariana Gonçalves', '1984-09-10'),
(11301301300, 'Nicolas Silva', '1999-12-05'),
(11401401400, 'Olivia Souza', '1988-06-03'),
(11501501500, 'Paulo Ribeiro', '1979-02-07'),
(11601601600, 'Quésia Castro', '1994-11-16'),
(11701701700, 'Rafael Lima', '1998-03-28'),
(11801801800, 'Sara Oliveira', '2001-10-09'),
(11901901900, 'Thiago Costa', '1983-07-15'),
(12002002000, 'Vanessa Moura', '1986-09-19');

-- Inserindo dados na tabela Modelo
INSERT INTO modelo (codMod, desc_2) VALUES
(1, 'SUV Compacto'),
(2, 'Sedan Médio'),
(3, 'Hatch Pequeno'),
(4, 'Picape Grande'),
(5, 'SUV Médio'),
(6, 'Sedan Grande'),
(7, 'Hatch Médio'),
(8, 'Conversível'),
(9, 'Crossover'),
(10, 'Picape Compacta'),
(11, 'SUV Grande'),
(12, 'Minivan'),
(13, 'Sedan Compacto'),
(14, 'Coupé'),
(15, 'Roadster'),
(16, 'Hatch Compacto'),
(17, 'SUV Compacto Premium'),
(18, 'SUV Elétrico'),
(19, 'Sedan Elétrico'),
(20, 'Hatch Esportivo');

-- Inserindo dados na tabela Veículo
INSERT INTO veiculo (placa, modelo_codMod, cliente_cpf, cor) VALUES
('ABC1234', 1, 10100100100, 'Azul'),
('DEF5678', 2, 10200200200, 'Vermelho'),
('GHI9012', 3, 10300300300, 'Preto'),
('JKL3456', 4, 10400400400, 'Branco'),
('MNO7890', 5, 10500500500, 'Prata'),
('PQR2345', 6, 10600600600, 'Verde'),
('STU6789', 7, 10700700700, 'Cinza'),
('VWX0123', 8, 10800800800, 'Amarelo'),
('YZA4567', 9, 10900900900, 'Roxo'),
('BCD8901', 10, 11001001000, 'Azul'),
('EFG2345', 11, 11101101100, 'Vermelho'),
('HIJ6789', 12, 11201201200, 'Preto'),
('KLM0123', 13, 11301301300, 'Branco'),
('ABC1D34', 14, 11401401400, 'Prata'),
('QRS8901', 15, 11501501500, 'Verde'),
('TUV2345', 16, 11601601600, 'Cinza'),
('WXY6789', 17, 11701701700, 'Amarelo'),
('ZAB0123', 18, 11801801800, 'Roxo'),
('CDE4567', 19, 11901901900, 'Azul'),
('FGH8901', 20, 12002002000, 'Vermelho');

-- Inserindo dados na tabela Pátio
INSERT INTO patio (num, ender, capacidade) VALUES
(1, 'Rua Central, 100', 50),
(2, 'Avenida das Flores, 200', 40),
(3, 'Praça das Palmeiras, 300', 35),
(4, 'Rua do Sol, 123', 20),
(5, 'Avenida Brasil, 321', 30),
(6, 'Rua dos Pássaros, 400', 25),
(7, 'Rua Verde, 45', 60),
(8, 'Rua Azul, 67', 55),
(9, 'Avenida do Contorno, 90', 45),
(10, 'Praça das Américas, 12', 50),
(11, 'Rua das Oliveiras, 78', 30),
(12, 'Rua dos Girassóis, 150', 40),
(13, 'Avenida Central, 321', 35),
(14, 'Rua dos Ipês, 200', 20),
(15, 'Praça do Sol, 450', 30),
(16, 'Rua do Norte, 99', 25),
(17, 'Avenida Sul, 150', 50),
(18, 'Praça das Rosas, 33', 60),
(19, 'Rua das Estrelas, 211', 40),
(20, 'Avenida Leste, 175', 35);

-- Inserindo dados na tabela Estaciona
INSERT INTO estaciona (cod, patio_num, veiculo_placa, dtEntrada, dtSaida, hrEntrada, hrSaida) VALUES
(1, 1, 'ABC1234', '2023-10-10', '2023-10-10', '08:00', '10:00'),
(2, 2, 'DEF5678', '2023-10-11', '2023-10-11', '09:00', '11:30'),
(3, 3, 'GHI9012', '2023-10-12', '2023-10-12', '10:30', '12:00'),
(4, 4, 'JKL3456', '2023-10-13', '2023-10-13', '11:00', '13:00'),
(5, 5, 'MNO7890', '2023-10-14', '2023-10-14', '12:00', '14:30'),
(6, 6, 'PQR2345', '2023-10-15', '2023-10-15', '13:30', '15:00'),
(7, 7, 'STU6789', '2023-10-16', '2023-10-16', '14:00', '16:00'),
(8, 8, 'VWX0123', '2023-10-17', '2023-10-17', '15:00', '17:30'),
(9, 9, 'YZA4567', '2023-10-18', '2023-10-18', '16:00', '18:00'),
(10, 10, 'BCD8901', '2023-10-19', '2023-10-19', '08:00', '10:00'),
(11, 11, 'EFG2345', '2023-10-20', '2023-10-20', '09:30', '11:30'),
(12, 12, 'HIJ6789', '2023-10-21', '2023-10-21', '10:00', '12:00'),
(13, 13, 'KLM0123', '2023-10-22', '2023-10-22', '11:00', '13:00'),
(14, 14, 'ABC1D34', '2023-10-23', '2023-10-23', '12:30', '14:30'),
(15, 15, 'QRS8901', '2023-10-24', '2023-10-24', '13:00', '15:00'),
(16, 16, 'TUV2345', '2023-10-25', '2023-10-25', '14:00', '16:00'),
(17, 17, 'WXY6789', '2023-10-26', '2023-10-26', '15:30', '17:30'),
(18, 18, 'ZAB0123', '2023-10-27', '2023-10-27', '08:00', '10:00'),
(19, 19, 'CDE4567', '2023-10-28', '2023-10-28', '09:00', '11:00'),
(20, 20, 'FGH8901', '2023-10-29', '2023-10-29', '10:30', '12:30');

# Consultas SQL:
-- a) Exiba a placa e o nome dos donos de todos os veículos.
SELECT veiculo.placa, cliente.nome
FROM veiculo
JOIN cliente ON veiculo.cliente_cpf = cliente.cpf;

-- b) Exiba o CPF e o nome do cliente que possui o veiculo de placa “ABC1D34”.
SELECT cliente.cpf, cliente.nome
FROM cliente
JOIN veiculo ON cliente.cpf = veiculo.cliente_cpf
WHERE veiculo.placa = 'ABC1D34';

-- c) Exiba a placa e a cor do veículo que possui o código de estacionamento 1.
SELECT veiculo.placa, veiculo.cor
FROM estaciona
JOIN veiculo ON estaciona.veiculo_placa = veiculo.placa
WHERE estaciona.cod = 1;

-- d) Exiba a placa e o ano do veículo que possui o código de estacionamento 1.
SELECT veiculo.placa, veiculo.ano
FROM estaciona
JOIN veiculo ON estaciona.veiculo_placa = veiculo.placa
WHERE estaciona.cod = 1; # Se veículo tivesse ano acredito que seria desta forma

-- e) Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000.
SELECT veiculo.placa, veiculo.ano, modelo.desc_2 AS descricao_modelo
FROM veiculo
JOIN modelo ON veiculo.modelo_codMod = modelo.codMod
WHERE veiculo.ano >= 2000; # Se veículo tivesse ano acredito que seria desta forma

-- f) Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa “JEG-1010”.
SELECT patio.ender, estaciona.dtEntrada, estaciona.dtSaida
FROM estaciona
JOIN veiculo ON estaciona.veiculo_placa = veiculo.placa
JOIN patio ON estaciona.patio_num = patio.num
WHERE veiculo.placa = 'JEG-1010';

-- g) Exiba a quantidade de vezes que os veículos de cor verde estacionaram.
SELECT COUNT(*) AS quantidade_veiculos_verde
FROM estaciona
JOIN veiculo ON estaciona.veiculo_placa = veiculo.placa
WHERE veiculo.cor = 'verde';

-- h) Liste todos os clientes que possuem carro de modelo 1.
SELECT cliente.cpf, cliente.nome
FROM cliente
JOIN veiculo ON cliente.cpf = veiculo.cliente_cpf
WHERE veiculo.modelo_codMod = 1;

-- i) Liste as placas, os horários de entrada e saída dos veículos de cor verde.
SELECT veiculo.placa, estaciona.hrEntrada, estaciona.hrSaida
FROM estaciona
JOIN veiculo ON estaciona.veiculo_placa = veiculo.placa
WHERE veiculo.cor = 'verde';

-- j) Liste todos os estacionamentos do veículo de placa “ABC1D34”.
SELECT patio.ender, estaciona.dtEntrada, estaciona.dtSaida
FROM estaciona
JOIN veiculo ON estaciona.veiculo_placa = veiculo.placa
JOIN patio ON estaciona.patio_num = patio.num
WHERE veiculo.placa = 'ABC1D34';

-- k) Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2.
SELECT cliente.nome
FROM cliente
JOIN veiculo ON cliente.cpf = veiculo.cliente_cpf
JOIN estaciona ON veiculo.placa = estaciona.veiculo_placa
WHERE estaciona.cod = 2;

-- l) Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3.
SELECT cliente.cpf
FROM cliente
JOIN veiculo ON cliente.cpf = veiculo.cliente_cpf
JOIN estaciona ON veiculo.placa = estaciona.veiculo_placa
WHERE estaciona.cod = 3;

-- m) Exiba a descrição do modelo do veículo cujo código do estacionamento é 2.
SELECT modelo.desc_2
FROM modelo
JOIN veiculo ON modelo.codMod = veiculo.modelo_codMod
JOIN estaciona ON veiculo.placa = estaciona.veiculo_placa
WHERE estaciona.cod = 2;

-- n) Exiba a placa, o nome dos donos e a descrição dos modelos de todos os veículos.
SELECT veiculo.placa, cliente.nome, modelo.desc_2
FROM veiculo
JOIN cliente ON veiculo.cliente_cpf = cliente.cpf
JOIN modelo ON veiculo.modelo_codMod = modelo.codMod;