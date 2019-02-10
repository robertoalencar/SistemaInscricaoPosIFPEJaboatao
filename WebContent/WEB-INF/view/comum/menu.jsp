		<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>/home">IFPE Campus Jaboat�o - Inscri��es P�s-Gradua��o</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="dadosUsuario"><i class="fa fa-user fa-fw"></i> ${usuarioLogado.nome} </a></li>
                        <li><a href="changePasswordView"><i class="fa fa-edit"></i> Mudar Senha </a></li>
                        <li class="divider"></li>
                        <li><a href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out fa-fw"></i> Logout </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    	<li class="sidebar-search">
                            <div style="text-align: center;">
                            	<img src="<%=request.getContextPath()%>/resources/img/Ifpe_logomarca2.png" style="width: 90%;">
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/home"><i class="fa fa-dashboard fa-fw"></i> Dashboard </a>
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Inscri��es <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=request.getContextPath()%>/inscricao/list"><i class="fa fa-table fa-fw"></i> Listar</a>
                                </li>
                                <li>
                                	<a href="<%=request.getContextPath()%>/inscricao/add"><i class="fa fa-edit fa-fw"></i> Nova</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Usu�rio <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=request.getContextPath()%>/usuario/list"><i class="fa fa-table fa-fw"></i> Listar</a>
                                </li>
                                <li>
                                	<a href="<%=request.getContextPath()%>/usuario/add"><i class="fa fa-edit fa-fw"></i> Nova</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>