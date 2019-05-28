<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Inscri��o P�s Gradua��o</title>

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
	                    <h3 class="page-header"><strong> Dados Consolidados da Sele��o </strong></h3>
	                </div>
	            </div>
	            
	            <div class="row">
                	<div class="col-lg-12">
						<div class="panel panel-info">
      						<div class="panel-heading">Quadro Comparativo das Sele��es</div>
							<div class="panel-body">
							
								<div class="row">&nbsp;</div>
						
								<div class="col-lg-12">
								
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th style="width: 60%;"> &nbsp; </th>
												<th style="width: 10%; vertical-align: middle; text-align: center; color: red;">2019</th>
												<th style="width: 10%; vertical-align: middle; text-align: center;">2018</th>
												<th style="width: 10%; vertical-align: middle; text-align: center;">2017</th>
												<th style="width: 10%; vertical-align: middle; text-align: center;">2016</th>
			          						</tr>
										</thead>
										<tbody>
											<tr>
												<td style="vertical-align: middle; text-align: center;"> <strong>Dados Gerais</strong> </td>
												<td style="vertical-align: middle; text-align: center;"> - </td>
												<td style="vertical-align: middle; text-align: center;"> - </td>
												<td style="vertical-align: middle; text-align: center;"> - </td>
												<td style="vertical-align: middle; text-align: center;"> - </td>
			          						</tr>
											<tr>
												<td> Quantidade Vagas </td>
												<td style="vertical-align: middle; text-align: center; color: red;"> 60 </td>
												<td style="vertical-align: middle; text-align: center;"> 60 </td>
												<td style="vertical-align: middle; text-align: center;"> 30 </td>
												<td style="vertical-align: middle; text-align: center;"> 20 </td>
			          						</tr>
											<tr>
												<td> Quantidade Inscritos </td>
												<td style="vertical-align: middle; text-align: center; color: red;">${listaInscricoes.size()}</td>
												<td style="vertical-align: middle; text-align: center;"> 145 </td>
												<td style="vertical-align: middle; text-align: center;"> 165 </td>
												<td style="vertical-align: middle; text-align: center;"> 127 </td>
			          						</tr>
			          						<tr>
												<td> Rela��o candidato/vaga </td>
												<td style="vertical-align: middle; text-align: center; color: red;">${listaInscricoes.size()/60}</td>
												<td style="vertical-align: middle; text-align: center;"> 2.4 </td>
												<td style="vertical-align: middle; text-align: center;"> 5.5 </td>
												<td style="vertical-align: middle; text-align: center;"> 6.35 </td>
			          						</tr>
			          						<tr>
												<td> Desclassificados por documenta��o incompleta </td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
												<td style="vertical-align: middle; text-align: center;"> 02 </td>
												<td style="vertical-align: middle; text-align: center;"> 03 </td>
												<td style="vertical-align: middle; text-align: center;"> 03 </td>
			          						</tr>
			          						<tr>
												<td> Quantidade de recursos apresentados </td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
												<td style="vertical-align: middle; text-align: center;"> 02 </td>
												<td style="vertical-align: middle; text-align: center;"> 01 </td>
												<td style="vertical-align: middle; text-align: center;"> 07 </td>
			          						</tr>
			          						<tr>
												<td style="vertical-align: middle; text-align: center;"> <strong>Dados Por Curso</strong> </td>
												<td style="vertical-align: middle; text-align: center;"> - </td>
												<td style="vertical-align: middle; text-align: center;"> - </td>
												<td style="vertical-align: middle; text-align: center;"> - </td>
												<td style="vertical-align: middle; text-align: center;"> - </td>
			          						</tr>
			          						<tr>
												<td> Quantidade Vagas :: Gest�o e Qualidade em TIC</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> 30 </td>
												<td style="vertical-align: middle; text-align: center;"> 30 </td>
												<td style="vertical-align: middle; text-align: center;"> 30 </td>
												<td style="vertical-align: middle; text-align: center;"> 20 </td>
			          						</tr>
			          						<tr>
												<td> Quantidade Vagas :: Desenv. Inova��o e Tec. Emergentes</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> 30 </td>
												<td style="vertical-align: middle; text-align: center;"> 30 </td>
												<td style="vertical-align: middle; text-align: center;"> n/a </td>
												<td style="vertical-align: middle; text-align: center;"> n/a </td>
			          						</tr>
			          						<tr>
												<td> Quantidade Inscritos :: Gest�o e Qualidade em TIC</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
												<td style="vertical-align: middle; text-align: center;"> 82 </td>
												<td style="vertical-align: middle; text-align: center;"> 165 </td>
												<td style="vertical-align: middle; text-align: center;"> 127 </td>
			          						</tr>
			          						<tr>
												<td> Quantidade Inscritos :: Desenv. Inova��o e Tec. Emergentes</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
												<td style="vertical-align: middle; text-align: center;"> 63 </td>
												<td style="vertical-align: middle; text-align: center;"> n/a </td>
												<td style="vertical-align: middle; text-align: center;"> n/a </td>
			          						</tr>
			          						<tr>
												<td> Rela��o candidato/vaga :: Gest�o e Qualidade em TIC</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
												<td style="vertical-align: middle; text-align: center;"> 2.7 </td>
												<td style="vertical-align: middle; text-align: center;"> 5.5 </td>
												<td style="vertical-align: middle; text-align: center;"> 6.35 </td>
			          						</tr>
			          						<tr>
												<td> Rela��o candidato/vaga :: Desenv. Inova��o e Tec. Emergentes</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
												<td style="vertical-align: middle; text-align: center;"> 2.1 </td>
												<td style="vertical-align: middle; text-align: center;"> n/a </td>
												<td style="vertical-align: middle; text-align: center;"> n/a </td>
			          						</tr>
			          						<tr>
												<td> 
													Gest�o e Qualidade em TIC: <br/> <br/> 
													- Quantitativo Classificados VCG  <br/>
													- Quantitativo Classificados PPI  <br/>
													- Quantitativo Classificados PCD  <br/>
												</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
												<td style="vertical-align: middle; text-align: center; vertical-align: bottom;"> 
													24 <br/> 
													05 <br/>
													01 <br/>
												</td>
												<td style="vertical-align: middle; text-align: center;"> n/a </td>
												<td style="vertical-align: middle; text-align: center;"> n/a </td>
			          						</tr>
			          						<tr>
												<td> 
													Desenv. Inova��o e Tec. Emergentes: <br/> <br/> 
													- Quantitativo Classificados VCG  <br/>
													- Quantitativo Classificados PPI  <br/>
													- Quantitativo Classificados PCD  <br/>
												</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
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
													Gest�o e Qualidade em TIC: <br/> <br/> 
													- Maior nota  <br/>
													- Menor nota (aprovados)  <br/>
													- Nota m�dia (aprovados)  <br/>
												</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
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
													Desenv. Inova��o e Tec. Emergentes: <br/> <br/> 
													- Maior nota  <br/>
													- Menor nota (aprovados)  <br/>
													- Nota m�dia (aprovados)  <br/>
												</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
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
													Perfil dos Candidatos Classificados :: Gest�o e Qualidade em TIC <br/> <br/> 
													(1) Da �rea de TI  <br/>
													(2) De outras �reas  <br/>
													(3) Possui experi�ncia profissional  <br/>
													(4) N�o possui experi�ncia profissional  <br/>
													(5) Homens  <br/>
													(6) Mulheres  <br/>
													(7) Pessoas com idade at� 30 anos  <br/>
													(8) Pessoas com idade entre 30 e 40 anos  <br/>
													(9) Pessoas com idade entre 40 e 50 anos  <br/>
													(10) Pessoas com idade superior a 50  <br/>
												</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
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
			          						<tr>
												<td> 
													Perfil dos Candidatos Classificados :: Desenv. Inova��o e Tec. Emergentes <br/> <br/> 
													(1) Da �rea de TI  <br/>
													(2) De outras �reas  <br/>
													(3) Possui experi�ncia profissional  <br/>
													(4) N�o possui experi�ncia profissional  <br/>
													(5) Homens  <br/>
													(6) Mulheres  <br/>
													(7) Pessoas com idade at� 30 anos  <br/>
													(8) Pessoas com idade entre 30 e 40 anos  <br/>
													(9) Pessoas com idade entre 40 e 50 anos  <br/>
													(10) Pessoas com idade superior a 50  <br/>
												</td>
												<td style="vertical-align: middle; text-align: center; color: red;"> </td>
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
									
									<div class="row">
										<small class="form-text text-muted" style="color: red;">* Dados da sele��o atual</small> <br/>
										<small class="form-text text-muted">** De 2016 para 2017 houve uma mudan�a importante nos crit�rios de pontua��o</small>
									</div>
								
								</div>
							
							</div>
						</div>
					</div>
				</div>
                
            </div>
        </div>
    </div>

</body>
</html>