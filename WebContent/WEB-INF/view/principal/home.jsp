<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Inscrição Pós Graduação</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />


	<script type="text/javascript">
	
		$(document).ready(function() {

			$.post("atualizarDadosSelecao", function(dados) { });
		});
		
	</script>

</head>

<body>

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

		<div id="page-wrapper">
        
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><strong> Seleção de Discentes dos Cursos de Pós-graduação do Campus Jaboatão dos Guararapes </strong></h3>
                </div>
            </div>
            <!-- /.row -->
            
            <div class="row">
				 
				 <div class="col-lg-12">

                 	<div class="panel-body">
                 	
                 		<c:if test="${mensagem ne null}">
							<div class="alert alert-error">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								${mensagem}
							</div>
						</c:if>
	                            	
	                	<div style="color: #0080FF; margin-bottom: 3%; font-size: 16px;"><strong> Cronograma: </strong></div>
	                	
	                    <table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th style="width: 50%; vertical-align: middle; text-align: center;">Atividade</th>
									<th style="width: 35%; vertical-align: middle; text-align: center;">Período</th>
									<th style="width: 15%; vertical-align: middle; text-align: center;">Status</th>
							    </tr>
							</thead>
							<tbody>
								<c:forEach var="atividadeCronograma" items="${listaAtividadesCronograma}">
								
									<c:choose>
									<c:when test="${atividadeCronograma.status eq 'Em Andamento'}">
										<tr style="background-color: #F5A9A9;">
									</c:when>
									<c:otherwise>
										<tr>
									</c:otherwise>
									</c:choose>
									
										<td style="vertical-align: middle;">${atividadeCronograma.atividade}</td>
										<td style="vertical-align: middle; text-align: center;">${atividadeCronograma.periodo}</td>
										<td style="vertical-align: middle; text-align: center;">${atividadeCronograma.status}</td>
						    		</tr>
								
								</c:forEach>
							</tbody>
						</table>
						
						<div class="row">
                			<div class="col-lg-12">
								<div style="color: #0080FF; margin-top: 2%; font-size: 16px;"><strong> Edital: </strong></div>
							</div>
						</div>
						
						<div class="row"><div class="col-lg-12">&nbsp;</div></div>
						<div class="row"><div class="col-lg-12">&nbsp;</div></div>
						
						<div class="row">
                			<div class="col-lg-12">
                				<a href="<%=request.getContextPath()%>/resources/EditalSeleção2019.pdf" target="_blank">
                    				<img src="<%=request.getContextPath()%>/resources/img/iconePDF.png" style="width: 10%;">
                    			</a>
                			</div>
            			</div>
            			
            			<div class="row"><div class="col-lg-12">&nbsp;</div></div>
            			<div class="row"><div class="col-lg-12">&nbsp;</div></div>
						
					</div>	
				</div>
			</div>
		</div>
	</div>

</body>
</html>
