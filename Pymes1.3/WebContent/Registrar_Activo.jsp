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
    
    <s:form id="idRegistra"  method="post"  action="registrarBienes" 
			theme="bootstrap" cssClass="form-horizontal">
			<label class="col-lg-3 control-label">Tipo de Bien</label>
				<div class="col-lg-7 selectpicker" >
					<s:select 	name=""
						list="#{'1':'Inmobiliario','2':'Mobiliario'}"
						headerKey=""
						headerValue="[Seleccione]" id="cboTipoActivo">
					</s:select>
				</div>
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onchange="de()">NUEVO</button>
	</s:form>
	<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
          <s:form id="idRegistra"  method="post"  action="registrarBienes" 
			theme="bootstrap" cssClass="form-horizontal">
                        <div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne" >Registro de Bien</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<fieldset>
<!-- 				                                <div class="form-group"> -->
<!-- 												        <label class="col-xs-3 control-label">Fecha de Adq.</label> -->
<!-- 												        <div class="col-xs-5 date"> -->
<!-- 												            <div class="input-group input-append date" id="datePicker"> -->
<!-- 												                <input type="text" class="form-control" name="empleado.fechaNacimiento"/> -->
<%-- 												                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span> --%>
<!-- 												            </div> -->
<!-- 												        </div> -->
<!-- 												    </div>	 -->
				                                <label class="col-lg-3 control-label">Nombre del Prov.</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="" id="" />
				                                </div>
				                                <label class="col-lg-3 control-label">Numero de Fact.</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="" id="" />
				                                </div>
				   								<label class="col-lg-3 control-label">Tipo de Bien</label>
				                                <div class="col-lg-7">
				                                    <s:select 	name=""
														list="#{}"
														headerKey=" "
														headerValue="[Seleccione]" id="" >
													</s:select>
				                                </div>
				                                <label class="col-lg-3 control-label">Descrip. del Bien</label>
				                                <div class="col-lg-7">
				                                    <s:textarea 	name="" id="" />
				                                </div>
				                                <label class="col-lg-3 control-label">Unidad de Medida</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="" id="" />
				                                </div>
				                                <label class="col-lg-3 control-label">Valor de Adq.</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="" id="" />
				                                </div>
				                                <label class="col-lg-3 control-label">Estado Fisico</label>
				                                <div class="col-lg-7">
				                                    <s:select 	name=""
														list="#{}"
														headerKey=" "
														headerValue="[Seleccione]" id="" >
													</s:select>
				                                </div>
				                                <label class="col-lg-3 control-label">Ubi.Fisi. del Bien</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="" id="" />
				                                </div>
				                                <label class="col-lg-3 control-label">Codigo segun Empresa</label>
				                                <div class="col-lg-7">
				                                    <s:textfield name="" id="" disabled="true" />
				                                </div>
				                                <label class="col-lg-3 control-label">Persona Respo. del Bien</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="" id="" />
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
            <section>
               <div class="col-lg-8 col-lg-offset-2">          
      
                 
                    
    <!-----------------------------------------TERMINA CODIGO HASTA AQUI ---------------------------- -->
                </div>
            </section>
            <!-- :form -->
               <div class="panel-body">
                       
                      <div class="dataTable_wrapper">
                        <s:a href="addBienes.jsp"><button type="button" class="btn btn-outline btn-success btn-lg btn-block">NUEVO REGISTRO DE BIENES</button></s:a><br>
                         
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                   
                                        <tr>
                                            <td>Fecha de Adq.</td>
											<td>Nombre Prov.</td>
											<td>Numero Fact.</td>
											<td>Tipo de Bien</td>
											<td>Descr. del Bien</td>
											<td>Unidad de Medi.</td>
											<td>Valor de Adq.</td>
											<td>Estado Fisico</td>
											<td>Ubi.Fis del Bien</td>
											<td>Codigo</td>
											<td>Empleado</td>
                                            
                                       <th>Operaciones</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                  <!--
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
                                         <td align="center">	
                                           	<s:a href="%{idBuscar}">
                                            	<button type="button" class="glyphicon glyphicon-pencil"><i class="fa fa-check"></i></button>
                                            </s:a>   
                                    		<s:a href="%{idEliminar}">
                                            	<button type="button" class="glyphicon glyphicon-remove" ><i class="fa fa-times"></i></button>
                                            </s:a>
                                        </tr>
                                    </s:iterator>  -->
                                    </tbody>
                                </table>
                                </div>
                            </div>
                    </div>
        </div>
        
        
    </div>
    </div>
    
    </div>
    
    
     
    <!-- VALIDACIONES DE REGISTRAR AUTO -->
    
    
    <script type="text/javascript">
    $(document).ready(function() {
    	
    	
    	
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








