INSERT INTO TipoUsuario (id, descricao) VALUES (1, 'Administrador');
INSERT INTO TipoUsuario (id, descricao) VALUES (2, 'Avaliador');
INSERT INTO TipoUsuario (id, descricao) VALUES (3, 'Operador');

INSERT INTO Usuario (id, avaliacoesRealizadas, email, fone, nome, senha, siape, tipo_id) VALUES (1, 0, 'roberto.alencar@jaboatao.ifpe.edu.br', '(81) 9 8888.0582', 'Roberto Luiz Sena de Alencar', '202CB962AC59075B964B07152D234B70', '2168887', 1);

INSERT INTO AtividadeCronograma (id, atividade, periodo, status) VALUES (1, 'Inscrição Online', '04/07/2022 - 24/07/2022', 'Em Andamento');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (2, 'Realização da Banca de Heteroidentificação (presencial)', '26/07/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (3, 'Divulgação do Resultado preliminar de Heteroidentificação (online)', '28/07/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (4, 'Interposição de Recurso de Heteroidentificação (online)', '29/07/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (5, 'Divulgação do Resultado Final da Heteroidentificação (online)', '02/08/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (6, 'Divulgação do Resultado Preliminar do Processo Seletivo (online)', '12/08/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (7, 'Interposição de Recurso (online))', '15/08/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (8, 'Divulgação do Resultado Final do Processo Seletivo (online)', '18/08/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (9, 'Matrícula dos(as) Aprovados(as) (presencial)', '22/08/2022 - 23/08/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (10, 'Divulgação dos(as) Reclassificados(as) (online)', '25/08/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (11, 'Matrícula dos(as) Reclassificados(as)(presencial)', '26/08/2022');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (12, 'Aula Inaugural e início das aulas (presencial)', '14/09/2022');