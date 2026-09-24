# Projeto - Atendimento a chamados

[Conceitual](merder.drawio.png)

# Dicionário de Dados

## Tabela: Usuario

| Campo | Tipo | Descrição |
|---|---|---|
| id | int | Identificador único do usuário |
| nome | varchar(100) | Nome do usuário |
| email | varchar(100) | E-mail do usuário |
| telefone | varchar(20) | Telefone do usuário |
| departamento | varchar(100) | Departamento do usuário |
| cargo | varchar(100) | Cargo do usuário |
| status | varchar(20) | Status do usuário |

## Tabela: Tecnico

| Campo | Tipo | Descrição |
|---|---|---|
| id | int | Identificador único do técnico |
| nome | varchar(100) | Nome do técnico |
| email | varchar(100) | E-mail do técnico |
| especialidade | varchar(100) | Especialidade do técnico |
| status | varchar(20) | Status do técnico |

## Tabela: Categoria

| Campo | Tipo | Descrição |
|---|---|---|
| id | int | Identificador único da categoria |
| nome | varchar(100) | Nome da categoria |
| descricao | varchar(255) | Descrição da categoria |

## Tabela: Chamado

| Campo | Tipo | Descrição |
|---|---|---|
| id | int | Identificador único do chamado |
| titulo | varchar(150) | Título do chamado |
| descricao | varchar(255) | Descrição do problema |
| data_abertura | datetime | Data e hora da abertura |
| data_fechamento | datetime | Data e hora do fechamento |
| status | varchar(30) | Status do chamado |
| prioridade | varchar(20) | Prioridade do chamado |
| id_usuario | int | Identificador do usuário que abriu o chamado |
| id_categoria | int | Identificador da categoria do chamado |
| id_tecnico | int | Identificador do técnico responsável |

## Tabela: Historico_Comentarios

| Campo | Tipo | Descrição |
|---|---|---|
| id | int | Identificador único do histórico |
| id_chamado | int | Identificador do chamado |
| id_usuario | int | Identificador do usuário |
| data_hora | datetime | Data e hora do comentário |
| descricao | varchar(255) | Descrição da atualização ou solução |
| tipo | varchar(50) | Tipo do registro, como comentário, atualização ou solução |

# Dados de teste em CSV 
- [Usuario](./usuario.csv)
- [Tecnico](tecnico.csv)
- [Categoria](./categoria.csv)
- [Chamado](./chamado.csv)
-[Historico_comentarios](historico_comentarios.csv)

# Script SQL DDL

```sql
CREATE DATABASE chamados_ti;

USE chamados_ti;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    departamento VARCHAR(100),
    cargo VARCHAR(100),
    status VARCHAR(20)
);

CREATE TABLE tecnico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    status VARCHAR(20)
);

CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE chamado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_abertura DATETIME NOT NULL,
    data_fechamento DATETIME,
    status VARCHAR(30),
    prioridade VARCHAR(20),
    id_usuario INT NOT NULL,
    id_categoria INT NOT NULL,
    id_tecnico INT,

    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (id_tecnico) REFERENCES tecnico(id)
);

CREATE TABLE historico_comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_chamado INT NOT NULL,
    id_usuario INT NOT NULL,
    data_hora DATETIME NOT NULL,
    descricao TEXT,
    tipo VARCHAR(50),

    FOREIGN KEY (id_chamado) REFERENCES chamado(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

```

# Script SQL DML 
```sql

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
```

