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