<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Listar Usuários</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/maskedinput.js"></script>


	<script type="text/javascript">

		$(document).ready(function() {
			
			ordenarRegistros('nome');
			
	    	$("#btNovo").click(function() {
	    		window.location="<%=request.getContextPath()%>/usuario/add";
			});
	    	
			$("#btCancelar").click(function() {
	    		window.location="<%=request.getContextPath()%>/home";
			});
			
			$("#ordenaTipo").click(function() {
				ordenarRegistros('tipo');
			});
			
			$("#ordenaNome").click(function() {
				ordenarRegistros('nome');
			});
			
			$("#tipoUsuario").change(function() {
				filtrarRegistros();
			});
			
			$("#nome").keyup(function() {
				filtrarRegistros();
			});
			
			function filtrarRegistros() {
				
				$.post("filter", {
					
					'tipoUsuarioId' : $('#tipoUsuario').val(),
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

				var linhas = '';
				var qtdItens = 0;
				
				$(dadosJSON).each(function (i) {
					
                    linhas += "<tr>";

                    linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].tipo.descricao + "</td>";
                   	linhas += "<td style='vertical-align: middle;'>" + dadosJSON[i].nome + "</td>";
                  	linhas += "<td style='vertical-align: middle; text-align: center;'>" + dadosJSON[i].siape + "</td>";
             		linhas += "<td style='vertical-align: middle;'>" + dadosJSON[i].login + "</td>";
             		linhas += "<td style='vertical-align: middle; text-align: center;'>"  + dadosJSON[i].fone + "</td>";
             		linhas += "<td style='vertical-align: middle;'>"  + dadosJSON[i].email + "</td>";
             		linhas += "<td style='vertical-align: middle; text-align: center;'> 3 </td>";
         			linhas += "<td style='vertical-align: middle; text-align: center;'>";
      				linhas += "<a href='view?id=" + dadosJSON[i].id + "' class='btn btn-primary' title='Visualizar'>V</a> &nbsp; &nbsp;";
  					linhas += "<a href='edit?id=" + dadosJSON[i].id + "' class='btn btn-warning' role='button' title='Editar'>E</a> &nbsp; &nbsp;";
					linhas += "<a href='delete?id=" + dadosJSON[i].id + "' class='btn btn-danger' role='button' title='Remover'>R</a>";
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
                    <h3 class="page-header"><strong> MANTER USUÁRIO </strong></h3>
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
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Clique <strong>aqui</strong> para exibir os campos de para filtrar de <strong>Usuários</strong></a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="col-lg-6">
		                                    	<div class="form-group">
		                                        	<label>Tipo</label>
		                                          	<select id="tipoUsuario" name="tipo" class="form-control">
														<option value=""> Selecione </option>
														<c:forEach items="${listaTipoUsuario}" var="obj">
															<option value="${obj.id}"> ${obj.descricao} </option>
														</c:forEach> 
													</select>
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
										<th style="width: 10%; vertical-align: middle; text-align: center;"><a href="#" id="ordenaTipo">Tipo</a></th>
										<th style="width: 20%; vertical-align: middle;"><a href="#" id="ordenaNome">Nome</a></th>
										<th style="width: 5%; vertical-align: middle; text-align: center;">SIAPE</th>
										<th style="width: 10%; vertical-align: middle;">Login</th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">Fone</th>
										<th style="width: 20%; vertical-align: middle;">E-mail</th>
										<th style="width: 5%; vertical-align: middle; text-align: center;">QTD Avaliações</th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">Ações</th>
            						</tr>
								</thead>
								<tfoot>
									<tr>
										<th style="width: 10%; vertical-align: middle; text-align: center;">Tipo</th>
										<th style="width: 20%; vertical-align: middle;">Nome</th>
										<th style="width: 5%; vertical-align: middle; text-align: center;">SIAPE</th>
										<th style="width: 10%; vertical-align: middle;">Login</th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">Fone</th>
										<th style="width: 20%; vertical-align: middle;">E-mail</th>
										<th style="width: 5%; vertical-align: middle; text-align: center;">QTD Avaliações</th>
										<th style="width: 15%; vertical-align: middle; text-align: center;">Ações</th>
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