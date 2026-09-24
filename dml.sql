USE chamados_ti;

INSERT INTO usuario 
(nome, email, telefone, departamento, cargo, status) 
VALUES 
('Lucas Almeida', 'lucas@empresa.com', '11999990001', 'Financeiro', 'Analista', 'Ativo'), 
('Mariana Santos', 'mariana@empresa.com', '11999990002', 'RH', 'Assistente', 'Ativo'), 
('Gabriel Ferreira', 'gabriel@empresa.com', '11999990003', 'Vendas', 'Gerente', 'Ativo');


INSERT INTO tecnico 
(nome, email, especialidade, status) 
VALUES 
('Pedro Henrique', 'pedro@empresa.com', 'Hardware', 'Ativo'), 
('Rafael Gomes', 'rafael@empresa.com', 'Redes', 'Ativo'), 
('Juliana Martins', 'juliana@empresa.com', 'Software', 'Ativo');


INSERT INTO categoria 
(nome, descricao) 
VALUES 
('Hardware', 'Problemas relacionados a computadores e peças'), 
('Software', 'Problemas relacionados a programas e sistemas'), 
('Rede', 'Problemas relacionados à internet e rede');


INSERT INTO chamado 
(titulo, descricao, data_abertura, data_fechamento, status, prioridade, id_usuario, id_categoria, id_tecnico) 
VALUES 
(
    'Computador não liga', 
    'O computador do setor financeiro não liga.', 
    '2026-09-01 08:30:00', 
    '2026-09-01 10:00:00', 
    'Fechado', 
    'Alta', 
    1, 
    1, 
    1
), 
(
    'Sistema não abre', 
    'O sistema de vendas apresenta erro ao iniciar.', 
    '2026-09-02 09:15:00', 
    NULL, 
    'Em andamento', 
    'Media', 
    3, 
    2, 
    3
), 
(
    'Internet lenta', 
    'A internet do setor de RH está muito lenta.', 
    '2026-09-03 13:20:00', 
    NULL, 
    'Aberto', 
    'Baixa', 
    2, 
    3, 
    2
);


INSERT INTO historico_comentarios 
(id_chamado, id_usuario, data_hora, descricao, tipo) 
VALUES 
(
    1, 
    1, 
    '2026-09-01 09:00:00', 
    'Técnico iniciou a análise do computador.', 
    'Atualização'
), 
(
    1, 
    1, 
    '2026-09-01 10:00:00', 
    'Fonte de energia foi substituída.', 
    'Solução'
), 
(
    2, 
    3, 
    '2026-09-02 10:00:00', 
    'O erro continua acontecendo ao abrir o sistema.', 
    'Comentário'
);