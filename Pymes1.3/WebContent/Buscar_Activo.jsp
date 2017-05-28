<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<jsp:include page="index.jsp"></jsp:include>


<body>

    <div class="container">
        <div class="row">
            <!-- form: -->
          
                <div class="page-header">
                    <h1>Mantenimiento de Bienes</h1>
                </div>

            
               
                    <div class="panel panel-green">
                        <div class="panel-heading">
                        
                        </div>
                        <!-- /.panel-heading -->
                       
                       
                       <div class="panel-body">
   
  
              
               
               
               <!-----------------------PONER CODIGO A PARTIR DE AQUI ---------------------------- -->

 
                      <div class="panel-body">
                       
                      <div class="dataTable_wrapper">
                        <s:a href="addBienes.jsp"><button type="button" class="btn btn-outline btn-success btn-lg btn-block">NUEVO REGISTRO DE BIENES</button></s:a><br>
                         
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                   
                                        <tr>
                                        	<td>idactivo</td>
                                        	<td>nombre</td>
                                        	<td>centroCosto</td>
                                        	<td>grupo</td>
                                        	<td>ubicacion</td>
                                        	<td>responsable</td>
                                        	<td>idproveedor</td>
                                        	<td>marca</td>
                                        	<td>modelo</td>
                                        	<td>serie</td>
                                        	<td>placa</td>
                                        	<td>codigoBarra</td>
                                        	<td>fechaCompra</td>
                                        	<td>valorComprar</td>
                                        	<td>garantia</td>
                                        	<td>venceGarantia</td>
                                        	<td>vidaUtil</td>
                                        	<td>polizanro</td>
                                        	<td>fecha</td>
                                        	<td>vencePoliza</td>
                                        	<td>aseguradora</td>
                                        	<td>agente</td>
                                        	<td>valorAsegurado</td>
                                        	<td>primaAnual</td>
                                        	<td>primaMensual</td>
                                        	<td>deducible</td>
                                        	<td>telefonoAgente</td>
                                        	<td>deptSolic</td>
                                        	<td>nombSolic</td>
                                        	<td>destino</td>
                                        	<td>fechaSalida</td>
                                        	<td>condiciones</td>
                                        	<td>observacion</td>
                                        	<td>idTipo_Activo</td>
                                       		<th>Operaciones</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                       <s:iterator value="listarActivo">
<!--                                       	 <s:url id="idEliminar" action="eliminarEmpleado"> -->
<!-- 				 							<s:param name="empleado.codigo" value="codigo"/> -->
<!-- 				 						 </s:url> -->
<!-- 				 						 <s:url id="idBuscar" action="buscarEmpleado"> -->
<!-- 				 							<s:param name="empleado.codigo" value="codigo"/> -->
<!-- 										 </s:url> -->
                                        <tr>
                                        	<td><s:property value="idactivo"/></td>
                                        	<td><s:property value="nombre"/></td>
                                        	<td><s:property value="centroCosto"/></td>
                                        	<td><s:property value="grupo"/></td>
                                        	<td><s:property value="ubicacion"/></td>
                                        	<td><s:property value="responsable"/></td>
                                        	<td><s:property value="idproveedor"/></td>
                                        	<td><s:property value="marca"/></td>
                                        	<td><s:property value="modelo"/></td>
                                        	<td><s:property value="serie"/></td>
                                        	<td><s:property value="placa"/></td>
                                        	<td><s:property value="codigoBarra"/></td>
                                        	<td><s:property value="fechaCompra"/></td>
                                        	<td><s:property value="valorComprar"/></td>
                                        	<td><s:property value="garantia"/></td>
                                        	<td><s:property value="venceGarantia"/></td>
                                        	<td><s:property value="vidaUtil"/></td>
                                        	<td><s:property value="polizanro"/></td>
                                        	<td><s:property value="fecha"/></td>
                                        	<td><s:property value="vencePoliza"/></td>
                                        	<td><s:property value="aseguradora"/></td>
                                        	<td><s:property value="agente"/></td>
                                        	<td><s:property value="valorAsegurado"/></td>
                                        	<td><s:property value="primaAnual"/></td>
                                        	<td><s:property value="primaMensual"/></td>
                                        	<td><s:property value="deducible"/></td>
                                        	<td><s:property value="telefonoAgente"/></td>
                                        	<td><s:property value="deptSolic"/></td>
                                        	<td><s:property value="nombSolic"/></td>
                                        	<td><s:property value="destino"/></td>
                                        	<td><s:property value="fechaSalida"/></td>
                                        	<td><s:property value="condiciones"/></td>
                                        	<td><s:property value="observacion"/></td>
                                        	<td><s:property value="idTipo_Activo"/></td>
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
                responsive: true,
                "searching": false,
                "sDom": '<"top"i>rt<"bottom"flp><"clear">'
        });
    });
    </script>
</body>
</html>




