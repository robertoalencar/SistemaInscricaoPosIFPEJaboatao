<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Resultado Seleção</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />

</head>

<body>

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

		<div id="page-wrapper">
        
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><strong> Resultado Seleção </strong></h3>
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
                                            <a data-toggle="collapse" data-parent="#accordion" href="#listaInovacao">Curso de Desenvolvimento, Inovação e Tecnologias Emergentes</a>
                                        </h4>
                                    </div>
                                    
                                    <div id="listaInovacao" class="panel-collapse collapse">
                                        <div class="panel-body">
											<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tfoot>
													<tr>
														<th style="vertical-align: middle; text-align: center;">Classificação</th>
														<th style="vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="vertical-align: middle;">Nome</th>
														<th style="vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</tfoot>
												<tbody>
													<c:forEach var="resultadoInovacao" items="${listaResultadoCursoInovacao}" varStatus="i">
														<c:choose>
														<c:when test="${i.index < 30}">
														<tr style="background-color: #A9F5E1;">
														</c:when>
														<c:otherwise>
														<tr style="background-color: #F78181;">
														</c:otherwise>
														</c:choose>
															<td style="vertical-align: middle; text-align: center;">${resultadoInovacao.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultadoInovacao.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultadoInovacao.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultadoInovacao.notaCandidato}</td>
							          					</tr>
													</c:forEach>								
												</tbody>
							     			</table>                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#listaGestao">Curso de Gestão e Qualidade em TIC</a>
                                        </h4>
                                    </div>
                                    <div id="listaGestao" class="panel-collapse collapse">
                                        <div class="panel-body">
                                        	
                                        	<div style="background-color: #A9F5E1;"><br/><strong>CLASSIFICADOS VCG (vagas para concorrência geral)</strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tfoot>
													<tr>
														<th style="vertical-align: middle; text-align: center;">Classificação</th>
														<th style="vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="vertical-align: middle;">Nome</th>
														<th style="vertical-align: middle; text-align: center;">Nota</th>
							         				</tr>
												</tfoot>
												<tbody>
													<c:forEach var="resultadoGestao" items="${listaResultadoCursoGestao}" varStatus="i">
														<c:if test="${i.index < 2}">
															<tr>
																<td style="vertical-align: middle; text-align: center;">${resultadoGestao.inscricao.classificacao}</td>
																<td style="vertical-align: middle; text-align: center;">${resultadoGestao.inscricao.numero}</td>
																<td style="vertical-align: middle;">${resultadoGestao.inscricao.candidato.nome}</td>
																<td style="vertical-align: middle; text-align: center;">${resultadoGestao.notaCandidato}</td>
							          						</tr>
						          						</c:if>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: red;"><br/><strong>Lista de Remanejamento VCG (vagas para concorrência geral)</strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tfoot>
													<tr>
														<th style="vertical-align: middle; text-align: center;">Classificação</th>
														<th style="vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="vertical-align: middle;">Nome</th>
														<th style="vertical-align: middle; text-align: center;">Nota</th>
							         				</tr>
												</tfoot>
												<tbody>
													<c:forEach var="resultadoGestao" items="${listaResultadoCursoGestao}" varStatus="i">
														<c:if test="${i.index >= 2}">
															<tr>
																<td style="vertical-align: middle; text-align: center;">${resultadoGestao.inscricao.classificacao}</td>
																<td style="vertical-align: middle; text-align: center;">${resultadoGestao.inscricao.numero}</td>
																<td style="vertical-align: middle;">${resultadoGestao.inscricao.candidato.nome}</td>
																<td style="vertical-align: middle; text-align: center;">${resultadoGestao.notaCandidato}</td>
							          						</tr>
						          						</c:if>
													</c:forEach>
												</tbody>
							     			</table>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<!-- /#page-wrapper -->

</body>

</html>