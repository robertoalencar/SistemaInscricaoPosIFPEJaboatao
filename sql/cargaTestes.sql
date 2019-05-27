
INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (8, '049.213.714-58', '1986-02-08', 'Rodrigo Gomes de Souza Costa', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (8, 'Inovacao', current_timestamp(), '0008', 8);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (9, true, current_timestamp(), true, 8.91, 'VCG', 1, 8);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (9, '044.940.654-71', '1984-10-03', 'Gleidon Sales de Araújo', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (9, 'Inovacao', current_timestamp(), '0009', 9);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (10, true, current_timestamp(), true, 7.93, 'PPI', 1, 9);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (10, '095.886.284-23', '1992-06-26', 'Adriana Luz da Rocha Castro', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (10, 'Gestao', current_timestamp(), '0010', 10);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (11, true, current_timestamp(), true, 7.72, 'VCG', 1, 10);

--------------------------

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (11, '085.432.974-94', '1992-10-07', 'Vandson Tenório de Oliveira Araújo', 'Feminino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (11, 'Gestao', current_timestamp(), '0011', 11);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (12, true, current_timestamp(), true, 7.99, 'VCG', 1, 11);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (12, '050.425.104-00', '1985-07-16', 'José Diego da Silva Xavier', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (12, 'Inovacao', current_timestamp(), '0012', 12);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (13, true, current_timestamp(), true, 10.41, 'PPI', 1, 12);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (13, '074.272.624-09', '1988-08-19', 'Anderson Felipe de Melo Rocha', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (13, 'Inovacao', current_timestamp(), '0013', 13);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (14, true, current_timestamp(), true, 8.87, 'VCG', 1, 13);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (14, '026.566.684-84', '1977-07-28', 'Eduardo Soares Bezerra', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (14, 'Gestao', current_timestamp(), '0014', 14);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (15, true, current_timestamp(), true, 8.23, 'VCG', 1, 14);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (15, '037.888.544-80', '1979-10-22', 'Carlos Fernando Araújo Matos', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (15, 'Inovacao', current_timestamp(), '0015', 15);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (16, true, current_timestamp(), true, 2.10, 'VCG', 1, 15);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (16, '071.509.084-46', '1988-12-17', 'Ivson Pereira da Silva', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (16, 'Inovacao', current_timestamp(), '0016', 16);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (17, true, current_timestamp(), true, 9.09, 'VCG', 1, 16);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (17, '081.061.134-18', '1990-08-06', 'José Elcio Costa da Silva', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (17, 'Gestao', current_timestamp(), '0017', 17);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (18, true, current_timestamp(), true, 8.68, 'VCG', 1, 17);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (18, '025.906.044-59', '1979-01-26', 'Valmir Romariz dos Santos Junior', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (18, 'Gestao', current_timestamp(), '0018', 18);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (19, true, current_timestamp(), true, 8.09, 'PPI', 1, 18);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (19, '046.048.914-35', '1981-10-05', 'Célia Regina Pereira Soares', 'Feminino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (19, 'Gestao', current_timestamp(), '0019', 19);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (20, true, current_timestamp(), true, 5.22, 'VCG', 1, 19);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (20, '045.166.444-28', '1981-12-11', 'Catarina Lessa de Carvalho', 'Feminino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (20, 'Inovacao', current_timestamp(), '0020', 20);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (21, true, current_timestamp(), true, 8.33, 'VCG', 1, 20);

INSERT INTO Candidato (id, cpf, dataNascimento, nome, sexo) 
VALUES (22, '034.848.614-60', '1976-05-26', 'Rinaldo Celestino dos Reis', 'Masculino');
INSERT INTO Inscricao (id, cursoEscolhido, dataInscricao, numero, candidato_id) 
VALUES (22, 'Gestao', current_timestamp(), '0059', 22);
INSERT INTO Avaliacao(id, aprovada, dataAvaliacao, documentacaoCompleta, notaFinal, tipoVaga, avaliador_id, inscricao_id) 
VALUES (23, true, current_timestamp(), true, 5.64, 'VCG', 1, 22);





