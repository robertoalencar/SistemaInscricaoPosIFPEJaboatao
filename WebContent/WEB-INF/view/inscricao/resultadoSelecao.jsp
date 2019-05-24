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
											
											<div style="background-color: #82FA58;"><br/> &nbsp; <strong> Classificados VCG (vagas para concorrência geral) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${classificadosInovacaoVCG}">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #82FA58;"><br/> &nbsp; <strong> Classificados PPI (vagas para pretos, pardos e indígenas) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${classificadosInovacaoPPI}">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #82FA58;"><br/> &nbsp; <strong> Classificados PCD (vagas para pessoas com deficiência) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${classificadosInovacaoPCD}">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #F2F5A9;"><br/> &nbsp; <strong> Lista de Remanejamento VCG (vagas para concorrência geral) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${remanejamentoInovacaoVCG}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #F2F5A9;"><br/> &nbsp; <strong> Lista de Remanejamento PPI (vagas para pretos, pardos e indígenas) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${remanejamentoInovacaoPPI}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #F2F5A9;"><br/> &nbsp; <strong> Lista de Remanejamento PCD (vagas para pessoas com deficiência) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${remanejamentoInovacaoPCD}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #BDBDBD;"><br/> &nbsp; <strong> Não Classificados </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${naoClassificadosInovacaoVCG}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #F5A9A9;"><br/> &nbsp; <strong> Candidatos Desclassificados </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${desclassificadosInovacao}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
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
                                        	
                                        	<div style="background-color: #82FA58;"><br/> &nbsp; <strong> Classificados VCG (vagas para concorrência geral) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${classificadosGestaoVCG}">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #82FA58;"><br/> &nbsp; <strong> Classificados PPI (vagas para pretos, pardos e indígenas) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${classificadosGestaoPPI}">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #82FA58;"><br/> &nbsp; <strong> Classificados PCD (vagas para pessoas com deficiência) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${classificadosGestaoPCD}">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #F2F5A9;"><br/> &nbsp; <strong> Lista de Remanejamento VCG (vagas para concorrência geral) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${remanejamentoGestaoVCG}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #F2F5A9;"><br/> &nbsp; <strong> Lista de Remanejamento PPI (vagas para pretos, pardos e indígenas) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${remanejamentoGestaoPPI}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #F2F5A9;"><br/> &nbsp; <strong> Lista de Remanejamento PCD (vagas para pessoas com deficiência) </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${remanejamentoGestaoPCD}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #BDBDBD;"><br/> &nbsp; <strong> Não Classificados </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${naoClassificadosGestaoVCG}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
													</c:forEach>
												</tbody>
							     			</table>
							     			
							     			<div style="background-color: #F5A9A9;"><br/> &nbsp; <strong> Candidatos Desclassificados </strong><br/><br/></div>
                                        	<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Classificação</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nº Inscrição</th>
														<th style="width: 55%; vertical-align: middle;">Nome</th>
														<th style="width: 15%; vertical-align: middle; text-align: center;">Nota</th>
							         						</tr>
												</thead>
												<tbody>
													<c:forEach var="resultado" items="${desclassificadosGestao}" varStatus="i">
														<tr>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.classificacao}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.inscricao.numero}</td>
															<td style="vertical-align: middle;">${resultado.inscricao.candidato.nome}</td>
															<td style="vertical-align: middle; text-align: center;">${resultado.notaCandidato}</td>
						          						</tr>
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