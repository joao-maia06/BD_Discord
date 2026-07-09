-- =======================================
-- SCRIPT PARA POPULAR O BANCO DE DADOS
-- =======================================

-- 1. INSERIR 10 USUÁRIOS
INSERT INTO usuario (nome_usuario, email, telefone, hash_senha, idade, biografia, status) VALUES
('joaosilva', 'joao.silva@email.com', '11999991111', 'hash_senha_123', 25, 'Apaixonado por tecnologia', TRUE),
('maria_santos', 'maria.santos@email.com', '11999992222', 'hash_senha_456', 28, 'Designer e amante de café', TRUE),
('pedro_oliveira', 'pedro.oliveira@email.com', '11999993333', 'hash_senha_789', 32, 'Desenvolvedor full stack', TRUE),
('ana_paula', 'ana.paula@email.com', '11999994444', 'hash_senha_101', 22, 'Estudante de computação', TRUE),
('carloslima', 'carlos.lima@email.com', '11999995555', 'hash_senha_112', 35, 'Músico nas horas vagas', TRUE),
('fernanda_costa', 'fernanda.costa@email.com', '11999996666', 'hash_senha_131', 27, 'Viajante e fotógrafa', TRUE),
('roberto_alves', 'roberto.alves@email.com', '11999997777', 'hash_senha_415', 40, 'Professor de matemática', TRUE),
('juliana_fer', 'juliana.ferreira@email.com', '11999998888', 'hash_senha_161', 26, 'Amante de livros', FALSE),
('marcos_souza', 'marcos.souza@email.com', '11999999999', 'hash_senha_718', 30, 'Jogador profissional', TRUE),
('patricia_gomes', 'patricia.gomes@email.com', '11999990000', 'hash_senha_192', 24, 'Bailarina', TRUE);

-- 2. INSERIR 4 SERVIDORES
INSERT INTO servidor (nome, descricao, id_proprietario) VALUES
('Discord Brasil', 'Servidor oficial da comunidade brasileira', 1),
('GameZone', 'Servidor para gamers de todas as plataformas', 3),
('TechHub', 'Discussões sobre tecnologia e programação', 5),
('MusicLovers', 'Para amantes da música e arte', 7);

-- 3. INSERIR 8 CANAIS (2 por servidor)
INSERT INTO canal (tipo, nome, id_servidor, descricao) VALUES
-- Servidor 1 (Discord Brasil)
('texto', 'geral', 1, 'Canal principal para conversas gerais'),
('voz', 'voz-geral', 1, 'Canal de voz para conversas em grupo'),
-- Servidor 2 (GameZone)
('texto', 'noticias-games', 2, 'Últimas notícias do mundo dos games'),
('voz', 'lfg', 2, 'Procurando grupo para jogar'),
-- Servidor 3 (TechHub)
('texto', 'programacao', 3, 'Discussões sobre programação'),
('voz', 'reunioes-tech', 3, 'Reuniões técnicas e apresentações'),
-- Servidor 4 (MusicLovers)
('texto', 'recomendacoes', 4, 'Recomendações de músicas e artistas'),
('voz', 'jam-sessions', 4, 'Sessões de música ao vivo');

-- 4. INSERIR 4 CONVERSAS (privadas entre usuários)
INSERT INTO conversa (data_criacao) VALUES
(DEFAULT), -- Conversa 1
(DEFAULT), -- Conversa 2
(DEFAULT), -- Conversa 3
(DEFAULT); -- Conversa 4

-- 5. INSERIR 13 MEMBROS_SERVIDOR
INSERT INTO membro_servidor (id_usuario, id_servidor) VALUES
-- Servidor 1 (Discord Brasil)
(1, 1), (2, 1), (3, 1), (4, 1),
-- Servidor 2 (GameZone)
(3, 2), (5, 2), (6, 2), (7, 2),
-- Servidor 3 (TechHub)
(5, 3), (8, 3), (9, 3),
-- Servidor 4 (MusicLovers)
(7, 4), (10, 4);

-- 6. INSERIR 10 PARTICIPANTES_CONVERSA
INSERT INTO participante_conversa (id_usuario, id_conversa) VALUES
-- Conversa 1
(1, 1), (2, 1),
-- Conversa 2
(3, 2), (4, 2), (5, 2),
-- Conversa 3
(6, 3), (7, 3), (8, 3),
-- Conversa 4
(9, 4), (10, 4);

-- 7. INSERIR 20 MENSAGENS (10 em canais e 10 em conversas)
-- Mensagens em Canais (10 mensagens)
INSERT INTO mensagem (conteudo, id_usuario, id_canal, id_conversa) VALUES
-- Canal 1 (geral do servidor 1)
('Olá pessoal! Bem-vindos ao servidor!', 1, 1, NULL),
('Alguém mais está animado para o evento de hoje?', 2, 1, NULL),
('Vamos marcar um encontro pra jogar essa semana', 3, 1, NULL),
-- Canal 3 (noticias-games do servidor 2)
('Novo patch do jogo foi lançado hoje!', 5, 3, NULL),
('Alguém já testou o novo modo de jogo?', 6, 3, NULL),
('O que acharam do último lançamento?', 3, 3, NULL),
-- Canal 5 (programacao do servidor 3)
('Alguma dica de framework para iniciantes?', 5, 5, NULL),
('Python continua sendo a melhor linguagem!', 8, 5, NULL),
('Vamos fazer um hackathon esse mês', 9, 5, NULL),
-- Canal 7 (recomendacoes do servidor 4)
('Recomendo ouvir o novo álbum do Coldplay', 7, 7, NULL);

-- Mensagens em Conversas (10 mensagens)
INSERT INTO mensagem (conteudo, id_usuario, id_canal, id_conversa) VALUES
-- Conversa 1
('Oi! Como você está?', 1, NULL, 1),
('Estou bem, e você?', 2, NULL, 1),
('Vamos nos encontrar amanhã?', 1, NULL, 1),
-- Conversa 2
('Você viu o último episódio da série?', 3, NULL, 2),
('Sim, foi incrível!', 4, NULL, 2),
('Precisamos marcar de assistir juntos', 5, NULL, 2),
-- Conversa 3
('Estou estudando para a prova', 6, NULL, 3),
('Posso te ajudar com isso', 7, NULL, 3),
('Vamos estudar em grupo?', 8, NULL, 3),
-- Conversa 4
('Você vai ao show no sábado?', 9, NULL, 4);

-- 8. INSERIR 6 CARGOS_SERVIDOR
INSERT INTO cargo_servidor (id_servidor, nome, cor, hierarquia) VALUES
-- Servidor 1
(1, 'Administrador', '#FF0000', 3),
(1, 'Moderador', '#00FF00', 2),
(1, 'Membro', '#0000FF', 1),
-- Servidor 2
(2, 'Administrador', '#FF0000', 3),
(2, 'Moderador', '#FFA500', 2),
-- Servidor 3
(3, 'Administrador', '#800080', 3);

-- 9. INSERIR 8 MEMBROS_SERVIDOR_CARGO
-- Primeiro, vamos obter os IDs dos membros_servidor
-- Assumindo que os IDs são gerados sequencialmente começando em 1
INSERT INTO membro_servidor_cargo (id_membro_servidor, id_cargo) VALUES
-- Servidor 1
(1, 1), -- João é Administrador
(2, 2), -- Maria é Moderadora
(3, 3), -- Pedro é Membro
(4, 3), -- Ana é Membro
-- Servidor 2
(5, 4), -- Pedro é Administrador
(6, 5), -- Carlos é Moderador
(7, 5), -- Fernanda é Moderadora
-- Servidor 3
(9, 6); -- Marcos é Administrador

-- 10. INSERIR 10 REACOES_MENSAGEM
INSERT INTO reacao_mensagem (id_usuario, id_mensagem, emoji) VALUES
-- Reações nas mensagens de canais
(1, 1, '👍'),
(2, 1, '❤️'),
(3, 2, '😂'),
(4, 3, '🎮'),
(5, 4, '🔥'),
(6, 5, '👏'),
(7, 8, '💻'),
(8, 9, '⭐'),
-- Reações nas mensagens de conversas
(1, 11, '😊'),
(3, 14, '👀');

-- 11. INSERIR 4 SOLICITACOES_AMIZADE
INSERT INTO solicitacao_amizade (id_remetente, id_destinatario, status, data_envio) VALUES
(1, 2, 'aceita', DEFAULT),
(3, 4, 'pendente', DEFAULT),
(5, 6, 'aceita', DEFAULT),
(7, 8, 'recusada', DEFAULT);

-- 12. INSERIR 4 AMIZADES
INSERT INTO amizade (id_usuario_1, id_usuario_2, data_inicio) VALUES
(1, 2, DEFAULT),  -- João e Maria
(3, 4, DEFAULT),  -- Pedro e Ana
(5, 6, DEFAULT),  -- Carlos e Fernanda
(9, 10, DEFAULT); -- Marcos e Patrícia
