drop table inscricao;
drop table candidato;

CREATE TABLE candidato (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	habilitado boolean,
	nome varchar(100),
	cpf varchar(50),
	sexo varchar(50),
	dataNacimento date,
	email varchar(100),
	foneResidencial varchar(50),
	foneCelular varchar(50)
);

CREATE TABLE inscricao (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	candidato_id int,
	habilitado boolean,
	numero varchar(20),
	classificacao int,
	dataInscricao date
);

ALTER TABLE inscricao ADD CONSTRAINT fk_candidato_inscricao FOREIGN KEY (candidato_id) REFERENCES candidato(id);
