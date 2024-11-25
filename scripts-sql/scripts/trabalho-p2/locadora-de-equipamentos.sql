CREATE SCHEMA locadora_equipamentos;
USE locadora_equipamentos;

CREATE TABLE cliente (
    id BIGINT,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(11),
        CONSTRAINT pk_cliente PRIMARY KEY (id)
);

CREATE TABLE endereco (
    id BIGINT,
    id_cliente BIGINT,
    rua VARCHAR(150),
    numero int,
    bairro VARCHAR(150),
    cep VARCHAR(9),
        CONSTRAINT pk_endereco PRIMARY KEY (id),
        CONSTRAINT fk_endereco_cliente FOREIGN KEY (id_cliente) references cliente(id)
);

CREATE TABLE fatura (
    id BIGINT,
    id_cliente BIGINT,
    valor_total DECIMAL(10, 2),
    status ENUM('Ativa', 'Concluída', 'Cancelada'),
    data_emissao DATE,
        CONSTRAINT pk_fatura PRIMARY KEY (id),
        CONSTRAINT fk_fatura_cliente FOREIGN KEY (id_cliente) references cliente(id)
);

CREATE TABLE feedback (
    id BIGINT,
    id_fatura BIGINT,
    nome VARCHAR(100),
    descricao BLOB,
        CONSTRAINT pk_feedback PRIMARY KEY (id),
        CONSTRAINT fk_feedback_fatura FOREIGN KEY (id_fatura) references fatura(id)
);

CREATE TABLE locacao (
    id BIGINT,
    id_fatura BIGINT,
    data_inicio DATE,
    data_fim DATE,
    status ENUM('Ativa', 'Concluída', 'Cancelada'),
        CONSTRAINT pk_locacao PRIMARY KEY (id),
        CONSTRAINT fk_locacao_fatura FOREIGN KEY (id_fatura) references fatura(id)
);

CREATE TABLE multa (
    id BIGINT,
    id_locacao BIGINT,
    descricao BLOB,
    valor DECIMAL(10,2),
    status ENUM('Pendente', 'Pago'),
        CONSTRAINT pk_multa PRIMARY KEY (id),
        CONSTRAINT fk_multa_locacao FOREIGN KEY (id_locacao) references locacao(id)
);