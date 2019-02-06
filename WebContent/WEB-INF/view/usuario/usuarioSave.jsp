<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Manter Usuário</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/maskedinput.js"></script>

	<script type="text/javascript">

		$(document).ready(function() {
			
	       	$("#fone").mask("(99) 9 9999.9999");
	    	
	    	$("#btNovo").click(function() {
	    		window.location="<%=request.getContextPath()%>/usuario/add";
			});
	    	
			$("#btEdit").click(function() {
	    		window.location="<%=request.getContextPath()%>/usuario/edit?id="+$('#idUsuario').val();
			});
	    	
			$("#btCancelar").click(function() {
	    		window.location="<%=request.getContextPath()%>/usuario/list";
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
                    <h3 class="page-header"><strong> MANTER USUÁRIO </strong></h3>
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
                        		<button type="button" class="btn btn-warning" id="btEdit"> Editar </button>
                        	</c:if>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                
								<form role="form" action="${operacao}" method="post">
                                 
                                 	<c:if test="${operacao ne 'save'}">
                                 		<input type="hidden" name="id" id="idUsuario" value="${usuario.id}">
                                 	</c:if>
                                 
                                 	<c:if test="${mensagem ne null}">
                                 		<div class="alert alert-success alert-dismissible">
                                 			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
											${mensagem}
										</div>
									</c:if>
                                 
                                  	<div class="col-lg-12">
                                    	<div class="form-group">
                                        	<label>Nome</label>
                                         	<input class="form-control" name="nome" id="nome" value="${usuario.nome}" required="required">
                                      	</div>
									</div>
                                     
                                    <div class="col-lg-6">
                                    	<div class="form-group">
                                        	<label>Tipo</label>
                                          	<select id="tipo" name="tipo" class="form-control">
												<option value=""> Selecione </option>
												<c:forEach items="${listaTipoUsuario}" var="obj">
													<option value="${obj.id}" <c:if test="${obj.id eq usuario.tipo.id}">selected="selected"</c:if>> ${obj.descricao} </option>
												</c:forEach> 
											</select>
                                      	</div>
									</div>
							
									<div class="col-lg-6">
                                     	<div class="form-group">
                                        	<label>SIAPE</label>
                                          	<input class="form-control" name="siape" id="siape" value="${usuario.siape}" required="required">
                                      	</div>
                                    </div>
                                     
                                    <div class="col-lg-6">
                                     	<div class="form-group">
                                         	<label>Fone</label>
                                         	<input class="form-control" name="fone" id="fone" value="${usuario.fone}" required="required">
										</div>
                                    </div>
                                     
                                     <div class="col-lg-6">
                                     	<div class="form-group">
                                         	<label>E-mail</label>
                                         	<input class="form-control" name="email" id="email" value="${usuario.email}" required="required">
                                    	</div>
									</div>
									
									<div class="col-lg-6">
                                    	<div class="form-group">
                                         	<label>Login</label>
                                         	<input class="form-control" name="login" id="login" value="${usuario.login}" required="required">
                                    	</div>
                                    </div>
                                     
                                    <div class="col-lg-6">
                                     	<div class="form-group">
                                        	<label>Senha</label>
                                          	<input type="password" class="form-control" name="senha" id="senha" value="${usuario.senha}" required="required">
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
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>
</html>