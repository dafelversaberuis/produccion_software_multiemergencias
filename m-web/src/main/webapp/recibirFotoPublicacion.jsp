<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*,java.util.*,java.io.*,org.apache.commons.fileupload.*,java.text.SimpleDateFormat"
	errorPage=""%>
<%@page import="beans.Parametro"%>  
<jsp:useBean id="bAdministrarPublicaciones"
	class="beans.AdministrarPublicaciones" scope="page" />
<%
	Parametro parametro = new Parametro();
	String[] parametros2 = parametro.getarametros();
	String directorio_ruta = application.getRealPath("images")+"/publicaciones/";

	String tu = request.getParameter("tu");
	String us = request.getParameter("us");

	int guardo = 0;
	// Si se ha enviado correctamente el formulario con la imagens se carga la imagen al servidor	
	int l = 0;
	int campo = 1;
	int tamano_maximo_archivo = 1024;
	String solonombrearchivo = new String();
	// verifica si tenemos un request de file upload
	boolean isMultipart = FileUpload.isMultipartContent(request);
	if (isMultipart == true) { //valida q si haya un archivo para subir
		// Crea a nuevo manejador de file upload
		DiskFileUpload upload = new DiskFileUpload();
		// Analiza el request   
		List items = upload.parseRequest(request);
		// Crea un iterador para procesar los items
		Iterator iter = items.iterator();
		// Procesa los items subidos
		String[] parametros = new String[10];
		while (iter.hasNext()) {
			FileItem item2 = (FileItem) iter.next();

			if (item2.isFormField()) {
				parametros[l] = item2.getString();
				l++;
			}

			else {
				String fieldName = item2.getFieldName();
				String fileName = item2.getName();
				String contentType = item2.getContentType();
				boolean isInMemory = item2.isInMemory();
				long sizeInBytes = (item2.getSize() / 1024);
				int punto = fileName.lastIndexOf('.');
				String ext = fileName.substring(punto + 1);
				ext = ext.toUpperCase();
				if (ext.equals("JPG") || ext.equals("GIF") || ext.equals("JPEG") || ext.equals("JPE") || ext.equals("JFIF") || ext.equals("TIFF") || ext.equals("PNG")) {//valida q extensiones puedo subir
					int slash = fileName.lastIndexOf('/');
					int backslash = fileName.lastIndexOf('\\');
					int finpath = backslash;
					if (slash > backslash) {
						finpath = slash;
					}

					solonombrearchivo = fileName.substring(finpath + 1);
					String nombre = solonombrearchivo;
					int puntos = nombre.indexOf('.');
					nombre = nombre.substring(0, puntos);
					nombre = nombre.toUpperCase();
					File dir = new File(directorio_ruta);
					if (dir.exists()) {
						String[] nombres = dir.list();
						for (int i = 0; i < nombres.length; i++) {
							String nombredir = nombres[i];
							int pto = nombredir.indexOf('.');
							nombredir = nombredir.substring(0, pto);
							nombredir = nombredir.toUpperCase();
							if (nombredir.equals(nombre)) {
%><script language="javascript">window.alert("Existe una foto con el mismo nombre. Cámbieselo o busque otra foto");</script>


<%
	//i=nombres.length;
								break;
							}//fin if de comparacion para q no sobrescriba
							else {
								if (i == nombres.length - 1) {
									if (sizeInBytes <= tamano_maximo_archivo) {
										File uploadedFile = new File(directorio_ruta + solonombrearchivo);
										item2.write(uploadedFile);
										guardo = 1;
										//bAdministrarPublicaciones.guardarRepositorio(tu, us, solonombrearchivo); //esto no es necesario en publicaciones....
%>
<script type="text/javascript" src="Scripts/noticias.js" charset="UTF-8"></script>
<script>alert('Foto cargada con éxito, se cerrará la venta. Si esto no sucede haga clic en el botón cerrar'); agregarFoto('<%=solonombrearchivo%>');
try{
	window.opener.recargar();
	
}catch(e) {
	//alert('La ventana desde la que se abrió ésta, fue cerrada. La foto se cargó, pero para visualizarla abra la ventana repositorio de fotos nuevamente');
}
window.close();

</script>
<%
	} else {
%><script language="javascript">window.alert("La foto excede el tamaño máximo de: "+ <%=tamano_maximo_archivo%> +"KB");</script>
<%
	}
								}//fin if q va dentro del else copia solo cuando llega al ultivo archivo
							}//fin else de comparacion para q no sobrescriba
						}//fin for nombres.length
					}//fin if dir
				}//fin if ext
				else {
%><script language="javascript">window.alert("Solo se pueden cargar Imágenes");</script>

<%
	}
			}//fin else
		}//fin while
	}//fin if
%>
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
<p />
<p />
<p />
<p />
<form name="form1">
<%
	if (guardo == 1) {
%>
<center><strong>Cierre la ventana para continuar</strong><br />
<br />
<input class="searchbutton" name="btnCerrar" id="btnCerrar"
	type="button" style="cursor: hand" value="Cerrar"
	onclick="window.close(); return false;" /></center>
<%
	} else {
%>
<center><strong>Haga clic en volver para agregar otra
imagen</strong><br />
<br />
<input class="searchbutton" name="btnVolver" id="btnVolver"
	type="button" style="cursor: hand" value="Volver"
	onclick="document.form1.action='subirFotoPublicacion.jsp'; document.form1.submit(); return false;" /></center>
<%
	}
%>
</form>
</body>
</html>