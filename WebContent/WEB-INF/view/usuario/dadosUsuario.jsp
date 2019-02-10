<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Dados do Usuário</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />

	<script type="text/javascript">

		$(document).ready(function() {
			
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
                    <h3 class="page-header"><strong> DADOS DO USUÁRIO </strong></h3>
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
									
									<div class="col-lg-12"> &nbsp; </div>
									
								</div>
								
								<!-- /.row (nested) -->
                            	<div class="row">
									<div class="col-lg-6">
										<button type="button" class="btn btn-danger" id="btCancelar">Cancelar</button> &nbsp;
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