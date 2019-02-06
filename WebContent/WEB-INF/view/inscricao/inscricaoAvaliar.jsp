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
			
			$("#cpf").mask("999.999.999-99");
	       	$("#foneResidencial").mask("(99) 9999.9999");
	    	$("#foneCelular").mask("(99) 9 9999.9999");
	    	$("#dataNacimento").mask("99/99/9999");
	    	
	    	$("#btNovo").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/add";
			});
	    	
			$("#btEdit").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/edit?id="+$('#idInscricao').val();
			});
	    	
			$("#btCancelar").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/list";
			});
	    	
		});
	
	</script>

</head>

<body>

	<c:if test="${operacao eq 'view'}">
	
		<script type="text/javascript">

			$(document).ready(function() {
				$("input").prop("disabled", true);
				$("#btLimpar").prop("disabled", true);
				$("#btSalvar").prop("disabled", true);
			});
		
		</script>
		
	</c:if>

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
											<label>Número de Inscrição</label> 
											<input class="form-control" name="numero" readonly="readonly" value="${inscricao.numero}">
										</div>
									</div>

									<div class="col-lg-12">
										<div class="form-group">
											<label>Nome</label> 
											<input class="form-control" name="nome" id="nome" placeholder="Informe o nome completo do candidato." value="${inscricao.candidato.nome}" readonly="readonly">
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>CPF</label> 
											<input class="form-control" name="cpf" id="cpf" value="${inscricao.candidato.cpf}" readonly="readonly">
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>E-mail</label> 
											<input class="form-control" name="email" id="email" value="${inscricao.candidato.email}" readonly="readonly">
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>Fone Residencial:</label> 
											<input class="form-control" name="foneResidencial" id="foneResidencial" value="${inscricao.candidato.foneResidencial}" readonly="readonly">
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>Fone Celular:</label> 
											<input class="form-control" name="foneCelular" id="foneCelular" value="${inscricao.candidato.foneCelular}" readonly="readonly">
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>Data de Nascimento</label> 
											<input class="form-control" name="dataNacimento" id="dataNacimento" value="<fmt:formatDate value='${inscricao.candidato.dataNacimento}' pattern='dd/MM/yyyy' />" readonly="readonly">
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group">
											<label>Sexo</label>
											<div class="radio">
												<label><input type="radio" name="sexo" id="sexo"
													value="Masculino"
													<c:if test="${inscricao.candidato.sexo eq 'Masculino'}"> checked="checked" </c:if>
													readonly="readonly">Masculino</label> <label><input
													type="radio" name="sexo" id="sexo" value="Feminino"
													<c:if test="${inscricao.candidato.sexo eq 'Feminino'}"> checked="checked" </c:if>
													readonly="readonly">Feminino</label> <label><input
													type="radio" name="sexo" id="sexo" value="Outro"
													<c:if test="${inscricao.candidato.sexo eq 'Outro'}"> checked="checked" </c:if>
													readonly="readonly">Outro</label>
											</div>
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
									<div class="col-lg-12">
										<div class="form-group">
											<label>Nome</label> 
											<input class="form-control" name="numero" readonly="readonly" value="${inscricao.numero}">
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
                        <div class="panel-heading" style="text-align: right;">
                        	<c:if test="${operacao ne 'save'}">
                        		<button type="button" class="btn btn-warning" id="btEdit"> Editar </button>  &nbsp;
                        	</c:if>
                            <button type="button" class="btn btn-info" id="btNovo"> Novo </button>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                
								
								
								
								
								
								
								
								
                                    
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