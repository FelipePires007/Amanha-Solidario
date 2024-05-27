CREATE DATABASE amanhaSolidario

create table endereco(
	cep int primary key not null,
    rua varchar(255),
    municipio varchar(255),
    bairro varchar(255),
    lati decimal(10,8),
    longi decimal(11,8)
);


