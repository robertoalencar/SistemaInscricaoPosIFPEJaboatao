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
  	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/maskedinput.js"></script>
  	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/moment-with-locales.min.js"></script>

	<script type="text/javascript">
	
	
		var qtdLinhasVinculoEmpregaticio = 0;

		
		$(document).ready(function() {
			
			
	       	$("#foneResidencial").mask("(99) 9999.9999");
	    	$("#foneCelular").mask("(99) 9 9999.9999");
	    	$("#dataNascimento").datepicker({ dateFormat: 'dd/mm/yy' });			
			
	    	
			$("#btCancelar").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/list";
			});
			
			$('#gradQtdCursosComputacao').change(function() {
				calcularPontuacaoGraduacao();
			});
			$('#gradQtdCursosOutros').change(function() {
				calcularPontuacaoGraduacao();
			});
			
			
			function calcularPontuacaoGraduacao() {
				
				var gradQtdCursosComputacao = $('#gradQtdCursosComputacao').val();
				var gradQtdCursosOutros = $('#gradQtdCursosOutros').val();
				var gradPontuacaoTotal = (gradQtdCursosComputacao * 3) + (gradQtdCursosOutros * 1); 
				
				$('#gradPontuacaoTotal').val(gradPontuacaoTotal);
				
				if (gradPontuacaoTotal > 3) {
					$('#gradPontuacaoItem').val(3); //pontução máxima	
				} else {
					$('#gradPontuacaoItem').val(gradPontuacaoTotal);
				}
				
				calcularNotaFinal();
			}
			
			
			$('#qtdAtigosComputacao').change(function() {
				calcularPontuacaoProducaoCientifica();
			});
			$('#qtdAtigosOutras').change(function() {
				calcularPontuacaoProducaoCientifica();
			});
			
			
			function calcularPontuacaoProducaoCientifica() {
				
				var qtdAtigosComputacao = $('#qtdAtigosComputacao').val();
				var qtdAtigosOutras = $('#qtdAtigosOutras').val();
				var prodCientificaPontuacaoTotal = (qtdAtigosComputacao * 5) + (qtdAtigosOutras * 2); 
				
				$('#prodCientificaPontuacaoTotal').val(prodCientificaPontuacaoTotal);
				
				if (prodCientificaPontuacaoTotal > 10) {
					$('#prodCientificaPontuacaoItem').val(10); //pontução máxima	
				} else {
					$('#prodCientificaPontuacaoItem').val(prodCientificaPontuacaoTotal);
				}
				
				calcularNotaFinal();
			}
			
			
			$('#historicoMediaGeral').change(function() {
				
				var notaHistorico = $('#historicoMediaGeral').val();
				notaHistorico = notaHistorico.replace(',','.');
				$('#historicoMediaGeral').val(notaHistorico);
				
				calcularPontuacaoHistoricoEscolar();
			});
			$('#historicoFatorCargaHoraria').change(function() {
				calcularPontuacaoHistoricoEscolar();
			});
			
			
			function calcularPontuacaoHistoricoEscolar() {
				
				var historicoMediaGeral = $('#historicoMediaGeral').val();
				var historicoFatorCargaHoraria = $('#historicoFatorCargaHoraria').val();
				var historicoPontuacaoTotal = (historicoMediaGeral * historicoFatorCargaHoraria);
				
				historicoPontuacaoTotal = parseFloat(historicoPontuacaoTotal.toFixed(2)); //arredonda para duas casas decimais
				
				$('#historicoPontuacaoTotal').val(historicoPontuacaoTotal);
				
				if (historicoPontuacaoTotal > 10) {
					$('#historicoPontuacaoItem').val(10); //pontução máxima	
				} else {
					$('#historicoPontuacaoItem').val(historicoPontuacaoTotal);
				}
				
				calcularNotaFinal();
			}
			
			
			$(document).on('click', '#btAdicionarVinculo', function(){
				
				var linhaNovoVinculo = "<div id='vinculo"+qtdLinhasVinculoEmpregaticio+"'>";
				linhaNovoVinculo += "<div class='col-lg-3'>";
				linhaNovoVinculo += "<div class='form-group'>";
				linhaNovoVinculo += "<label>Vínculo na área de</label>";
				linhaNovoVinculo += "<select id='areaCargo"+qtdLinhasVinculoEmpregaticio+"' name='areaCargo' class='form-control'>";
				linhaNovoVinculo += "<option value=''> &nbsp; </option>";
				linhaNovoVinculo += "<option value='computacao'> Computação </option>";
				linhaNovoVinculo += "<option value='outras'> Outras Áreas </option>";
				linhaNovoVinculo += "</select>";
				linhaNovoVinculo += "</div>";
				linhaNovoVinculo += "</div>";
				
				linhaNovoVinculo += "<div class='col-lg-3'>";
				linhaNovoVinculo += "<div class='form-group'>";
				linhaNovoVinculo += "<label>Data de Início do Vínculo</label>";
				linhaNovoVinculo += "<input type='text' id='dataInicio"+qtdLinhasVinculoEmpregaticio+"' name='dataInicio'>";
				linhaNovoVinculo += "</div>";
				linhaNovoVinculo += "</div>";
				
				linhaNovoVinculo += "<div class='col-lg-3'>";
				linhaNovoVinculo += "<div class='form-group'>";
				linhaNovoVinculo += "<label>Data Final do Vínculo</label>";
				linhaNovoVinculo += "<input type='text' id='dataFim"+qtdLinhasVinculoEmpregaticio+"' name='dataFim'>";
				linhaNovoVinculo += "</div>";
				linhaNovoVinculo += "</div>";
				
				linhaNovoVinculo += "<div class='col-lg-3'>";
				linhaNovoVinculo += "<div class='form-group'>";
				linhaNovoVinculo += "<label>Total de Meses</label>";
				linhaNovoVinculo += "<input class='form-control' id='totalMeses"+qtdLinhasVinculoEmpregaticio+"' name='totalMeses' readonly='readonly'>";
				linhaNovoVinculo += "</div>";
				linhaNovoVinculo += "</div>";
				
				linhaNovoVinculo += "</div>";
				
				$('#linhaVinculoEmpregaticio').append(linhaNovoVinculo);
				
				$("#dataInicio"+qtdLinhasVinculoEmpregaticio).datepicker({ dateFormat: 'dd/mm/yy' });
				$("#dataFim"+qtdLinhasVinculoEmpregaticio).datepicker({ dateFormat: 'dd/mm/yy' });
				
				$("#areaCargo"+qtdLinhasVinculoEmpregaticio).change(function() { atualizarPontuacaoVinculos(); });
				$("#dataInicio"+qtdLinhasVinculoEmpregaticio).change(function() { atualizarPontuacaoVinculos(); });
				$("#dataFim"+qtdLinhasVinculoEmpregaticio).change(function() { atualizarPontuacaoVinculos(); });
				
				qtdLinhasVinculoEmpregaticio = qtdLinhasVinculoEmpregaticio + 1;
				
			});
			

			$(document).on('click', '#removerVinculo', function() {
				
				qtdLinhasVinculoEmpregaticio = qtdLinhasVinculoEmpregaticio - 1;
				$("#vinculo"+qtdLinhasVinculoEmpregaticio).remove();
				calcularPontuacaoItemExperienciaProfissional();
				
			});
			
			
			function atualizarPontuacaoVinculos() {
				
				for (var i = 0; i < qtdLinhasVinculoEmpregaticio; i++) {
					
					var areaCargo = $("#areaCargo"+i).val();
					var campoDataInicio = $("#dataInicio"+i).val();
					var campoDataFim = $("#dataFim"+i).val();
					
					if ((areaCargo != null && areaCargo != "") 
							&& (campoDataInicio != null && campoDataInicio != "") 
							&& (campoDataFim != null && campoDataFim != "")) {

				        moment.locale('pt-br');
						
				        var dataInicio = moment(campoDataInicio,'DD/MM/YYYY');
				        var dataFim = moment(campoDataFim,'DD/MM/YYYY');
				        var diffDias = dataFim.diff(dataInicio, 'days');
				        var diffMeses = parseFloat((diffDias/30).toFixed(2));
				        
						$("#totalMeses" + i).val(diffMeses);
						
						calcularPontuacaoItemExperienciaProfissional();
					}
				}
			}
			
			
			function calcularPontuacaoItemExperienciaProfissional() {
				
				var expProfTotalMesesAreaComp = 0;
				var expProfTotalMesesOutras = 0;
				var areaCargo;
				var dataInicio;
				var dataFim;
				var totalMeses;
				
				for (var i = 0; i < qtdLinhasVinculoEmpregaticio; i++) {
					
					areaCargo = $("#areaCargo"+i).val();
					dataInicio = $("#dataInicio"+i).val();
					dataFim = $("#dataFim"+i).val();
					totalMeses = $("#totalMeses"+i).val();
					
					if ((areaCargo != null && areaCargo != "") 
						&& (dataInicio != null && dataInicio != "") 
						&& (dataFim != null && dataFim != "")) {
						
						totalMeses = $("#totalMeses"+i).val();
						
						if (areaCargo == 'computacao') {
							expProfTotalMesesAreaComp = parseFloat(expProfTotalMesesAreaComp) + parseFloat(totalMeses); 
						} else if (areaCargo == 'outras') {
							expProfTotalMesesOutras = parseFloat(expProfTotalMesesOutras) + parseFloat(totalMeses);
						}
					}
				}
				
				expProfTotalMesesAreaComp = parseFloat(expProfTotalMesesAreaComp/12).toFixed(2); //converte o total de meses em anos
				expProfTotalMesesOutras = parseFloat(expProfTotalMesesOutras/12).toFixed(2); //converte o total de meses em anos
				
				$("#expProfTotalMesesAreaComp").val(expProfTotalMesesAreaComp);
				$("#expProfTotalMesesOutras").val(expProfTotalMesesOutras);
				
				var expProfPontuacaoTotal = (expProfTotalMesesAreaComp*2)+(expProfTotalMesesOutras*1);
				$("#expProfPontuacaoTotal").val(parseFloat(expProfPontuacaoTotal).toFixed(2));
				
				if (expProfPontuacaoTotal > 10) {
					$('#expProfPontuacaoItem').val(10); //pontuação máxima	
				} else {
					$('#expProfPontuacaoItem').val(parseFloat(expProfPontuacaoTotal).toFixed(2));
				}
				
				calcularNotaFinal();
			}
			
			
			function calcularNotaFinal() {
				
				var IC01;
				var IC02;
				var IC03;
				var IC04;
				
				if ($("#gradPontuacaoItem").val() == '') {
					IC01 = 0;
				} else {
					IC01 = parseFloat($("#gradPontuacaoItem").val());
				}
				
				if ($("#prodCientificaPontuacaoItem").val() == '') {
					IC02 = 0;
				} else {
					IC02 = parseFloat($("#prodCientificaPontuacaoItem").val());
				}
				
				if ($("#expProfPontuacaoItem").val() == '') {
					IC03 = 0;
				} else {
					IC03 = parseFloat($("#expProfPontuacaoItem").val());
				}
				
				if ($("#historicoPontuacaoItem").val() == '') {
					IC04 = 0;
				} else {
					IC04 = parseFloat($("#historicoPontuacaoItem").val());
				}
				
				var notaFinal = (((IC01 + IC02 + IC03) * 3.0) + (IC04 * 7.0)) / 10;
				$("#notaFinal").val(parseFloat(notaFinal).toFixed(2));
			}
			
		});
		
		
		
	</script>

</head>

<body>

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

        <div id="page-wrapper">
        
        	<form role="form" action="avaliacaoSave" method="post">
        	
        	<input type="hidden" name="idInscricao" value="${inscricao.id}">
        
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><strong> AVALIAR CANDIDATO </strong></h3>
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
                                   	<select name="cursoEscolhido" class="form-control" readonly="readonly">
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
									<input type="email" class="form-control" name="email" id="email" value="${inscricao.candidato.email}">
								</div>
							</div>
                                  
							<div class="col-lg-6">
								<div class="form-group">
									<label>Fone Residencial</label>
									<input class="form-control" name="foneResidencial" id="foneResidencial" value="${inscricao.candidato.foneResidencial}">
								</div>
							</div>
                                   
							<div class="col-lg-6">
								<div class="form-group">
									<label>Fone Celular</label>
									<input class="form-control" name="foneCelular" id="foneCelular" value="${inscricao.candidato.foneCelular}">
								</div>
							</div>
                                   
							<div class="col-lg-6">
								<div class="form-group">
									<label>Data de Nascimento</label>
									<input class="form-control" name="dataNascimento" id="dataNascimento" value="<fmt:formatDate value='${inscricao.candidato.dataNascimento}' pattern='dd/MM/yyyy' />">
								</div>
							</div>
                                   
							<div class="col-lg-6">
								<div class="form-group">
									<label>Sexo</label>
									<div class="radio">
										<label><input type="radio" name="sexo" value="Masculino" <c:if test="${inscricao.candidato.sexo eq 'Masculino'}"> checked="checked" </c:if>>Masculino</label>
										<label><input type="radio" name="sexo" value="Feminino" <c:if test="${inscricao.candidato.sexo eq 'Feminino'}"> checked="checked" </c:if>>Feminino</label>
										<label><input type="radio" name="sexo" value="Outro" <c:if test="${inscricao.candidato.sexo eq 'Outro'}"> checked="checked" </c:if>>Outro</label>
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
                                   	<label>Documentação Completa<span style="color: red;"> * </span></label>
                                   	<div class="radio">
                                     	<label><input type="radio" id="documentacaoCompleta" name="documentacaoCompleta" value="true" required="required">Sim</label> &nbsp;
                                       	<label><input type="radio" id="documentacaoCompleta" name="documentacaoCompleta" value="false">Não</label> <br/>
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
									<input class="form-control" name="notaFinal" id="notaFinal" readonly="readonly" style="width: 20%;">
									<small id="passwordHelpBlock" class="form-text text-muted">Pontuação Final = (((IC01 + IC02 + IC03) * 3,0) + (IC04 * 7,0)) / 10</small>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
                                   	<label>Tipo da Vaga<span style="color: red;"> * </span></label>
                                   	<select name="tipoVaga" class="form-control" required="required">
										<option value=""> Selecione </option>
										<option value="VCG"> VCG - Vagas para concorrência geral </option>
										<option value="PPI"> PPI - Vagas para pretos e pardos </option>
										<option value="PCD"> PCD - Vagas para pessoas com deficiência </option>
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
                                   	<label>Observações</label>
                                   	<textarea class="form-control" name="observacoes"></textarea>
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
                      		
                      		<div class="col-lg-12">
								<div class="form-group" style="color: gray;"><strong>Atenção:</strong> Informe a quantidade de cursos de graduação concluídos pelo candidato.</div>
							</div>
							
							<div class="col-lg-12">&nbsp;</div>
                      	
							<div class="col-lg-3">
                               	<div class="form-group">
                                   	<label>(IC01.1) Na Área de Comput.</label>
                                   	<input type="number" class="form-control" name="gradQtdCursosComputacao" id="gradQtdCursosComputacao" pattern="[0-9]+$" placeholder="Ex.: 2">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Peso 3</small>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                             	<div class="form-group">
                                   	<label>(IC01.2) Em Outras Áreas</label>
                                   	<input type="number" class="form-control" name="gradQtdCursosOutros" id="gradQtdCursosOutros" pattern="[0-9]+$" placeholder="Ex.: 1">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Peso 1</small>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>Pontuação Total</label>
                                   	<input class="form-control" name="gradPontuacaoTotal" id="gradPontuacaoTotal" readonly="readonly">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Pont. Total = (IC01.1 * 3) + (IC01.2 * 1)</small>
                                </div>
							</div>
												
							<div class="col-lg-3">
                               	<div class="form-group">
                                 	<label>Pontuação Item</label>
                                   	<input class="form-control" name="gradPontuacaoItem" id="gradPontuacaoItem" readonly="readonly"> 
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Até 3,0 pontos</small>
                               	</div>
							</div>
						</div>
						<div class="panel-heading">(IC02) Item Currículo 02 - Produção Científica</div>
                      	<div class="panel-body">
                      	
                      		<div class="col-lg-12">&nbsp;</div>
                      		
                      		<div class="col-lg-12">
								<div class="form-group" style="color: gray;"><strong>Atenção:</strong> Informe a quantidade de artigos publicados em revista ou congresso <strong>COM QUALIS</strong> publicados pelo candidato.</div>
							</div>
                      		
                      		<div class="col-lg-12">&nbsp;</div>
                      	
							<div class="col-lg-3">
                               	<div class="form-group">
                                   	<label>(IC02.1) Na Área de Comput.</label>
                                   	<input type="number" class="form-control" name="qtdAtigosComputacao" id="qtdAtigosComputacao" pattern="[0-9]+$" placeholder="Ex.: 4">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Peso 5</small>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                             	<div class="form-group">
                                   	<label>(IC02.2) Em Outras Áreas</label>
                                   	<input type="number" class="form-control" name="qtdAtigosOutras" id="qtdAtigosOutras" pattern="[0-9]+$" placeholder="Ex.: 2">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Peso 2</small>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>Pontuação Total</label>
                                   	<input class="form-control" name="prodCientificaPontuacaoTotal" id="prodCientificaPontuacaoTotal" readonly="readonly">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Pont. Total = (IC02.1 * 5) + (IC02.2 * 2)</small>
                                </div>
							</div>
												
							<div class="col-lg-3">
                               	<div class="form-group">
                                 	<label>Pontuação Item</label>
                                   	<input class="form-control" name="prodCientificaPontuacaoItem" id="prodCientificaPontuacaoItem" readonly="readonly">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Até 10,0 pontos</small>
                               	</div>
							</div>
						</div>
						
						<div class="panel-heading">(IC03) Item Currículo 03 - Experiência Profissional</div>
                      	<div class="panel-body">
                      	
                      		<div class="col-lg-12">&nbsp;</div>
                      		
                      		<div class="col-lg-10">
								<div class="form-group" style="color: gray;">
									<strong>Atenção:</strong> 
									<ul>
										<li> (1) Clique no botão Adicionar para incluir novos vínculos empregatícios ao candidato. </li>
										<li> (2) Informe a área de atuação e as datas de início e fim do respectivo vínculo empregatício. </li>
										<li> (3) Caso o vínculo esteja sem data de saída, ou seja, é um vínculo ainda em vigor deve ser informado no campo 'Data de Início do Vínculo' a data do primeiro dia do período das inscrições. </li>
										<li> (4) Clique em Remover para retirar o último vínculo empregatício adicionado. </li>
									</ul>
								</div>
							</div>
							
							<div class="col-lg-2">
								<div class="form-group" style="color: gray;">
									<button type="button" id="btAdicionarVinculo" class="btn btn-info glyphicon glyphicon-plus-sign" title="Adicionar Novo Vínculo Empregatício"> Adicionar</button> <br /> <br />
									<button type='button' id='removerVinculo' class='btn btn-danger glyphicon glyphicon-remove-sign' title="Remove Vínculo Empregatício"> Remover</button> 
								</div>
							</div>
							
							<div class="col-lg-12">&nbsp;</div>

                      		<div id="linhaVinculoEmpregaticio"></div>				
							
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>(TAC) Total Área Computação</label>
                                   	<input class="form-control" id="expProfTotalMesesAreaComp" name="expProfTotalMesesAreaComp" readonly="readonly">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Total de Meses Computação / 12</small>
                                </div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>(TOA) Total Outras Áreas</label>
                                   	<input class="form-control" id="expProfTotalMesesOutras" name="expProfTotalMesesOutras" readonly="readonly">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Total de Meses Outras / 12</small>
                                </div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>Total Geral</label>
                                   	<input class="form-control" id="expProfPontuacaoTotal" name="expProfPontuacaoTotal" readonly="readonly">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Total Geral = (TAC * 2) + (TOA * 1)</small>
                                </div>
							</div>
												
							<div class="col-lg-3">
                               	<div class="form-group">
                                 	<label>Pontuação Item</label>
                                   	<input class="form-control" id="expProfPontuacaoItem" name="expProfPontuacaoItem" readonly="readonly">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Até 10,0 pontos</small>
                               	</div>
							</div>
						</div>
						
						<div class="panel-heading">(IC04) Item Currículo 04 – Histórico Escolar da Graduação</div>
                      	<div class="panel-body">
                      	
                      		<div class="col-lg-12">&nbsp;</div>
                      		
                      		<div class="col-lg-12">
								<div class="form-group" style="color: gray;"><strong>Atenção:</strong> Informe a média geral indicada no histórico escolar da graduação do candidato.</div>
							</div>
                      		
                      		<div class="col-lg-12">
								<div class="form-group" style="color: gray;">
                                   	<label>Como Selecionar o Fator de Carga Horária:</label> <br />
                                   	Para cursos superiores com carga horária superior a 3.000 horas ou cursos realizados no exterior, selecione o <strong> Fator 1 </strong> <br />
                                   	Para cursos superiores com carga horária inferior a 3.000 horas, selecione o <strong> Fator 0,85 </strong>
								</div>
							</div>
                      		
                      		<div class="col-lg-12">&nbsp;</div>
                      	
							<div class="col-lg-3">
                               	<div class="form-group">
                                   	<label>(IC04.1) Média Histórico</label>
                                   	<input type="text" class="form-control" name="historicoMediaGeral" id="historicoMediaGeral" placeholder="Ex.: 8.5"> 
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Em caso de número decimal, utilizar PONTO ao invés de vírgula.</small>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                             	<div class="form-group">
                                   	<label>(IC04.2) Fator de Carga Horária</label>
                                   	<select name="historicoFatorCargaHoraria" id="historicoFatorCargaHoraria" class="form-control">
										<option value="0"> Selecione </option>
										<option value="0.85"> 0.85 </option>
										<option value="1"> 1 </option>
									</select>
                               	</div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>Pontuação Total</label>
                                   	<input class="form-control" name="historicoPontuacaoTotal" id="historicoPontuacaoTotal" readonly="readonly"> 
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Nota Histórico Escolar = IC04.1 * IC04.2</small>
                                </div>
							</div>
												
							<div class="col-lg-3">
                               	<div class="form-group">
                                 	<label>Pontuação Item</label>
                                   	<input class="form-control" name="historicoPontuacaoItem" id="historicoPontuacaoItem" readonly="readonly">
                                   	<small id="passwordHelpBlock" class="form-text text-muted">Até 10,0 pontos</small>
                               	</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
				
			<div class="row">
			
				<div class="col-lg-12">
					<div class="form-group">
                    	<small id="passwordHelpBlock" class="form-text text-muted"><span style="color: red;"> * </span> Campos de preenchimento obrigatório.</small>
                  	</div>
				</div>
			
				<div class="col-lg-12"> &nbsp; </div>
			
				<div class="col-lg-12">
					<div class="col-lg-6">
						<button type="button" class="btn btn-danger" id="btCancelar">Cancelar</button> &nbsp;
					</div>
					<div class="col-lg-6" style="text-align: right;">
	                   	<button type="reset" id="btLimpar" class="btn btn-default">Limpar</button> &nbsp;
	                   	<button type="submit" id="btSalvar" class="btn btn-primary">Salvar</button>
	                </div>
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