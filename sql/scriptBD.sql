
CREATE TABLE candidato (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	habilitado boolean,
	nome varchar(100),
	cpf varchar(50),
	sexo float,
	dataNacimento date,
	email varchar(100),
	foneResidencial varchar(50),
	foneCelular varchar(50)
	
);

CREATE TABLE inscricao (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	habilitado boolean,
	numero int,
	classificacao int,
	candidato int 
	
);

ALTER TABLE inscricao ADD CONSTRAINT fk_candidato_inscricao FOREIGN KEY (candidato) REFERENCES candidato(id);
