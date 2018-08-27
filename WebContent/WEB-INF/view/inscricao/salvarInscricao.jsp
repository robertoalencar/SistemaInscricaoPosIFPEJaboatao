<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>P�s Gradua��o - Salvar Inscri��o</title>

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
	    	
			$("#btCancelar").click(function() {
	    		
	    		window.location="<%=request.getContextPath()%>/home";
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
                    <h3 class="page-header"><strong> NOVA INSCRI��O </strong></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: right;">
                            <button type="button" class="btn btn-info" id="btNovo"> Novo </button>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                
                                    <form role="form" action="save" method="post">
                                    
                                    	<c:if test="${mensagem ne null}">
                                    		<div class="alert alert-success alert-dismissible">
                                    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
												${mensagem}
											</div>
										</c:if>
                                    
                                    	<div class="form-group">
                                            <label>N�mero de Inscri��o</label>
                                            <input class="form-control" name="numero" readonly="readonly" value="${numeroInscricao}">
                                            <p class="help-block">Campo preenchido automaticamente pelo sistema.</p>
                                        </div>
                                    
                                        <div class="form-group">
                                            <label>Nome</label>
                                            <input class="form-control" name="nome" placeholder="Informe o nome completo do candidato." value="${candidato.nome}" required="required">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>CPF</label>
                                            <input class="form-control" name="cpf" id="cpf" value="${candidato.cpf}" required="required">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Sexo</label>
                                            <div class="radio">
                                                <label><input type="radio" name="sexo" value="Masculino" <c:if test="${candidato.sexo eq 'Masculino'}"> checked="checked" </c:if> required="required">Masculino</label>
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" name="sexo" value="Feminino" <c:if test="${candidato.sexo eq 'Feminino'}"> checked="checked" </c:if>>Feminino</label>
                                            </div>
                                            <div class="radio">
                                                <label><input type="radio" name="sexo" value="Outro" <c:if test="${candidato.sexo eq 'Outro'}"> checked="checked" </c:if>>Outro</label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Data de Nascimento</label>
                                            <input class="form-control" name="dataNacimento" id="dataNacimento" value="<fmt:formatDate value='${candidato.dataNacimento}' pattern='dd/MM/yyyy' />" required="required">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>E-mail</label>
                                            <input class="form-control" name="email" value="${candidato.email}" required="required">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Fone Residencial:</label>
                                            <input class="form-control" name="foneResidencial" id="foneResidencial" value="${candidato.foneResidencial}" required="required">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Fone Celular:</label>
                                            <input class="form-control" name="foneCelular" id="foneCelular" value="${candidato.foneCelular}" required="required">
                                        </div>

										<div class="panel-footer" style="text-align: right;">
											<button type="button" class="btn btn-danger" id="btCancelar">Cancelar</button> &nbsp;
                                        	<button type="reset" class="btn btn-default">Limpar</button> &nbsp;
                                        	<button type="submit" class="btn btn-success">Salvar</button>
                                        </div>
                                        
                                    </form>
                                    
                                </div>
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