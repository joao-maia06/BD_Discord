CREATE TABLE usuario (
  id_usuario SERIAL PRIMARY KEY,
  nome_usuario VARCHAR(32) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE,
  telefone CHAR(11) UNIQUE,
  hash_senha VARCHAR(255) NOT NULL, -- armazena o hash da senha
  data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CHECK ((email IS NOT NULL) OR (telefone IS NOT NULL)) -- garante que o usuario possua telefone ou email (ou ambos)
);

CREATE TABLE servidor (
  id_servidor SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT,
  data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_proprietario INTEGER NOT NULL,
  FOREIGN KEY(id_proprietario) REFERENCES usuario(id_usuario)
);

CREATE TABLE canal (
  id_canal SERIAL PRIMARY KEY,
  tipo VARCHAR(10) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  id_servidor INTEGER NOT NULL,
  FOREIGN KEY(id_servidor) REFERENCES servidor(id_servidor),
  CHECK (tipo IN ('voz','texto'))
);

CREATE TABLE conversa (
  id_conversa SERIAL PRIMARY KEY,
  data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mensagem (
  id_mensagem SERIAL PRIMARY KEY,
  conteudo TEXT NOT NULL,
  data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_usuario INTEGER NOT NULL,
  id_canal INTEGER,
  id_conversa INTEGER,
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_canal) REFERENCES canal(id_canal),
  FOREIGN KEY(id_conversa) REFERENCES conversa(id_conversa),
  CHECK ((id_canal IS NULL AND id_conversa IS NOT NULL) OR (id_canal IS NOT NULL AND id_conversa IS NULL)) -- garante que uma mensagem pertença a um canal ou a uma conversa, mas nao aos dois simultaneamente
);

CREATE TABLE membro_servidor (
  PRIMARY KEY(id_usuario, id_servidor),
  id_usuario INTEGER NOT NULL,
  id_servidor INTEGER NOT NULL,
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_servidor) REFERENCES servidor(id_servidor)
);

CREATE TABLE participante_conversa (
  PRIMARY KEY(id_usuario, id_conversa),
  id_usuario INTEGER NOT NULL,
  id_conversa INTEGER NOT NULL,
  FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY(id_conversa) REFERENCES conversa(id_conversa)
);
