
-- Modelo Relacional: Sistema de Manutenção para Complexo de Geração Solar
CREATE DATABASE relacional_solar;
USE relacional_solar;

CREATE TABLE Engenheiro (
    matricula VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    especialista VARCHAR(250),
    idade TINYINT
);

CREATE TABLE Ordem_Servico (
    numero_indisp VARCHAR(250) PRIMARY KEY,
    data_aberturaOS DATE NOT NULL,
    data_ocorrido DATE NOT NULL,
    status_ordem VARCHAR(250),
    criticidade ENUM('alto', 'medio', 'baixo'),
    engenheiro_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (engenheiro_id) REFERENCES Engenheiro(matricula)
);

CREATE TABLE Tipo (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    ordem_servico_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (ordem_servico_id) REFERENCES Ordem_Servico(numero_indisp)
);

CREATE TABLE OS_Tipo (
    numero_indisp VARCHAR(250),
    tipo_id VARCHAR(50),
    PRIMARY KEY (numero_indisp, tipo_id),
    FOREIGN KEY (numero_indisp) REFERENCES Ordem_Servico(numero_indisp),
    FOREIGN KEY (tipo_id) REFERENCES Tipo(id)
);

CREATE TABLE Equipamento (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    tipo VARCHAR(250) NOT NULL,
    marca VARCHAR(250),
    modelo VARCHAR(250),
    data_instalacao DATE,
    tipo_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (tipo_id) REFERENCES Tipo(id)
);

CREATE TABLE Zona (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    poligono GEOMETRY NOT NULL,
    localizacao POINT NOT NULL,
    data_criacao DATE,
    tipo_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (tipo_id) REFERENCES Tipo(id)
);

CREATE TABLE Complexo (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    poligono GEOMETRY NOT NULL,
    localizacao POINT NOT NULL,
    data_criacao DATE,
    observacao TEXT,
    pais VARCHAR(250),
    estado VARCHAR(250),
    bairro VARCHAR(250),
    logradouro VARCHAR(250),
    cidade VARCHAR(250),
    zona_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (zona_id) REFERENCES Zona(id)
);

CREATE TABLE Parque (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    poligono GEOMETRY NOT NULL,
    localizacao POINT NOT NULL,
    data_criacao DATE,
    fuso VARCHAR(250),
    complexo_id VARCHAR(50) NOT NULL,
    zona_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (complexo_id) REFERENCES Complexo(id),
    FOREIGN KEY (zona_id) REFERENCES Zona(id)
);

CREATE TABLE Eletrocentro (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    marca VARCHAR(250) NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    poligono GEOMETRY NOT NULL,
    localizacao POINT NOT NULL,
    data_criacao DATE,
    transmissao VARCHAR(250),
    parque_id VARCHAR(50) NOT NULL,
    zona_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (zona_id) REFERENCES Zona(id),
    FOREIGN KEY (parque_id) REFERENCES Parque(id)
);

CREATE TABLE Inversor (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    tipo VARCHAR(250) NOT NULL,
    marca VARCHAR(250),
    modelo VARCHAR(250),
    data_instalacao DATE,
    ponto POINT NOT NULL,
    localizacao POINT NOT NULL,
    eletrocentro_id VARCHAR(50) NOT NULL,
	equipamento_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (eletrocentro_id) REFERENCES Eletrocentro(id),
    FOREIGN KEY (equipamento_id) REFERENCES Equipamento(id)
);

CREATE TABLE String_Box (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    tipo VARCHAR(250) NOT NULL,
    marca VARCHAR(250),
    modelo VARCHAR(250),
    data_instalacao DATE,
    ponto DOUBLE NOT NULL,
    localizacao POINT NOT NULL,
    inversor_id VARCHAR(50) NOT NULL,
	equipamento_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (equipamento_id) REFERENCES Equipamento(id),
    FOREIGN KEY (inversor_id) REFERENCES Inversor(id)
);

CREATE TABLE Tracker (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    tipo VARCHAR(250) NOT NULL,
    marca VARCHAR(250),
    modelo VARCHAR(250),
    data_instalacao DATE,
    sujidade ENUM('sim', 'não') NOT NULL,
    linha LINESTRING NOT NULL,
    localizacao POINT NOT NULL,
    stringbox_id VARCHAR(50) NOT NULL,
	equipamento_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (equipamento_id) REFERENCES Equipamento(id),
    FOREIGN KEY (stringbox_id) REFERENCES String_Box(id)
);

CREATE TABLE Placa (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    tipo VARCHAR(250) NOT NULL,
    marca VARCHAR(250),
    modelo VARCHAR(250),
    data_instalacao DATE,
    diagnostico_termal VARCHAR(250),
    poligono GEOMETRY NOT NULL,
    tracker_id VARCHAR(50) NOT NULL,
    equipamento_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (equipamento_id) REFERENCES Equipamento(id),
    FOREIGN KEY (tracker_id) REFERENCES Tracker(id)
);

CREATE TABLE Modulo (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    tipo VARCHAR(250) NOT NULL,
    marca VARCHAR(250),
    modelo VARCHAR(250),
    data_instalacao DATE,
    sujidade ENUM('sim', 'não') NOT NULL,
    poligono GEOMETRY NOT NULL,
    placa_id VARCHAR(50) NOT NULL,
    equipamento_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (equipamento_id) REFERENCES Equipamento(id),
    FOREIGN KEY (placa_id) REFERENCES Placa(id)
);

CREATE TABLE Subestacao (
    id VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    observacao VARCHAR(250) NOT NULL,
    status ENUM('Operante', 'Inoperante') NOT NULL,
    capacidade VARCHAR(250),
    poligono GEOMETRY NOT NULL,
    localizacao POINT NOT NULL,
    data_criacao DATE,
    zona_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (zona_id) REFERENCES Zona(id)
);
