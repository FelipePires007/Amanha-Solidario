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
CREATE TABLE doacao (
  id_doacao INT PRIMARY KEY NOT NULL,
  quantidade INT NOT NULL,
  tipo CHAR(1) NOT NULL,
  data_recebimento date NOT NULL
);


insert into endereco (cep, rua, municipio, bairro, lati, longi)
	values (12345678, 'Rua das Flores', 'São Paulo', 'Centro', -23.55052, -46.633308),
		   (87654321, 'Avenida Brasil', 'Rio de Janeiro', 'Copacabana', -22.971089, -43.185997),
		   (45678912, 'Rua 25 de Março', 'São Paulo', 'Brás', -23.541183, -46.629035),
		   (98765432, 'Rua Oscar Freire', 'São Paulo', 'Jardins', -23.566501, -46.667672),
           (65432198, 'Avenida Paulista', 'São Paulo', 'Bela Vista', -23.561268, -46.655503);

SELECT * FROM endereco;