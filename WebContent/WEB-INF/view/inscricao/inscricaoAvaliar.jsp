<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Avaliar Inscrição</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/maskedinput.js"></script>

	<script type="text/javascript">

		$(document).ready(function() {
			
			$("#btCancelar").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/list";
			});
	    	
		});
	
	</script>

</head>

<body>

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><strong> AVALIAR INSCRIÇÃO </strong></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">

					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#accordionCandidato">Candidato</a>
								</h4>
							</div>
							
							<div id="accordionCandidato" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="col-lg-12">
										<div class="form-group">
											<label>Número de Inscrição: </label> ${inscricao.numero}
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>Nome: </label> ${inscricao.candidato.nome} 
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>CPF: </label> ${inscricao.candidato.cpf} 
										</div>
									</div>
									
									<div class="col-lg-6">
										<div class="form-group">
											<label>Data de Nascimento: </label> <fmt:formatDate value='${inscricao.candidato.dataNacimento}' pattern='dd/MM/yyyy' /> 
										</div>
									</div>
									
									<div class="col-lg-6">
										<div class="form-group">
											<label>Sexo: </label> ${inscricao.candidato.sexo}
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>Fone Residencial: </label> ${inscricao.candidato.foneResidencial} 
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>Fone Celular: </label> ${inscricao.candidato.foneCelular} 
										</div>
									</div>

									<div class="col-lg-12">
										<div class="form-group">
											<label>E-mail: </label> ${inscricao.candidato.email} 
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#accordionAvaliador">Avaliador</a>
								</h4>
							</div>
							
							<div id="accordionAvaliador" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="col-lg-6">
										<div class="form-group">
											<label>Nome: </label> ${usuarioLogado.nome}
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label>Tipo: </label> ${usuarioLogado.tipo.descricao}
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label>SIAPE: </label> ${usuarioLogado.siape}
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label>Fone: </label> ${usuarioLogado.fone}
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label>E-mail: </label> ${usuarioLogado.email}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
					
                        <div class="panel-body">
                            <div class="row">
                            
                            	<form role="form" action="" method="post">
                            		
                            		<input type="hidden" name="idInscricao" value="${inscricao.id}">
                            		
									<div class="col-lg-12">
										<div class="form-group">
											<label>Curso Escolhido: </label> ${inscricao.cursoEscolhido}
										</div>
									</div>
                            
	                            	<div class="col-lg-12">
	                                   	<div class="form-group">
	                                    	<label>Documentação Completa</label>
	                                       	<div class="radio">
	                                         	<label><input type="radio" name="documentacaoCompleta" value="true" required="required">Sim</label> &nbsp;
	                                           	<label><input type="radio" name="documentacaoCompleta" value="false">Não</label>
	                                       	</div>
										</div>
									</div>
	                                
									<div class="col-lg-12">
	                                   	<div class="form-group">
	                                    	<label>Tipo da Vaga</label>
	                                    	<select name="tipoVaga" class="form-control" required="required">
												<option value=""> Selecione </option>
												<option value="VCG"> VCG - Vagas para concorrência geral </option>
												<option value="VPP"> VPP - Vagas para pretos e pardos </option>
												<option value="VCI"> VCI - Vagas para indígenas </option>
												<option value="PCD"> PCD - Vagas para pessoas com deficiência </option>
											</select>
										</div>
									</div>

									<div class="col-lg-12"> &nbsp; </div>

									<div class="col-lg-6">
										<button type="button" class="btn btn-danger" id="btCancelar">Cancelar</button> &nbsp;
									</div>
									
									<div class="col-lg-6" style="text-align: right;">
                                    	<button type="reset" id="btLimpar" class="btn btn-default">Limpar</button> &nbsp;
                                      	<button type="submit" id="btSalvar" class="btn btn-primary">Salvar</button>
                                    </div>
                                    
								</form>
                                    
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>
</html>