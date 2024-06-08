CREATE DATABASE amanhaSolidario;

USE amanhaSolidario;

--Criação das tabelas

CREATE TABLE endereco(
    cep CHAR(8) PRIMARY KEY NOT NULL,
    rua VARCHAR(255),
    municipio VARCHAR(255),
    bairro VARCHAR(255),
    lati DECIMAL(10,8),
    longi DECIMAL(11,8)
);

CREATE TABLE doacao (
  id_doacao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  quantidade INT NOT NULL,
  tipo VARCHAR(25) NOT NULL,
  data_recebimento DATE NOT NULL
);

CREATE TABLE ong (
    id_ong INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cep CHAR(8),
    projeto VARCHAR(255),
    id_doacao INT,
    nome VARCHAR(255),
    gestor VARCHAR(255),
    FOREIGN KEY (cep) REFERENCES endereco(cep),
    FOREIGN KEY (id_doacao) REFERENCES doacao(id_doacao)
);

CREATE TABLE abrigo (
  id_abrigo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome VARCHAR(255) NOT NULL,
  cep CHAR(8),
  id_ong INT,
  capacidade INT NOT NULL,
  gestor VARCHAR(255) NOT NULL,
  FOREIGN KEY (cep) REFERENCES endereco(cep),
  FOREIGN KEY (id_ong) REFERENCES ong(id_ong)
);

CREATE TABLE vitima (
    id_vitima INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cpf CHAR(11),
    nome VARCHAR(255) NOT NULL,
    genero VARCHAR(255) NOT NULL,
    idade INT,
    id_abrigo INT,
    FOREIGN KEY (id_abrigo) REFERENCES abrigo(id_abrigo)
);

CREATE TABLE voluntarios(
  id_voluntarios INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  numero_voluntarios INT,
  funcao VARCHAR(200),
  cpf CHAR(11),
  id_ong INT,
  FOREIGN KEY (id_ong) REFERENCES ong(id_ong)
);

-- Inserindo valores tabelas

INSERT INTO endereco (cep, rua, municipio, bairro, lati, longi)
VALUES 
    ('12345678', 'Rua das Flores', 'São Paulo', 'Centro', -23.55052, -46.633308),
    ('87654321', 'Avenida Brasil', 'Rio de Janeiro', 'Copacabana', -22.971089, -43.185997),
    ('45678912', 'Rua 25 de Março', 'São Paulo', 'Brás', -23.541183, -46.629035),
    ('98765432', 'Rua Oscar Freire', 'São Paulo', 'Jardins', -23.566501, -46.667672),
    ('65432198', 'Avenida Paulista', 'São Paulo', 'Bela Vista', -23.561268, -46.655503);

INSERT INTO doacao (quantidade, tipo, data_recebimento)
VALUES
    (10, 'Alimento', '2024-05-26'),
    (25, 'Roupa', '2024-05-16'),
    (20, 'Alimento', '2024-05-01'),
    (15, 'Alimento', '2024-04-24'),
    (40, 'Roupa', '2024-04-11');

INSERT INTO ong (cep, projeto, id_doacao, nome, gestor)
VALUES
    ('12345678', 'Projeto Alimentar', 1, 'ONG Alegria', 'João Silva'),
    ('87654321', 'Projeto Vestir', 2, 'ONG Esperança', 'Maria Souza'),
    ('45678912', 'Projeto Nutrir', 3, 'ONG Solidariedade', 'Carlos Pereira'),
    ('98765432', 'Projeto Educação', 4, 'ONG Futuro', 'Ana Lima'),
    ('65432198', 'Projeto Incluir', 5, 'ONG Inclusão', 'Paulo Santos');

INSERT INTO abrigo (nome, cep, id_ong, capacidade, gestor)
VALUES
    ('Abrigo Soledade', '12345678', 1, 50, 'Gil Maik'),
    ('Abrigo Bosque da Paz', '87654321', 2, 70, 'Andrey Justino'),
    ('Abrigo Viladouro', '87654321', 3, 75, 'Kaique Alexandre'),
    ('Abrigo Bom Viver', '12345678', 4, 60, 'Felipe Pires'),
    ('Abrigo Amanhã Melhor', '65432198', 5, 50, 'Gabriel Santos');

INSERT INTO vitima (cpf, nome, genero, idade, id_abrigo)
VALUES
    ('34567890123', 'Bruno Silva', 'Masculino', 27, 6),
    ('65432109876', 'Camila Martins', 'Feminino', 31, 7),
    ('56789012345', 'Felipe Oliveira', 'Masculino', 29, 8),
    ('89012345678', 'Fernanda Lima', 'Feminino', 26, 9),
    ('01234567890', 'Ricardo Santos', 'Masculino', 32, 10),
    ('23456789012', 'Juliana Pereira', 'Feminino', 24, 11),
    ('34567890123', 'Diego Fernandes', 'Masculino', 33, 12),
    ('45678901234', 'Priscila Rodrigues', 'Feminino', 28, 13),
    ('56789012345', 'Marcelo Gomes', 'Masculino', 30, 14),
    ('67890123456', 'Larissa Monteiro', 'Feminino', 27, 15);


INSERT INTO voluntarios (numero_voluntarios, funcao, cpf, id_ong)
VALUES 
    (40, 'Saude', '12345608921', 1),
    (38, 'Correios', '12345670891', 2),
    (55, 'Corpo de Bombeiros', '1234506783', 3),
    (32, 'Resgate de Animais', '1234056781', 4),
    (25, 'Distribuir Comida', '12304567821', 5);


-- Sessão para todas as consultas das tabelas

SELECT * FROM endereco;

SELECT * FROM doacao;

SELECT * FROM ong;

SELECT * FROM abrigo;

SELECT * FROM vitima;

SELECT * FROM voluntarios;

-- CRIAÇÃO DE GRAFICOS

-- Gil Maik
SELECT tipo, SUM(quantidade) AS quantidade_total
FROM doacao
GROUP BY tipo;

 
SELECT
  abrigo.nome AS Nome,
  abrigo.capacidade AS Capacidade
FROM abrigo
ORDER BY abrigo.capacidade;

SELECT
  abrigo.nome AS Nome,
  (abrigo.capacidade - (SELECT SUM(vitima.idade) FROM vitima WHERE vitima.id_abrigo = abrigo.id_abrigo)) AS Vagas
FROM abrigo
LEFT JOIN vitima ON vitima.id_abrigo = abrigo.id_abrigo
GROUP BY abrigo.id_abrigo, abrigo.nome, abrigo.capacidade;

SELECT genero, COUNT(id_vitima) AS quantidade_vitimas
FROM vitima
GROUP BY genero;