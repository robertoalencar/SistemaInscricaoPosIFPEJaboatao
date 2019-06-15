<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Avaliar Inscrição</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body>

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

        <div id="page-wrapper">
        
        	<form role="form" action="avaliacaoSave" method="post">
        	
        	<input type="hidden" name="idInscricao" value="${inscricao.id}">
        
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><strong> VISUALIZAR AVALIAÇÃO </strong></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
					<div class="panel panel-info">
      					<div class="panel-heading">Candidato</div>
						<div class="panel-body">
						
							<div class="col-lg-12">
	                           	<div class="form-group">
                                   <label>Número de Inscrição</label>
                                   <input class="form-control" name="numero" readonly="readonly" value="${inscricao.numero}">
                               </div>
							</div>
							
							<div class="col-lg-12">
								<div class="form-group">
                                   	<label>Curso Escolhido</label>
                                   	<select name="cursoEscolhido" class="form-control" disabled="disabled">
										<option value=""> Selecione </option>
										<option value="Gestao" <c:if test="${inscricao.cursoEscolhido eq 'Gestao'}">selected="selected"</c:if>> Gestão e Qualidade em TIC </option>
										<option value="Inovacao" <c:if test="${inscricao.cursoEscolhido eq 'Inovacao'}">selected="selected"</c:if>> Desenv. Inovação e Tecnologias Emergentes </option>
									</select>
								</div>
							</div>
                                
							<div class="col-lg-12">
								<div class="form-group">
									<label>Nome</label>
									<input class="form-control" name="nome" id="nome" value="${inscricao.candidato.nome}" readonly="readonly">
								</div>
							</div>
                                   
							<div class="col-lg-6">
								<div class="form-group">
									<label>CPF</label>
									<input class="form-control" name="cpf" id="cpf" value="${inscricao.candidato.cpf}" readonly="readonly">
								</div>
							</div>
					
							<div class="col-lg-6">
								<div class="form-group">
									<label>E-mail</label>
									<input type="email" class="form-control" name="email" id="email" value="${inscricao.candidato.email}" readonly="readonly">
								</div>
							</div>
                                  
							<div class="col-lg-6">
								<div class="form-group">
									<label>Fone Residencial</label>
									<input class="form-control" name="foneResidencial" id="foneResidencial" value="${inscricao.candidato.foneResidencial}" readonly="readonly">
								</div>
							</div>
                                   
							<div class="col-lg-6">
								<div class="form-group">
									<label>Fone Celular</label>
									<input class="form-control" name="foneCelular" id="foneCelular" value="${inscricao.candidato.foneCelular}" readonly="readonly">
								</div>
							</div>
                                   
							<div class="col-lg-6">
								<div class="form-group">
									<label>Data de Nascimento</label>
									<input class="form-control" name="dataNascimento" id="dataNascimento" value="<fmt:formatDate value='${inscricao.candidato.dataNascimento}' pattern='dd/MM/yyyy' />" readonly="readonly">
								</div>
							</div>
                                   
							<div class="col-lg-6">
								<div class="form-group">
									<label>Sexo</label>
									<div class="radio">
										<label><input type="radio" name="sexo" value="Masculino" <c:if test="${inscricao.candidato.sexo eq 'Masculino'}"> checked="checked" </c:if> readonly="readonly">Masculino</label>
										<label><input type="radio" name="sexo" value="Feminino" <c:if test="${inscricao.candidato.sexo eq 'Feminino'}"> checked="checked" </c:if> readonly="readonly">Feminino</label>
										<label><input type="radio" name="sexo" value="Outro" <c:if test="${inscricao.candidato.sexo eq 'Outro'}"> checked="checked" </c:if> readonly="readonly">Outro</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
                <div class="col-lg-12">
					<div class="panel panel-info">
      					<div class="panel-heading">Avaliador</div>
						<div class="panel-body">
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
							<div class="col-lg-6">
								<div class="form-group">
									<label>E-mail: </label> ${usuarioLogado.email}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
                <div class="col-lg-12">
					<div class="panel panel-success">
      					<div class="panel-heading">Pontuação do Candidato</div>
                        <div class="panel-body">
                          	
                           	<div class="col-lg-6">
								<div class="form-group">
                                   	<label>Documentação Completa</label>
                                   	<div class="radio">
                                     	<label><input type="radio" name="documentacaoCompleta" <c:if test='${avaliacaoVO.documentacaoCompleta eq true}'>checked="checked"</c:if> readonly="readonly">Sim</label> &nbsp;
                                       	<label><input type="radio" name="documentacaoCompleta" <c:if test='${avaliacaoVO.documentacaoCompleta eq false}'>checked="checked"</c:if> readonly="readonly">Não</label> <br/>
                                       	<small id="passwordHelpBlock" class="form-text text-muted">
                                       		Para considerar que a documentação do candidato está incompleta deve-se verificar: <br>
                                       		- Ficha de inscrição não entregue ou preenchida incorretamente ou <br/>
											- Não entrega da cópia do RG e CPF, ou da carteira nacional de habilitação (CNH) ou <br/>
											- Não entrega da cópia do diploma da graduação ou da declaração de conclusão de curso
                                       	</small>
                                   	</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Nota Final</label> 
									<input class="form-control" name="notaFinal" id="notaFinal" style="width: 20%;" readonly="readonly" value="${avaliacaoVO.notaFinal}">
									<small id="passwordHelpBlock" class="form-text text-muted">Pontuação Final = (((IC01 + IC02 + IC03) * 3,0) + (IC04 * 7,0)) / 10</small>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
                                   	<label>Tipo da Vaga</label>
                                   	<select name="tipoVaga" class="form-control" disabled="disabled">
										<option value=""> Selecione </option>
										<option value="VCG" <c:if test="${avaliacaoVO.tipoVaga eq 'VCG'}">selected="selected"</c:if>> VCG - Vagas para concorrência geral </option>
										<option value="PPI" <c:if test="${avaliacaoVO.tipoVaga eq 'PPI'}">selected="selected"</c:if>> PPI - Vagas para pretos e pardos </option>
										<option value="PCD" <c:if test="${avaliacaoVO.tipoVaga eq 'PCD'}">selected="selected"</c:if>> PCD - Vagas para pessoas com deficiência </option>
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
                                   	<label>Observações</label>
                                   	<textarea class="form-control" name="observacoes" readonly="readonly">${avaliacaoVO.observacoes}</textarea>
								</div>
							</div>
							
						</div>
					</div>
               	</div>
			</div>

            <div class="row">
            	<div class="col-lg-12">
					<div class="panel panel-warning">
    					<div class="panel-heading">(IC01) Item Currículo 01 - Cursos de Graduação</div>
                      	<div class="panel-body">
                      	
							<div class="col-lg-12">&nbsp;</div>
                      	
							<div class="col-lg-3">
                               	<div class="form-group">
                                   	<label>(IC01.1) Na Área de Comput.</label>
                                   	<input type="number" class="form-control" name="gradQtdCursosComputacao" id="gradQtdCursosComputacao" pattern="[0-9]+$" readonly="readonly" value="${avaliacaoVO.gradQtdCursosComputacao}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Peso 3</small>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                             	<div class="form-group">
                                   	<label>(IC01.2) Em Outras Áreas</label>
                                   	<input type="number" class="form-control" name="gradQtdCursosOutros" id="gradQtdCursosOutros" pattern="[0-9]+$" readonly="readonly" value="${avaliacaoVO.gradQtdCursosOutros}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Peso 1</small>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>Pontuação Total</label>
                                   	<input class="form-control" name="gradPontuacaoTotal" id="gradPontuacaoTotal" readonly="readonly" value="${avaliacaoVO.gradPontuacaoTotal}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Pont. Total = (IC01.1 * 3) + (IC01.2 * 1)</small>
                                </div>
							</div>
												
							<div class="col-lg-3">
                               	<div class="form-group">
                                 	<label>Pontuação Item</label>
                                   	<input class="form-control" name="gradPontuacaoItem" id="gradPontuacaoItem" readonly="readonly" value="${avaliacaoVO.gradPontuacaoItem}"> 
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Até 3,0 pontos</small>
                               	</div>
							</div>
						</div>
						
						<div class="panel-heading">(IC02) Item Currículo 02 - Produção Científica</div>
                      	<div class="panel-body">
                      	
                      		<div class="col-lg-12">&nbsp;</div>
                      		
							<div class="col-lg-3">
                               	<div class="form-group">
                                   	<label>(IC02.1) Na Área de Comput.</label>
                                   	<input type="number" class="form-control" name="qtdAtigosComputacao" id="qtdAtigosComputacao" pattern="[0-9]+$" readonly="readonly" value="${avaliacaoVO.qtdAtigosComputacao}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Peso 5</small>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                             	<div class="form-group">
                                   	<label>(IC02.2) Em Outras Áreas</label>
                                   	<input type="number" class="form-control" name="qtdAtigosOutras" id="qtdAtigosOutras" pattern="[0-9]+$" readonly="readonly" value="${avaliacaoVO.qtdAtigosOutras}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Peso 2</small>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>Pontuação Total</label>
                                   	<input class="form-control" name="prodCientificaPontuacaoTotal" id="prodCientificaPontuacaoTotal" readonly="readonly" value="${avaliacaoVO.prodCientificaPontuacaoTotal}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Pont. Total = (IC02.1 * 5) + (IC02.2 * 2)</small>
                                </div>
							</div>
												
							<div class="col-lg-3">
                               	<div class="form-group">
                                 	<label>Pontuação Item</label>
                                   	<input class="form-control" name="prodCientificaPontuacaoItem" id="prodCientificaPontuacaoItem" readonly="readonly" value="${avaliacaoVO.prodCientificaPontuacaoItem}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Até 10,0 pontos</small>
                               	</div>
							</div>
						</div>
						
						<div class="panel-heading">(IC03) Item Currículo 03 - Experiência Profissional</div>
                      	<div class="panel-body">
                      	
                      		<div class="col-lg-12">&nbsp;</div>
                      		
                     		<c:forEach begin="0" end="${avaliacaoVO.totalVinculosEmpregaticios}" varStatus="i">
							  
								<div class='col-lg-3'>
									<div class='form-group'>
										<label>Vínculo na área de</label>
										<select name='areaCargo' class='form-control' disabled="disabled">
											<option value=''> &nbsp; </option>
											<option value='computacao' <c:if test="${avaliacaoVO.areaCargo[i.current] eq 'computacao'}">selected="selected"</c:if>> Computação </option>
											<option value='outras' <c:if test="${avaliacaoVO.areaCargo[i.current] eq 'outras'}">selected="selected"</c:if>> Outras Áreas </option>
										</select>
									</div>
								</div>

								<div class='col-lg-3'>
									<div class='form-group'>
										<label>Data de Início do Vínculo</label>
										<input class="form-control" name="dataInicio" value="${avaliacaoVO.dataInicio[i.current]}" readonly="readonly">
									</div>
								</div>
													
								<div class='col-lg-3'>
									<div class='form-group'>
										<label>Data Final do Vínculo</label>
										<input class="form-control" name="dataFim" value="${avaliacaoVO.dataFim[i.current]}" readonly="readonly">
									</div>
								</div>
													
								<div class='col-lg-3'>
									<div class='form-group'>
										<label>Total de Meses</label>
										<input class="form-control" name="totalMeses" readonly="readonly" value="${avaliacaoVO.totalMeses[i.current]}">
									</div>
								</div>
													
							</c:forEach>
							
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>(TAC) Total Área Computação</label>
                                   	<input class="form-control" id="expProfTotalMesesAreaComp" name="expProfTotalMesesAreaComp" readonly="readonly" value="${avaliacaoVO.expProfTotalMesesAreaComp}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Total de Meses Computação / 12</small>
                                </div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>(TOA) Total Outras Áreas</label>
                                   	<input class="form-control" id="expProfTotalMesesOutras" name="expProfTotalMesesOutras" readonly="readonly" value="${avaliacaoVO.expProfTotalMesesOutras}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Total de Meses Outras / 12</small>
                                </div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>Total Geral</label>
                                   	<input class="form-control" id="expProfPontuacaoTotal" name="expProfPontuacaoTotal" readonly="readonly" value="${avaliacaoVO.expProfPontuacaoTotal}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Total Geral = (TAC * 2) + (TOA * 1)</small>
                                </div>
							</div>
												
							<div class="col-lg-3">
                               	<div class="form-group">
                                 	<label>Pontuação Item</label>
                                   	<input class="form-control" id="expProfPontuacaoItem" name="expProfPontuacaoItem" readonly="readonly" value="${avaliacaoVO.expProfPontuacaoItem}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Até 10,0 pontos</small>
                               	</div>
							</div>
						</div>
						
						<div class="panel-heading">(IC04) Item Currículo 04 – Histórico Escolar da Graduação</div>
                      	<div class="panel-body">
                      	
                      		<div class="col-lg-12">&nbsp;</div>
                      		
							<div class="col-lg-3">
                               	<div class="form-group">
                                   	<label>(IC04.1) Média Histórico</label>
                                   	<input type="text" class="form-control" name="historicoMediaGeral" id="historicoMediaGeral" readonly="readonly" value="${avaliacaoVO.historicoMediaGeral}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Em caso de número decimal, utilizar PONTO ao invés de vírgula.</small> 
                               	</div>
							</div>
					
							<div class="col-lg-3">
                             	<div class="form-group">
                                   	<label>(IC04.2) Fator de Carga Horária</label>
                                   	<select name="historicoFatorCargaHoraria" id="historicoFatorCargaHoraria" class="form-control" disabled="disabled">
										<option value="0" <c:if test="${avaliacaoVO.historicoFatorCargaHoraria eq 0}">selected="selected"</c:if>> Selecione </option>
										<option value="0.85" <c:if test="${avaliacaoVO.historicoFatorCargaHoraria eq 0.85}">selected="selected"</c:if>> 0.85 </option>
										<option value="1" <c:if test="${avaliacaoVO.historicoFatorCargaHoraria eq 1}">selected="selected"</c:if>> 1 </option>
									</select>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>Pontuação Total</label>
                                   	<input class="form-control" name="historicoPontuacaoTotal" id="historicoPontuacaoTotal" readonly="readonly" value="${avaliacaoVO.historicoPontuacaoTotal}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Nota Histórico Escolar = IC04.1 * IC04.2</small> 
                                </div>
							</div>
												
							<div class="col-lg-3">
                               	<div class="form-group">
                                 	<label>Pontuação Item</label>
                                   	<input class="form-control" name="historicoPontuacaoItem" id="historicoPontuacaoItem" readonly="readonly" value="${avaliacaoVO.historicoPontuacaoItem}">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Até 10,0 pontos</small>
                               	</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
				
			<div class="row">
			
				<div class="col-lg-12"> &nbsp; </div>
			
				<div class="col-lg-12">
					<a href="view?id=${inscricao.candidato.id}" class="btn btn-danger" title="Voltar">Voltar</a>
                </div>
			</div>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="col-lg-12"> &nbsp; </div>
					<div class="col-lg-12"> &nbsp; </div>
                </div>
			</div>
			
			</form>
			
		</div>
	</div>

</body>
</html>