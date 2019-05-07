<%@ page contentType="text/html; charset=UTF-8" %>

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

			ordenarRegistros('classificacao');
			
			$("#ordenaClassificacao").click(function() {
				ordenarRegistros('classificacao');
			});
			
			$("#ordenaNome").click(function() {
				ordenarRegistros('c.nome');
			});
			
			$("#ordenaDataInscricao").click(function() {
				ordenarRegistros('dataInscricao');
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
			
			function ordenarRegistros(ordenadoPor) {
				
				var ordem = $('#ordem').val();
				
				if (ordem == null || ordem == '') {
					
					$('#ordem').val('ASC')
					
				} else if (ordem == 'ASC') {
					
					$('#ordem').val('DESC')
					
				} else if (ordem == 'DESC') {
					
					$('#ordem').val('ASC')
				}
				
				$.post("ordenarRegistros", {
					
					'criterioOrdenacao' : ordenadoPor,
					'ordem' : $('#ordem').val()
					
				}, function(dadosJSON) {
					
					carregaTabelaJSon(dadosJSON);
				});
			}
			
			function carregaTabelaJSon(dadosJSON) {
				
				console.log(dadosJSON);

				var linhas = '';
				var qtdItens = 0;
				
				$(dadosJSON).each(function (i) {
					
                    linhas += "<tr>";

                    var classificacao = '';
                    if (dadosJSON[i].inscricao.classificacao != undefined) {
                    	classificacao = dadosJSON[i].inscricao.classificacao;
                    }
                    
                    linhas += "<td style='vertical-align: middle; text-align: center;'>" + classificacao + "</td>";
                   	linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].inscricao.numero + "</td>";
                  	linhas += "<td style='vertical-align: middle;'>" + dadosJSON[i].inscricao.candidato.nome + "</td>";
             		linhas += "<td style='vertical-align: middle; text-align: center;'>" + new Date(dadosJSON[i].inscricao.dataInscricao).toLocaleDateString() + "</td>";
             		linhas += "<td style='vertical-align: middle; text-align: center;'>"  + dadosJSON[i].qtdAvaliacoes + "</td>";
         			linhas += "<td style='vertical-align: middle; text-align: center;'>";
         			linhas += "<a href='view?id=" + dadosJSON[i].inscricao.id + "' class='btn btn-primary' title='Visualizar'>Visualizar</a> &nbsp;";
         			linhas += "<a href='viewEvaluations?id=" + dadosJSON[i].inscricao.id + "' class='btn btn-success' title='Avaliações'>Avaliações</a>";
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
                    <h3 class="page-header"><strong> MANTER INSCRIÇÕES </strong></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <c:if test="${exibirAvaliacoes eq true}">
	            <script type="text/javascript">
	            	$(document).ready(function() {
						$("#modalAvaliacoes").modal();
					});
	            </script>
            </c:if>
            
            <!-- Modal -->
			<div class="modal fade" id="modalAvaliacoes" role="dialog">
				<div class="modal-dialog">
			    
					<!-- Modal content-->
			      	<div class="modal-content">
			        	<div class="modal-header">
			          		<button type="button" class="close" data-dismiss="modal">&times;</button>
			          		<h4 class="modal-title">Avaliações do Candidato: ${nomeCandidato}</h4>
			        	</div>
			        	
			        	<div class="modal-body">
			          		<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th style="width: 20%; vertical-align: middle;">Avaliador</th>
										<th style="width: 10%; vertical-align: middle; text-align: center;">Data Avaliação</th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">Curso Escolhido</th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">Tipo Vaga</th>
										<th style="width: 10%; vertical-align: middle; text-align: center;">Pontuação</th>
										<th style="width: 10%; vertical-align: middle; text-align: center;">Aprovada</th>
										<th style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
            						</tr>
								</thead>
								<tbody>
									<c:forEach var="avaliacao" items="${listaAvaliacoes}">
										<tr>
											<td style="vertical-align: middle;">${avaliacao.avaliador.nome}</td>
											<td style="vertical-align: middle; text-align: center;"><fmt:formatDate value="${avaliacao.dataAvaliacao}" pattern="dd/MM/yyyy" /></td>
											<td style="vertical-align: middle; text-align: center;">${avaliacao.inscricao.cursoEscolhido}</td>
											<td style="vertical-align: middle; text-align: center;">${avaliacao.tipoVaga}</td>
											<td style="vertical-align: middle; text-align: center;">${avaliacao.notaFinal}</td>
											<td style="vertical-align: middle; text-align: center;">
												<c:choose>
													<c:when test="${avaliacao.aprovada eq true}"><strong>Sim</strong></c:when>
													<c:otherwise>Não</c:otherwise>
												</c:choose>
											</td>
											<td style="vertical-align: middle; text-align: center;">
												<a href="#">Visualizar</a> <br/>
												<span>-</span>  <br/>
         										<a href="aprovarAvaliacao?id=${avaliacao.id}" style="color: green;">Aprovar</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
        					</table>
			        	</div>
			        	<div class="modal-footer">
			          		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        	</div>
			      	</div>
				</div>
			</div>
            
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-responsive">
						
							<div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Clique <strong>aqui</strong> para exibir os campos de para filtrar de <strong>Inscrições</strong></a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
		                                    	<div class="form-group">
		                                        	<label>Nº Inscrição</label>
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
						
							<input type="hidden" id="ordem">
							
							<c:if test="${mensagem ne null}">
                               	<div class="alert alert-success alert-dismissible">
                               		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
									${mensagem}
								</div>
							</c:if>
							
							<table class="table table-striped table-bordered table-hover" id="tabelaLista">
								<thead>
									<tr>
										<th style="width: 5%; vertical-align: middle; text-align: center;"><a href="#" id="ordenaClassificacao">Classificação</a></th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
										<th style="width: 45%; vertical-align: middle;"><a href="#" id="ordenaNome">Nome</a></th>
										<th style="width: 10%; vertical-align: middle; text-align: center;"><a href="#" id="ordenaDataInscricao">Data Inscrição</a></th>
										<th style="width: 5%%; vertical-align: middle; text-align: center;">QTD Avaliações</th>
										<th style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
            						</tr>
								</thead>
								<tfoot>
									<tr>
										<th style="width: 5%; vertical-align: middle; text-align: center;">Classificação</th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
										<th style="width: 45%; vertical-align: middle;">Nome</th>
										<th style="width: 10%; vertical-align: middle; text-align: center;">Data Inscrição</th>
										<th style="width: 5%%; vertical-align: middle; text-align: center;">QTD Avaliações</th>
										<th style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
            						</tr>
								</tfoot>
								<tbody id="conteudoLista"></tbody>
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
			<!-- /.col-lg-12 -->
		</div>
	<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

</body>

</html>