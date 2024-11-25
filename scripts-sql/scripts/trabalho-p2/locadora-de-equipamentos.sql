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

# Inserts
INSERT INTO cliente (id, nome, email, telefone) VALUES
(1, 'João Silva', 'joao.silva@example.com', '11987654321'),
(2, 'Maria Oliveira', 'maria.oliveira@example.com', '21987654321'),
(3, 'Carlos Souza', 'carlos.souza@example.com', '31987654321'),
(4, 'Ana Costa', 'ana.costa@example.com', '41987654321'),
(5, 'Pedro Lima', 'pedro.lima@example.com', '51987654321'),
(6, 'Fernanda Almeida', 'fernanda.almeida@example.com', '61987654321'),
(7, 'Roberto Santos', 'roberto.santos@example.com', '71987654321'),
(8, 'Clara Nunes', 'clara.nunes@example.com', '81987654321'),
(9, 'Lucas Pereira', 'lucas.pereira@example.com', '91987654321'),
(10, 'Gabriela Mendes', 'gabriela.mendes@example.com', '22987654321'),
(11, 'Ricardo Martins', 'ricardo.martins@example.com', '32987654321'),
(12, 'Juliana Rocha', 'juliana.rocha@example.com', '42987654321'),
(13, 'Paulo Cunha', 'paulo.cunha@example.com', '52987654321'),
(14, 'Mariana Xavier', 'mariana.xavier@example.com', '62987654321'),
(15, 'Felipe Batista', 'felipe.batista@example.com', '72987654321'),
(16, 'Isabela Ramos', 'isabela.ramos@example.com', '82987654321'),
(17, 'Gustavo Torres', 'gustavo.torres@example.com', '92987654321'),
(18, 'Rafaela Carvalho', 'rafaela.carvalho@example.com', '13987654321'),
(19, 'Thiago Ferreira', 'thiago.ferreira@example.com', '23987654321'),
(20, 'Vanessa Azevedo', 'vanessa.azevedo@example.com', '33987654321');

INSERT INTO endereco (id, id_cliente, rua, numero, bairro, cep) VALUES
(1, 1, 'Rua das Flores', 123, 'Jardim Primavera', '12345-678'),
(2, 2, 'Avenida Paulista', 1000, 'Centro', '01310-000'),
(3, 3, 'Rua da Harmonia', 45, 'Boa Vista', '12312-345'),
(4, 4, 'Rua do Sol', 300, 'Alto da Lapa', '45678-910'),
(5, 5, 'Travessa dos Pássaros', 78, 'Vila Nova', '67890-123'),
(6, 6, 'Praça das Águas', 500, 'Águas Claras', '23456-789'),
(7, 7, 'Avenida das Palmeiras', 202, 'Jardim Tropical', '34567-890'),
(8, 8, 'Rua dos Girassóis', 15, 'Campo Verde', '78901-234'),
(9, 9, 'Alameda das Acácias', 333, 'Centro', '89012-345'),
(10, 10, 'Estrada da Paz', 400, 'Vila Esperança', '90123-456'),
(11, 11, 'Rua das Magnólias', 85, 'Jardim Bela Vista', '34567-123'),
(12, 12, 'Avenida Liberdade', 1200, 'Centro', '56789-012'),
(13, 13, 'Rua São Pedro', 60, 'Santa Cruz', '67890-456'),
(14, 14, 'Rua dos Jasmins', 89, 'Jardim das Rosas', '89012-678'),
(15, 15, 'Travessa da Esperança', 90, 'Vila Alegre', '90123-789'),
(16, 16, 'Rua Nova', 25, 'Parque das Árvores', '12345-890'),
(17, 17, 'Avenida Central', 450, 'Bairro Central', '23456-123'),
(18, 18, 'Rua das Orquídeas', 75, 'Jardim Florido', '34567-234'),
(19, 19, 'Praça do Sol', 120, 'Sol Nascente', '45678-345'),
(20, 20, 'Estrada Velha', 600, 'Vila Velha', '56789-456');

INSERT INTO fatura (id, id_cliente, valor_total, status, data_emissao) VALUES
(1, 1, 500.00, 'Ativa', '2024-01-01'),
(2, 2, 1200.50, 'Concluída', '2024-01-15'),
(3, 3, 300.00, 'Cancelada', '2024-02-01'),
(4, 4, 450.75, 'Ativa', '2024-02-20'),
(5, 5, 800.00, 'Concluída', '2024-03-01'),
(6, 6, 950.00, 'Ativa', '2024-03-15'),
(7, 7, 200.00, 'Cancelada', '2024-04-01'),
(8, 8, 670.30, 'Concluída', '2024-04-10'),
(9, 9, 1000.00, 'Ativa', '2024-05-01'),
(10, 10, 450.00, 'Concluída', '2024-05-20'),
(11, 11, 300.00, 'Ativa', '2024-06-01'),
(12, 12, 750.00, 'Cancelada', '2024-06-15'),
(13, 13, 1100.00, 'Ativa', '2024-07-01'),
(14, 14, 620.25, 'Concluída', '2024-07-10'),
(15, 15, 950.00, 'Cancelada', '2024-08-01'),
(16, 16, 400.00, 'Concluída', '2024-08-15'),
(17, 17, 1250.00, 'Ativa', '2024-09-01'),
(18, 18, 300.50, 'Concluída', '2024-09-20'),
(19, 19, 980.00, 'Ativa', '2024-10-01'),
(20, 20, 1500.75, 'Cancelada', '2024-10-15');

INSERT INTO feedback (id, id_fatura, nome, descricao) VALUES
(1, 1, 'Ótimo serviço', 'O atendimento foi excelente, e a locação foi rápida e eficiente.'),
(2, 2, 'Boa experiência', 'A fatura foi gerada corretamente, sem problemas no processo.'),
(3, 3, 'Problemas com cancelamento', 'Tive dificuldades para cancelar o serviço, mas resolveram rapidamente.'),
(4, 4, 'Satisfeito', 'Tudo ocorreu conforme o esperado, sem nenhuma falha.'),
(5, 5, 'Excelente atendimento', 'Equipe muito atenciosa e disposta a ajudar.'),
(6, 6, 'Recomendo', 'Uma experiência tranquila e sem complicações.'),
(7, 7, 'Cancelamento confuso', 'A explicação sobre o cancelamento poderia ser mais clara.'),
(8, 8, 'Muito bom', 'Atendimento rápido e eficiente.'),
(9, 9, 'Valor justo', 'O valor cobrado foi justo pela qualidade do serviço prestado.'),
(10, 10, 'Bom suporte', 'Recebi suporte rápido quando tive dúvidas.'),
(11, 11, 'Razoável', 'O serviço foi ok, mas demorou um pouco mais do que o esperado.'),
(12, 12, 'Problemas resolvidos', 'Tive problemas no início, mas a equipe foi muito prestativa.'),
(13, 13, 'Ótima experiência', 'Todo o processo foi simples e bem explicado.'),
(14, 14, 'Atendimento excelente', 'A equipe foi muito educada e eficiente.'),
(15, 15, 'Demora no atendimento', 'O atendimento demorou um pouco, mas o serviço foi bom.'),
(16, 16, 'Bom custo-benefício', 'A qualidade do serviço é ótima pelo preço.'),
(17, 17, 'Muito bom', 'Gostei bastante da experiência geral.'),
(18, 18, 'Atendimento razoável', 'O atendimento poderia ter sido um pouco mais rápido.'),
(19, 19, 'Recomendo', 'Serviço confiável e bem organizado.'),
(20, 20, 'Muito satisfeito', 'Superou minhas expectativas, recomendo fortemente.');

INSERT INTO locacao (id, id_fatura, data_inicio, data_fim, status) VALUES
(1, 1, '2024-01-01', '2024-01-10', 'Concluída'),
(2, 2, '2024-01-05', '2024-01-15', 'Concluída'),
(3, 3, '2024-02-01', '2024-02-07', 'Cancelada'),
(4, 4, '2024-02-15', '2024-02-25', 'Concluída'),
(5, 5, '2024-03-01', '2024-03-08', 'Concluída'),
(6, 6, '2024-03-10', '2024-03-20', 'Ativa'),
(7, 7, '2024-04-01', '2024-04-05', 'Cancelada'),
(8, 8, '2024-04-10', '2024-04-18', 'Concluída'),
(9, 9, '2024-05-01', '2024-05-10', 'Ativa'),
(10, 10, '2024-05-15', '2024-05-25', 'Concluída'),
(11, 11, '2024-06-01', '2024-06-05', 'Ativa'),
(12, 12, '2024-06-10', '2024-06-15', 'Cancelada'),
(13, 13, '2024-07-01', '2024-07-10', 'Ativa'),
(14, 14, '2024-07-15', '2024-07-25', 'Concluída'),
(15, 15, '2024-08-01', '2024-08-07', 'Cancelada'),
(16, 16, '2024-08-10', '2024-08-20', 'Concluída'),
(17, 17, '2024-09-01', '2024-09-10', 'Ativa'),
(18, 18, '2024-09-15', '2024-09-25', 'Concluída'),
(19, 19, '2024-10-01', '2024-10-10', 'Ativa'),
(20, 20, '2024-10-15', '2024-10-22', 'Cancelada');

INSERT INTO multa (id, id_locacao, descricao, valor, status) VALUES
(1, 1, 'Atraso na devolução do equipamento.', 50.00, 'Pago'),
(2, 2, 'Danos ao equipamento durante o uso.', 120.00, 'Pago'),
(3, 3, 'Falta de manutenção preventiva exigida.', 80.00, 'Pendente'),
(4, 4, 'Devolução fora do horário combinado.', 30.00, 'Pago'),
(5, 5, 'Equipamento devolvido com peças ausentes.', 150.00, 'Pendente'),
(6, 6, 'Uso fora das condições especificadas no contrato.', 100.00, 'Pago'),
(7, 7, 'Danos leves à carcaça do equipamento.', 75.00, 'Pendente'),
(8, 8, 'Devolução parcial de acessórios.', 40.00, 'Pago'),
(9, 9, 'Uso além do prazo contratado.', 90.00, 'Pendente'),
(10, 10, 'Desgaste anormal causado por uso indevido.', 110.00, 'Pago'),
(11, 11, 'Falta de limpeza do equipamento na devolução.', 25.00, 'Pendente'),
(12, 12, 'Danos ao motor do equipamento.', 200.00, 'Pendente'),
(13, 13, 'Equipamento devolvido sem inspeção prévia.', 45.00, 'Pago'),
(14, 14, 'Manuseio impróprio causando desgaste.', 130.00, 'Pendente'),
(15, 15, 'Peça quebrada durante o uso.', 85.00, 'Pago'),
(16, 16, 'Equipamento não operou conforme manual.', 60.00, 'Pago'),
(17, 17, 'Danos por transporte inadequado.', 95.00, 'Pendente'),
(18, 18, 'Devolução com acessórios faltando.', 70.00, 'Pago'),
(19, 19, 'Equipamento devolvido com manchas.', 20.00, 'Pago'),
(20, 20, 'Uso em condições adversas sem autorização.', 140.00, 'Pendente');

INSERT INTO funcionario (id, nome, data_contratacao, cargo) VALUES
(1, 'Ana Silva', '2020-01-15', 'Gerente de Operações'),
(2, 'Carlos Almeida', '2019-03-22', 'Técnico de Manutenção'),
(3, 'Mariana Costa', '2021-05-10', 'Assistente Administrativo'),
(4, 'João Pereira', '2018-08-01', 'Supervisor de Locação'),
(5, 'Beatriz Souza', '2022-02-20', 'Analista Financeiro'),
(6, 'Ricardo Santos', '2020-11-05', 'Coordenador de Logística'),
(7, 'Fernanda Rocha', '2023-01-03', 'Técnico de Manutenção'),
(8, 'Pedro Lima', '2017-09-12', 'Gerente de Manutenção'),
(9, 'Sofia Martins', '2021-06-18', 'Recepcionista'),
(10, 'Lucas Oliveira', '2022-09-25', 'Auxiliar de Almoxarifado'),
(11, 'Gabriela Mendes', '2020-04-07', 'Analista de Recursos Humanos'),
(12, 'Thiago Barbosa', '2023-03-15', 'Técnico de Suporte'),
(13, 'Isabela Ferreira', '2019-12-30', 'Especialista em Equipamentos'),
(14, 'Renato Araújo', '2016-07-22', 'Gerente Geral'),
(15, 'Juliana Nascimento', '2021-10-11', 'Coordenadora de Treinamento'),
(16, 'Gustavo Ribeiro', '2018-05-05', 'Motorista'),
(17, 'Patrícia Carvalho', '2020-09-19', 'Analista de Controle de Qualidade'),
(18, 'Marcelo Cunha', '2023-02-01', 'Assistente de Logística'),
(19, 'Débora Xavier', '2022-08-14', 'Supervisora de Atendimento'),
(20, 'Fábio Monteiro', '2019-11-30', 'Técnico de Manutenção');

INSERT INTO locacao_funcionario (id, id_locacao, id_funcionario) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 3, 2),
(4, 4, 5),
(5, 5, 7),
(6, 6, 4),
(7, 7, 2),
(8, 8, 9),
(9, 9, 6),
(10, 10, 10),
(11, 11, 2),
(12, 12, 3),
(13, 13, 8),
(14, 14, 6),
(15, 15, 11),
(16, 16, 9),
(17, 17, 5),
(18, 18, 7),
(19, 19, 10),
(20, 20, 3);

INSERT INTO servico_adicional (id, id_locacao, nome, descricao, custo) VALUES
(1, 1, 'Entrega Expressa', 'Entrega do equipamento em até 2 horas.', 50.00),
(2, 2, 'Manutenção Extra', 'Manutenção preventiva adicional durante a locação.', 75.00),
(3, 3, 'Seguro Contra Danos', 'Cobertura total para danos causados durante o uso.', 120.00),
(4, 4, 'Operador Técnico', 'Técnico especializado para operar o equipamento.', 200.00),
(5, 5, 'Acessórios Extras', 'Conjunto adicional de acessórios para o equipamento.', 40.00),
(6, 6, 'Treinamento', 'Treinamento rápido para o uso do equipamento.', 100.00),
(7, 7, 'Transporte', 'Transporte do equipamento até o local de uso.', 60.00),
(8, 8, 'Instalação', 'Instalação completa do equipamento no local.', 90.00),
(9, 9, 'Retirada Agendada', 'Serviço de retirada do equipamento em horário específico.', 30.00),
(10, 10, 'Configuração Avançada', 'Configuração personalizada do equipamento.', 80.00),
(11, 11, 'Suporte 24/7', 'Assistência técnica disponível 24 horas.', 150.00),
(12, 12, 'Desmontagem', 'Desmontagem completa do equipamento ao final do uso.', 50.00),
(13, 13, 'Backup de Dados', 'Serviço de backup para equipamentos com armazenamento.', 70.00),
(14, 14, 'Limpeza Técnica', 'Limpeza técnica especializada do equipamento.', 45.00),
(15, 15, 'Manutenção Pós-Uso', 'Serviço de manutenção após a devolução.', 85.00),
(16, 16, 'Monitoramento', 'Monitoramento remoto do uso do equipamento.', 110.00),
(17, 17, 'Atualização de Software', 'Atualização do software do equipamento.', 65.00),
(18, 18, 'Seguro de Roubo', 'Cobertura contra roubo do equipamento.', 140.00),
(19, 19, 'Recarga de Bateria', 'Recarga completa de baterias durante o uso.', 25.00),
(20, 20, 'Personalização', 'Adaptação do equipamento para necessidades específicas.', 95.00);

INSERT INTO categoria (id, nome, descricao) VALUES
(1, 'Construção Civil', 'Equipamentos utilizados em obras de construção civil.'),
(2, 'Agrícola', 'Equipamentos voltados para o setor agrícola.'),
(3, 'Industrial', 'Máquinas e ferramentas industriais.'),
(4, 'Transporte', 'Veículos e equipamentos de transporte.'),
(5, 'Tecnologia', 'Equipamentos relacionados a tecnologia e informática.');

INSERT INTO equipamento (id, id_categoria, nome, marca, modelo, data_aquisicao, status) VALUES
(1, 1, 'Betoneira', 'Makita', 'BT-2020', '2020-05-15', 'Disponível'),
(2, 1, 'Guindaste', 'Caterpillar', 'GC-500', '2019-03-10', 'Locado'),
(3, 2, 'Trator', 'John Deere', 'JD-750', '2021-07-25', 'Disponível'),
(4, 2, 'Pulverizador', 'Case', 'PZ-300', '2022-01-15', 'Em Manutenção'),
(5, 3, 'Torno Mecânico', 'Bosch', 'TM-150', '2018-12-20', 'Disponível'),
(6, 3, 'Furadeira de Coluna', 'Makita', 'FC-400', '2020-09-10', 'Locado'),
(7, 4, 'Empilhadeira', 'Toyota', 'EM-200', '2019-11-05', 'Disponível'),
(8, 4, 'Caminhão', 'Volvo', 'FM-12', '2021-03-30', 'Locado'),
(9, 5, 'Servidor', 'Dell', 'PowerEdge R740', '2022-06-18', 'Disponível'),
(10, 5, 'Switch Gerenciável', 'Cisco', 'SG-350', '2021-04-12', 'Em Manutenção');

INSERT INTO locacao_equipamento (id, id_locacao, id_equipamento) VALUES
(1, 1, 2),
(2, 2, 6),
(3, 3, 4),
(4, 4, 8),
(5, 5, 3),
(6, 6, 7),
(7, 7, 1),
(8, 8, 5),
(9, 9, 9),
(10, 10, 10);

INSERT INTO empresa (id, nome, cnpj, orcamento) VALUES
(1, 'Construtora ABC', '12345678000101', 500000.00),
(2, 'AgroTech Ltda.', '98765432000109', 750000.00),
(3, 'Indústria XYZ', '11122233000188', 1000000.00),
(4, 'Transportes Delta', '44455566000177', 600000.00),
(5, 'Tech Solutions', '88899900000155', 300000.00);

INSERT INTO manutencao (id, id_equipamento, id_empresa, descricao, data_inicio, data_fim, custo) VALUES
(1, 4, 2, 'Reparo no sistema de pulverização.', '2023-01-10', '2023-01-15', 5000.00),
(2, 6, 3, 'Substituição de componentes elétricos.', '2023-02-20', '2023-02-25', 3000.00),
(3, 10, 5, 'Atualização de firmware.', '2023-03-01', '2023-03-05', 2000.00),
(4, 2, 1, 'Troca de cabos hidráulicos.', '2023-04-12', '2023-04-18', 4500.00),
(5, 8, 4, 'Revisão do sistema de freios.', '2023-05-01', '2023-05-07', 3500.00);

# Consultas
# 1)
SELECT
    e.nome AS equipamento_nome,
    e.marca,
    e.modelo,
    l.data_inicio,
    l.data_fim,
    e.status AS equipamento_status,
    c.nome AS categoria_nome
    FROM locacao_equipamento le
    JOIN equipamento e ON le.id_equipamento = e.id
    JOIN locacao l ON le.id_locacao = l.id
    JOIN categoria c ON e.id_categoria = c.id
    WHERE e.status = 'Locado';

# 2)
SELECT
    f.nome AS funcionario_nome,
    f.cargo,
    s.nome AS servico_nome,
    s.descricao AS servico_descricao,
    s.custo
    FROM locacao_funcionario lf
    JOIN funcionario f ON lf.id_funcionario = f.id
    JOIN locacao_equipamento le ON lf.id_locacao = le.id_locacao
    JOIN servico_adicional s ON le.id_locacao = s.id_locacao
    WHERE lf.id_locacao = 1;

# 3)
SELECT
    l.id AS locacao_id,
    SUM(s.custo) AS custo_total
    FROM locacao_equipamento le
    JOIN equipamento e ON le.id_equipamento = e.id
    JOIN servico_adicional s ON le.id_locacao = s.id_locacao
    JOIN locacao l ON le.id_locacao = l.id
    WHERE l.id = 2;

# 4)
SELECT
    e.nome AS equipamento_nome,
    e.marca,
    e.modelo,
    m.descricao AS manutencao_descricao,
    m.data_inicio,
    m.data_fim,
    emp.nome AS empresa_nome
    FROM manutencao m
    JOIN equipamento e ON m.id_equipamento = e.id
    JOIN empresa emp ON m.id_empresa = emp.id
    WHERE m.data_inicio >= '2023-03-01';

# 5)
SELECT
    e.nome AS equipamento_nome,
    e.marca,
    e.modelo,
    e.status AS equipamento_status,
    l.data_inicio AS locacao_inicio,
    l.data_fim AS locacao_fim,
    m.data_inicio AS manutencao_inicio,
    m.data_fim AS manutencao_fim
    FROM equipamento e
    LEFT JOIN locacao_equipamento le ON e.id = le.id_equipamento
    LEFT JOIN locacao l ON le.id_locacao = l.id
    LEFT JOIN manutencao m ON e.id = m.id_equipamento
    JOIN categoria c ON e.id_categoria = c.id
    WHERE c.nome = 'Construção Civil'
            AND (e.status IN ('Locado', 'Em Manutenção')
                OR m.data_inicio IS NOT NULL);

# 6)
SELECT SUM(f.valor_total) AS Faturamento_Semestral
    FROM fatura f
    WHERE status = 'Concluída'
        AND data_emissao >= CURDATE() - INTERVAL 6 MONTH;