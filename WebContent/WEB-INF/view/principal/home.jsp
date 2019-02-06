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

	<div id="wrapper">

        <c:import url="/WEB-INF/view/comum/menu.jsp" />

        <div id="page-wrapper">
        	<div class="row">&nbsp;</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-3 col-md-6">
                                
				                    <div class="panel panel-primary">
				                        <div class="panel-heading">
				                            <div class="row">
				                                <div class="col-xs-3">
				                                    <i class="fa fa-list-alt fa-5x"></i>
				                                </div>
				                                <div class="col-xs-9 text-right">
				                                    <div class="huge">${listaInscricoes.size()}</div>
				                                    <div>Inscrições Realizadas</div>
				                                </div>
				                            </div>
				                        </div>
				                        <a href="<%=request.getContextPath()%>/inscricao/list">
				                            <div class="panel-footer">
				                                <span class="pull-left">Visualizar Inscrições</span>
				                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
				                                <div class="clearfix"></div>
				                            </div>
				                        </a>
				                    </div>
				                    
				                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>
</html>