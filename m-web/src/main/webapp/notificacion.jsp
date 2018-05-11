<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.util.*,java.text.SimpleDateFormat"
     session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

     <title>CURSOS BLS, ACLS, PRIMEROS AUXILIOS. MULTIEMERGENCIAS BUCARAMANGA</title><link rel="icon" type="image/gif" href="/imagenes/favicon_multiemergencias.gif" />
<meta name="description" content="Cursos de Soporte Vital Básico y Avanzado. Formación para personal del area de la salud en Santander "/>
<meta name="keywords" content="cursos bls, cursos acls, cursos de primeros auxilios, cursos toma de muestras de laboratorios, toma de citologias, curso atención integral a victimas de violencia sexual, Cursos salud bucaramanga, capacitación en salud santander "/>
        <meta name="viewport" content="initial-scale=1.0,width=device-width">
<link rel="stylesheet" type="text/css" href="home_files/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="home_files/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="home_files/style.css">

<style>
.filters:before {
	width: 0% !important;
}
</style>
<style>
.fluidvids-elem {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
}

.fluidvids {
	width: 100%;
	position: relative;
}
</style>
<style>
.filters:before {
	width: 100% !important;
}
</style>
<style>
.filters:before {
	width: 100% !important;
}
</style>
<style>
.filters:before {
	width: 0% !important;
}
</style>
<style>
.filters:before {
	width: 0% !important;
}
</style>
<link rel="stylesheet" href="assets/css/font-awesome.css" type="text/css" />
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

String parametro = new String();
parametro=request.getParameter("campo");
parametro=""+parametro;
if(parametro==null){parametro="Sitio en mantenimiento!";}
if(parametro=="null"){parametro="Sitio en mantenimiento!";}
if(parametro.equals("null")){parametro="Sitio en mantenimiento!";}
if(parametro.trim().equals("")){parametro="Sitio en mantenimiento!";}

%>

<!--HEADER-->
	<header><img src="home_files/logo.png" alt="logo" width="220px" height="80px">
	
	</header>
	<!--END HEADER-->
<!--MAIN SECTION-->
	<div class="main work-page">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!--POST-->
					<div class="post">

						<div class="content">
							<h3><%=parametro%></h3>
<br/>
							<p><a href="/m-web/index.jsp"><h5>>>>>>> Volver <<<<<< </h5></a></p>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

						</div>
					</div>
					<!--END POST-->


				</div>
			</div>
		</div>
	</div>
	<!--END MAIN SECTION-->

	<!--FOOTER-->
	<footer><center>
	<div class="container">
		<img src="home_files/logo-sm.png" alt="">
		<ul class="list-inline social">
			<li><a href="https://www.facebook.com/muliemergencias.centrodeentrenamiento" target="_blank"><i class="fa fa-facebook"></i></a></li>
			<li><a href="http://www.twitter.com/" target="_blank" ><i class="fa fa-twitter"></i></a></li>
			<li><a href="https://co.linkedin.com/pub/jefe-nixon-zambrano/52/168/b8b" target="_blank" ><i class="fa fa-linkedin"></i></a></li>

		</ul>
		<p>
			Contacto: multiemergenciassas@gmail.com<br>Whatsapp: (+57) 316 629 27 91 ; (+57) 320 408 03 85<br>Diseñado por: quimerapps.com
		</p>
	</div></center>
	</footer>
	<!--END FOOTER-->

	<script src="home_files/jquery-1.11.0.min.js"></script>
	<script src="home_files/jquery-migrate-1.2.1.js"></script>

	<script src="home_files/smoothscroll.js"></script>
	<script src="home_files/snap.svg-min.js"></script>
	<script src="home_files/jquery.bxslider.js"></script>
	<script src="home_files/retina.min.js"></script>
	<script src="home_files/imagesloaded.pkgd.min.js"></script>
	<script src="home_files/masonry.pkgd.min.js"></script>
	<script src="home_files/classie.js"></script>
	<script src="home_files/modernizr.custom.js"></script>
	<script src="home_files/cbpGridGallery.js"></script>
	<script src="home_files/jquery.resizestop.min.js"></script>
	<script src="home_files/fluidvids.js"></script>
	<script src="home_files/doubletaptogo.js"></script>

	<script src="home_files/main.js"></script>

</body>
</html>
