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
  tipo CHAR NOT NULL,
  data_recebimento date NOT NULL
);


insert into endereco (cep, rua, municipio, bairro, lati, longi)
	values (12345678, 'Rua das Flores', 'São Paulo', 'Centro', -23.55052, -46.633308),
		   (87654321, 'Avenida Brasil', 'Rio de Janeiro', 'Copacabana', -22.971089, -43.185997),
		   (45678912, 'Rua 25 de Março', 'São Paulo', 'Brás', -23.541183, -46.629035),
		   (98765432, 'Rua Oscar Freire', 'São Paulo', 'Jardins', -23.566501, -46.667672),
           (65432198, 'Avenida Paulista', 'São Paulo', 'Bela Vista', -23.561268, -46.655503);


insert into doacao (id_doacao, quantidade, tipo, data_recebimento)
values
           (1, 10, 'Alimento', '26-05-2024'),
           (2, 5, 'Roupa', '16-05-2024'),
           (3, 20, 'Alimento', '01-05-2024'),
           (4, 15, 'Alimento', '24-04-2024'),
           (5, 8, 'Roupa', '11-04-2024');


SELECT * FROM endereco;
SELECT * FROM doacao;