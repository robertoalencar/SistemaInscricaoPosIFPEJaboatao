drop table inscricao;
drop table candidato;
drop table tipo_usuario;
drop table usuario;
drop table avaliacao;

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
	candidatoId int,
	habilitado boolean,
	numero varchar(20),
	classificacao int,
	dataInscricao date
);

CREATE TABLE tipo_usuario (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	habilitado boolean,
	descricao varchar(50)
);

CREATE TABLE usuario (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipoUsuarioId int,
	habilitado boolean,
	nome varchar(50),
	siape varchar(50),
	login varchar(50),
	senha varchar(50),
	fone varchar(50),
	email varchar(50)
);

CREATE TABLE pontuacao (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	habilitado boolean,
	qtdCursosGraduacaoComputacao int,
	qtdCursosGraduacaoOutras int,
	qtdAtigosComputacao int,
	qtdAtigosOutras int,
	mediaGeralHistorico float,
	fatorCargaHoraria float,
	notaFinal float
);

CREATE TABLE avaliacao (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	usuarioId int,
	pontuacaoId int,
	inscricaoId int,
	habilitado boolean,
    dataConclusaoAvaliacao date,
    cursoPretendidoPrimeiraOpcao varchar(50),
    cursoPretendidoSegundoOpcao varchar(50),
    tipoVaga varchar(10),
    documentacaoCompleta boolean,
    observacoes varchar(500)
);

CREATE TABLE vinculo_empregaticio (

	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pontuacaoId int,
	habilitado boolean,
    dataInicio date,
    dataFim date,
    areaCargo varchar(250)
);

ALTER TABLE inscricao ADD CONSTRAINT fk_candidato_inscricao FOREIGN KEY (candidatoId) REFERENCES candidato(id);
ALTER TABLE usuario ADD CONSTRAINT fk_tipo_usuario_usuario FOREIGN KEY (tipoUsuarioId) REFERENCES tipo_usuario(id);
ALTER TABLE avaliacao ADD CONSTRAINT fk_inscricao_avaliacao FOREIGN KEY (inscricaoId) REFERENCES inscricao(id);
ALTER TABLE avaliacao ADD CONSTRAINT fk_usuario_avaliacao FOREIGN KEY (usuarioId) REFERENCES usuario(id);
ALTER TABLE avaliacao ADD CONSTRAINT fk_pontuacao_avaliacao FOREIGN KEY (pontuacaoId) REFERENCES pontuacao(id);
ALTER TABLE vinculo_empregaticio ADD CONSTRAINT fk_pontuacao_vinculo_empregaticio FOREIGN KEY (pontuacaoId) REFERENCES pontuacao(id);

