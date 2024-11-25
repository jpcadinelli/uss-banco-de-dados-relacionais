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

CREATE TABLE funcionario (
    id BIGINT,
    nome VARCHAR(100),
    data_contratacao DATE,
    cargo VARCHAR(100),
        CONSTRAINT pk_funcionario PRIMARY KEY (id)
);

CREATE TABLE locacao_funcionario (
    id BIGINT,
    id_locacao BIGINT,
    id_funcionario BIGINT,
        CONSTRAINT pk_locacao_funcionario PRIMARY KEY (id),
        CONSTRAINT fk_locacao_funcionario_locacao FOREIGN KEY (id_locacao) references locacao(id),
        CONSTRAINT fk_locacao_funcionario_funcionario FOREIGN KEY (id_funcionario) references funcionario(id)
);

CREATE TABLE servico_adicional (
    id BIGINT,
    id_locacao BIGINT,
    nome VARCHAR(100),
    descricao BLOB,
    custo DECIMAL(10,2),
        CONSTRAINT pk_servico_adicional PRIMARY KEY (id),
        CONSTRAINT fk_servico_adicional_locacao FOREIGN KEY (id_locacao) references locacao(id)
);

CREATE TABLE categoria (
    id BIGINT,
    nome VARCHAR(100),
    descricao BLOB,
        CONSTRAINT pk_categoria PRIMARY KEY (id)
);

CREATE TABLE equipamento (
    id BIGINT,
    id_categoria BIGINT,
    nome VARCHAR(100),
    marca VARCHAR(100),
    modelo VARCHAR(100),
    data_aquisicao DATE,
    status ENUM('Disponível', 'Locado', 'Em Manutenção'),
        CONSTRAINT pk_equipamento PRIMARY KEY (id),
        CONSTRAINT fk_equipamento_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE locacao_equipamento (
    id BIGINT,
    id_locacao BIGINT,
    id_equipamento BIGINT,
        CONSTRAINT pk_locacao_equipamento PRIMARY KEY (id),
        CONSTRAINT fk_locacao_equipamento_locacao FOREIGN KEY (id_locacao) references locacao(id),
        CONSTRAINT fk_locacao_equipamento_equipamento FOREIGN KEY (id_equipamento) references equipamento(id)
);

CREATE TABLE empresa (
    id BIGINT,
    nome VARCHAR(100),
    cnpj VARCHAR(14),
    orcamento DECIMAL(10,2),
        CONSTRAINT pk_empresa PRIMARY KEY (id)
);

CREATE TABLE manutencao (
    id BIGINT,
    id_equipamento BIGINT,
    id_empresa BIGINT,
    descricao BLOB,
    data_inicio DATE,
    data_fim DATE,
    custo DECIMAL(10,2),
        CONSTRAINT pk_manutencao PRIMARY KEY (id),
        CONSTRAINT fk_manutencao_equipamento FOREIGN KEY (id_equipamento) references equipamento(id),
        CONSTRAINT fk_manutencao_empresa FOREIGN KEY (id_empresa) references empresa(id)
);