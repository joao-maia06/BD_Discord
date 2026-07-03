# Levantamento

## Entidades e seus Atributos

- **Usuario**

id_usuario, nome_usuario, email, telefone, senha, data_criacao.

- **Servidor**

id_servidor, nome, descriçao, data_criacao.

- **Canal**

id_canal, nome, tipo.

- **Conversa**

id_conversa, data_criaçao.

- **Mensagem**

id_mensagem, conteudo, data_criaçao.

## Entidades adicionais

- **Membro_servidor**
- **Participante_conversa**

## Relacionamentos

- Usuario cria Servidor (1:N)
- Servidor possui Canal (1:N)
- Usuario participa de Servidor (N:N)
- Conversa possui Participantes (N:N)
- Usuario envia Mensagem (1:N)
- Canal contem Mensagem (1:N)
- Conversa contem Mensagem (1:N)

## Regras de negocio

### Usuário

- Todo usuário deve possuir um identificador único.
- Um usuário deve possuir e-mail ou telefone (ou ambos), mas nunca os dois nulos ao mesmo tempo.
- Todo usuário deve possuir uma senha, ela não pode ser nula e deve possuir no mínimo 8 caracteres e no máximo 72.
- Todo usuário deve possuir um nome, ele não pode ser nulo e deve ter no máximo 32 caracteres.
- O nome do usuario deve ser unico.
- Um usuário pode participar de vários servidores.

### Servidor

- Todo servidor deve possuir um identificador único.
- Todo servidor possui um, e apenas um, usuário proprietário.
- Todo servidor deve possuir um nome, com no mínimo 2 e no máximo 100 caracteres.
- Um usuário pode criar vários servidores.
- Um servidor pode conter vários canais.
- Um servidor pode conter vários usuários participantes.

### Canal

- Todo canal deve possuir um identificador único.
- Todo canal deve possuir um nome, com no mínimo 1 e no máximo 100 caracteres.
- Todo canal pertence a um servidor.
- O tipo do canal deve pertencer ao conjunto {texto, voz}.

### Conversa

- Toda conversa deve possuir um identificador único.
- Um usuário pode participar de varias conversas.
- Uma conversa não pode possuir participantes repetidos.

### Mensagem

- Toda mensagem deve possuir um identificador único.
- Toda mensagem deve possuir um conteúdo com no mínimo 1 e no máximo 2000 caracteres.
- Toda mensagem deve possuir um usuário autor.
- Um usuário pode enviar varias mensagens.
- Uma mensagem deve pertencer a um canal ou a uma conversa, mas nunca aos dois simultaneamente.
