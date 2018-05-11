<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.net.*, java.sql.*,java.util.*,java.text.SimpleDateFormat, java.text.NumberFormat,java.text.DecimalFormat" errorPage="" session="false"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:useBean id="bAdministrarPublicaciones"
	class="beans.AdministrarPublicaciones" scope="page" />
<%@page import="beans.RepositorioFotos"%>
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
<link href="estilos/estilos.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-image: url();
	background-color: #AFDBF6;
}
-->
</style>
<script language="javascript" type="text/javascript">

function borrar(foto, nombreFoto){
if(confirm('Realmente dese elimnar la foto/imagen compartida?')){
//alert('foto '+foto);
	document.getElementById('hdnFoto22').value = foto;
		document.getElementById('hdnNombreFoto').value = nombreFoto;
		document.getElementById('hdnBorrar').value = "1";
		document.form1.submit();
}

}
</script>
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
<body>
<%
	String tu = request.getParameter("tu");
	String us = request.getParameter("us");

	String fotoAEliminar = request.getParameter("hdnFoto22");
	String borrar = request.getParameter("hdnBorrar");
	String nombreFoto = request.getParameter("hdnNombreFoto");

	if (borrar != null) {
		if (borrar.equals("1")) {

			bAdministrarPublicaciones.eliminarArchivo(application.getRealPath("imagenes")+"/cursos/"+nombreFoto, fotoAEliminar, application.getRealPath("imagenes"));
%>
<script>
			alert('Foto eliminada con éxito');
			try{
				window.opener.recargar();
				window.close(); 
				
			}catch(e) {
				
			}
			</script>
<%
	}

	}

	List<RepositorioFotos> fotos = bAdministrarPublicaciones.getRepositorioFotosEliminar(tu, us);
	int cuenta = 0;
%>

<form method="post" name="form1"><strong>Fotos que puede
eliminar(Clic en la foto que desea eliminar):</strong><br />
<table width="100%" border="0" cellpadding="2" cellspacing="2">
	<%
		for (RepositorioFotos l : fotos) {
			if (cuenta == 0) {
	%><tr>
		<%
			}

				cuenta++;
				if (cuenta <= 6) {
		%>    
		<td><a href="#"
			onClick="borrar('<%=l.getIdFoto()%>','<%=l.getDireccionFoto()%>'); return false;">
			
			<% if(l.getArchivo()!=null){ %>  
			
		<img src="/m-web/ver_archivo_adjunto.jsp?id=<%=l.getIdFoto() %>"
			width="72" height="72" alt="" />
			
			<%}else{ %>
			<img src="imagenes/cursos/<%=l.getDireccionFoto()%>?re=<%=Math.random()%>"
			width="72" height="72" alt="" />
			<%} %>
			
			</a><br />
		</td>
		<%
			}
				if (cuenta == 6 || cuenta == fotos.size()) {
					cuenta = 0;
		%>
	</tr>
	<%
		}
		}
	%>


</table>
<br />
<p><input class="searchbutton" name="pp" type="button"
	style="cursor: hand" value="Cerrar ventana"
	onclick="window.close(); return false;" /></p>
<input name="hdnFoto22" type="hidden" id="hdnFoto22" value="0">
<input name="hdnNombreFoto" type="hidden" id="hdnNombreFoto" value="0">
<input name="hdnBorrar" type="hidden" value="0" id="hdnBorrar">
</form>

</body>
</html>
