INSERT INTO TipoUsuario (id, descricao) VALUES (1, 'Administrador');
INSERT INTO TipoUsuario (id, descricao) VALUES (2, 'Avaliador');
INSERT INTO TipoUsuario (id, descricao) VALUES (3, 'Operador');

INSERT INTO Usuario (id, avaliacoesRealizadas, email, fone, nome, senha, siape, tipo_id) VALUES (1, 0, 'roberto.alencar@jaboatao.ifpe.edu.br', '(81) 9 8888.0582', 'Roberto Luiz Sena de Alencar', '202CB962AC59075B964B07152D234B70', '2168887', 1);

INSERT INTO AtividadeCronograma (id, atividade, periodo, status) VALUES (1, 'Elaboração do Edital', '02/01/19 - 29/03/19', 'OK');
INSERT INTO AtividadeCronograma (id, atividade, periodo, status) VALUES (2, 'Aprovação do Edital (Reitoria)', '01/04/19 - 31/05/19', 'OK');
INSERT INTO AtividadeCronograma (id, atividade, periodo, status) VALUES (3, 'Divulgação do Edital', '04/06/19 - 14/06/19', 'Em Andamento');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (4, 'Período de Inscrições', '17/06/19 - 05/07/19');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (5, 'Período de Avaliação dos Candidatos (comissão de seleção)', '18/06/19 - 19/07/19');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (6, 'Divulgação do Resultado Preliminar', '31/07/19');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (7, 'Interposição de Recurso', '02/08/19');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (8, 'Divulgação do Resultado Final', '14/08/19');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (9, 'Matrícula dos(as) Aprovados(as)', '19/08/19 - 21/08/19');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (10, 'Divulgação dos(as) Reclassificados(as)', '23/08/19');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (11, 'Matrícula dos(as) Reclassificados(as)', '27/08/19 - 28/08/19');
INSERT INTO AtividadeCronograma (id, atividade, periodo) VALUES (12, 'Aula Inaugural e início das aulas', '01/10/19');

