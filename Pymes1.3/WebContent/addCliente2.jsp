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
						<s:form id="validationForm" action="registrarCliente"
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
													<s:textfield name="cliente.nombre" id="nombre" />
												</div>
												<label class="col-lg-3 control-label">Apellidos</label>
												<div class="col-lg-7">
													<s:textfield name="cliente.apellido" id="apellido" />
												</div>
												<label class="col-lg-3 control-label">123</label>
												<div class="col-lg-7">
													<s:url id="idPro" action="cargaProfesor" />
														Profesor : <sj:select  href="%{idPro}"  
																	list="lstProfesor"
																	listKey="codigo"
																	listValue="datos" 
																	name="profesor" 
																	onChangeTopics="topicoAula,topicoCurso"
																	headerKey=" "
																	headerValue="[ Seleccione ]" cssStyle="width:200px"/>
													     Aula :
<s:url id="idAula" action="cargaProfesor" />
<sj:select  href="%{idAula}" 
			list="lstAula"
			listKey="codigo"
			listValue="descripcion" 
			name="aula" 
			reloadTopics="topicoAula"
			headerKey=" "
			headerValue="[ Seleccione ]"
			onChangeTopics="topicoCurso"/>
<br>
Curso : 
<s:url id="idCurso" action="cargaProfesor" />
<sj:select  href="%{idCurso}" 
			list="lstCurso"
			listKey="codigo"
			listValue="nombre" 
			name="curso" 
			reloadTopics="topicoCurso"
			headerKey=" "
			headerValue="[ Seleccione ]"/>
												</div>
												
												<s:hidden id="idHidden" name="imagen" value="" />

												
											</fieldset>

										</div>
									</div>
								</div>

								<!-- Step 2 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepTwo">Tomar Foto</a>
										</h4>
									</div>
									<div id="stepTwo" class="panel-collapse collapse">
										<div class="panel-body">
											<div class="panel-body">


												<fieldset>

													<img id='img' style="width: 400px;" src="">
													<div class="container">

														<!-- Trigger the modal with a button -->
														<div class="col-lg-offset-4">
															<button type="button" id="tomar" class="btn btn-success"
																data-toggle="modal" data-target="#myModal">Tomar
																Foto</button>
														</div>
														<!-- Modal -->
														<div class="modal fade" id="myModal" role="dialog">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">Modal Header</h4>
																	</div>
																	<div class="modal-body">
																		<div align="center">



																			<video width="500" id='webcam'></video>
																			<canvas style="display: none" id='canv'></canvas>
																		</div>
																		<div align="center">
																			<br /> <input type="button" class="btn btn-success"
																				id='captura' value="Tomar Foto">
																			<button type="button" id="cerrar"
																				class="btn btn-danger" data-dismiss="modal">Close</button>
																		</div>
																	</div>
																	<div class="modal-footer"></div>
																</div>
															</div>
														</div>
													</div>
												</fieldset>

											</div>

										</div>
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

	<!-- VALIDACIONES DE REGISTRAR CLIENTE -->


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#validationForm')
									.bootstrapValidator(
											{
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													NombreCliente : {
														selector : '#nombre',
														validators : {
															notEmpty : {
																message : 'El campo es requerido. No puede estar vacio'
															},
															stringLength : {
																min : 2,
																max : 30,
																message : 'El nombre del Cliente  debe contener más de 2 y menos de 30 caracteres'
															},
															regexp : {
																regexp : /^[a-zA-Z0\s]+$/,
																message : 'Solo puede ingresar letras en este campo'
															}
														}
													},

													ApellidoCliente : {
														selector : '#apellido',
														validators : {
															notEmpty : {
																message : 'El campo es requerido. No puede estar vacio'
															},
															stringLength : {
																min : 2,
																max : 30,
																message : 'El apellido del Cliente  debe contener más de 2 y menos de 30 caracteres'
															},
															regexp : {
																regexp : /^[a-zA-Z0\s]+$/,
																message : 'Solo puede ingresar letras en este campo'
															}
														}
													}
												}
											});
						});
	</script>


	<!-- FIN VALIDACIONES DE REGISTRAR CLIENTE -->




	<script type="text/javascript">
		//	$('#hola').attr("action","ingresarSistema"); 
		//alert("action " + $("#hola").attr("action"));

		$(document).ready(function() {

			$("#tomar").click(function() {

			});

		});


	</script>










</body>



<script>
	function myFunction() {
		var x = document.getElementById("bryan").value;
		if (x == "image") {

			$("#signature").hide(1000);
			$("#displayarea").show(1000);

		} else {

			$("#signature").show(1000);
			$("#displayarea").hide(1000);

		}

	}
</script>
<script>
	$(document).ready(function() {
		$('#captura').click(function() {

			$('#webcam').hide(1000);
			$('#cerrar').show(1000);
			$('#captura').hide();
		});

	});

	$(document).ready(function() {
		$('#tomar').click(function() {

			$('#webcam').show(1000);
			$('#captura').show();
			$('#cerrar').hide();

		});

	});

	var varHidden = document.getElementById("idHidden");

	window.addEventListener('load', init);

	function init() {
		var video = document.querySelector('#webcam'), canvas = document
				.querySelector('#canv'), btn = document
				.querySelector('#captura'), img = document
				.querySelector('#img');

		navigator.getUserMedia = (navigator.getUserMedia
				|| navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);

		if (navigator.getUserMedia) {
			navigator.getUserMedia({
				video : true
			}, function(stream) {
				video.src = window.URL.createObjectURL(stream);
				video.play();
			}, function(e) {
				console.log(e);
			})
		} else
			alert('Tienes un navegador obsoleto');

		video.addEventListener('loadedmetadata', function() {
			canvas.width = video.videoWidth;
			canvas.height = video.videoHeight;
		}, false);

		btn.addEventListener('click', function() {

			canvas.getContext('2d').drawImage(video, 0, 0);
			var imgData = canvas.toDataURL('image/png');
			img.setAttribute('src', imgData);
			varHidden.setAttribute('value', imgData);
		});
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#captura').click(function() {
			var idcli = $('#codi').attr("value"); //obtiene el valor de cliente.IdCliente

			$('#IDCliente').attr("value", idcli); //envia a hidden "IDCliente" el valor de idcli 

		});

	});
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#dni").keyup(function() {
			var value = $(this).val();
			$("#dniFoto").val(value);
		});
		$("#sesion").hide();

		$("#selec").click(function() {

			$("#sesion").show(1000);

		});

	});
</script>

<script src="libs/jquery.js"></script>

<script type="text/javascript">
	jQuery.noConflict()
</script>

<script>
	/*  @preserve
	    jQuery pub/sub plugin by Peter Higgins (dante@dojotoolkit.org)
	    Loosely based on Dojo publish/subscribe API, limited in scope. Rewritten blindly.
	    Original is (c) Dojo Foundation 2004-2010. Released under either AFL or new BSD, see:
	    http://dojofoundation.org/license for more information.
	 */
	(function($) {
		var topics = {};
		$.publish = function(topic, args) {
			if (topics[topic]) {
				var currentTopic = topics[topic], args = args || {};

				for (var i = 0, j = currentTopic.length; i < j; i++) {
					currentTopic[i].call($, args);
				}
			}
		};
		$.subscribe = function(topic, callback) {
			if (!topics[topic]) {
				topics[topic] = [];
			}
			topics[topic].push(callback);
			return {
				"topic" : topic,
				"callback" : callback
			};
		};
		$.unsubscribe = function(handle) {
			var topic = handle.topic;
			if (topics[topic]) {
				var currentTopic = topics[topic];

				for (var i = 0, j = currentTopic.length; i < j; i++) {
					if (currentTopic[i] === handle.callback) {
						currentTopic.splice(i, 1);
					}
				}
			}
		};
	})(jQuery);
</script>

<div style="visibility: hidden;"></div>
<script src="libs/jSignature.min.noconflict.js"></script>
<script>
	(function($) {

		$(document)
				.ready(
						function() {

							// This is the part where jSignature is initialized.
							var $sigdiv = $("#signature").jSignature({
								'UndoButton' : false

							})

							// All the code below is just code driving the demo. 
							, $tools = $('#tools'), $extraarea = $('#displayarea'), pubsubprefix = 'jSignature.demo.'

							var export_plugins = $sigdiv.jSignature(
									'listPlugins', 'export'), chops = [
									'<label class="col-lg-3 control-label">Country</label><select id="bryan"  class="form-control" onchange="myFunction()" >',
									'<option value="">(nuevo)</option>' ], name

							//cambaimos el for por solo el index donde esta la imagen , ya que solo necesitamos guardarlo en imagen
							name = export_plugins[2]
							chops.push('<option  value="' + name + '">' + name
									+ '</option>')

							chops.push('')

							$(chops.join(''))
									.bind(
											'change',
											function(e) {
												if (e.target.value !== '') {
													var data = $sigdiv
															.jSignature(
																	'getData',
																	e.target.value)
													$.publish(pubsubprefix
															+ 'formatchanged')
													if (typeof data === 'string') {
														$('textarea', $tools)
																.val(data)
													} else if ($.isArray(data)
															&& data.length === 2) {
														$('textarea', $tools)
																.val(
																		data
																				.join(','))
														$
																.publish(
																		pubsubprefix
																				+ data[0],
																		data);
													} else {
														try {
															$('textarea',
																	$tools)
																	.val(
																			JSON
																					.stringify(data))
														} catch (ex) {
															$('textarea',
																	$tools)
																	.val(
																			'Not sure how to stringify this, likely binary, format.')
														}
													}
												}
											}).appendTo($tools)

							$(
									'<input type="button" id="limpiar" class="btn btn-info col-lg-7" value="Limpiar">')
									.bind('click', function(e) {
										$sigdiv.jSignature('reset')
									}).appendTo($tools)

							$(
									'<div style="visibility: hidden;"><textarea style="width:100%;height:7em;"></textarea></div>')
									.appendTo($tools)

							$.subscribe(pubsubprefix + 'formatchanged',
									function() {
										$extraarea.html('')
									})

							$
									.subscribe(
											pubsubprefix + 'image/svg+xml',
											function(data) {

												try {
													var i = new Image()
													i.src = 'data:' + data[0]
															+ ';base64,'
															+ btoa(data[1])
													$(i).appendTo($extraarea)
												} catch (ex) {

												}

												var message = [
														"If you don't see an image immediately above, it means your browser is unable to display in-line (data-url-formatted) SVG.",
														"This is NOT an issue with jSignature, as we can export proper SVG document regardless of browser's ability to display it.",
														"Try this page in a modern browser to see the SVG on the page, or export data as plain SVG, save to disk as text file and view in any SVG-capabale viewer." ]
												$(
														"<div>"
																+ message
																		.join("<br/>")
																+ "</div>")
														.appendTo($extraarea)
											});

							$
									.subscribe(
											pubsubprefix
													+ 'image/svg+xml;base64',
											function(data) {
												var i = new Image()
												i.src = 'data:' + data[0] + ','
														+ data[1]
												$(i).appendTo($extraarea)

												var message = [
														"If you don't see an image immediately above, it means your browser is unable to display in-line (data-url-formatted) SVG.",
														"This is NOT an issue with jSignature, as we can export proper SVG document regardless of browser's ability to display it.",
														"Try this page in a modern browser to see the SVG on the page, or export data as plain SVG, save to disk as text file and view in any SVG-capabale viewer." ]
												$(
														"<div>"
																+ message
																		.join("<br/>")
																+ "</div>")
														.appendTo($extraarea)
											});

							$
									.subscribe(
											pubsubprefix + 'image/png;base64',
											function(data) {
												var varH = document
														.getElementById("obtenerImagen");
												var i = new Image()
												i.src = 'data:' + data[0] + ','
														+ data[1]
												var sr = 'data:' + data[0]
														+ ',' + data[1]

												i.id = 'dataImagen'
												$('').appendTo($extraarea)
												$(i).appendTo($extraarea)
												varH.setAttribute('value', sr);

											});

							$
									.subscribe(
											pubsubprefix
													+ 'image/jsignature;base30',
											function(data) {
												$(
														'<span><b>This is a vector format not natively render-able by browsers. Format is a compressed "movement coordinates arrays" structure tuned for use server-side. The bonus of this format is its tiny storage footprint and ease of deriving rendering instructions in programmatic, iterative manner.</b></span>')
														.appendTo($extraarea)
											});

							if (Modernizr.touch) {
								$('#scrollgrabber').height(
										$('#content').height())
							}

						})

	})(jQuery)
</script>
</html>