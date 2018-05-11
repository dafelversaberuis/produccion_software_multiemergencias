<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import="java.util.*,java.text.SimpleDateFormat"
	session="false"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
 <title>CURSOS BLS, ACLS, PRIMEROS AUXILIOS. MULTIEMERGENCIAS BUCARAMANGA</title><link rel="icon" type="image/gif" href="/imagenes/favicon_multiemergencias.gif" />
<meta name="description" content="Cursos de Soporte Vital Básico y Avanzado. Formación para personal del area de la salud en Santander "/>
<meta name="keywords" content="cursos bls, cursos acls, cursos de primeros auxilios, cursos toma de muestras de laboratorios, toma de citologias, curso atención integral a victimas de violencia sexual, Cursos salud bucaramanga, capacitación en salud santander "/>
  

<? header("Cache-Control: no-cache, must-revalidate");?>
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="pragma" content="no-cache" />
<meta name="resource-type" content="document" />

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<script type="text/javascript" src="Scripts/noticias.js"></script>


<style type="text/css">
<!--
body {
	background-image: url();
background-color: #AFDBF6;
}
-->
</style>
<style type="text/css">
<!--
.Estilo5 {
	font-size: 12px;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}

.Estilo6 {
	font-size: 12px;
	font-weight: bold;
}
-->
</style>
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window,document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
 fbq('init', '2135401846746027'); 
fbq('track', 'PageView');
</script>
<noscript>
 <img height="1" width="1" 
src="https://www.facebook.com/tr?id=2135401846746027&ev=PageView
&noscript=1"/>
</noscript>
<!-- End Facebook Pixel Code -->


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-118142515-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-118142515-1');
</script>
</head>
<body><div id="contenedor">
<form method="post" name="form1" id="form1">  
<table border="0" width="100%" cellpadding="2">
	<tr>   
		<td width="34%"><span class="Estilo3"><span
			class="Estilo4 Estilo8">*</span> Título Servicio:</span></td>
		<td width="66%"><input name="txtTitulo" type="text" id="txtTitulo"
			class="searchfield"  /></td>
	</tr>
	<tr>
		<td>* Contenido</td>
		<td><textarea name="txtContenido" rows="10" class="searchfield" id="txtContenido" style="width: 94%"></textarea></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2"><div align="center"><span id="detalleActualizarDatos">
		  <input class="searchbutton"
			name="btnActualizarDatos" id="btnActualizarDatos" type="button"
			style="cursor: hand" value=" Crear "
			onClick="nuevoPortafolio(); return false;" />
	    </span></div></td>
	</tr>
</table>
<span id="detalle"></span>
</form>
</div>
</body>
</html>
