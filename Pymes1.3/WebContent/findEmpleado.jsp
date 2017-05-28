<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/datepicker.min.css" />
<link rel="stylesheet" href="css/datepicker3.min.css" />
<script src="js/bootstrap-datepicker.min.js"></script>
<style>
	#verFoto{
	position:absolute;
	left:680px;
	top:100px;
	border: white;
	width: 180px;
	height: 270px;
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
		document.getElementById("imgFoto").src=''; 
	};
	reader.readAsDataURL(file);
}
</script>



<body>

  <div id="wrapper">

  
   
 
   
   <div id="page-wrapper">
   
  
     <div class="container-fluid">
      <div class="page-header">
                     <a href="listarEmpleado"><img src="images/volver.jpg" width="45px"/></a>
                </div>
        <div class="row">
            <!-- form: -->
            <section>
               <div class="col-lg-8 col-lg-offset-2">
               
               
               <!-----------------------PONER CODIGO A PARTIR DE AQUI ---------------------------- -->
               
                  
      <s:form id="idActualiza"  method="post"  enctype="multipart/form-data" action="actualizarEmpleado" 
			theme="bootstrap" cssClass="form-horizontal">
			<div style="background-color: white" id="verFoto" >
				<img id="imgFoto" src="verFoto?idCodigo=<s:property value="empleado.codigo" />" 
				width="180px" height="270px">
			</div>
			<s:hidden name="empleado.codigo"/>
                        <div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos Personales</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<fieldset>
				                                <label class="col-lg-3 control-label">Nombre</label>
				                                <div class="col-lg-7">
				                                    <s:textfield   name="empleado.nombre"  id="nombre"/>
				                                </div>
				                                <label class="col-lg-3 control-label">Apellido</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="empleado.apellido" id="apellido" />
				                                </div>
				   								<label class="col-lg-3 control-label">Sexo</label>
				                                <div class="col-lg-7">
				                                    <s:select 	name="empleado.sexo"
														list="#{'Masculino':'Masculino','Femenino':'Femenino'}"
														headerKey=" "
														headerValue="[Seleccione]" id="sexo" >
													</s:select>
				                                </div>
				                                <label class="col-lg-3 control-label">DNI</label>
				                                <div class="col-lg-7">
				                                    <s:textfield 	name="empleado.dni" id="dni" />
				                                </div>
				                           		<label class="col-lg-3 control-label">Cargo</label>
				                                <div class="col-lg-7">
				                                    <s:select 	name="empleado.cargo"
														list="#{'Administrador':'Administrador','Contador':'Contador'}"
														headerKey=" "
														headerValue="[Seleccione]" id="cargo"/>
				                                </div>
				 								<label class="col-lg-3 control-label">Sucursal</label>          
				                                  <div class="col-lg-7">  
													<s:select	name="empleado.codSucursal" id="sucursal"
													list="listaSucursal"
													listKey="codigo"
													listValue="nombre"
													headerKey=" "
													headerValue="[Seleccione]" cssStyle="width:200px"/>
				                             	</div>    
												<div class="form-group">
												        <label class="col-xs-3 control-label">Fecha Naci.</label>
												        <div class="col-xs-5 date">
												            <div class="input-group input-append date" id="datePicker">
																
												                <s:textfield class="form-control" name="empleado.fechaNacimiento"/>
												                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
												            </div>
												        </div>
												    </div>				                             	                                              
												<div class="form-group">
												        <label class="col-xs-3 control-label">Fecha Reg.</label>
												        <div class="col-xs-5 date">
												            <div class="input-group input-append date" id="datePicker2">
																
												                <s:textfield class="form-control" name="empleado.fechaRegistro"/>
												                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
												            </div>
												        </div>
												    </div>				                             	                                              				                             	
				                             	<div id="foto">
					                             <label class="col-lg-3 control-label">Seleccione Foto</label>
					                                <div class="col-lg-7">
					                                    <s:file name="empleado.Foto" onchange="processFiles(this.files)" />
					                                </div>
                           						</div>                                              
				                            	<div class="col-lg-9 col-lg-offset-3">
				                            		<s:submit id="s" cssClass="btn btn-primary" name="Actualizar" value="Actualizar"/>
				                            	</div> 
                                			</fieldset>            

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
    
    
    <script type="text/javascript">
    $(document).ready(function() {
    $('#idActualiza').bootstrapValidator({
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








