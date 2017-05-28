<jsp:include page="index.jsp"></jsp:include>
<%@ taglib uri="/struts-jquery-tags" prefix="sj"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-1.10.2.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script src="libs/modernizr.js"></script>
<sj:head jqueryui="false" jquerytheme="blitzer"/>
</head>
<body>
<s:form id="idx" theme="bootstrap" cssClass="form-horizontal">
<s:url id="idPro" action="cargaProfesor" />
Profesor : <sj:select  href="%{idPro}" 
			list="lstProfesor"
			listKey="codigo"
			listValue="datos" 
			name="profesor" 
			onChangeTopics="topicoAula,topicoCurso"
			headerKey=" "
			headerValue="[ Seleccione ]"/>

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
 </s:form>
</body>
</html>