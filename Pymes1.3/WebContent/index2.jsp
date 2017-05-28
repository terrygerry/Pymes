<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link
	href="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link
	href="bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">
	
	
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	
	

</head>
<body style="height: 1500px">



      <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">SERPRODAT</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Mantenimiento <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="listarEmpleado">Empleado</a></li>
          <li><a href="addCliente.jsp">Cliente</a></li>
         
        </ul>
      </li>
      <li><a href="#">Proceso</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Reportes <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Empleado</a></li>
          <li><a href="#">Cliente</a></li>
         
        </ul>
      </li>
      <s:iterator value="#session.objUsuarioMenus">
					<li>
						<a href="${pageContext.request.contextPath}/<s:property value="ruta"/>">
							<s:property value="descripcion"/>
						</a>
					</li>
				</s:iterator>   

    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<s:url action="logout"></s:url>">
      	<span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
    </ul>
        <ul  class="nav navbar-nav navbar-right">
    	<li><a href=""><s:property value="#session.objUsuario.nombres"/></a></li>
    </ul>
  </div>
</nav>
  
<div class="container">
  
</div>

	
	
</body>
</html>

