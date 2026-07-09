-- adicao de novos e atributos e constraints para tabelas ja existentes

ALTER TABLE membro_servidor
DROP CONSTRAINT membro_servidor_pkey; -- remove pk composta antiga

ALTER TABLE membro_servidor
ADD COLUMN id_membro_servidor SERIAL PRIMARY KEY; -- adiciona pk unica

ALTER TABLE membro_servidor
ADD CONSTRAINT membro_servidor_unique
  UNIQUE(id_usuario, id_servidor); -- mantem unicidade na tabela

ALTER TABLE usuario
ADD COLUMN idade INTEGER;

ALTER TABLE usuario
ALTER COLUMN idade SET NOT NULL;

ALTER TABLE usuario
ADD CONSTRAINT idade_ck
  CHECK (idade > 0);

ALTER TABLE usuario
ADD COLUMN biografia VARCHAR(2000);

ALTER TABLE usuario
ADD COLUMN status BOOLEAN;

ALTER TABLE usuario
ALTER COLUMN status SET NOT NULL;

ALTER TABLE canal
ADD COLUMN descricao VARCHAR(2000);

-- implementacao de resposta para mensagens com autorelacionamento

ALTER TABLE mensagem
ADD COLUMN id_mensagem_resposta INTEGER;

ALTER TABLE mensagem
ADD CONSTRAINT fk_mensagem_resposta
  FOREIGN KEY(id_mensagem_resposta)
  REFERENCES mensagem(id_mensagem);

-- expansao do dominio com novas tabelas

CREATE TABLE solicitacao_amizade(
  id_solicitacao SERIAL PRIMARY KEY,
  id_remetente INTEGER NOT NULL,
  id_destinatario INTEGER NOT NULL,
  status VARCHAR(10) NOT NULL,
  data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY(id_remetente) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_destinatario) REFERENCES usuario(id_usuario),

  CHECK (status IN ('pendente', 'aceita', 'recusada')),
  CHECK (id_remetente <> id_destinatario)
);

CREATE TABLE amizade(
  id_usuario_1 INTEGER NOT NULL,
  id_usuario_2 INTEGER NOT NULL,
  data_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY(id_usuario_1, id_usuario_2),

  FOREIGN KEY(id_usuario_1) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_usuario_2) REFERENCES usuario(id_usuario),

  CHECK (id_usuario_1 <> id_usuario_2)
);

CREATE TABLE cargo_servidor(
  id_cargo_servidor SERIAL PRIMARY KEY,
  id_servidor INTEGER NOT NULL,
  nome VARCHAR(100) NOT NULL,
  cor VARCHAR(10) NOT NULL,
  hierarquia INTEGER NOT NULL,

  FOREIGN KEY(id_servidor) REFERENCES servidor(id_servidor),

  CHECK (hierarquia BETWEEN 1 AND 3), -- 1 para membro, 2 para moderador e 3 para administrador
  CHECK (LENGTH(TRIM(nome)) >= 1)
);

CREATE TABLE membro_servidor_cargo(
  id_membro_servidor INTEGER NOT NULL,
  id_cargo INTEGER NOT NULL,

  PRIMARY KEY(id_membro_servidor, id_cargo),

  FOREIGN KEY(id_membro_servidor) REFERENCES membro_servidor(id_membro_servidor),
  FOREIGN KEY(id_cargo) REFERENCES cargo_servidor(id_cargo_servidor)
);

CREATE TABLE reacao_mensagem(
  id_usuario INTEGER NOT NULL,
  id_mensagem INTEGER NOT NULL,
  emoji VARCHAR(10) NOT NULL,
  data_reacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY(id_usuario, id_mensagem),

  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_mensagem) REFERENCES mensagem(id_mensagem)
);
