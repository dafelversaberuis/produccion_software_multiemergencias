<%@page import="beans.Portafolio"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.util.*,java.text.SimpleDateFormat"
    pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bAdministrarPublicaciones" class="beans.AdministrarPublicaciones" scope="page" />
<%@page import="beans.Publicacion"%>
<%@page import="beans.Parametro"%>
<%@page import="beans.Seccion"%>
<%@page import="beans.RepositorioFotos"%>	
<html>
<head>
    <title>CURSOS BLS, ACLS, PRIMEROS AUXILIOS. MULTIEMERGENCIAS BUCARAMANGA</title><link rel="icon" type="image/gif" href="/imagenes/favicon_multiemergencias.gif" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Cursos de Soporte Vital B�sico y Avanzado. Formaci�n para personal del area de la salud en Santander "/>
<meta name="keywords" content="cursos bls, cursos acls, cursos de primeros auxilios, cursos toma de muestras de laboratorios, toma de citologias, curso atenci�n integral a victimas de violencia sexual, Cursos salud bucaramanga, capacitaci�n en salud santander "/>
   <meta charset="utf-8">
	 <!-- librerias  -->
	<link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css"/>
	<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" type="text/css"/>
	<link rel="stylesheet" href="assets/css/font-awesome.css" type="text/css" />
	<link rel="stylesheet" href="assets/css/font-awesome.min.css" type="text/css" />
	<link rel="stylesheet" href="assets/css/animate.min.css" type="text/css" />
	<link rel="stylesheet" href="assets/css/style.css" type="text/css" />
	<link rel="stylesheet" href="assets/css/menu.css" type="text/css" />
	<link rel="stylesheet" href="assets/css/slicknav.css">
	<link rel="stylesheet" href="assets/css/component.css" type="text/css" />
	<link rel="stylesheet" href="assets/css/cycleslider.css">
	<link rel="stylesheet" href="assets/css/supersized.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="assets/css/supersized.shutter.css" type="text/css" media="screen" />
	<link type="text/css" rel="stylesheet" href="assets/css/portfolio_new.css"/>
	<link rel="stylesheet" href="assets/css/prettyPhoto.css" type="text/css" />
	<link rel="stylesheet" href="assets/css/colors/color1.css" id="color" type="text/css" />
	<link rel="shortcut icon" href="assets/assets/images/favicon.html" /> 
	<link rel="apple-touch-icon" href="assets/assets/images/apple_touch_icon.html" />
	<link rel="apple-touch-icon" sizes="72x72" href="assets/assets/images/apple_touch_icon_72x72.html" />
	<link rel="apple-touch-icon" sizes="114x114" href="assets/assets/images/apple_touch_icon_114x114.html" />
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="assets/js/modernizr.custom.js"></script>
	
		<script type="text/javascript" src="Scripts/noticias.js" charset="UTF-8"></script>
		
		<style type="text/css">
		
		sinestilo:{ 
		
		}
		
		</style>


 <script language="javascript" type="text/javascript">
function fMenu()
	{
		var vError1 = false;
		var vError2 = false;
		if(document.getElementById('usuario').value=="")
		{
			vError1=true;
		
		}
		if(document.getElementById('contrasena').value=="")
		{
			vError2=true;
		}
		if(vError1)
		{
			if(vError2)
			{
				alert('�Debe digitar su documento y contrase�a de administrador!');
				document.getElementById('usuario').focus();
				
			}else
			{
				alert('�Debe digitar su documento!');
				document.getElementById('usuario').focus();
			}
		}else
		{
			if(vError2)
			{
				alert('�Debe especificar la contrase�a!');
				document.getElementById('contrasena').focus();
			}else
			{
				document.siss.submit();
			}
		
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
<!--PRELOADER-->
	<section id="jSplash">
		<div id="circle"></div>
	</section>
<div id="menutop"></div>	
    <%
session.invalidate(); 
					response.setHeader("Cache-Control","no-store");
					response.setHeader("Pragma","no-cache");
					response.setDateHeader("Expires",0);
					
					
					Parametro parametro = new Parametro();
					String [] parametros2  = parametro.getarametros();
					 %>
					 
<%

String bandera = request.getParameter("bandera");

String asunto = "";
String mensaje ="";
String usuarioEnvia ="";
String fromEnvia ="";
String nombreAdjuntoCorreo="";


String seudonimo = "";
String nombres = request.getParameter("nombres");

String correoe =  request.getParameter("correo");
String telefono =  request.getParameter("telefono");
String contenido = request.getParameter("txtContenido");

if(correoe==null){
	

	correoe =  "";
	
	
}

if(nombres==null){
	
	nombres = "";

	
}

if(telefono==null){
	
	
	telefono = "";
	
}

if(contenido==null){
	
	contenido = "";
	
}

if(bandera!=null && bandera.equals("1")){
	
	int exito = bAdministrarPublicaciones.contactar(correoe, nombres, telefono, contenido);
	
	if(exito==1){
		nombres = "";

		correoe =  "";
		telefono = "";
		contenido = "";
		%>
		<script>
alert('Informaci�n enviada con �xito');



		</script>
		<%
	}
}


%>					 
					 
					 
					 
	<!--Wrapper 
=============================-->
<div id="wrapper">
<div id="mask">
	
<!--Header 
=============================-->

<div id="header" class="header">
<div class="menu-inner">
<div class="container"><div class="row">
				<div class="header-table col-md-12 header-menu">
        			<!--  Logo section -->
                	<a href="#home" class="nav-link"><img src="img/logo.png" width="250px" height="80px"> </a>
                	
                    <!--  // Logo section -->

		<!-- Sub Page Menu section -->
	  <nav class="main-nav">
						<a href="#" class="nav-toggle"></a>
						<ul id="sub-nav" class="nav"> <li><a href="#home" class="nav-link">Regresar</a></li> 
<%
				List<Publicacion> publicaciones = bAdministrarPublicaciones.getNotasPublicas(); int cuenta = 0; 
                List<Seccion> secciones = bAdministrarPublicaciones.getSecciones();
                List<Portafolio> portafolios = bAdministrarPublicaciones.getPortafolios();
                if(secciones!=null && secciones.size()>0){
                for(Seccion s: secciones){
                %>
                 <li><a href="#seccion<%=s.getSeccion() %>" class="nav-link"><%=s.getTitulo().trim() %></a></li>
                
                  <%} } %>
				<li><a href="#galeriadefotos" class="nav-link">*Galer�a</a></li>
                            <li><a href="#contactenos" class="nav-link">*Cont�ctenos</a></li> 
                            <li><a href="#certificado" class="nav-link">*Certificado</a></li> 
                            <li><a href="#portafolio" class="nav-link">*Portafolio</a></li> 	
				  </ul>
				  </nav>
                  <!--  // Sub Page Menu section -->
               
				</div>
</div></div>   
</div>
</div>

<!-- // Header 
=============================-->

<!--Home Page
=============================-->

<div id="home" class="item">
				
				<div class="clearfix">
			<div class="header_details">
				<div class="container">
					<div class="header_icons accura-header-block accura-hidden-2xs">
						<ul class="accura-social-icons accura-stacked accura-jump accura-full-height accura-bordered accura-small accura-colored-bg clearFix">
						<li id="1"><a href="https://web.facebook.com/multiemergencias.centrodeentrenamiento/" target="_blank" class="accura-social-icon-facebook circle"><i class="fa fa-facebook"></i></a></li>
					    <li id="2"><a href="https://twitter.com/multiemergencia" target="_blank" class="accura-social-icon-twitter circle"><i class="fa fa-twitter"></i></a></li>
                        <li id="3"><a data-href="" data-text="Multiemergencias" href="whatsapp://send" target="_blank" class="accura-social-icon-linkedin circle"><i class="fa fa-whatsapp"></i></a></li>
                        <li id="4"><a href="https://www.instagram.com/multiemergencias/" target="_blank" class="accura-social-icon-pinterest circle" onclick="return false;"><i class="fa fa-instagram"></i></a></li>
					    <li id="5"><a href="https://mail.zoho.com/biz/customlogin?rd=multiemergencias.com" target="_blank" class="accura-social-icon-facebook circle"><i class="fa fa-paper-plane"></i></a></li>
					   
						
					  </ul>
					</div>
				<div class="call">
					<div class="home_address">
						<img src="img/logo.png" width="40%" height="40%">
					</div>
					<i class="fa fa-whatsapp"></i> 316 629 27 91<br/></div>
			</div>
<!-- Mainheader Menu Section -->
<script type="text/javascript">if(typeof wabtn4fg==="undefined"){wabtn4fg=1;h=document.head||document.getElementsByTagName("head")[0],s=document.createElement("script");s.type="text/javascript";s.src="//whatsapp-sharing.com/button";h.appendChild(s);}</script>	
<div class="mainheaderslide" id="slide">
	<div id="mainheader" class="header">
		<div class="menu-inner">
			<div class="container">
				<div class="row">
        <div class="header-table col-md-13 header-menu">
        
        <!--  Logo section --> 
        <div class="brand" ><a href="#home" class="nav-link" style="font-size:23px; line-height:1.2">Centro de entrenamiento en<span>emergencias</span></a></div>
        <!--  // Logo section -->
        
<!-- Home Page Menu section -->
						<nav class="main-nav">
						<a href="#" class="nav-toggle"></a>
							<ul  id="home_nav" class="nav">
							<% if(secciones!=null && secciones.size()>0){
                for(Seccion s: secciones){
                %>
                 <li><a href="#seccion<%=s.getSeccion() %>" class="nav-link"><%=s.getTitulo().trim() %></a></li>
                
                  <%} } %>
						
							<li><a href="#portafolio" class="nav-link">*Portafolio</a></li>  
							<li><a href="#galeriadefotos" class="nav-link">*Galer�a</a></li>  
                            <li><a href="#contactenos" class="nav-link">*Cont�ctenos</a></li>
                             	
							
							</ul>
					  </nav>
<!--  // Home Page Menu section -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
            <!-- // Mainheader Menu Section -->
		</div>
			<div id="boxgallery" class="boxgallery" data-effect="effect-2">
			<%
	 List<RepositorioFotos> fotos = bAdministrarPublicaciones.getRepositorioFotos();
	%>
				<%
	if(fotos!=null && fotos.size()>0){ for(RepositorioFotos r: fotos){%>
			
		
		<%if(r.getArchivo()!=null){
			String directorio_ruta = application.getRealPath("imagenes")+"/cursos/";
			bAdministrarPublicaciones.guardarArchivoDisco(directorio_ruta+r.getDireccionFoto(), r.getArchivo());
		%>
		<div class="panel">
			<img src="/m-web/ver_archivo_adjunto.jsp?id=<%=r.getIdFoto() %>" alt="Multiemergencias">
		</div>
		
		<%}else{
		if(r.getDireccionFoto()!=null){
		%>
		<div class="panel">
			<img src="imagenes/cursos/<%=r.getDireccionFoto().trim() %>?rf=<%=Math.random()%>" alt="Multiemergencias"/>
		</div>
		<%}} %>
		
		
		
		
	
	<%}} %>
			
			
				
			
			</div>
		</div>
	</div>
		
<!-- // Home Page
=============================-->


<%


if(secciones!=null && secciones.size()>0){
  for(Seccion seccion: secciones){



%>

<!--secciones 
=============================-->    
   
<div id="seccion<%=seccion.getSeccion()%>" class="item">
<%if(seccion.getDireccionFoto()!=null && !seccion.getDireccionFoto().trim().equals("") && !seccion.getDireccionFoto().trim().equals("null")){ %>
			<img src="images/publicaciones/<%=seccion.getDireccionFoto() %>" alt="Multiemergencias" class="fullBg">
			<%}else{ %>
			<img src="assets/img/me7.jpg" alt="Multiemergencias" class="fullBg">
			<%} %>
			<div class="content">
                <div class="content_overlay"></div>
				<div class="content_inner">
					<div class="row contentscroll">
	<div class="container col-md-12">
          <div class="col-md-6 empty">&nbsp;</div>
                          <div class="col-md-6 content_text">
                          <div class="clearfix" >
                          <h1><%=seccion.getTitulo().trim() %></h1><span  id="bloquecontenido"><%=seccion.getContenido().trim() %></span><br />
							
										
			</div>
</div>
           </div>
    </div>
         </div>
	</div>
</div>     


<%}} %>



<!-- admin
=============================--> 

<div id="administrador" class="item">
			<img src="assets/img/me6.jpg"  alt="the Paxton Gipsy Hill"  class="fullBg">
			<div class="content">
            
				<div class="content_overlay"></div>
				<div class="content_inner" >
                <div class="row contentscroll">
	<div class="container col-md-12">
          <div class="col-md-6 empty">&nbsp;</div>
		  			      <div class="col-md-6 content_text">
                          <div id="contactforms">
                           <h1>LOGUEO</h1>
                           <form id="siss" name="siss" action="home.jsp" method="post"> 
			<p>Por favor ingrese al m�dulo administrador:<br/><br/></p>
			
		   	
			
			<div class="clearfix cont_form pad_top20"> 
				<input type="text" name="usuario"  id="usuario"  placeholder="* Documento : " style="background-color: #D1D6E2; width: 100%"
                    onfocus="this.placeholder = ''" onBlur="this.placeholder = '* Documento :'" /><br><br><br><input type="password" name="contrasena" id="contrasena" placeholder="* Clave : " style="width: 100%; background-color: #D1D6E2"
                    onfocus="this.placeholder = ''" onBlur="this.placeholder = '* Clave :'" /><br><br><input name="button" type="button" class="submitBtn"  onclick="fMenu()" value="Ingresar" style="background-color:red; color: white; width: 150px" />    
                </div>
				</form>
	</div>
                          </div>
    </div>
                </div>
				</div>
		  </div>
	</div>

   <!-- admin
=============================-->    




<!-- Portafolio
=============================--> 

<div id="portafolio" class="item">
			<img src="images/publicaciones/portafolio.jpg" alt="The Spice Lounge" class="fullBg">
			<div class="content">
                             
				<div class="content_overlay"></div>
				<div class="content_inner">
					<div class="row contentscroll">
	<div class="container col-md-12">
          <div class="col-md-6 empty">&nbsp;</div>
                          <div class="col-md-6 content_text">
                          <h1>Portafolio de servicios</h1><p class="pad_top13"></p> <br />
                          <div id="services">
							<div class="main">
<div class="clearfix">

<!-- div one created -->
<div class="pad_top50">
   <% 
   if(portafolios!=null && portafolios.size()>0){
		for(Portafolio p: portafolios){
			
		%>
   
    <div class="toggle-container">
        <div class="toggle-header">
        	<div class="toggle-link toggle-open" style="color:white;font-size:22px"><%=p.getTitulo() %></div>
        </div>
        <div class="toggle-content">
			<p><div style="color:black; font-size:18px; text-align : justify; " ><%=p.getContenido() %></div></p>
			
        </div>
    </div>
    
    <% }}%>
    
   
    
</div><!-- div one created ends here -->






<div class="clearfix"></div>
</div>
</div>
</div>
           </div>
    </div>
                </div>
				</div>
	  </div>
    </div>

<!-- // portafolio
=============================--> 


<!-- tratamiento datos
=============================--> 

<div id="tratamiento" class="item">
			<img src="images/publicaciones/tratamiento_datos.jpg" alt="The Spice Lounge" class="fullBg">
			<div class="content">
                             
				<div class="content_overlay"></div>
				<div class="content_inner">
					<div class="row contentscroll">
	<div class="container col-md-12">
          <div class="col-md-6 empty">&nbsp;</div>
                          <div class="col-md-6 content_text">
                          <h1>Tratatamento de datos personales</h1><p class="pad_top13"></p> <br />
                          <div id="services">
							<div class="main">
<div class="clearfix">

<!-- div one created -->
<div  style="font-size:14px; text-align : justify;">
  

   
   1. Multiemergencias S.A.S. recolectar�, usar� y tratara datos personales, conforme la Pol�tica de Tratamiento de Datos Personales que ha implementado y actuar� como responsable del tratamiento de datos personales de los cuales soy titular.
 <br/>
 <br/>
2. Los datos personales que se utilizar�n son: Nombres y apellidos, documento de identidad, direcci�n de correo electr�nico.
 <br/>
 <br/>
3. Los datos personales recogidos se utilizan con el prop�sito de (i) Generar certificaciones de los cursos/diplomados/capacitaciones sobre los cuales se ha capacitado. (ii)Informar sobre nuestras promociones, ofertas, novedades y servicios sobre los distintos cursos; (iii) Dar cumplimiento a obligaciones contra�das con nuestros clientes (iv) Evaluar la calidad del servicio (vii) Gestionar tareas b�sicas de administraci�n.
 <br/>
 <br/>
4. Mis derechos como titular de los datos son los previstos en la Constituci�n y la ley 1581 de 2012, especialmente el derecho a conocer, actualizar, rectificar y suprimir mi informaci�n personal, as� como el derecho a revocar el consentimiento otorgado para el tratamiento de datos personales. Los derechos pueden ser ejercidos a trav�s de canales como l�neas telef�nicas, correo electr�nico, p�gina web, redes sociales.
 <br/>
 <br/>
5. Multiemergencias S.A.S. garantiza la confidencialidad, libertad, seguridad, veracidad, transparencia, acceso y circulaci�n restringida de mis Teniendo en cuenta lo anterior, autorizo de manera voluntaria, previa, expl�cita, informada e inequ�voca a Multiemergencias S.A.S. para tratar mis datos personales. La informaci�n obtenida para el Tratamiento de mis datos personales la he suministrado de forma voluntaria y es ver�dica.

    

    


   
    
</div>






<div class="clearfix"></div>
</div>
</div>
</div>
           </div>
    </div>
                </div>
				</div>
	  </div>
    </div>

<!-- tratamiento datos 
=============================--> 







     
<!--Gallery 
=============================--> 

<div id="gallery" class="item">
	<div id="slides" class="clearfix">
	<div class="cycle-slideshow" 
    data-cycle-fx=fade
	data-cycle-speed=1000
    data-cycle-timeout=3000
    data-cycle-caption-plugin=caption2
    data-cycle-overlay-fx-out="fadeOut"
    data-cycle-overlay-fx-in="fadeIn"
	  data-cycle-prev=".prev" 
  data-cycle-next=".next"     
    >
    <div class="cycle-overlay"></div>



        </div>
        
	<div class="gal-top">
	<div class="container">
		<div class="galheading galleft"><h1>Gallery Cycle-Slider</h1></div>
		<div id="button" class="clearfix galright">
			<div class="prev"><i class="fa fa-angle-left"></i></div>
			<div class="next"><i class="fa fa-angle-right"></i></div>
		</div>
	</div>
</div>

</div>

</div>


<!-- // Gallery 
=============================--> 




<!-- Gallery  SS
=============================--> 

<div id="galleryss" class="item">

	<!--Thumbnail Navigation-->
	<div id="prevthumb"></div>
	<div id="nextthumb"></div>
	
	<!--Arrow Navigation-->
	<a id="prevslide" class="load-item"></a>
	<a id="nextslide" class="load-item"></a>
	
	<div id="thumb-tray" class="load-item">
		<div id="thumb-back"></div>
		<div id="thumb-forward"></div>
	</div>
	
	<!--Time Bar-->
	<div id="progress-back" class="load-item">
		<div id="progress-bar"></div>
	</div>
	
	<!--Control Bar-->
	<div id="controls-wrapper" class="load-item">
		<div id="controls">
			
			
		
			<!--Slide counter-->
			<div id="slidecounter">
				<span class="slidenumber"></span> / <span class="totalslides"></span>			</div>
			
			<!--Slide captions displayed here-->
			<div id="slidecaption"></div>
			
			<!--Thumb Tray button-->
			<a id="tray-button"><img id="tray-arrow" src="img/button-tray-up.png" alt=""/></a>
			
			<!--Navigation-->
			<ul id="slide-list"></ul>
		</div>
	</div>
<div class="gal-top">
		<div class="container">
			<div class="galheading galleft"><h1>Gallery Super-Sized</h1></div>
		</div>
	</div>
</div>

<!-- // Gallery  SS Ends
=============================--> 




<!-- Filter Gallery 
=============================--> 

<div id="filtergallery" class="item">

<div class="content contentscroll">
            <div class="content_overlay_fullwidth"></div>
<section class="portfolio">
 <!-- Portfolio Section -->    
  <section class="section">
    <div class="container">
	  <div class="prettygalheading clearfix text-center"><h1>Gallery Filter</h1>
      	<p class="text-center pad_top13">Nutritionists, naturopaths, doctors, and journalists weigh in on topics organic food.</p>
      </div>
      <!-- Portfolio Filters -->
      <ul id="filters">
          
      </ul>
      <!-- End Portfolio Filters -->
    </div>
    <div class="portfolio-top"></div> 
    <!-- Portfolio Grid -->
    <ul id="portfolio-grid" class="portfolio-grid">
	
    </ul>
    <!-- End Portfolio Grid -->
  </section>
  <!-- End Portfolio Section -->
 </section>
 </div>
</div>

<!-- // Filter Gallery 
=============================--> 




<!-- Gallery Without Filter
=============================--> 

<div id="gallerywithoutfilter" class="item">
<img src="assets/img/me16.jpg" alt="The Spice Lounge" class="fullBg">
<div class="content contentscroll">
            <div class="content_overlay_fullwidth"></div>
<section class="portfolio">
 <!-- Portfolio Section -->    
  <section class="section">
    <div class="container">
	  <div class="prettygalheading clearfix text-center"><h1>Galer�a de Fotos</h1></div>
    </div>
    <div class="portfolio-top"></div> 
    <p class="text-center pad_top13">Nuestras im�genes.</p>
	
    <!-- Portfolio Grid -->
    <ul class="portfolio-grid">
	
     
     
     
     
    </ul>
    <!-- End Portfolio Grid -->
  </section>
  <!-- End Portfolio Section -->
 </section>
 </div>
</div>

<!-- // Gallery Without Filter
=============================--> 




<!-- galeria de fotos
=============================--> 
	
	<input type="hidden" value="<%=fotos.size()%>" id="numeroFotos"/>
 <div id="galeriadefotos" class="item">
			<img src="assets/img/me17.jpg" alt="The Spice Lounge" class="fullBg">
			<div class="content">
                             
				<div class="content_overlay"></div>
				<div class="content_inner">
					<div class="row contentscroll">
	<div class="container col-md-12">
          <div class="col-md-6 empty">&nbsp;</div>
                          <div class="col-md-6 content_text">
                          <div class="clearfix" >
                          <h1>Galer�a</h1>
                          <p class="pad_top13">Nuestras im�genes.</p>
							
<div class="clearfix pad_top20">
 <div class="two_half">
	<ul class="portfolio-grid">
	<%
	if(fotos!=null && fotos.size()>0){ for(RepositorioFotos r: fotos){%>
	
	 <li class="mix all food vimeo mix_all">
	     <div class="view3 third-effect3">
	     <%
	     if(r.getArchivo()!=null){
	    	 //ya se creo el archivo lo leemos
	    	 %>
	    	 <img src="/m-web/ver_archivo_adjunto.jsp?id=<%=r.getIdFoto() %>" alt="Multiemegergencias">
	    	 <%
	     }else{
	    	 if(r.getDireccionFoto()!=null){
	     %>
	     <img src="imagenes/cursos/<%=r.getDireccionFoto().trim() %>?rf=<%=Math.random()%>" alt="">
	     <%}}%>
	     
			<div class="mask">
			 <%
	     if(r.getArchivo()!=null){%>
	    	 <a href="/m-web/ver_archivo_adjunto.jsp?id=<%=r.getIdFoto() %>"  data-rel="prettyPhoto[gallery2]" class="viewDetail lightbox info">
         <div class="project-overlay">
       	<h3>Multiemergencias</h3>
	  	<span class="project-name">Fotos</span>          </div>
         </a> 
         
	    	 <%
	    	 
	     }else{
	    	 if(r.getDireccionFoto()!=null){
	    	 %>
			<a href="imagenes/cursos/<%=r.getDireccionFoto().trim() %>?rf=<%=Math.random()%>"  data-rel="prettyPhoto[gallery2]" class="viewDetail lightbox info">
            <div class="project-overlay">
          	<h3>Multiemergencias</h3>
		  	<span class="project-name">Fotos</span>          </div>
            </a> 
            <%}} %>
                       </div>
	     </div>
     </li>
     
      <%} }%>
     
     
      
    </ul>	
</div>
</div>													
			</div>
</div>
           </div>
    </div>
         </div>
	</div>
</div>

<!-- // galeria de fotos
=============================--> 









<!--certificado 
=============================-->

<div id="certificado" class="item three_fourth">
				<img src="images/publicaciones/certificado.jpg" alt="The Spice Lounge" class="fullBg">
				<div class="content">
					<div class="content_overlay_three_fourth"></div>
                        <div class="content_inner">
<div class="row contentscroll">
	<div class="container">
          <div class="col-md-3 empty">&nbsp;</div>
    <div class="col-md-9 content_text">
                          <h1>Certificado online</h1>
						  	
								<p class="row">
								<p>Por favor digite su documento y presione consultar:</p>
								</p>
															
									
			<div class="clearfix cont_form pad_top20"> 
				<input name="documento_certificado" type="text" id="documento_certificado" class="validate['required'] documento_certificado" placeholder="* Escriba aqu� su documento " style="background-color: #D1D6E2; width: 50%"
                    onfocus="this.placeholder = ''" onBlur="this.placeholder = '* Escriba aqu� su documento'" /><br><br>
				<input id="validarDocumento" value="Consultar" name="validarDocumento" type="button"  class="submitBtn" onclick="validarLoteConsulta2(); return false;" style="background-color:red; color: white; width: 150px">
                </div>
			<br><br>
			<span id="detalleLote" style="text-align: center"></span>
							
						
             
    </div>
                </div>
					</div>
	  </div>
    </div> </div> 


		
		    
<!-- // certificado 
=============================-->









<!-- contactenos
=============================-->

<div id="contactenos" class="item">
			<img src="assets/img/me5.jpg"  alt="the Paxton Gipsy Hill"  class="fullBg">
			<div class="content">
            
				<div class="content_overlay"></div>
				<div class="content_inner" >
                <div class="row contentscroll">
	<div class="container col-md-12">
          <div class="col-md-6 empty">&nbsp;</div>
		  			      <div class="col-md-6 content_text">
                          <div id="contactforms">
                           <h1>Cont�ctenos</h1>
                           <form id="contact_form" name="contact_form" class="cont_form pad_top13" action="#" method="post"> <input name="bandera" id="bandera" type="hidden" value="0" />
			<p>Puedes comunicarte con nosotros para lo que desees(Con nuestros datos o redes sociales) � escribe en el formulario y te responderemos enseguida:</p>
			<div class="clearfix pad_top20">
					<h2 class="clearfix address">
				<div class="phone"><i class="fa fa-phone"></i>&nbsp;&nbsp;+ 57 316 629 2791</div>
				
					<i class="fa fa-envelope"></i> multiemergenciassas@gmail.com
				<div class="clearfix">
			</div>
		   	
			
			<div class="clearfix cont_form pad_top20"> 
				<input name="nombres" type="text" id="nombres" class="validate['required'] textbox1" placeholder="* Nombre : "
                    onfocus="this.placeholder = ''" onBlur="this.placeholder = '* Nombre :'" />
				<input name="correo" type="text" id="correo"  class="validate['required','email']  textbox1"
                    placeholder="* Email : " onFocus="this.placeholder = ''" onBlur="this.placeholder = '* Email :'" />
				<input name="telefono" type="text" id="telefono" class="validate['required','phone']  textbox1"
                    placeholder="* tel�fono : " onFocus="this.placeholder = ''" onBlur="this.placeholder = '* Tel�fono :'" />
				<textarea name="txtContenido"   id="txtContenido" class="validate['required'] messagebox1"
                    placeholder="* Escribe aqu� : " onFocus="this.placeholder = ''" onBlur="this.placeholder = '* Escribe aqu� :'"></textarea>
				<input id="contactsubmitBtn1" value="Enviar mensaje" name="Confirm" type="submit" class="submitBtn" onclick="enviar_formulario(); return false;" >
                </div>
				</form>
	</div>
                          </div>
    </div>
                </div>
				</div>
		  </div>
	</div>

<!-- // contactenos
=============================-->




<!-- Footer
=============================-->
<div id="footer" class="footer">
	<div class="copyright">Dise�ado por Quimerapps.com</div>
</div>
<!-- // Footer Ends
=============================-->


<!--portafolio
=============================-->
<div id="specialmenu" class="toHideTheBubbles hidden-phone">
	<div class="spcontainer">
	<div id="spmenu1">  <a href="#administrador" class="nav-link"><button class="spmenu spmenu1" >
			<span><i class="fa fa-sign-in"></i></span>
			<span class="sptext"><span>Logueo</span>Admin</span>
		</button></a> </div>
     <div id="spmenu2">  <a href="#certificado" class="nav-link"><button class="spmenu spmenu2" >
			<span><i class="fa fa-angle-double-down"></i></span>
			<span class="sptext"><span>Certificado</span>Online</span>
		</button></a> </div>
	
		
		<div id="spmenu3"><a href="#tratamiento" class="nav-link"><button class="spmenu spmenu3" >
		<span><i class="fa fa-info-circle"></i></span>
			<span class="sptext"><span>Tratamiento datos personales</span>
		</button></a>	</div>
    </div>
</div>
<!-- // portafolio 
=============================-->








<!-- inicio2 librerias-->
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.scrollTo.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.fitvids.js"></script>

<script type="text/javascript" src="assets/js/jquery.slicknav.min.js"></script>
<script src="assets/js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="assets/js/retina-1.1.0.min.js"></script>
<script type="text/javascript" src="assets/js/jpreloader.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.cycle.all.js"></script>
<script type="text/javascript" src="assets/js/jquery.cycle2.caption2.js"></script>
<script type="text/javascript" src="assets/js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="assets/js/supersized.shutter.min.js"></script>
<script type="text/javascript" src="assets/js/supersized_custom.js"></script>
<script type="text/javascript" src="assets/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="assets/js/jquery.mixitup.min.js"></script>
<script type="text/javascript" src="assets/js/classie.js"></script>
<script type="text/javascript" src="assets/js/boxesFx.js"></script>
<script type="text/javascript" src="assets/js/wait.js"></script>
<script type="text/javascript" src="assets/js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="assets/js/custom_general_box.js"></script>
<script type="text/javascript" src="assets/js/custom_general.js"></script>

<!-- fin2 librerias-->

</body>

</html>
<script>

function enviar_formulario(){

	mensaje = "";
	
	if(document.getElementById('nombres').value.replace(/^\s*|\s*$/g, "")==""){
		mensaje = mensaje + "\n* Debe diligenciar nombre completo.";
	}
	
	
	if(document.getElementById('correo').value.replace(/^\s*|\s*$/g, "")==""){
		mensaje = mensaje + "\n* Debe diligenciar el correo electr�nico.";
	}
	
	if ((document.contact_form.correo.value!="") && (!es_correo(document.contact_form.correo.value)))
	{
		mensaje = mensaje + "\n* El correo electr�nico no tiene una estructura v�lida.";
		
	}
	
	if(document.getElementById('telefono').value.replace(/^\s*|\s*$/g, "")==""){
		mensaje = mensaje + "\n* Debe diligenciar el tel�fono � celular.";
	}
	
	if ((document.contact_form.telefono.value!="") && (!es_numero(document.contact_form.telefono.value)))
	{
		mensaje = mensaje + "\n* El tel�fono � celular contiene caract�res no v�lidos (Debe ser num�rico).";
		
	}
	
	if(document.getElementById('txtContenido').value.replace(/^\s*|\s*$/g, "")==""){
		mensaje = mensaje + "\n* Debe diligenciar el correo electr�nico.";
	}
	
	
	
	
	
	
	
	
	
	if(mensaje!=""){
				alert("Por favor revise lo siguiente:\n\n "+mensaje);
	
	}else{
		
		
			document.getElementById('bandera').value = "1";
			document.contact_form.submit();	
	}
	
}


function limpiar_formulario(){
	

	document.getElementById('nombres').value = "";
	document.getElementById('correo').value = "";
	document.getElementById('telefono').value = "";
	document.getElementById('txtContenido').value = "";
	alert('Formulario limpiado');
	document.contact_form.nombres.focus();
	

	
}

function es_correo(direccion) 
{
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(direccion)) return true;
	else return false;
}


function es_numero(cadena)
{
	var longit = cadena.length;
	
	for(k=0;k<longit;k++)
	{
		var car = cadena.charAt(k);
		if ((car!='1') && (car!='2') && (car!='3') && (car!='4') && (car!='5') && (car!='6') && (car!='7') && (car!='8') && (car!='9') && (car!='0'))
			return false;
	}
	if (longit>0) return true;
	else return false;
}



$(document).ready(function(){
	//$('#bloquecontenido').attr('class', 'sinestilo');
	//$('#bloquecontenido').attr('class', 'sinestilo');
	//alert('ssssssssss');	
	jQuery('#bloquecontenido').css({'color' : 'blue' });
	});
	
	




</script>