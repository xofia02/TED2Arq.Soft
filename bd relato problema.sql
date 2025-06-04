--BD: relato_db 
--MS: Relato Problema

-- Criando tabela relato_problema
CREATE TABLE relato_problema (
    id BIGINT PRIMARY KEY, -- poderiamos usar AUTO_INCREMENT para nao precisar colocar o id manualmente
    solicitacao_id BIGINT NOT NULL,
    descricao VARCHAR(2000) NOT NULL,
    data_relato DATE NOT NULL
);

-- Exemplos
INSERT INTO relato_problema (id, solicitacao_id, descricao, data_relato) 
VALUES (1, 1, 'Sistema apresenta erro X ao tentar selecionar laboratorio', '2025-06-01');

INSERT INTO relato_problema (id, solicitacao_id, descricao, data_relato) 
VALUES (2, 2, 'Falha ao fazer a solicitacao', '2025-06-02');

-- CRUD 

-- Create: Se quiser inserir algo novo
--INSERT INTO relato_problema (solicitacao_id, descricao, data_relato) 
--VALUES (:solicitacaoId, :descricao, :dataRelato);

-- Read: Selecionar relato por id
--SELECT id, solicitacao_id, descricao, data_relato 
--FROM relato_problema 
--WHERE id = :id;

-- Read: Selecionar tudo
--SELECT id, solicitacao_id, descricao, data_relato 
--FROM relato_problema;

-- Update: Se quiser atualizar, atualizacao com id
--UPDATE relato_problema 
--SET solicitacao_id = :solicitacaoId, 
  --  descricao = :descricao, 
    --data_relato = :dataRelato 
--WHERE id = :id;

-- Delete: Se quiser apagar, novamente usando id
--DELETE FROM relato_problema 
--WHERE id = :id;

-- Rodar:
BEGIN