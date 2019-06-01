<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">

	<title>Inscrição Pós Graduação</title>

	<c:import url="/WEB-INF/view/comum/arquivosJS.jsp" />
	<c:import url="/WEB-INF/view/comum/arquivosCSS.jsp" />


	<script type="text/javascript">
	
		$(document).ready(function() {

			$.post("atualizarDadosSelecao", function(dados) { });
		});
		
	</script>

</head>

<body>

	<c:import url="/WEB-INF/view/comum/menu.jsp" />

</body>
</html>
