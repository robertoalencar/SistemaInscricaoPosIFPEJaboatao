<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Inscrição Pós Graduação</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />

</head>

<body>

	<br />
	<br />
	<br />

	<div align="center" style="color: #6E6E6E;">

		<table style="width: 70%;">
			<tr>
				<td style="text-align: left; width: 70%; vertical-align: bottom;">
					Bem vindo ao sistema de avaliação de candidatos dos cursos de <strong style="color: #DF0101;">Pós-graduação</strong> do <strong style="color: #088A29;">IFPE Campus Jaboatão dos Guararapes</strong>, informe suas credencias de acesso para acessar o sistema.
				</td>
				<td style="text-align: right; width: 30%; vertical-align: bottom;">
					<img src="<%=request.getContextPath()%>/resources/img/Ifpe_logomarca2.png" style="width: 70%;">
				</td>
			</tr>
		</table>
	
		<hr class="linhaSeparador" />
		
		<c:if test="${msg ne null}">
			<div class="alert alert-error" style="width: 70%;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				${msg}
			</div>
		</c:if>
	
		<div style="width: 20%; font-size: 20px;">
	
			<form action="efetuarLogin" method="post">
	
				<br/>
	
				<div class="form-group" style="text-align: left;">
	   				<label for="inputLogin">Login</label>
	   				<input type="text" class="form-control" id="inputLogin" name="login" value="${usuario.login}" maxlength="20" required="required" tabindex="1">
	 				</div>
	 				
	 				<div class="form-group" style="text-align: left;">
	   				<label for="inputSenha">Senha</label>
	   				<input type="password" class="form-control" id="inputSenha" name="senha" value="${usuario.senha}" maxlength="20" required="required" tabindex="2">
	 			</div>
	 				
	 			<br/>
	 				
	 			<button type="submit" class="btn btn-primary" tabindex="3" style="width: 100%; height: 50px;"> &nbsp; ENTRAR &nbsp; </button>
	 			
			</form>
		</div>
	</div>

	<p style="margin-top: 5%;">
	
	<hr class="linhaSeparador">
	
	<div class="textoRodape">
		<p><c:import url="/WEB-INF/view/comum/textoRodape.jsp" /></p>
	</div>

</body>
</html>