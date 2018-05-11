<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.util.*,java.text.SimpleDateFormat"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bAdministrarPublicaciones" class="beans.AdministrarPublicaciones" scope="page" />
<%@page import="beans.Publicacion"%>
<%@page import="beans.Parametro"%>	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>CURSOS BLS, ACLS, PRIMEROS AUXILIOS. MULTIEMERGENCIAS BUCARAMANGA</title><link rel="icon" type="image/gif" href="/imagenes/favicon_multiemergencias.gif" />
<meta name="description" content="Cursos de Soporte Vital Básico y Avanzado. Formación para personal del area de la salud en Santander "/>
<meta name="keywords" content="cursos bls, cursos acls, cursos de primeros auxilios, cursos toma de muestras de laboratorios, toma de citologias, curso atención integral a victimas de violencia sexual, Cursos salud bucaramanga, capacitación en salud santander "/>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
    
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
    
    <div id="top-izq"></div>  
     <div id="contenedor">
	<div id="encabezado">		 
      	<div id="barra_roja"><h1>Entrenamiento en Emergencias y Salud Ocupacional</h1></div>     
		<div id="logo_multiemergencias"><img id="" src="imagenes/logo-multiemergencias.png" alt="logo Multiemergencias" width="571" height="212"></div>
		<div id="menu_principal">
			
			<a ></a><a class="estilo_enlaces_principales" href="index.jsp"><< Regresar a página principal >></a>
			<a  ></a>
		</div> 		
	</div>
	<center><h2><span >TODAS NUESTRAS NOTICIAS</span></h2></center><br/><br/><br/><br/><br/><br/><br/><br/>
	  <div id="noticia_interna_1">                
                <div id="titulo_noticia"></div> 
                <div id="contenido_noticia_1">
           
           <%
           
           List<Publicacion> publicaciones = bAdministrarPublicaciones.getNotasPublicas();
           for(Publicacion l: publicaciones){ %><center>
<div id="" class="contenedor_noticias_1">
				   <div class="fondo_titulo_noticias">
					<%if((l.getDireccionFotoPublicacion()!=null && !l.getDireccionFotoPublicacion().trim().equals("null") && !l.getDireccionFotoPublicacion().trim().equals(""))){ %>
					<div class="circulo_noticias" style="background-image:url(images/publicaciones/<%=l.getDireccionFotoPublicacion() %>);"></div>
					<%} else{%><div class="circulo_noticias" style="background-image:url(imagenes/noticias/run.png);"></div><%}%>
					<div class="descripcion_noticias"><h2><%=l.getTituloPublicacion().trim() %></h2><br><%= bAdministrarPublicaciones.getTextoCortado(l.getContenidoPublicacion().trim()) %><%= "<h6><a href='noticiaInterna.jsp?id="+l.getIdPublicacion()+"' style='text-decoration:none'>(Ver más)</a></h6>" %></div>
				</div>

		</div><br/><br/></center><br/><br/><br/><br/><br/><br/><%} %>
           
           
                         </div> 
           </div>
				
	 	 
	</div>
	
	<div id="footer">            
        <div id="contenido_footer"><h3>Contacto: multiemergenciassas@gmail.com<br>Whatsapp: (+57) 316 629 27 91 ; (+57) 320 408 03 85<br>Bucaramanga, Colombia<br> <br>Software por: quimerapps.com</h3></div> 
		<div id="footer-der"></div>  
        </div>	

	
</body>
</html>