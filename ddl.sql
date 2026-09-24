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