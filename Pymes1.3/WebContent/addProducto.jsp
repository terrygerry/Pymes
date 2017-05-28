<%@ taglib uri="/struts-jquery-tags" prefix="sj"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<jsp:include page="index.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
  <head>
<script src="js/jquery-1.10.2.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script src="libs/modernizr.js"></script>

<sj:head jqueryui="true" jquerytheme="blitzer"/>
</head>

<body>

	<div class="row ">
		<div style="visibility: hidden;">
		</div>
		<!-- /.col-lg-12 -->
		<div class="container-fluid">
			<div class="row">
				<!-- form: -->
				<section>
					<div class="col-lg-8 col-lg-offset-2">
						<s:form id="validationForm" action="registrarProducto"
							theme="bootstrap" cssClass="form-horizontal">

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

												<label class="col-lg-3 control-label">Nombres</label>
												<div class="col-lg-7">
													<s:textfield name="producto.nombre" id="nombre" />
												</div>
												<label class="col-lg-3 control-label">Precio</label>
												<div class="col-lg-7">
													<s:textfield name="producto.precio" id="precio" />
												</div>
												<label class="col-lg-3 control-label">Stock</label>
												<div class="col-lg-7">
													<s:textfield name="producto.stock" id="stock" />
												</div>
												<label class="col-lg-3 control-label">Marca</label>
												<div class="col-lg-7">
													<s:url id="idMarca" action="cargaMarca" />
														<sj:select  href="%{idMarca}"  
																	list="lstMarca"
																	listKey="codigo"
																	listValue="nombre" 
																	name="marca" 
																	onChangeTopics="topicoCategoria"
																	headerKey=" "
																	headerValue="[ Seleccione ]" cssStyle="width:200px"/>
												</div>
												<label class="col-lg-3 control-label">Categoria</label>
												<div class="col-lg-7">
													<s:url id="idCategoria" action="cargaMarca" />
														<sj:select  href="%{idCategoria}"  
																	list="lstCategoria"
																	listKey="codigo"
																	listValue="nombre" 
																	name="categoria" 
																	reloadTopics="topicoCategoria"
																	headerKey=" "
																	headerValue="[ Seleccione ]" cssStyle="width:200px"/>
												</div>

												
											</fieldset>

										</div>
									</div>
								</div>

							<div class="col-lg-9 col-lg-offset-3">
								<s:submit id="btnRegistrar" cssClass="btn btn-primary"
									name="Registrar" value="Registrar"></s:submit>
							</div>
						</s:form>
					</div>

					<br />






				</section>
			</div>
		</div>
	</div>

</html>