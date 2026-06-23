# Levantamento Inicial

## Funcionalidades Principais do Sistema

- Usuarios criam contas
- Usuarios criam servidores
- Usuarios adicionam amigos
- Usuarios criam mensagen diretas com outro(s) usuario(s)
- Usuarios enviam mensagens

## Possiveis Entidades e seus Atributos

- Usuario
id_usuario
nome_usuario
email
telefone
senha
data_criacao

- Servidor
id_servidor
nome
descriçao
data_criacao

- Canal
id_canal
nome
tipo

- Conversa
id_conversa
data_criaçao

- Mensagem
id_mensagem
conteudo
data_criaçao

- Membro_servidor


## Possiveis Relacionamentos

- Usuario cria Servidor (1:N)
- Servidor possui Canal (1:N)
- Usuario participa de Servidor (N:N)
- Conversa possui Participantes (N:N)
- Usuario envia Mensagem (1:N)
- Canal contem Mensagem (1:N)
- Conversa contem Mensagem (1:N)

## Observaçoes

- Uma mensagem pode estar em um canal ou em uma conversa, nao pode estar nos dois ao mesmo tempo
- Membro_servidor resolve o relaconamento Usuario participa de Servidor
