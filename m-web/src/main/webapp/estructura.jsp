<jsp:useBean id="bAdministrarPublicaciones"
	class="beans.AdministrarPublicaciones" scope="page" />
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
	background-color: #FBD7EB;
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
<body>
	<%
		String id = request.getParameter("encuesta");

		Object[] encuesta = bAdministrarPublicaciones.getNombreEncuesta(id);
	%>

	<table width="100%" border="0" cellspacing="2" cellpadding="2">
		<tr>
			<td bgcolor="#E81D8F" align="center" style="text-align: center" colspan="2"><font
				color="white"><h2>
						Encuesta:
						<%=encuesta[1]%></h2>Vigencia: <%=encuesta[2]%> a <%=encuesta[3]%><br />
						<a href="imprimirEncuesta.jsp?encuesta=<%= id %>" target="_blank">(Imprimir formato encuesta)</a>
						</font></td>


		</tr>

		<%
			List<Object[]> preguntas = bAdministrarPublicaciones
					.getPreguntas(id);
			int j = 0;
			if (preguntas != null && preguntas.size() > 0) {
				for (Object[] pregunta : preguntas) {
					j++;
		%>
		<tr>
			<td align="left" bgcolor="#EEEEEE" valign="middle" width="5%"><%=j + ". "%></td>
			<td align="left" bgcolor="#EEEEEE"><%=pregunta[2]%></td>
		</tr>

		<%
		
			if(pregunta[3].equals("U") || pregunta[3].equals("M")){
			List<Object[]> opciones = bAdministrarPublicaciones
							.getOpciones("" + pregunta[0]);
					if (opciones != null && opciones.size() > 0) {
						for(Object[] opcion: opciones){
		if(pregunta[3].equals("U")){  
		%>
		<tr>
			<td align="left" bgcolor="#FFFFFF" valign="middle"  width="5%"><input type="radio" name="pregunta<%=pregunta[0] %>" value="<%=opcion[2]%>"></td>
			<td align="left" bgcolor="#FFFFFF"><%=opcion[2]%> <%if(opcion[3].equals("S")){ %>Justifique: <input type="text" name="observacion<%=opcion[0] %>" value="" style="width:70%"/><%} %></td>
		</tr>
		<%}
		else{
			%>
			<tr>
			<td align="left" bgcolor="#FFFFFF" valign="middle"  width="5%"><input type="checkbox" name="pregunta<%=pregunta[0] %>" value="<%=opcion[2]%>"></td>
			<td align="left" bgcolor="#FFFFFF"><%=opcion[2]%> <%if(opcion[3].equals("S")){ %>Justifique: <input type="text" name="observacion<%=opcion[0] %>" value="" style="width:70%"/><%} %></td>
		</tr>
			<%
		}
		}  
			}
			}else{
				%>
				<tr>
				<td align="left" bgcolor="#FFFFFF" valign="middle" colspan="2"><textarea name="pregunta<%=pregunta[0] %>" cols="55" rows="7"></textarea></td>
				
			</tr>
				<%
			}
					
					
					
				}
			}
		%>

	</table>

</body>
</html>
