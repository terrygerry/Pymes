<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>



<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script src="js/bootstrap-select.js"></script>

<link rel="stylesheet" href="css/datepicker.min.css" />
<link rel="stylesheet" href="css/datepicker3.min.css" />

<script src="js/bootstrap-datepicker.min.js"></script>



<style>
	#verFoto{
	border: white;
	width: 280px;
	height: 170px;
	background: orange;
	background-size: 100%;
	background-repeat: no-repeat;
	}
</style>
<script>
function processFiles(files) {
	var file = files[0];
	var reader = new FileReader();
	reader.onload = function (e) {
		var output = document.getElementById("verFoto"); 
		verFoto.style.backgroundImage = "url('" + e.target.result + "')";
	};
	reader.readAsDataURL(file);
}

</script>
<jsp:include page="index.jsp"></jsp:include>


<body>
	

  <div id="wrapper">
   <div id="page-wrapper">
   
   <div class="container-fluid" lang="center">
  	
               
               
    <!-----------------------PONER CODIGO A PARTIR DE AQUI ---------------------------- -->
    
    <s:form id=""  method="post"  action="" 
			theme="bootstrap" cssClass="form-horizontal">
			<label class="col-lg-3 control-label">Tipo de Bien</label>
				<div class="col-lg-7 selectpicker" >
					<s:select 	name=""
						list="#{'1':'Inmobiliario','2':'Mobiliario'}"
						headerKey=""
						headerValue="[Seleccione]" id="cboTipoActivo" >
					</s:select>
				</div>
				<button  type="button" id="btnNuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onchange="de()">NUEVO</button>
		
	</s:form>
	<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="titulo"></h4>
        </div>
        <div class="modal-body">
          <s:form id="idRegistra"  method="post"  action="registrarActivo" 
			theme="bootstrap" cssClass="form-horizontal">
                        <div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne" >Registro de Activo</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<fieldset>
				                                
				                                <label class="col-lg-3 control-label">Nombre </label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.nombre" id="txtNombre" />
				                                </div>
				                                <label class="col-lg-3 control-label">Costo</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.centroCosto" id="txtCosto" />
				                                </div>
				                                <label class="col-lg-3 control-label">Grupo</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.grupo" id="txtGrupo" />
				                                </div>
				                                <label class="col-lg-3 control-label">Ubicacion</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.ubicacion" id="txtUbicacion" />
				                                </div>
				                                <label class="col-lg-3 control-label">Responsable</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.responsable" id="txtResponsable" />
				                                </div>
				   								<label class="col-lg-3 control-label">Proveedor</label>
				   								<div class="col-lg-7">
				                                    <s:textfield 	name="activo.idproveedor" id="txtProveedor" />
				                                </div>
				                                <label class="col-lg-3 control-label">Marca</label>
				                                <div class="col-lg-7">
				                                    <s:textarea 	name="activo.marca" id="txtMarca" />
				                                </div>
				                                <label class="col-lg-3 control-label">Modelo</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.modelo" id="txtModelo" />
				                                </div>
				                                <label class="col-lg-3 control-label">Serie</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.serie" id="txtSerie" />
				                                </div>
				                                <label class="col-lg-3 control-label" id="lblPlaca">Placa</label>
				                                <div class="col-lg-7" id="divPlaca">
				                                    <s:textfield 	name="activo.placa" id="txtPlaca" />
				                                </div>
				                                <label class="col-lg-3 control-label">Codigo Barra</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.codigoBarra" id="txtCodigoBarra" />
				                                </div>
				                               <div class="form-group">
												        <label class="col-xs-3 control-label">Fecha Compra</label>
												        <div class="col-xs-5 date">
												            <div class="input-group input-append date" id="datePicker">
																
												                <input type="text" class="form-control" name="activo.fechaCompra"/>
												                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
												            </div>
												        </div>
												    </div>
				                                <label class="col-lg-3 control-label">Valor Compra</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.valorComprar" id="txtValorCompra" />
				                                </div>
				                                <label class="col-lg-3 control-label">Garantia</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.garantia" id="txtGarantia" />
				                                </div>
				                                <label class="col-lg-3 control-label">Vence Garantia</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.venceGarantia" id="txtVenceGarantia" />
				                                </div>
				                                <label class="col-lg-3 control-label">Vida Util</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.vidaUtil" id="txtvidaUtil" />
				                                </div>
				                                <label class="col-lg-3 control-label">Nro Poliza</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.polizanro" id="txtPoliza" />
				                                </div>
				                               <div class="form-group">
												        <label class="col-xs-3 control-label">Fecha </label>
												        <div class="col-xs-5 date">
												            <div class="input-group input-append date" id="datePicker2">
																
												                <input type="text" class="form-control" name="activo.fecha"/>
												                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
												            </div>
												        </div>
												    </div>
				                                <label class="col-lg-3 control-label">Vence Poliza</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.vencePoliza" id="txtVencePoliza" />
				                                </div>
				                                <label class="col-lg-3 control-label">Aseguradora</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.aseguradora" id="txtAseguradora" />
				                                </div>
				                                <label class="col-lg-3 control-label">Agente</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.agente" id="txtAgente" />
				                                </div>
				                                <label class="col-lg-3 control-label">Valor Asegurador</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.valorAsegurado" id="txtValorAsegurado" />
				                                </div>
				                                <label class="col-lg-3 control-label">Prima Anual</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.primaAnual" id="txtPrimaAnual" />
				                                </div>
				                                <label class="col-lg-3 control-label">Prima Mensual</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.primaMensual" id="txtPrimaMensual" />
				                                </div>
				                                <label class="col-lg-3 control-label">Deducible</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.deducible" id="txtDeducible" />
				                                </div>
				                                <label class="col-lg-3 control-label">Telefono Agente</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.telefonoAgente" id="txtTelefonoAg" />
				                                </div>
				                                <label class="col-lg-3 control-label">Dept Solicitante</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.deptSolic" id="txtDept" />
				                                </div>
				                                <label class="col-lg-3 control-label">Nombre Solicitante</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.nombSolic" id="txtNombSolic" />
				                                </div>
				                                <label class="col-lg-3 control-label">Destino</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.destino" id="txtDestino" />
				                                </div>
				                                <label class="col-lg-3 control-label">Fecha Salida</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.fechaSalida" id="txtFechaSalida" />
				                                </div>
				                                <label class="col-lg-3 control-label">Condiciones</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="activo.condiciones" id="txtCondicion" />
				                                </div>
				                                <label class="col-lg-3 control-label">Observacion</label>
				                                <div class="col-lg-7">
				                                    <s:textfield name="activo.observacion" id="txtObservacion" />
				                                </div>
				                                <label class="col-lg-3 control-label">Tipo Activo</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="idTipo_Activo" id="txtTipoActivo" />
				                                </div>                                           
				                            	<div class="col-lg-9 col-lg-offset-3">
				                            		<s:submit id="s" cssClass="btn btn-primary" name="Registrar" value="Registrar"/>
				                            	</div> 
                                			</fieldset>            

									     </div>
									   </div>
									</div>
							</div>
                        </s:form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
<!--       <div class="page-header"> -->
<!--                     <a href="listBienes.jsp"><img src="images/volver.jpg" width="45px"/></a> -->
<!--                 </div> -->
<!--         <div class="row"> -->
            <!-- form: -->    
      
                 
                    
    <!-----------------------------------------TERMINA CODIGO HASTA AQUI ---------------------------- -->
            <!-- :form -->
            	<div class="panel-body">
                       
                      <div class="dataTable_wrapper">
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
        
        
    	</div>
    </div>
    
    
    
     
    <!-- VALIDACIONES DE REGISTRAR AUTO -->
    
    
    <script type="text/javascript">
    $(document).ready(function() {
    	
    	$("#cboTipoActivo").change(function(){
            var options = document.getElementById("cboTipoActivo").options; 
            var selectedIndex = document.getElementById("cboTipoActivo").selectedIndex; 
            var selectedOptionText = options[selectedIndex].text;
            var selectedOptionValue = options[selectedIndex].value;
            
            if(selectedOptionValue==1){
            document.getElementById('titulo').innerHTML="Registro NO Activo";
			$("#divPlaca").hide();            
			$("#lblPlaca").hide();
            }else{
            	document.getElementById('titulo').innerHTML="Registro Activo";
            	$("#divPlaca").show();            
    			$("#lblPlaca").show();
            }
            console.log("Id of selected option is: " + selectedOptionValue);
            console.log("Text of selected option is: " + selectedOptionText);   
        });	
    	
//     	$('#datePicker')
//         .datepicker({
//             format: 'yyyy-mm-dd'
//         })
//         .on('changeDate', function(e) {
//             // Revalidate the date field
//            // $('#idRegistra').formValidation('revalidateField', 'empleado.fechaNacimiento');
//             //$('#idRegistra').formValidation('revalidateField', 'empleado.fechaRegistro');
//         });
//     	$('#datePicker2')
//         .datepicker({
//             format: 'yyyy-mm-dd'
//         })
//         .on('changeDate', function(e) {
//             // Revalidate the date field
//            // $('#idRegistra').formValidation('revalidateField', 'empleado.fechaNacimiento');
//             //$('#idRegistra').formValidation('revalidateField', 'empleado.fechaRegistro');
//         });
//     	/*$('#datePicker')
//         .datepicker({
//             format: 'yyyy-mm-dd'
//         })
//         .on('changeDate', function(e) {
//             // Revalidate the date field
//             $('#idRegistra').formValidation('revalidateField', 'empleado.fechaRegistro');
//         });*/
//     $('#idRegistra').bootstrapValidator({
//         message: 'This value is not valid',
//         feedbackIcons: {
//             valid: 'glyphicon glyphicon-ok',
//             invalid: 'glyphicon glyphicon-remove',
//             validating: 'glyphicon glyphicon-refresh'
//         },
//         fields: {
//         	Nombre: {
//         		selector:'#nombre',
//                 validators: {
//                     notEmpty: {
//                         message: 'El campo Nombre es requerido. No puede estar vacio'
//                     },
//                     stringLength: {
//                         min: 3,
//                         max: 30,
//                         message: 'El nombre debe contener más de 3 y menos de 30 caracteres'
//                     },
//                     regexp: {
//                         regexp: /^[a-zA-Z\s]+$/,
//                         message: 'El nombre sólo puede consistir en letras'
//                     }
//                 }
//             },
//             Apellido: {
//             	selector: '#apellido',
//                 validators: {
//                     notEmpty: {
//                         message: 'El campo Apellido es requerido. No puede estar vacio.'
//                     },
//                     stringLength: {
//                			min: 3,
//                			max: 30,
// 		                message: 'El apellido debe contener más de 3 y menos de 30 caracteres'
// 		            },
// 		            regexp: {
// 		                regexp:  /^[a-zA-Z\s]+$/,
// 		                message: 'El apellido sólo puede consistir en letras'
// 		            }
//                 }
//             },
//             Sexo: {
//             	selector: '#sexo',
//                 validators: {
//                     notEmpty: {
//                         message: 'El campo Sexo es requerido. No puede estar vacio.'
//                     }
//                 }
//             },           
//             Dni: {
//             	selector: '#dni',
//                 validators: {
//                     notEmpty: {
//                         message: 'El campo DNI es requerido. No puede estar vacio.'
//                     },
//                     regexp: {
//                 		regexp: /^[0-9]{8}$/,
//                 		message: 'El DNI sólo puede consistir digitos de 8 cifras'
//                      }
            
            
//                 }
//             },          
//             Cargo: {
//             	selector: '#cargo',
//                 validators: {
//                     notEmpty: {
//                         message: 'El campo Cargo es requerido. No puede estar vacio.'
//                     }
//                 }
//             },
//             Sucusal:{
//             	selector:'#sucursal',
//             	validators:{
//             		notEmpty: {
//                         message: 'El campo Sucursal es requerido. No puede estar vacio.'
//                     }
//             	}
//             }

//         }
//     });   
});
    function name() {
    	alert(document.getElementById("#cboTipoActivo").value());
		if(document.getElemntById("#cboTipoActivo").value==1){
			$(".modal-title").text("REGISTRAR ACTIVO MOBILIARIO");
		}
		else
		{
			$(".modal-title").text("REGISTRAR ACTIVO INMOBILIARIO");
		}
	}
    
    function de() {
    	d=document.getElemntById("#cboTipoActivo").value;
    	console.log(d);
	}
    
	
</script>
    
    
     <!-- FIN VALIDACIONES DE REGISTRAR AUTO -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>

    <!-- Bootstrap Core JavaScript -->

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>


    <!-- Page-Level Demo Scripts - Tables - Use for reference -->








