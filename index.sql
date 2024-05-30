CREATE DATABASE amanhaSolidario;

use amanhaSolidario;

create table endereco(
	cep int primary key not null,
    rua varchar(255),
    municipio varchar(255),
    bairro varchar(255),
    lati decimal(10,8),
    longi decimal(11,8)
);

create table doacao (
  id_doacao INT PRIMARY KEY NOT NULL,
  quantidade INT NOT NULL,
  tipo VARCHAR(25) NOT NULL,
  data_recebimento date NOT NULL
);

CREATE TABLE ong (
  id_ong INT PRIMARY KEY NOT NULL,
  cep INT,
  projeto VARCHAR(255),
  id_doacao INT,
  nome VARCHAR(255),
  gestor VARCHAR(255),
  FOREIGN KEY (cep) REFERENCES endereco(cep),
  FOREIGN KEY (id_doacao) REFERENCES doacao(id_doacao)
);

CREATE TABLE abrigo (
  id_abrigo INTEGER PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cep CHAR(8),
  capacidade INTEGER NOT NULL,
  gestor VARCHAR(255) NOT NULL

);


CREATE TABLE vitima (
  id_vitima INT AUTO_INCREMENT PRIMARY KEY,
  cpf BIGINT,
  nome VARCHAR(255) NOT NULL,
  genero VARCHAR(255) NOT NULL,
  idade INT,
  id_abrigo INTEGER,
  FOREIGN KEY (id_abrigo) REFERENCES abrigo(id_abrigo)
);

insert into endereco (cep, rua, municipio, bairro, lati, longi)
	values (12345678, 'Rua das Flores', 'São Paulo', 'Centro', -23.55052, -46.633308),
		   (87654321, 'Avenida Brasil', 'Rio de Janeiro', 'Copacabana', -22.971089, -43.185997),
		   (45678912, 'Rua 25 de Março', 'São Paulo', 'Brás', -23.541183, -46.629035),
		   (98765432, 'Rua Oscar Freire', 'São Paulo', 'Jardins', -23.566501, -46.667672),
           (65432198, 'Avenida Paulista', 'São Paulo', 'Bela Vista', -23.561268, -46.655503);

INSERT INTO doacao (id_doacao, quantidade, tipo, data_recebimento)
VALUES
    (1, 10, 'Alimento', '2024-05-26'),
    (2, 5, 'Roupa', '2024-05-16'),
    (3, 20, 'Alimento', '2024-05-01'),
    (4, 15, 'Alimento', '2024-04-24'),
    (5, 8, 'Roupa', '2024-04-11');

insert into  ong (id_ong, cep, projeto, id_doacao, nome, gestor)
values
  (1, 12345678, 'Projeto Alimentar', 1, 'ONG Alegria', 'João Silva'),
  (2, 87654321, 'Projeto Vestir', 2, 'ONG Esperança', 'Maria Souza'),
  (3, 45678912, 'Projeto Nutrir', 3, 'ONG Solidariedade', 'Carlos Pereira'),
  (4, 98765432, 'Projeto Educação', 4, 'ONG Futuro', 'Ana Lima'),
  (5, 65432198, 'Projeto Incluir', 5, 'ONG Inclusão', 'Paulo Santos');


insert into abrigo (id_abrigo, nome, cep, capacidade, gestor)
values
    (1, 'Abrigo Soledade', '12344321', 50, 'Gil Maik'),
    (2, 'Abrigo Bosque da Paz', '43211234', 70, 'Andrey Justino'),
    (3, 'Abrigo Viladouro', '87654321', 75, 'Kaique Alexandre'),
    (4, 'Abrigo Bom Viver', '12345678', 60, 'Felipe Pires'),
    (5, 'Abrigo Amanhã Melhor', '81726354', 50, 'Gabriel Santos');



SELECT * FROM endereco;

SELECT * FROM doacao;

SELECT * FROM ong