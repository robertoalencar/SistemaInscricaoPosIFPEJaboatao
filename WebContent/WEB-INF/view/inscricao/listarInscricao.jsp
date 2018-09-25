<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>


	<meta charset="utf-8">

	<title>P�s Gradua��o - Listar Inscri��es</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/maskedinput.js"></script>


	<script type="text/javascript">

		$(document).ready(function() {
			
			ordenarRegistros();
			
	    	$("#btNovo").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/add";
			});
	    	
			$("#btCancelar").click(function() {
	    		window.location="<%=request.getContextPath()%>/home";
			});
			
			$("#criterioOrdenacao").change(function() {
				ordenarRegistros();
			});
			
			$("#ordem").change(function() {
				ordenarRegistros();
			});
			
			$("#numInscricao").keyup(function() {
				filtrarRegistros();
			});
			
			$("#nome").keyup(function() {
				filtrarRegistros();
			});
			
			function filtrarRegistros() {
				
				$.post("filter", {
					
					'numInscricao' : $('#numInscricao').val(),
					'nome' : $('#nome').val()
					
				}, function(dadosJSON) {
					
					carregaTabelaJSon(dadosJSON);
				});
			}
			
			function ordenarRegistros() {

				$.post("ordenarRegistros", {
					
					'criterioOrdenacao' : $('#criterioOrdenacao').val(),
					'ordem' : $('#ordem').val()
					
				}, function(dadosJSON) {
					
					carregaTabelaJSon(dadosJSON);
				});
			}
			
			function carregaTabelaJSon(dadosJSON) {

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
             		linhas += "<td style='vertical-align: middle; text-align: center;'>" + new Date(dadosJSON[i].dataInscricao).toLocaleDateString() + "</td>";
         			linhas += "<td style='vertical-align: middle; text-align: center;'>";
      				linhas += "<a href='view?id=" + dadosJSON[i].id + "' class='btn btn-primary' title='Visualizar Inscri��o'>V</a> &nbsp; &nbsp;";
  					linhas += "<a href='edit?id=" + dadosJSON[i].id + "' class='btn btn-warning' role='button' title='Editar Inscri��o'>E</a> &nbsp; &nbsp;";
					linhas += "<a href='delete?id=" + dadosJSON[i].id + "' class='btn btn-danger' role='button' title='Remover Inscri��o'>R</a>";
					linhas += "</td>";
						
					linhas += "</tr>";
					
					qtdItens++;
                });
				
                $('#conteudoLista').html(linhas);
                $('#totaLista').html(qtdItens);
			}
	    	
		});
	
	</script>

</head>

<body>

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

        <div id="page-wrapper">
        
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><strong> INSCRI��ES P�S-GRADUA��O </strong></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-responsive">
						
							<div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Clique <strong>aqui</strong> para exibir os campos de para filtrar de <strong>Inscri��es</strong></a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
		                                    	<div class="form-group">
		                                        	<label>N� Inscri��o</label>
		                                          	<input class="form-control" name="numInscricao" id="numInscricao">
		                                      	</div>
											</div>
									
											<div class="col-lg-6">
		                                     	<div class="form-group">
		                                         	<label>Nome</label>
		                                         	<input class="form-control" name="nome" id="nome">
		                                    	</div>
		                                    </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
						
							<div style="margin-bottom: 10%;">
								<div style="float: left;">
									<label>Ordenar Por:</label>
									<select class="form-control input-sm" id="criterioOrdenacao">
										<option value="classificacao">Classifica��o</option>
										<option value="c.nome">Nome</option>
										<option value="dataInscricao">Data de Inscricao</option>
									</select>
								</div>
								<div style="float: left; margin-left: 2%;">
									<label>&nbsp;</label>
									<select class="form-control input-sm" id="ordem">
										<option value="ASC">Ascendente</option>
										<option value="DESC">Descendente</option>
									</select>
								</div>
								<div style="float: right; margin-top: 2%;">
									<button type="button" class="btn btn-info" id="btNovo"> Novo </button>
								</div>
							</div>
							
							<table class="table table-striped table-bordered table-hover" id="tabelaLista">
								<thead>
									<tr>
										<th style="width: 5%; vertical-align: middle; text-align: center;">#</th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">N� Inscri��o</th>
										<th style="width: 50%; vertical-align: middle;">Nome</th>
										<th style="width: 10%; vertical-align: middle; text-align: center;">Data Inscri��o</th>
										<th style="width: 20%; vertical-align: middle; text-align: center;">A��es</th>
            						</tr>
								</thead>
								<tfoot>
									<tr>
										<th style="width: 5%; vertical-align: middle; text-align: center;">#</th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">N� Inscri��o</th>
										<th style="width: 50%; vertical-align: middle;">Nome</th>
										<th style="width: 10%; vertical-align: middle; text-align: center;">Data Inscri��o</th>
										<th style="width: 20%; vertical-align: middle; text-align: center;">A��es</th>
            						</tr>
								</tfoot>
								<tbody id="conteudoLista"></tbody>
        					</table>
        					
        					<c:choose>
								<c:when test="${lista.size() == 0}">
									N�o foram encontrados registros.
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
			<!-- /.col-lg-12 -->
		</div>
	<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

</body>

</html>