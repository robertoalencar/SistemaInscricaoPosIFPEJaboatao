INSERT INTO TipoUsuario (id, descricao) VALUES (1, 'Administrador');
INSERT INTO TipoUsuario (id, descricao) VALUES (2, 'Avaliador');
INSERT INTO TipoUsuario (id, descricao) VALUES (3, 'Operador');

INSERT INTO Usuario (id, avaliacoesRealizadas, email, fone, nome, senha, siape, tipo_id) VALUES (1, 0, 'roberto.alencar@jaboatao.ifpe.edu.br', '(81) 9 8888.0582', 'Roberto Luiz Sena de Alencar', '202CB962AC59075B964B07152D234B70', '2168887', 1);

INSERT INTO AtividadeCronograma (id, atividade, periodo, status) VALUES (1, 'Elaboração do Edital', ' - ', 'OK');
INSERT INTO AtividadeCronograma (id, atividade, periodo, status) VALUES (2, 'Aprovação do Edital (Reitoria)', ' - ', 'OK');
INSERT INTO AtividadeCronograma (id, atividade, periodo, status) VALUES (3, 'Divulgação do Edital', ' - ', 'OK');
INSERT INTO AtividadeCronograma (id, atividade, periodo, status) VALUES (4, 'Período de Inscrições', '04/01/21 - 24/01/21', 'Em Andamento');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (5, 'Período de Avaliação dos Candidatos (comissão de seleção)', '04/01/21 - 19/02/21');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (6, 'Divulgação do Resultado Preliminar', '25/02/21');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (7, 'Interposição de Recurso', '26/02/21');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (8, 'Divulgação do Resultado Final', '04/03/21');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (9, 'Matrícula dos(as) Aprovados(as)', '08/03/21 - 11/03/21');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (10, 'Divulgação dos(as) Reclassificados(as)', '15/03/21');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (11, 'Matrícula dos(as) Reclassificados(as)', '17/03/21 - 18/03/21');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (12, 'Aula Inaugural e início das aulas', '19/04/21');