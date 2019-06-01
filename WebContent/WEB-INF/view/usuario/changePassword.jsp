<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Modificar Senha do Usuário</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />

</head>

<body>

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><strong> USUÁRIO - MODIFICAR SENHA </strong></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                        	<form role="form" action="changePassword" method="post">
                            	<div class="row">
                                 
                                 	<c:if test="${mensagem ne null}">
                                 		<div class="${tipoMensagem}">
                                 			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
											${mensagem}
										</div>
									</c:if>
									
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
									<div class="col-lg-12">
										<div class="form-group">
											<label>E-mail: </label> ${usuarioLogado.email}
										</div>
									</div>
									
									<div class="col-lg-6">
                                     	<div class="form-group">
                                   			<label>Senha Atual</label>
                                   			<input type="password" class="form-control" name="senhaAtual" required="required" maxlength="50">	
                                      	</div>
                                 	</div>
								</div>
								
								<!-- /.row (nested) -->
                            	<div class="row">
                                 	
                                 	<div class="col-lg-6">
                                     	<div class="form-group">
                                   			<label>Nova Senha</label>
                                   			<input type="password" class="form-control" name="novaSenha" required="required" maxlength="50">	
                                      	</div>
                                 	</div>
                                 	
                                 	<div class="col-lg-6">
                                     	<div class="form-group">
                                   			<label>Confirme a Senha</label>
                                   			<input type="password" class="form-control" name="confirmaSenha" required="required" maxlength="50">	
                                      	</div>
                                 	</div>
                                    
                                 	<div class="col-lg-12"> &nbsp; </div>

									<div class="col-lg-12" style="text-align: right;">
                                    	<button type="reset" id="btLimpar" class="btn btn-default">Limpar</button> &nbsp;
                                      	<button type="submit" id="btSalvar" class="btn btn-primary">Salvar</button>
									</div>
                            	</div>
                            	<!-- /.row (nested) -->
                            </form>
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