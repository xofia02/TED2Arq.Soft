--BD: laboratorio_db
--MS: laboratorios
-- Tabela Laboratorio

--CRIACAO DE TABELAS:
-- Tabela Laboratorio
CREATE TABLE laboratorio (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL
);

-- Tabela Software
CREATE TABLE software (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    versao VARCHAR(100),
    link TEXT,
    tipo VARCHAR(50),
    disponivel BOOLEAN,
    data_criacao TIMESTAMP,
    data_atualizacao TIMESTAMP,
    data_solicitacao TIMESTAMP
);

-- Tabela de junção Laboratorio-Software
CREATE TABLE laboratory_software (
    laboratory_id BIGINT NOT NULL,
    software_id BIGINT NOT NULL,
    PRIMARY KEY (laboratory_id, software_id),
    FOREIGN KEY (laboratory_id) REFERENCES laboratorio(id) ON DELETE CASCADE,
    FOREIGN KEY (software_id) REFERENCES software(id) ON DELETE CASCADE
);

--Exemplos:
-- Inserindo laboratórios
INSERT INTO laboratorio (nome, status) VALUES
('LAB-01', 'ATIVO'),
('LAB-02', 'INATIVO');

-- Inserindo softwares
INSERT INTO software (nome, versao, link, tipo, disponivel, data_criacao, data_atualizacao, data_solicitacao) VALUES
('Eclipse IDE', '2023.3', 'https://www.eclipse.org/ide/', 'LIVRE', TRUE, NOW(), NOW(), NOW()),
('Visual Studio Code', '1.85.2', 'https://code.visualstudio.com/', 'LIVRE', TRUE, NOW(), NOW(), NOW());

-- Inserindo relacionamentos laboratorio-software
-- Supondo que laboratório 1 tenha ambos os softwares instalados
INSERT INTO laboratory_software (laboratory_id, software_id) VALUES
(1, 1),  -- laboratório 1 -> Eclipse IDE
(1, 2),  -- laboratório 1 -> Visual Studio Code
(2, 2);  -- laboratório 2 -> Visual Studio Code somente


--Iniciar:
BEGIN