ALTER TABLE usuario
ADD CONSTRAINT nome_usuario_ck
  CHECK (LENGTH(TRIM(nome_usuario)) >= 2); -- garante que o nome do usuario tenha pelo menos dois caracteres

ALTER TABLE usuario
ALTER COLUMN telefone TYPE VARCHAR(15); -- alterado pois o telefone tem diferentes quantidades de caracteres

ALTER TABLE usuario
ADD CONSTRAINT telefone_ck
  CHECK (telefone IS NULL OR telefone ~ '^[0-9]{10,15}$'); -- garante que o valor de telefone ficara em um formato adequado, contendo entre 10 e 15 caracteres numericos

ALTER TABLE usuario
ADD CONSTRAINT email_ck
  CHECK (email IS NULL OR email ~ '^[^@]+@[^@]+\.[^@]+$'); -- garante que o email tenha o formato proximo do adequado, com arroba, algo antes e depois do arroba e um ponto do dominio

ALTER TABLE servidor
ADD CONSTRAINT nome_servidor_ck
  CHECK (LENGTH(TRIM(nome)) >= 2);

ALTER TABLE servidor
ADD CONSTRAINT descricao_ck
  CHECK (LENGTH(descricao) <= 2000); -- garante que o texto de descricao nao ultrapasse 2000 caracteres

ALTER TABLE canal
ADD CONSTRAINT nome_canal_ck
  CHECK (LENGTH(TRIM(nome)) >= 1);

ALTER TABLE mensagem
ADD CONSTRAINT conteudo_ck
  CHECK (LENGTH(conteudo) BETWEEN 1 AND 2000); -- garante que o conteudo da ensagem tenha no minimo 1 caractere e nao ultrapasse 2000 caracteres
