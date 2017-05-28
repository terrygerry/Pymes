<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<jsp:include page="index.jsp"></jsp:include>


<body>

    <div class="container">
        <div class="row">
            <!-- form: -->
          
                <div class="page-header">
                    <h1>Mantenimiento de Empleado</h1>
                </div>

            
               
                    <div class="panel panel-green">
                        <div class="panel-heading">
                        
                        </div>
                        <!-- /.panel-heading -->
                       
                       
                       <div class="panel-body">
   
  
              
               
               
               <!-----------------------PONER CODIGO A PARTIR DE AQUI ---------------------------- -->

 
                      <div class="panel-body">
                       
                      <div class="dataTable_wrapper">
                        <s:a href="listaSucursal"><button type="button" class="btn btn-outline btn-success btn-lg btn-block">NUEVO EMPLEADO</button></s:a><br>
                         
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                   
                                        <tr>
                                            <td>Código</td>
											<td>Nombre</td>
											<td>Apellido</td>
											<td>Sexo</td>
											<td>DNI</td>
											<td>Cargo</td>
											<td>Fecha Naci.</td>
											<td>Fecha Reg.</td>
											<td>Sucursal</td>
                                            <td>Foto</td>
                                       <th>Operaciones</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                  
                                       <s:iterator value="listaEmpleado">
                                      	 <s:url id="idEliminar" action="eliminarEmpleado">
				 							<s:param name="empleado.codigo" value="codigo"/>
				 						 </s:url>
				 						 <s:url id="idBuscar" action="buscarEmpleado">
				 							<s:param name="empleado.codigo" value="codigo"/>
										 </s:url>
                                        <tr>
                                         <td><s:property value="codigo" /></td>
                                         <td><s:property value="nombre" /></td>
                                         <td><s:property value="apellido" /></td>
                                         <td><s:property value="sexo" /></td>
                                         <td><s:property value="dni" /></td>
                                         <td><s:property value="cargo" /></td>
                                         <td><s:property value="fechaNacimiento" /></td>
                                         <td><s:property value="fechaRegistro" /></td>
                                         <td><s:property value="nomSucursal" /></td>
                                         <td>
                                         	<img alt="Imagen" src="verFoto?idCodigo=<s:property value="codigo" />" 
                                         		width="70px" height="45px">
                                         </td>
                                         <td align="center">	
                                           	<s:a href="%{idBuscar}">
                                            	<button type="button" class="glyphicon glyphicon-pencil"><i class="fa fa-check"></i></button>
                                            </s:a>   
                                    		<s:a href="%{idEliminar}">
                                            	<button type="button" class="glyphicon glyphicon-remove" ><i class="fa fa-times"></i></button>
                                            </s:a>
                                        </tr>
                                    </s:iterator>
                                    </tbody>
                                </table>
                                </div>
                            </div>
                    
                    </div>
                 
                    </div>
                    </div></div></div>
    <!-----------------------------------------TERMINA CODIGO HASTA AQUI ---------------------------- -->
              
       
        
    
    
    

    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
</body>
</html>




