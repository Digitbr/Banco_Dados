CREATE SCHEMA EXERCICIO3;
USE EXERCICIO3;

CREATE TABLE IF NOT EXISTS ESPECTADORES(
ID_ESPEC INT PRIMARY KEY,
TEL_ESPEC VARCHAR(20),
EMAIL_ESPEC VARCHAR(20) NOT NULL,
NOME_ESPEC VARCHAR(100) NOT NULL,
DATA_NASC DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS SALAS(
ID_SALA INT PRIMARY KEY,
NOME VARCHAR(50) NOT NULL,
CAPACIDADE INT NOT NULL);

CREATE TABLE IF NOT EXISTS FILMES(
ID_FILME INT PRIMARY KEY,
NOME_FILME VARCHAR(100) NOT NULL,
DISTRIBUIDOR_FILME VARCHAR(100) NOT NULL,
TEMPO_FILME INT NOT NULL,
DIRETOR VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS SESSOES(
ID_SESSAO INT PRIMARY KEY,
FILME_SESSAO INT NOT NULL,
SALA_SESSAO INT NOT NULL,
CONSTRAINT FK_FIL_SES FOREIGN KEY (FILME_SESSAO) REFERENCES FILMES(ID_FILME),
CONSTRAINT FK_SAL_SES FOREIGN KEY (SALA_SESSAO) REFERENCES SALAS(ID_SALA));

CREATE TABLE IF NOT EXISTS INGRESSOS(
ID_INGRESSO INT PRIMARY KEY,
DATA_ING DATE NOT NULL,
HORA_ING TIME NOT NULL,
SESSAO_ING INT NOT NULL,
ESPECTADOR_ING INT NOT NULL,
CONSTRAINT FK_SES_ING FOREIGN KEY(SESSAO_ING) REFERENCES SESSOES(ID_SESSAO),
CONSTRAINT FK_SES_ESP FOREIGN KEY(ESPECTADOR_ING) REFERENCES SESSOES(ID_SESSAO));
