<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Listar Inscrições</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/maskedinput.js"></script>

	<script type="text/javascript">

		$(document).ready(function() {
			
			
	    	$("#btNovo").click(function() {
	    		
	    		window.location="<%=request.getContextPath()%>/inscricao/add";
			});
	    	
	    	
			$("#btCancelar").click(function() {
	    		
	    		window.location="<%=request.getContextPath()%>/home";
			});
			
			
			function carregaTabelaJSon() {

				var criterioOrdenacao = $('#criterioOrdenacao').val();
				var ordem = $('#ordem').val();

				$.post("filter", {
					
					'criterioOrdenacao' : criterioOrdenacao,
					'ordem' : ordem
					
				}, function(dadosJSON) {
					
					var linhas = '';
					var qtdItens = 0;
					
					$(dadosJSON).each(function (i) {
						
	                    linhas += "<tr>";

	                    var classificacao = '';
	                    if (dadosJSON[i].classificacao != undefined) {
	                    	classificacao = dadosJSON[i].classificacao;
	                    }
	                    
	                    linhas += "<td style='vertical-align: middle; text-align: center;'>" + classificacao + "</td>";
                    	linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].numero + "</td>";
                   		linhas += "<td style='vertical-align: middle;'>" + dadosJSON[i].candidato.nome + "</td>";
              			linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].dataInscricao + "</td>";
          				linhas += "<td style='vertical-align: middle; text-align: center;'>";
       					linhas += "<a href='view?id=" + dadosJSON[i].id + "' class='btn btn-primary' title='Visualizar Inscrição'>V</a> &nbsp;";
   						linhas += "<a href='edit?id=" + dadosJSON[i].id + "' class='btn btn-warning' role='button' title='Editar Inscrição'>E</a> &nbsp;";
						linhas += "<a href='delete?id=" + dadosJSON[i].id + "' class='btn btn-danger' role='button' title='Remover Inscrição'>R</a>";
						linhas += "</td>";
							
						linhas += "</tr>";
						
						qtdItens++;
	                });
					
	                $('#conteudoLista').html(linhas);
	                $('#totaLista').html(qtdItens);
				});
			}

			
			$("#criterioOrdenacao").change(function() {
				carregaTabelaJSon();
			});
			
			
			$("#ordem").change(function() {
				carregaTabelaJSon();
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
                    <h3 class="page-header"><strong> INSCRIÇÕES PÓS-GRADUAÇÃO </strong></h3>
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
							<div class="table-responsive">
							
								<table style="margin-bottom: 2%;">
									<tr>
										<td>
											<label>Ordenar Por</label>
											<select class="form-control input-sm" id="criterioOrdenacao">
												<option value="c.nome">Nome</option>
												<option value="dataInscricao">Data de Inscricao</option>
											</select>
										</td>
										<td style="padding-left: 4%;">
											<label>&nbsp;</label>
											<select class="form-control input-sm" id="ordem">
												<option value="ASC">Ascendente</option>
												<option value="DESC">Descendente</option>
											</select>
										</td>
									</tr>
								</table>
								
								<table class="table table-striped table-bordered table-hover" id="tabelaLista">
									<thead>
										<tr>
											<th style="width: 5%; vertical-align: middle; text-align: center;">#</th>
											<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
											<th style="width: 50%; vertical-align: middle;">Nome</th>
											<th style="width: 10%; vertical-align: middle; text-align: center;">Data Inscrição</th>
											<th style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
	            						</tr>
									</thead>
									<tfoot>
										<tr>
											<th style="width: 5%; vertical-align: middle; text-align: center;">#</th>
											<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
											<th style="width: 50%; vertical-align: middle;">Nome</th>
											<th style="width: 10%; vertical-align: middle; text-align: center;">Data Inscrição</th>
											<th style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
	            						</tr>
									</tfoot>
									<tbody id="conteudoLista">
										<c:forEach items="${lista}" var="obj">
											<tr>
		              							<td style="vertical-align: middle; text-align: center;">${obj.classificacao}</td>
		              							<td style="vertical-align: middle; text-align: center;">${obj.numero}</td>
		              							<td style="vertical-align: middle;">${obj.candidato.nome}</td>
		              							<td style="vertical-align: middle; text-align: center;"><fmt:formatDate value="${obj.dataInscricao}" pattern="dd/MM/yyyy" /></td>
		              							<td style="vertical-align: middle; text-align: center;">
		              								<a href="view?id=${obj.id}" class="btn btn-primary" title="Visualizar Inscrição">V</a> &nbsp;
													<a href="edit?id=${obj.id}" class="btn btn-warning" role="button" title="Editar Inscrição">E</a> &nbsp;
													<a href="delete?id=${obj.id}" class="btn btn-danger" role="button" title="Remover Inscrição">R</a>
		              							</td>
		            						</tr>
	            						</c:forEach>
	          						</tbody>
	        					</table>
	        					
	        					<c:choose>
									<c:when test="${lista.size() == 0}">
										Não foram encontrados registros.
									</c:when>
									<c:otherwise>
										Total de Itens Listados: <label id="totaLista">${lista.size()}</label>
									</c:otherwise>
								</c:choose>
	        					
	        				</div>
						</div>
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

</body>

</html>