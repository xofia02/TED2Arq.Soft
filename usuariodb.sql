--BD:usuariodb
--MS:Gerenciamento de usuarios

-- Enum para tipo de usuário
CREATE TYPE tipo_usuario AS ENUM ('PROFESSOR', 'ADMIN');

-- Tabela professor
CREATE TABLE professor (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    nome VARCHAR(255),
    senha_hash VARCHAR(255),
    tipo tipo_usuario DEFAULT 'PROFESSOR' NOT NULL
);

-- Tabela usuarios
CREATE TABLE usuarios (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    tipo tipo_usuario NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger para atualizar data_atualizacao ao modificar registro
CREATE OR REPLACE FUNCTION update_data_atualizacao()
RETURNS TRIGGER AS $$
BEGIN
   NEW.data_atualizacao = NOW();
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_usuarios
BEFORE UPDATE ON usuarios
FOR EACH ROW
EXECUTE FUNCTION update_data_atualizacao();

--Exemplo:
INSERT INTO usuarios (nome, email, senha_hash, tipo)
VALUES 
('Admin Teste', 'admin@example.com', '$2a$10$3zP8zX9z3zP8zX9z3zP8zX9z3zP8zX9z3zP8zX9z3zP8zX9z3zP8zX9', 'ADMIN'),
('Professor Teste', 'professor@example.com', '$2a$10$4aQ9aX4aQ9aX4aQ9aX4aQ9aX4aQ9aX4aQ9aX4aQ9aX4aQ9aX4aQ9aX4', 'PROFESSOR');

--iniciar
BEGIN
