<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Inscri��o P�s Gradua��o</title>

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
                    <h3 class="page-header"><strong> Sele��o de Discentes dos Cursos de P�s-gradua��o do Campus Jaboat�o dos Guararapes </strong></h3>
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
									<th style="width: 35%; vertical-align: middle; text-align: center;">Per�odo</th>
									<th style="width: 15%; vertical-align: middle; text-align: center;">Status</th>
							    </tr>
							</thead>
							<tbody>
								<tr>
									<td style="vertical-align: middle;">Elabora��o do Edital</td>
									<td style="vertical-align: middle; text-align: center;">02/01/19 - 29/03/19</td>
									<td style="vertical-align: middle; text-align: center;">OK</td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Aprova��o do Edital (Reitoria)</td>
									<td style="vertical-align: middle; text-align: center;">01/04/19 - 31/05/19</td>
									<td style="vertical-align: middle; text-align: center;">OK</td>
						    	</tr>
						    	<tr style="background-color: #F5A9A9;">
									<td style="vertical-align: middle;">Divulga��o do Edital</td>
									<td style="vertical-align: middle; text-align: center;">04/06/19 - 14/06/19</td>
									<td style="vertical-align: middle; text-align: center;">Em andamento</td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Per�odo de Inscri��es</td>
									<td style="vertical-align: middle; text-align: center;">17/06/19 - 05/07/19</td>
									<td style="vertical-align: middle; text-align: center;"></td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Per�odo de Avalia��o dos Candidatos (comiss�o de sele��o)</td>
									<td style="vertical-align: middle; text-align: center;">18/06/19 - 19/07/19</td>
									<td style="vertical-align: middle; text-align: center;"></td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Divulga��o do Resultado Preliminar</td>
									<td style="vertical-align: middle; text-align: center;">31/07/19</td>
									<td style="vertical-align: middle; text-align: center;"></td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Interposi��o de Recurso</td>
									<td style="vertical-align: middle; text-align: center;">02/08/19</td>
									<td style="vertical-align: middle; text-align: center;"></td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Divulga��o do Resultado Final</td>
									<td style="vertical-align: middle; text-align: center;">14/08/19</td>
									<td style="vertical-align: middle; text-align: center;"></td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Matr�cula dos(as) Aprovados(as)</td>
									<td style="vertical-align: middle; text-align: center;">19/08/19 - 21/08/19</td>
									<td style="vertical-align: middle; text-align: center;"></td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Divulga��o dos(as) Reclassificados(as)</td>
									<td style="vertical-align: middle; text-align: center;">23/08/19</td>
									<td style="vertical-align: middle; text-align: center;"></td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Matr�cula dos(as) Reclassificados(as)</td>
									<td style="vertical-align: middle; text-align: center;">27/08/19 - 28/08/19</td>
									<td style="vertical-align: middle; text-align: center;"></td>
						    	</tr>
						    	<tr>
									<td style="vertical-align: middle;">Aula Inaugural e in�cio das aulas</td>
									<td style="vertical-align: middle; text-align: center;">01/10/19</td>
									<td style="vertical-align: middle; text-align: center;"></td>
						    	</tr>
							</tbody>
						</table>
						
						<div style="color: #0080FF; margin-bottom: 3%; font-size: 16px;"><strong> Edital: </strong></div>
						
					</div>	
				</div>
			</div>
		</div>
	</div>

</body>
</html>
