--BD: solicitacao_db
--MS: Solicitacao service

-- Criando tabela solicitacao
CREATE TABLE solicitacao (
    id BIGINT PRIMARY KEY, -- poderiamos usar AUTO_INCREMENT para nao precisar colocar o id manualmente
    software_name VARCHAR(100) NOT NULL,
    software_version VARCHAR(50),
    lab_id VARCHAR(50) NOT NULL,
    request_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    professor_email VARCHAR(100) NOT NULL
);

-- Exemplos
INSERT INTO solicitacao ( 
    id, software_name, software_version, lab_id, request_date, status, professor_email
) VALUES (
   1, 'Eclipse IDE', '2023.3', 'LAB-01', '2025-06-03', 'PENDENTE', 'professor1@instituicao.edu'
);
INSERT INTO solicitacao (
   id, software_name, software_version, lab_id, request_date, status, professor_email
) VALUES (
    2,'Visual Studio Code', '1.85.2', 'LAB-PROG', '2025-06-01', 'PENDENTE', 'prof.vscode@universidade.edu'
);

-- CRUD 
--SELECT * FROM solicitacao
--WHERE lab_id = 'LAB-01' AND status = 'PENDENTE';

--UPDATE solicitacao
--SET status = 'APROVADA'
--WHERE id = 1;

--DELETE FROM solicitacao
--WHERE id = 2 AND status = 'REJEITADA';

-- Rodar:
BEGIN