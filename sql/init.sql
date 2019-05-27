INSERT INTO TipoUsuario (id, habilitado, descricao) VALUES (1, true, 'Administrador');
INSERT INTO TipoUsuario (id, habilitado, descricao) VALUES (2, true, 'Operador');
INSERT INTO TipoUsuario (id, habilitado, descricao) VALUES (3, true, 'Avaliador');

INSERT INTO Usuario (id, avaliacoesRealizadas, email, fone, nome, senha, siape, tipo_id) VALUES (1, 'roberto.alencar@jaboatao.ifpe.edu.br', '(81) 9 8888.0582', 'Roberto Luiz Sena de Alencar', '202CB962AC59075B964B07152D234B70', '2168887', 1);