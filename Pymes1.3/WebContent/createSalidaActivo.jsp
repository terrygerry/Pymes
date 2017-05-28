<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>



<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

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




<body>

  <div id="wrapper">
   <div id="page-wrapper">
   
  
     <div class="container-fluid">
<!--       <div class="page-header"> -->
<!--         <a href="listBienes.jsp"><img src="images/volver.jpg" width="45px"/></a> -->
<!--       </div> -->
        <div class="row">
            <!-- form: -->
            <section>
               <div class="col-lg-8 col-lg-offset-2">
               
               
               <!-----------------------PONER CODIGO A PARTIR DE AQUI ---------------------------- -->
               
                  
      <s:form id="idRegistra"  method="post"  action="registrarBienes" 
			theme="bootstrap" cssClass="form-horizontal">
                        <div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title" align="center">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne" >Ficha de Salida de Activo Fijo</a>
										</h4>
										
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											
											
											<table>
												<tr>
													<td  align="left" width="50%" ></td>
													<td align="right" width="25%" >
														<table>
															<tr>
																<td  class="col-xs-3 control-label"><label>FECHA: </label></td>
																<td><s:textfield  disabled="true" name="" id="" /></td>
															</tr>
														</table>
													</td>
													<td align="right" width="25%" >
														<table>
															<tr>
																<td><label>FICHA NRO:</label></td>
					                                   			<td><s:textfield disabled="true"	name="" id="" /></td>
					                                   		</tr>
														</table>
													</td>
												</tr>
											</table>
											<table>
												<tr>
												<td>
												<label class="col-lg-3 control-label">Nombre del Solicitante</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="" id="" />
				                                </div>
												<label class="col-lg-3 control-label">Depart. Solicitante</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="" id="" />
				                                </div>
				                                <label class="col-lg-3 control-label">Cantidad</label>
				                               	<div class="col-lg-7">
    												<s:textfield type="number" name="" />
    											</div>
				                                <div class="form-group">
												        <label class="col-xs-3 control-label">Moviliario o Equipo</label>
												        <div class="col-lg-7">
				                                    		<s:textfield 	name="" id="" />
				                                    		<s:a href=""><button type="button" class="btn btn-primary">Buscar Equipo</button></s:a><br>
				                                		</div>
												</div>
												<label class="col-lg-3 control-label">Entra</label>
				                                <div class="col-lg-7">
				                                    <s:select 	name=""
														list="#{}"
														headerKey=" "
														headerValue="[Seleccione]" id="" >
													</s:select>
				                                </div>
				                                <div class="container-fluid">
            											<fieldset class="col-md-6">    	
															<legend>Reingreso</legend>
															<div class="panel panel-default">
																<div class="panel-body">
																	<div class="form-group">
																		<label class="col-lg-3 control-label">Nro. Ficha</label>
				                                						<div class="col-lg-7">
				                                    						<s:textfield 	name="" id="" />
				                                						</div>
				                                						<label class="col-lg-3 control-label">Fecha</label>
												        				<div class="col-xs-5 date">
												            				<div class="input-group input-append date" id="datePicker">
												                				<input type="text" class="form-control" name="empleado.fechaNacimiento"/>
												                				<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
												            				</div>
												        				</div>
												        			</div>
																</div>
															</div>
														</fieldset>
<!-- 														<div class="clearfix"></div> -->
												</div>
												<br>
												<br>
												<label class="col-lg-3 control-label">Motivo de Ingreso y Procedencia :</label>
				                                <div class="col-lg-7">
				                                    <s:textarea 	name="" id="" />
				                                </div>
				                                <label class="col-lg-3 control-label">Observaciones :</label>
				                                <div class="col-lg-7">
				                                    <s:textarea 	name="" id="" />
				                                </div>
				                                <div class="col-lg-9 col-lg-offset-3">
				                            		<s:submit id="s" cssClass="btn btn-primary" name="Registrar" value="Grabar"/>
				                            		&nbsp;
				                            		&nbsp;
				                            		&nbsp;
				                            		&nbsp;
				                            		<s:a href="index.jsp"><button type="button" class="btn btn-primary">Salir</button></s:a>
				                            	</div>
				                            		</td>
												</tr>
											</table>
									     </div>
									</div>
								</div>
							</div>
                        </s:form>
                 
                    
    <!-----------------------------------------TERMINA CODIGO HASTA AQUI ---------------------------- -->
                </div>
            </section>
            <!-- :form -->
              
        </div>
        
        
    </div>
    </div>
    
    </div>
    
    
     
    <!-- VALIDACIONES DE REGISTRAR AUTO -->
    
<script>
    $("input[name='demo_vertical']").TouchSpin({
      verticalbuttons: true
    });
</script>
    
    
    <script type="text/javascript">
    $(document).ready(function() {
    	$('#datePicker')
        .datepicker({
            format: 'yyyy-mm-dd'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
           // $('#idRegistra').formValidation('revalidateField', 'empleado.fechaNacimiento');
            //$('#idRegistra').formValidation('revalidateField', 'empleado.fechaRegistro');
        });
    	$('#datePicker2')
        .datepicker({
            format: 'yyyy-mm-dd'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
           // $('#idRegistra').formValidation('revalidateField', 'empleado.fechaNacimiento');
            //$('#idRegistra').formValidation('revalidateField', 'empleado.fechaRegistro');
        });
    	/*$('#datePicker')
        .datepicker({
            format: 'yyyy-mm-dd'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#idRegistra').formValidation('revalidateField', 'empleado.fechaRegistro');
        });*/
    $('#idRegistra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	Nombre: {
        		selector:'#nombre',
                validators: {
                    notEmpty: {
                        message: 'El campo Nombre es requerido. No puede estar vacio'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El nombre debe contener más de 3 y menos de 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'El nombre sólo puede consistir en letras'
                    }
                }
            },
            Apellido: {
            	selector: '#apellido',
                validators: {
                    notEmpty: {
                        message: 'El campo Apellido es requerido. No puede estar vacio.'
                    },
                    stringLength: {
               			min: 3,
               			max: 30,
		                message: 'El apellido debe contener más de 3 y menos de 30 caracteres'
		            },
		            regexp: {
		                regexp:  /^[a-zA-Z\s]+$/,
		                message: 'El apellido sólo puede consistir en letras'
		            }
                }
            },
            Sexo: {
            	selector: '#sexo',
                validators: {
                    notEmpty: {
                        message: 'El campo Sexo es requerido. No puede estar vacio.'
                    }
                }
            },           
            Dni: {
            	selector: '#dni',
                validators: {
                    notEmpty: {
                        message: 'El campo DNI es requerido. No puede estar vacio.'
                    },
                    regexp: {
                		regexp: /^[0-9]{8}$/,
                		message: 'El DNI sólo puede consistir digitos de 8 cifras'
                     }
            
            
                }
            },          
            Cargo: {
            	selector: '#cargo',
                validators: {
                    notEmpty: {
                        message: 'El campo Cargo es requerido. No puede estar vacio.'
                    }
                }
            },
            Sucusal:{
            	selector:'#sucursal',
            	validators:{
            		notEmpty: {
                        message: 'El campo Sucursal es requerido. No puede estar vacio.'
                    }
            	}
            }

        }
    });
});

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








