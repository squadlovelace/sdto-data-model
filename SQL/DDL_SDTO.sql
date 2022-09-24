USE SDTO;

CREATE TABLE responsavel (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(200) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    parentesco VARCHAR(64) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE perfil (
    id INT AUTO_INCREMENT,
    tipo VARCHAR(64) NOT NULL,
    descricao VARCHAR(14) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE usuario (
    id INT AUTO_INCREMENT NOT NULL,
    email VARCHAR(200) NOT NULL,
    nome VARCHAR(200),
    senha VARCHAR(64),
    rg VARCHAR(128),
    cpf VARCHAR(11),
    telefone VARCHAR(14),
    data_nascimento DATE,
    id_responsavel INT,
    id_perfil INT,
    PRIMARY KEY (id),
    UNIQUE (email, cpf, rg),
    FOREIGN KEY (id_responsavel) REFERENCES responsavel (id),
    FOREIGN KEY (id_perfil) REFERENCES perfil (id)
);

CREATE TABLE instituicao (
    id INT AUTO_INCREMENT NOT NULL,
    razao_social VARCHAR(200) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE endereco (
    id INT AUTO_INCREMENT NOT NULL,
    rua VARCHAR(200),
    numero VARCHAR(10),
    cep VARCHAR(10),
    bairro VARCHAR(32),
    cidade VARCHAR(64),
    complemento VARCHAR(64),
    id_usuario INT,
    id_instituicao INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id),
    FOREIGN KEY (id_instituicao) REFERENCES instituicao (id)
);

CREATE TABLE colaborador (
    id INT AUTO_INCREMENT NOT NULL,
    crm VARCHAR(20),
    cargo VARCHAR(32),
    id_usuario INT,
    id_instituicao INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id),
    FOREIGN KEY (id_instituicao) REFERENCES instituicao (id)
);

CREATE TABLE orgao (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(64),
    tempo_isquemia VARCHAR(20),
    tipo ENUM('orgao', 'tecido'),
    PRIMARY KEY (id)
);

CREATE TABLE receptor (
    id INT AUTO_INCREMENT NOT NULL,
    tipo_sanguineo VARCHAR(20),
    rgct VARCHAR(64),
    possui_comorbidade BOOLEAN,
    descricao_comorbidade VARCHAR(64),
    id_usuario INT,
    id_orgao INT,
    PRIMARY KEY (id),
    UNIQUE (rgct),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id),
    FOREIGN KEY (id_orgao) REFERENCES orgao (id)
);

CREATE TABLE doador (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(200) NOT NULL,
    tipo_sanguineo VARCHAR(20),
    tipo ENUM ('vivo', 'morto'),
    causa_morte VARCHAR(64),
    id_orgao INT,
    id_instituicao INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_orgao) REFERENCES orgao (id),
    FOREIGN KEY (id_instituicao) REFERENCES instituicao (id)
);




