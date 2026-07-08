# Levantamento

## Entidades e seus Atributos

- **Usuario**

id_usuario, nome_usuario, email, telefone, senha, idade, status, biografia, data_criacao.

- **Servidor**

id_servidor, nome, descriçao, data_criacao.

- **Canal**

id_canal, nome, tipo, descricao.

- **Conversa**

id_conversa, data_criaçao.

- **Mensagem**

id_mensagem, conteudo, id_mensagem_resposta, data_criaçao.

- **Solicitacao_amizade**

id_solicitacao, id_remetente, id_destinatario, status, data_envio

- **Amizade**

id_usuario_1, id_usuario_2, data_inicio

- **Cargo_servidor**

id_cargo, id_servidor, nome, cor, hierarquia

- **Reacao_mensagem**

id_usuario, id_mensagem, emoji, data_reacao

## Entidades adicionais

- **Membro_servidor**
- **Participante_conversa**
- **Membro_servidor_cargo**

## Relacionamentos

- Usuario cria Servidor (1:N)
- Servidor possui Canal (1:N)
- Usuario participa de Servidor (N:N)
- Conversa possui Participantes (N:N)
- Usuario envia Mensagem (1:N)
- Canal contem Mensagem (1:N)
- Conversa contem Mensagem (1:N)
- Mensagem responde Mensagem (N:1)
- Usuario solicita amizade de Usuario (N:N)
- Usuario possui amizade com Usuario (N:N)
- Servidor possui Cargos (1:N)
- Membro_servidor possui Cargos (N:N)
- Usuario reage a Mensagem (N:N)

## Regras de negocio

### Usuário

- Todo usuário deve possuir um identificador único.
- Um usuário deve possuir obrigatoriamente um e-mail ou um telefone (ou ambos).
- Todo usuário deve possuir uma senha.
- Todo usuário deve possuir um nome, com pelo menos 2 caracteres e no maximo 32.
- O nome do usuario deve ser unico.
- Um usuário pode participar de vários servidores.
- O usuário pode possuir uma biografia, com no máximo 2000 caracteres.
- O usuário deve possuir a idade, que não deve ser negativa.

### Servidor

- Todo servidor deve possuir um identificador único.
- Todo servidor possui um unico usuário proprietário.
- Todo servidor deve possuir um nome, com no minimo 1 e no maximo 100 caracteres.
- Um usuário pode criar vários servidores.
- Um servidor pode conter vários canais.
- Um servidor pode conter vários usuários participantes.
- Um usuário não pode participar de um servidor varias vezes.
- Um servidor pode conter uma descriçao com no maximo 2000 caracteres.

### Canal

- Todo canal deve possuir um identificador único.
- Todo canal deve possuir um nome, com no minimo 1 e no maximo 100 caracteres.
- Todo canal pertence a um servidor.
- Um canal nao pode pertencer a dois servidores ao mesmo tempo. 
- O tipo do canal deve pertencer ao conjunto {texto, voz}.
- O canal pode possuir uma descrição com no máximo 2000 caracteres.

### Conversa

- Toda conversa deve possuir um identificador único.
- Um usuário pode participar de varias conversas.
- Uma conversa não pode possuir participantes repetidos.

### Mensagem

- Toda mensagem deve possuir um identificador único.
- Toda mensagem deve possuir um conteúdo, com no minimo 1 e no maximo 2000 caracteres.
- Toda mensagem deve possuir um usuário autor.
- Um usuário pode enviar varias mensagens.
- Uma mensagem deve pertencer a um canal ou a uma conversa, mas nunca aos dois simultaneamente.
- Uma ou mais mensagens podem ser resposta de uma outra mensagem, mas não podem responder varias ao mesmo tempo.

### Amizade

- O usuário pode solicitar amizade de outros usuários.
- O usuário pode ter amizade com vários usuários.
- O status da solicitação deve pertencer ao conjunto {’pendente’, ’aceita’, ‘recusada’}

### Cargo

- O servidor pode possuir vários cargos, mas um cargo não pode estar em vários servidores ao mesmo tempo.
- O membro de um servidor pode possuir vários cargos e um cargo pode estar atrelado a vários membros.
- O membro do servidor não pode possuir o mesmo cargo varias vezes.
- A hierarquia do cargo deve pertencer ao conjunto {1, 2, 3}, onde cada um representa um nível (1 - Membro, 2 - Moderador, 3 - Administrador).

### Reação de mensagens

- O usuário pode reagir a varias mensagens, mas não pode reagir varias vezes a mesma mensagem.
