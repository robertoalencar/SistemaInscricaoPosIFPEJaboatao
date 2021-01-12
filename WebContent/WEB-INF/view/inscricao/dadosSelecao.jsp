<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Inscrição Pós Graduação</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />

</head>

<body>

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

        <div id="page-wrapper">
        
        	<div class="row">&nbsp;</div>
        	
            <div class="row">
            
            	<div class="row">
	                <div class="col-lg-12">
	                    <h3 class="page-header"><strong> Dados Consolidados da Seleção </strong></h3>
	                </div>
	            </div>
	            
	            <div class="row">
                	<div class="col-lg-12">
								
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th style="width: 50%; "> &nbsp; </th>
									<th style="width: 10%; vertical-align: middle; text-align: center; color: red;">2021</th>
									<th style="width: 10%; vertical-align: middle; text-align: center;">2019</th>
									<th style="width: 10%; vertical-align: middle; text-align: center;">2018</th>
									<th style="width: 10%; vertical-align: middle; text-align: center;">2017</th>
									<th style="width: 10%; vertical-align: middle; text-align: center;">2016</th>
          						</tr>
							</thead>
							<tbody>
								<tr style="background-color: #64FE2E;">
									<td style="vertical-align: middle; "> <strong>Dados Gerais</strong> </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
          						</tr>
								<tr>
									<td> &nbsp; -  &nbsp; Quantidade Vagas </td>
									<td style="vertical-align: middle; text-align: center; color: red;"> 60 </td>
									<td style="vertical-align: middle; text-align: center;"> 60 </td>
									<td style="vertical-align: middle; text-align: center;"> 60 </td>
									<td style="vertical-align: middle; text-align: center;"> 30 </td>
									<td style="vertical-align: middle; text-align: center;"> 20 </td>
          						</tr>
								<tr>
									<td> &nbsp; -  &nbsp; Quantidade Inscritos </td>
									<td style="vertical-align: middle; text-align: center; color: red;">${dadosSelecaoVo.quantidadeInscritos}</td>
									<td style="vertical-align: middle; text-align: center;"> 104 </td>
									<td style="vertical-align: middle; text-align: center;"> 145 </td>
									<td style="vertical-align: middle; text-align: center;"> 165 </td>
									<td style="vertical-align: middle; text-align: center;"> 127 </td>
          						</tr>
          						<tr>
									<td> &nbsp; -  &nbsp; Relação candidato/vaga </td>
									<td style="vertical-align: middle; text-align: center; color: red;"><fmt:formatNumber value="${dadosSelecaoVo.quantidadeInscritos/60}" pattern="#,#0.0#"/></td>
									<td style="vertical-align: middle; text-align: center;"> 1.7 </td>
									<td style="vertical-align: middle; text-align: center;"> 2.4 </td>
									<td style="vertical-align: middle; text-align: center;"> 5.5 </td>
									<td style="vertical-align: middle; text-align: center;"> 6.35 </td>
          						</tr>
          						<tr>
									<td> &nbsp; -  &nbsp; Desclassificados por documentação incompleta </td>
									<td style="vertical-align: middle; text-align: center; color: red;"> ${dadosSelecaoVo.quantidadeDesclassificados} </td>
									<td style="vertical-align: middle; text-align: center;"> 02 </td>
									<td style="vertical-align: middle; text-align: center;"> 02 </td>
									<td style="vertical-align: middle; text-align: center;"> 03 </td>
									<td style="vertical-align: middle; text-align: center;"> 03 </td>
          						</tr>
          						<tr>
									<td> &nbsp; -  &nbsp; Quantidade de recursos apresentados </td>
									<td style="vertical-align: middle; text-align: center; color: red;"> </td>
									<td style="vertical-align: middle; text-align: center;">  </td>
									<td style="vertical-align: middle; text-align: center;"> 02 </td>
									<td style="vertical-align: middle; text-align: center;"> 01 </td>
									<td style="vertical-align: middle; text-align: center;"> 07 </td>
          						</tr>
          						<tr style="background-color: #64FE2E;">
									<td style="vertical-align: middle;"> <strong>Dados Por Curso :: Gestão e Qualidade em TIC</strong> </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
          						</tr>
          						<tr>
									<td> &nbsp; -  &nbsp; Quantidade Vagas</td>
									<td style="vertical-align: middle; text-align: center; color: red;"> 30 </td>
									<td style="vertical-align: middle; text-align: center;"> 30 </td>
									<td style="vertical-align: middle; text-align: center;"> 30 </td>
									<td style="vertical-align: middle; text-align: center;"> 30 </td>
									<td style="vertical-align: middle; text-align: center;"> 20 </td>
          						</tr>
          						<tr>
									<td> &nbsp; -  &nbsp; Quantidade Inscritos</td>
									<td style="vertical-align: middle; text-align: center; color: red;"> ${dadosSelecaoVo.quantidadeInscritosPosGestao} </td>
									<td style="vertical-align: middle; text-align: center;"> 56 </td>
									<td style="vertical-align: middle; text-align: center;"> 82 </td>
									<td style="vertical-align: middle; text-align: center;"> 165 </td>
									<td style="vertical-align: middle; text-align: center;"> 127 </td>
          						</tr>
          						<tr>
									<td> &nbsp; -  &nbsp; Relação candidato/vaga</td>
									<td style="vertical-align: middle; text-align: center; color: red;"> <fmt:formatNumber value="${dadosSelecaoVo.quantidadeInscritosPosGestao/30}" pattern="#,#0.0#"/> </td>
									<td style="vertical-align: middle; text-align: center;"> 1.8 </td>
									<td style="vertical-align: middle; text-align: center;"> 2.7 </td>
									<td style="vertical-align: middle; text-align: center;"> 5.5 </td>
									<td style="vertical-align: middle; text-align: center;"> 6.35 </td>
          						</tr>
          						<tr>
									<td> 
										&nbsp; -  &nbsp; Quantitativo Classificados VCG  <br/>
										&nbsp; -  &nbsp; Quantitativo Classificados PPI  <br/>
										&nbsp; -  &nbsp; Quantitativo Classificados PCD  <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; color: red; vertical-align: bottom;"> 
										${dadosSelecaoVo.quantitativoClassificadosGestaoVCG} <br/>
										${dadosSelecaoVo.quantitativoClassificadosGestaoPPI} <br/>
										${dadosSelecaoVo.quantitativoClassificadosGestaoPCD} <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										27 <br/> 
										03 <br/>
										00 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										24 <br/> 
										05 <br/>
										01 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
          						</tr>
          						<tr>
									<td style="vertical-align: bottom;"> 
										&nbsp; -  &nbsp; Maior nota  <br/>
										&nbsp; -  &nbsp; Menor nota (aprovados)  <br/>
										&nbsp; -  &nbsp; Nota média (aprovados)  <br/>
									</td>
									<td style="text-align: center; color: red; vertical-align: bottom;">
										${dadosSelecaoVo.maiorNotaGestao} <br/> 
										${dadosSelecaoVo.menorNotaGestao} <br/>
										${dadosSelecaoVo.notaMediaGestao} <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										11.79 <br/> 
										0.9 <br/>
										0.0 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										10.71 <br/> 
										08.07 <br/>
										08.79 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;">  
										14.00 <br/> 
										09.09 <br/>
										10.25 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;">
										** <br/>  
										20.00 <br/> 
										15.73 <br/>
										13.00 <br/>
									</td>
          						</tr>
          						<tr>
									<td> 
										Perfil dos Candidatos Classificados<br/> <br/> 
										(1) Da área de TI  <br/>
										(2) De outras áreas  <br/>
										(3) Possui experiência profissional  <br/>
										(4) Não possui experiência profissional  <br/>
										(5) Homens  <br/>
										(6) Mulheres  <br/>
										(7) Pessoas com idade até 30 anos  <br/>
										(8) Pessoas com idade entre 30 e 40 anos  <br/>
										(9) Pessoas com idade entre 40 e 50 anos  <br/>
										(10) Pessoas com idade superior a 50  <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; color: red; vertical-align: bottom;">
										(1) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoAreaTI} <br/>
										(2) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoAreaOutras} <br/>
										(3) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoExpProf} <br/>
										(4) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoNaoExpProf} <br/>
										(5) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoQtdHomens} <br/>
										(6) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoQtdMulheres} <br/>
										(7) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoMenor30} <br/>
										(8) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoMaior30Menor40} <br/>
										(9) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoMaior40Menor50} <br/>
										(10) &nbsp; ${dadosSelecaoVo.perfilCandidatosGestaoMaior50} <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										(1) &nbsp; 28 <br/>
										(2) &nbsp; 07 <br/>
										(3) &nbsp; 31 <br/>
										(4) &nbsp; 04 <br/>
										(5) &nbsp; 27 <br/>
										(6) &nbsp; 03 <br/>
										(7) &nbsp; 06 <br/>
										(8) &nbsp; 18 <br/>
										(9) &nbsp; 05 <br/>
										(10) &nbsp; 01 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										(1) &nbsp; 25 <br/>
										(2) &nbsp; 05 <br/>
										(3) &nbsp; 30 <br/>
										(4) &nbsp; 00 <br/>
										(5) &nbsp; 25 <br/>
										(6) &nbsp; 05 <br/>
										(7) &nbsp; 13 <br/>
										(8) &nbsp; 11 <br/>
										(9) &nbsp; 06 <br/>
										(10) &nbsp; 00 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										(1) &nbsp; 25 <br/>
										(2) &nbsp; 05 <br/>
										(3) &nbsp; 29 <br/>
										(4) &nbsp; 01 <br/>
										(5) &nbsp; 25 <br/>
										(6) &nbsp; 05 <br/>
										(7) &nbsp; 09 <br/>
										(8) &nbsp; 15 <br/>
										(9) &nbsp; 03 <br/>
										(10) &nbsp; 03 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										(1) &nbsp; 16 <br/>
										(2) &nbsp; 04 <br/>
										(3) &nbsp; 19 <br/>
										(4) &nbsp; 01 <br/>
										(5) &nbsp; 16 <br/>
										(6) &nbsp; 04 <br/>
										(7) &nbsp; 08 <br/>
										(8) &nbsp; 08 <br/>
										(9) &nbsp; 03 <br/>
										(10) &nbsp; 01 <br/>
									</td>
          						</tr>
          						
          						
          						<tr style="background-color: #64FE2E;">
									<td style="vertical-align: middle;"> <strong>Dados Por Curso :: Desenv. Inovação e Tec. Emergentes</strong> </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
									<td style="vertical-align: middle; text-align: center;"> - </td>
          						</tr>
          						<tr>
									<td> &nbsp; -  &nbsp; Quantidade Vagas</td>
									<td style="vertical-align: middle; text-align: center; color: red;"> 30 </td>
									<td style="vertical-align: middle; text-align: center;"> 30 </td>
									<td style="vertical-align: middle; text-align: center;"> 30 </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
          						</tr>
          						<tr>
									<td> &nbsp; -  &nbsp; Quantidade Inscritos</td>
									<td style="vertical-align: middle; text-align: center; color: red;"> ${dadosSelecaoVo.quantidadeInscritosPosInovacao} </td>
									<td style="vertical-align: middle; text-align: center;"> 48 </td>
									<td style="vertical-align: middle; text-align: center;"> 63 </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
          						</tr>
          						<tr>
									<td> &nbsp; -  &nbsp; Relação candidato/vaga</td>
									<td style="vertical-align: middle; text-align: center; color: red;"> <fmt:formatNumber value="${dadosSelecaoVo.quantidadeInscritosPosInovacao/30}" pattern="#,#0.0#"/> </td>
									<td style="vertical-align: middle; text-align: center;"> 1.6 </td>
									<td style="vertical-align: middle; text-align: center;"> 2.1 </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
          						</tr>
          						<tr>
									<td> 
										&nbsp; -  &nbsp; Quantitativo Classificados VCG  <br/>
										&nbsp; -  &nbsp; Quantitativo Classificados PPI  <br/>
										&nbsp; -  &nbsp; Quantitativo Classificados PCD  <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; color: red; vertical-align: bottom;">
										${dadosSelecaoVo.quantitativoClassificadosInovacaoVCG} <br/>
										${dadosSelecaoVo.quantitativoClassificadosInovacaoPPI} <br/>
										${dadosSelecaoVo.quantitativoClassificadosInovacaoPCD} <br/>												
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										28 <br/> 
										02 <br/>
										00 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										25 <br/> 
										05 <br/>
										00 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
          						</tr>
          						<tr>
									<td> 
										&nbsp; -  &nbsp; Maior nota  <br/>
										&nbsp; -  &nbsp; Menor nota (aprovados)  <br/>
										&nbsp; -  &nbsp; Nota média (aprovados)  <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; color: red; vertical-align: bottom;">
										${dadosSelecaoVo.maiorNotaInovacao} <br/> 
										${dadosSelecaoVo.menorNotaInovacao} <br/>
										${dadosSelecaoVo.notaMediaInovacao} <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										11.54 <br/> 
										1.96 <br/>
										0.0 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										10.41 <br/> 
										07.80 <br/>
										09.01 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
          						</tr>
          						<tr>
									<td> 
										Perfil dos Candidatos Classificados<br/> <br/> 
										(1) Da área de TI  <br/>
										(2) De outras áreas  <br/>
										(3) Possui experiência profissional  <br/>
										(4) Não possui experiência profissional  <br/>
										(5) Homens  <br/>
										(6) Mulheres  <br/>
										(7) Pessoas com idade até 30 anos  <br/>
										(8) Pessoas com idade entre 30 e 40 anos  <br/>
										(9) Pessoas com idade entre 40 e 50 anos  <br/>
										(10) Pessoas com idade superior a 50  <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; color: red; vertical-align: bottom;">
										(1) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaAreaTI} <br/>
										(2) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaAreaOutras} <br/>
										(3) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaExpProf} <br/>
										(4) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaNaoExpProf} <br/>
										(5) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaQtdHomens} <br/>
										(6) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaQtdMulheres} <br/>
										(7) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaMenor30} <br/>
										(8) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaMaior30Menor40} <br/>
										(9) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaMaior40Menor50} <br/>
										(10) &nbsp; ${dadosSelecaoVo.perfilCandidatosInovaMaior50} <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										(1) &nbsp; 35 <br/>
										(2) &nbsp; 03 <br/>
										(3) &nbsp; 31 <br/>
										(4) &nbsp; 07 <br/>
										(5) &nbsp; 27 <br/>
										(6) &nbsp; 03 <br/>
										(7) &nbsp; 16 <br/>
										(8) &nbsp; 12 <br/>
										(9) &nbsp; 01 <br/>
										(10) &nbsp; 01 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
										(1) &nbsp; 28 <br/>
										(2) &nbsp; 02 <br/>
										(3) &nbsp; 29 <br/>
										(4) &nbsp; 01 <br/>
										(5) &nbsp; 25 <br/>
										(6) &nbsp; 05 <br/>
										(7) &nbsp; 09 <br/>
										(8) &nbsp; 15 <br/>
										(9) &nbsp; 04 <br/>
										(10) &nbsp; 02 <br/>
									</td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
									<td style="vertical-align: middle; text-align: center;"> n/a </td>
          						</tr>
							</tbody>
						</table>
						
						<div class="row">&nbsp;</div>
						
						<div class="row" style="margin-left: 1%; margin-bottom: 5%;">
							<small class="form-text text-muted" style="color: red;">* Dados da seleção atual</small> <br/>
							<small class="form-text text-muted">** De 2016 para 2017 houve uma mudança importante nos critérios de pontuação</small>
						</div>
						
					</div>
				</div>
            </div>
        </div>
    </div>

</body>
</html>