<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Pós Graduação - Avaliar Inscrição</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/maskedinput.js"></script>

	<script type="text/javascript">

		$(document).ready(function() {
			
			$("#btCancelar").click(function() {
	    		window.location="<%=request.getContextPath()%>/inscricao/list";
			});
	    	
		});
	
	</script>

</head>

<body>

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

        <div id="page-wrapper">
        
        	<form role="form" action="" method="post">
        	
        	<input type="hidden" name="idInscricao" value="${inscricao.id}">
        
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><strong> AVALIAR INSCRIÇÃO </strong></h3>
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
									<label>Número de Inscrição: </label> ${inscricao.numero}
								</div>
							</div>

							<div class="col-lg-6">
								<div class="form-group">
									<label>Nome: </label> ${inscricao.candidato.nome} 
								</div>
							</div>

							<div class="col-lg-6">
								<div class="form-group">
									<label>CPF: </label> ${inscricao.candidato.cpf} 
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group">
									<label>Data de Nascimento: </label> <fmt:formatDate value='${inscricao.candidato.dataNacimento}' pattern='dd/MM/yyyy' /> 
								</div>
							</div>
							
							<div class="col-lg-6">
								<div class="form-group">
									<label>Sexo: </label> ${inscricao.candidato.sexo}
								</div>
							</div>

							<div class="col-lg-6">
								<div class="form-group">
									<label>Fone Residencial: </label> ${inscricao.candidato.foneResidencial} 
								</div>
							</div>

							<div class="col-lg-6">
								<div class="form-group">
									<label>Fone Celular: </label> ${inscricao.candidato.foneCelular} 
								</div>
							</div>

							<div class="col-lg-12">
								<div class="form-group">
									<label>E-mail: </label> ${inscricao.candidato.email} 
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
					<div class="panel panel-danger">
      					<div class="panel-heading">Pontuação do Candidato</div>
                        <div class="panel-body">
                          	
							<div class="col-lg-12">
								<div class="form-group">
									<label>Curso Escolhido: </label> ${inscricao.cursoEscolhido}
								</div>
							</div>
                           	<div class="col-lg-6">
								<div class="form-group">
                                   	<label>Documentação Completa</label>
                                   	<div class="radio">
                                     	<label><input type="radio" name="documentacaoCompleta" value="true" required="required">Sim</label> &nbsp;
                                       	<label><input type="radio" name="documentacaoCompleta" value="false">Não</label>
                                   	</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Nota Final: </label> 
									<input class="form-control" name="notaFinal" id="notaFinal" readonly="readonly" style="width: 20%;">
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
                                   	<label>Tipo da Vaga</label>
                                   	<select name="tipoVaga" class="form-control" required="required">
										<option value=""> Selecione </option>
										<option value="VCG"> VCG - Vagas para concorrência geral </option>
										<option value="VPP"> VPP - Vagas para pretos e pardos </option>
										<option value="VCI"> VCI - Vagas para indígenas </option>
										<option value="PCD"> PCD - Vagas para pessoas com deficiência </option>
									</select>
								</div>
							</div>
							
						</div>
					</div>
               	</div>
			</div>
               	
            <div class="row">
            	<div class="col-lg-12">
					<div class="panel panel-danger">
    					<div class="panel-heading">(IC01) Item Currículo 01 - Cursos de Graduação - Informe a quantidade de cursos concluídos pelo candidato</div>
                      	<div class="panel-body">
							<div class="col-lg-3">
                               	<div class="form-group">
                                   	<label>Na Área de Computação</label>
                                   	<input type="number" class="form-control" name="gradQtdCursosComputacao" id="gradQtdCursosComputacao" pattern="[0-9]+$">
                               	</div>
							</div>
					
							<div class="col-lg-3">
                             	<div class="form-group">
                                   	<label>Em Outras Áreas</label>
                                   	<input type="number" class="form-control" name="gradQtdCursosOutros" id="gradQtdCursosOutros" pattern="[0-9]+$">
                               	</div>
							</div>
					
							<div class="col-lg-3">
                            	<div class="form-group">
                                  	<label>Pontuação Total</label>
                                   	<input class="form-control" name="gradPontuacaoTotal" id="gradPontuacaoTotal" readonly="readonly">
                                </div>
							</div>
												
							<div class="col-lg-3">
                               	<div class="form-group">
                                 	<label>Pontuação Item (Até 3,0 pontos)</label>
                                   	<input class="form-control" name="gradPontuacaoItem" id="gradPontuacaoItem" readonly="readonly">
                               	</div>
							</div>
					
						</div>
					</div>
				</div>
			</div>
				
			<div class="row">
				<div class="col-lg-12">
					<div class="col-lg-12"> &nbsp; </div>
					<div class="col-lg-6">
						<button type="button" class="btn btn-danger" id="btCancelar">Cancelar</button> &nbsp;
					</div>
					<div class="col-lg-6" style="text-align: right;">
	                   	<button type="reset" id="btLimpar" class="btn btn-default">Limpar</button> &nbsp;
	                   	<button type="submit" id="btSalvar" class="btn btn-primary">Salvar</button>
	                </div>
                </div>
			</div>
			
			</form>
			
		</div>
	</div>

</body>
</html>