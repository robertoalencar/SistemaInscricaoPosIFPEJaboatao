<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Manter Inscrição</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/maskedinput.js"></script>

	<script type="text/javascript">

		$(document).ready(function() {
			
			$("#cpf").mask("999.999.999-99");
	       	$("#foneResidencial").mask("(99) 9999.9999");
	    	$("#foneCelular").mask("(99) 9 9999.9999");
	    	$("#dataNacimento").datepicker({ dateFormat: 'dd/mm/yy' });
	    	
	    	$("#btAvaliar").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/avaliar?id="+$('#idInscricao').val();
			});
	    	
	    	$("#btNovo").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/add";
			});
	    	
			$("#btEdit").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/edit?id="+$('#idInscricao').val();
			});
			
			$("#btRemove").click(function() {
	    		
				var retorno = confirm("Tem certeza que deseja excluir esse registro?");
	        	
	        	if (retorno == true) {
	        		window.location.href = "delete?id="+$('#idInscricao').val();
	        	}
	    		
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
				$("select").prop("disabled", true);
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
                    <h3 class="page-header"><strong> MANTER INSCRIÇÃO </strong></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: right;">
                            <button type="button" class="btn btn-info" id="btNovo"> Novo </button> &nbsp;
                            <c:if test="${operacao ne 'save'}">
                            	<button type="button" class="btn btn-success" id="btAvaliar"> Avaliar </button> &nbsp;
                        		<button type="button" class="btn btn-warning" id="btEdit"> Editar </button> &nbsp;
                        		<button type="button" class="btn btn-danger" id="btRemove"> Remover </button>
                        	</c:if>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                
								<form role="form" action="${operacao}" method="post">
                                 
                                 	<c:if test="${operacao ne 'save'}">
                                 		<input type="hidden" name="idInscricao" id="idInscricao" value="${inscricao.id}">
                                 		<input type="hidden" name="id" value="${inscricao.candidato.id}">
                                 	</c:if>
                                 
                                 	<c:if test="${mensagem ne null}">
                                 		<div class="alert alert-success alert-dismissible">
                                 			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
											${mensagem}
										</div>
									</c:if>
                                 
                                 	<div class="col-lg-12">
	                                  	<div class="form-group">
	                                          <label>Número de Inscrição</label>
	                                          <input class="form-control" name="numero" readonly="readonly" value="${inscricao.numero}">
	                                          <c:if test="${operacao eq 'save'}">
	                                          	<p class="help-block">Campo preenchido automaticamente pelo sistema.</p>
	                                          </c:if> 
	                                      </div>
									</div>
									
									<div class="col-lg-12">
	                                   	<div class="form-group">
	                                    	<label>Curso Escolhido<span style="color: red;"> * </span></label>
	                                    	<select name="cursoEscolhido" class="form-control" required="required">
												<option value=""> Selecione </option>
												<option value="Gestao" <c:if test="${inscricao.cursoEscolhido eq 'Gestao'}">selected="selected"</c:if>> Gestão e Qualidade em TIC </option>
												<option value="Inovacao" <c:if test="${inscricao.cursoEscolhido eq 'Inovacao'}">selected="selected"</c:if>> Desenv. Inovação e Tecnologias Emergentes </option>
											</select>
										</div>
									</div>
                                  
                                  	<div class="col-lg-12">
                                    	<div class="form-group">
                                        	<label>Nome<span style="color: red;"> * </span></label>
                                         	<input class="form-control" name="nome" id="nome" placeholder="Informe o nome completo do candidato." value="${inscricao.candidato.nome}" required="required">
                                      	</div>
									</div>
                                     
                                    <div class="col-lg-6">
                                    	<div class="form-group">
                                        	<label>CPF<span style="color: red;"> * </span></label>
                                          	<input class="form-control" name="cpf" id="cpf" value="${inscricao.candidato.cpf}" required="required">
                                      	</div>
									</div>
							
									<div class="col-lg-6">
                                     	<div class="form-group">
                                         	<label>E-mail</label>
                                         	<input type="email" class="form-control" name="email" id="email" value="${inscricao.candidato.email}">
                                    	</div>
                                    </div>
                                    
                                    <div class="col-lg-6">
                                    	<div class="form-group">
                                         	<label>Fone Residencial</label>
                                         	<input class="form-control" name="foneResidencial" id="foneResidencial" value="${inscricao.candidato.foneResidencial}">
                                    	</div>
                                    </div>
                                     
                                    <div class="col-lg-6">
                                     	<div class="form-group">
                                        	<label>Fone Celular</label>
                                          	<input class="form-control" name="foneCelular" id="foneCelular" value="${inscricao.candidato.foneCelular}">
                                      	</div>
                                 	</div>
                                     
                                    <div class="col-lg-6">
                                     	<div class="form-group">
                                         	<label>Data de Nascimento</label>
                                         	<input class="form-control" name="dataNacimento" id="dataNacimento" value="<fmt:formatDate value='${inscricao.candidato.dataNacimento}' pattern='dd/MM/yyyy' />">
										</div>
                                    </div>
                                     
                                     <div class="col-lg-6">
                                     	<div class="form-group">
                                        	<label>Sexo</label>
                                          	<div class="radio">
                                            	<label><input type="radio" name="sexo" value="Masculino" <c:if test="${inscricao.candidato.sexo eq 'Masculino'}"> checked="checked" </c:if>>Masculino</label>
                                              	<label><input type="radio" name="sexo" value="Feminino" <c:if test="${inscricao.candidato.sexo eq 'Feminino'}"> checked="checked" </c:if>>Feminino</label>
                                              	<label><input type="radio" name="sexo" value="Outro" <c:if test="${inscricao.candidato.sexo eq 'Outro'}"> checked="checked" </c:if>>Outro</label>
                                          	</div>
                                      	</div>
									</div>
									
									<div class="col-lg-12">
                                     	<div class="form-group">
                                        	<small id="passwordHelpBlock" class="form-text text-muted"><span style="color: red;"> * </span> Campos de preenchimento obrigatório.</small>
                                      	</div>
									</div>
									
                                 	<div class="col-lg-12"> &nbsp; </div>
									
									<div class="col-lg-6">
										<button type="button" class="btn btn-danger" id="btCancelar">Cancelar</button> &nbsp;
									</div>
									
									<div class="col-lg-6" style="text-align: right;">
                                    	<button type="reset" id="btLimpar" class="btn btn-default" <c:if test="${mensagem != null && operacao eq 'save'}">disabled="disabled"</c:if>>Limpar</button> &nbsp;
                                      	<button type="submit" id="btSalvar" class="btn btn-primary" <c:if test="${mensagem != null && operacao eq 'save'}">disabled="disabled"</c:if>>Salvar</button>
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
                
				<c:if test="${operacao eq 'view'}">
				
					 <div class="row">
		                <div class="col-lg-12">
		                    <h3 class="page-header"><strong> AVALIAÇÕES REALIZADAS </strong></h3>
		                </div>
		            </div>
		            
		            <c:choose>
		            	<c:when test="${listaAvaliacoes.size() == 0}">
							<div class="col-lg-12">
								<div class="form-group">
									<small id="passwordHelpBlock" class="form-text text-muted">Ainda não há avaliações realizadas para esse candidato.</small>
								</div>
							</div>
						</c:when>
						<c:otherwise>
						
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th style="width: 25%; vertical-align: middle;">Avaliador</th>
										<th style="width: 5%; vertical-align: middle; text-align: center;">Data Avaliação</th>
										<th style="width: 5%; vertical-align: middle; text-align: center;">Tipo Vaga</th>
										<th style="width: 10%; vertical-align: middle; text-align: center;">Documentação Completa?</th>
										<th style="width: 5%; vertical-align: middle; text-align: center;">Pontuação</th>
										<th style="width: 5%; vertical-align: middle; text-align: center;">Aprovada</th>
										<th style="width: 25%; vertical-align: middle; text-align: center;">Observações</th>
										<th style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
		          						</tr>
								</thead>
								<tbody>
								
									<c:forEach var="avaliacao" items="${listaAvaliacoes}">
										<tr>
											<td style="vertical-align: middle;">${avaliacao.avaliador.nome}</td>
											<td style="vertical-align: middle; text-align: center;"><fmt:formatDate value="${avaliacao.dataAvaliacao}" pattern="dd/MM/yyyy" /></td>
											<td style="vertical-align: middle; text-align: center;">${avaliacao.tipoVaga}</td>
											<td style="vertical-align: middle; text-align: center;">
												<c:choose>
													<c:when test="${avaliacao.documentacaoCompleta eq true}">Sim</c:when>
													<c:otherwise>Não</c:otherwise>
												</c:choose>
											</td>
											<td style="vertical-align: middle; text-align: center;"><strong>${avaliacao.notaFinal}</strong></td>
											<td style="vertical-align: middle; text-align: center;"><c:if test="${avaliacao.aprovada eq true}">Sim</c:if></td>
											<td style="vertical-align: middle;">${avaliacao.observacoes}</td>
											<td style="vertical-align: middle; text-align: center;">
												<a href='view?id=" + dadosJSON[i].inscricao.id + "' class='btn btn-primary' >Visualizar</a> &nbsp;
         										<a href='aprovarAvaliacao?id=${avaliacao.inscricao.id}&idAvaliacao=${avaliacao.id}' class='btn btn-success' >Aprovar</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
		      				</table>
						
						</c:otherwise>
		            </c:choose>
				
				</c:if>
                
                 <div class="row">
					<div class="col-lg-12">
						<div class="col-lg-12"> &nbsp; </div>
	                </div>
				</div>
				
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>
</html>