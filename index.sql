CREATE DATABASE amanhaSolidario;
USE amanhaSolidario;
--Criação das tabelas

CREATE TABLE endereco (
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

CREATE TABLE voluntario(
  id_voluntario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome VARCHAR(255),
  idade INT,
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
    ('12345678901', 'Maria Souza', 'Feminino', 25, 1),
    ('98765432109', 'Joaquim Ferreira', 'Masculino', 30, 2),
    ('45678901234', 'Ana Souza', 'Feminino', 28, 3),
    ('78901234567', 'Carlos Almeida', 'Masculino', 35, 4),
    ('23456789012', 'Carla Costa', 'Feminino', 22, 5),
    ('34567890123', 'Bruno Silva', 'Masculino', 27, 3),
    ('65432109876', 'Camila Martins', 'Feminino', 31, 2),
    ('56789012345', 'Felipe Oliveira', 'Masculino', 29, 1),
    ('89012345678', 'Fernanda Lima', 'Feminino', 26, 4),
    ('01234567890', 'Ricardo Santos', 'Masculino', 32, 5),
    ('23456789012', 'Juliana Pereira', 'Feminino', 24, 3),
    ('34567890123', 'Diego Fernandes', 'Masculino', 33, 2),
    ('45678901234', 'Priscila Rodrigues', 'Feminino', 28, 1),
    ('56789012345', 'Marcelo Gomes', 'Masculino', 30, 4),
    ('67890123456', 'Larissa Monteiro', 'Feminino', 27, 5);


INSERT INTO voluntario (nome, idade, funcao, cpf, id_ong)
VALUES 
    ('Carlos Mendes', 40, 'Saude', '45678901234', 1),
    ('Maria Oliveira', 38, 'Correios', '56789012345', 2),
    ('Joaquim Silva', 55, 'Corpo de Bombeiros', '67890123456', 3),
    ('Ana Costa', 32, 'Resgate de Animais', '78901234567', 4),
    ('Lucas Souza', 25, 'Distribuir Comida', '89012345678', 5),
    ('Fernanda Gomes', 28, 'Educação', '90123456789', 1),
    ('Pedro Santos', 35, 'Construção Civil', '01234567890', 2),
    ('Camila Lima', 30, 'Logística', '12345678901', 3),
    ('Paulo Ferreira', 29, 'Psicologia', '23456789012', 4),
    ('Juliana Rocha', 33, 'Saude', '34567890123', 5),
    ('Rodrigo Almeida', 27, 'Correios', '45678901234', 1),
    ('Aline Martins', 31, 'Corpo de Bombeiros', '56789012345', 3),
    ('Gustavo Vieira', 26, 'Resgate de Animais', '67890123456', 4),
    ('Beatriz Ribeiro', 24, 'Distribuir Comida', '78901234567', 5),
    ('Thiago Barros', 36, 'Educação', '89012345678', 3),
    ('Luiza Araújo', 28, 'Construção Civil', '90123456789', 4),
    ('Vinícius Carvalho', 30, 'Logística', '01234567890', 3),
    ('Mariana Fonseca', 32, 'Psicologia', '12345678901', 2),
    ('Eduardo Mendes', 34, 'Saude', '23456789012', 1),
    ('Tatiana Cardoso', 37, 'Correios', '34567890123', 2);



-- Sessão para todas as consultas das tabelas

SELECT * FROM endereco;

SELECT * FROM doacao;

SELECT * FROM ong;

SELECT * FROM abrigo;

SELECT * FROM vitima;

SELECT * FROM voluntario;

-- CRIAÇÃO DE GRAFICOS

-- Gil Maik
SELECT tipo, SUM(quantidade) AS quantidade_total
FROM doacao
GROUP BY tipo;


--Gil
SELECT
  abrigo.nome AS Nome,
  abrigo.capacidade AS Capacidade
FROM abrigo
ORDER BY abrigo.capacidade;

--Gil
SELECT
  abrigo.nome AS Nome,
  (abrigo.capacidade - (SELECT SUM(vitima.idade) FROM vitima WHERE vitima.id_abrigo = abrigo.id_abrigo)) AS Vagas
FROM abrigo
LEFT JOIN vitima ON vitima.id_abrigo = abrigo.id_abrigo
GROUP BY abrigo.id_abrigo, abrigo.nome, abrigo.capacidade;




-- Felipe
SELECT
  voluntario.nome AS Nome,
  voluntario.idade AS Idade
FROM voluntario
ORDER BY voluntario.idade;


--Gabriel
SELECT
  voluntario.nome AS Nome,
  voluntario.idade
  FROM voluntario
  LEFT JOIN voluntario ON voluntario.id_voluntario = voluntario.id_voluntario;


--Gabriel
SELECT 
  abrigo.nome AS Nome_Abrigo,
  COUNT(voluntario.id_voluntario) AS Quantidade_Voluntarios
FROM abrigo
LEFT JOIN ong ON abrigo.id_ong = ong.id_ong
LEFT JOIN voluntario ON ong.id_ong = voluntario.id_ong
GROUP BY abrigo.nome;

--Gabriel
SELECT genero, COUNT(id_vitima) AS quantidade_vitimas
FROM vitima
GROUP BY genero;

-- Andrey
SELECT nome, count(*) FROM ong GROUP BY nome;

SELECT projeto, COUNT(id_doacao) AS total_doacoes
FROM ong
GROUP BY projeto;

SELECT nome, COUNT(projeto) AS num_projetos
  FROM ong
  GROUP BY nome
  ORDER BY num_projetos DESC
  LIMIT 5;
