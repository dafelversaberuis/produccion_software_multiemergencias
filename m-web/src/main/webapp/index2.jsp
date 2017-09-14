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
    <title>MULTIEMERGENCIAS S.A.S</title>
    <meta name="Description" content="CENTRO DE ENTRENAMIENTO EN EMERGENCIAS y SALUD OCUPACIONAL ">
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">   
	<script src="js/jquery-1.11.3.min.js" ></script>


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
				alert('¡Debe digitar su documento y contraseña de administrador!');
				document.getElementById('usuario').focus();
				
			}else
			{
				alert('¡Debe digitar su documento!');
				document.getElementById('usuario').focus();
			}
		}else
		{
			if(vError2)
			{
				alert('¡Debe especificar la contraseña!');
				document.getElementById('contrasena').focus();
			}else
			{
				document.siss.submit();
			}
		
		}
		
	}
</script>
</head>
<body>
    <%
session.invalidate(); 
					response.setHeader("Cache-Control","no-store");
					response.setHeader("Pragma","no-cache");
					response.setDateHeader("Expires",0);
					
					
					Parametro parametro = new Parametro();
					String [] parametros2  = parametro.getarametros();
					 %>
					 
	
	<div id="top-izq"></div>  
     <div id="contenedor">
	<div id="encabezado">		 
      	<div id="barra_roja"><h1>Entrenamiento en Emergencias y Salud Ocupacional</h1></div>     
		<div id="logo_multiemergencias"><img id="" src="imagenes/logo-multiemergencias.png" alt="logo Multiemergencias" width="571" height="212"></div>
		<div id="menu_principal">
		
		
		
		<%
				List<Publicacion> publicaciones = bAdministrarPublicaciones.getNotasPublicas(); int cuenta = 0; 
                List<Seccion> secciones = bAdministrarPublicaciones.getSecciones();
                List<Portafolio> portafolios = bAdministrarPublicaciones.getPortafolios();
                if(secciones!=null && secciones.size()>0){
                for(Seccion s: secciones){
                %>
                
                <a class="estilo_enlaces_principales" href="seccion.jsp?id=<%=s.getSeccion()%>" style="text-decoration:none"><%=s.getTitulo().trim() %></a>
                
                <%} } %>
                <a class="estilo_enlaces_principales" href="contactenos.jsp" style="text-decoration:none">Contáctenos</a>
		
	
			
		</div> 		
	</div>
	
	<div id="slider">
                <div id="afiche_1"></div>               
                <div id="afiche_2"></div>                      
		</div><%
		int cuentaP = 0;
		if(portafolios!=null && portafolios.size()>0){ %>
	<div id="contenedor_portafolio">
	<% 
	
		for(Portafolio p: portafolios){
			cuentaP++;
		%>
		<div id="servicio" class="servicio_<%=cuentaP%>">
			<%if(cuentaP==1){ %><div id="titulo_portafolio">Portafolio de Servicios</div><%} %> 
           <div id="titulo" class="servicio_a"><div id="asterisco"></div><%=p.getTitulo() %><br/><div id="ver_mas"></div>  
		</div>
            <div id="cont_servicio"  class="contenido_servicio_<%=cuentaP%>">              
               <div id="cont_servicios">					
				<div id="item" class="clase_item"><%=p.getContenido() %></div>
				<div id="item" class="clase_item"></div>
				</div>
            </div>
		</div>
		<%} %>
</div><%} %>
<%for(Publicacion l: publicaciones){ cuenta++; if(publicaciones.size()>=1 && (cuenta<=2)){%>
<div id="" class="contenedor_noticias">
				   <div class="fondo_titulo_noticias">
					<%if((l.getDireccionFotoPublicacion()!=null && !l.getDireccionFotoPublicacion().trim().equals("null") && !l.getDireccionFotoPublicacion().trim().equals(""))){ %>
					<div class="circulo_noticias" style="background-image:url(images/publicaciones/<%=l.getDireccionFotoPublicacion() %>);"></div>
					<%} else{%><div class="circulo_noticias" style="background-image:url(imagenes/noticias/run.png);"></div><%}%>
					<div class="descripcion_noticias"><h2><%=l.getTituloPublicacion().trim() %></h2><br><%= bAdministrarPublicaciones.getTextoCortado(l.getContenidoPublicacion().trim()) %><%= "<h6><a href='noticiaInterna.jsp?id="+l.getIdPublicacion()+"' style='text-decoration:none'>(Ver más)</a></h6>" %></div>
				</div>

		</div><br/><br/><%}} %><div id="" class="contenedor_noticias">
		<%= "<center><h6><a href='noticias.jsp' style='text-decoration:none'>- Ver todas las noticias -</a></h6></center>" %>	
		</div>
		</div>
	
	<div id="footer">            
        <div id="contenido_footer"><form name="siss" method="post" action="home.jsp"><h3>Documento: <input type="text" name="usuario" class="search" id="usuario" value="" tabindex="1"/><br>Clave: <input type="password"  value="" name="contrasena" id="contrasena" tabindex="2"/><br><br><input name="button" type="button" class="submit" style="cursor:hand" onclick="fMenu()" value="Entrar" tabindex="3"/>     
</h3></form>	          </div> 
		<div id="footer-der"></div>  
        </div>	
	<%
	 List<RepositorioFotos> fotos = bAdministrarPublicaciones.getRepositorioFotos();
	%>
	<input type="hidden" value="<%=fotos.size()%>" id="numeroFotos"/>
	<script>
			
		$(document).ready(function(){
            
//------------------  portafolio de servicios --------------------------------- 
				
				var numero_servicios=8;
								
				// cierra e inicia todos los servicios  en 0
				
				for(i=1; i<=numero_servicios ;i++){
							$(".servicio_"+i).data("cerrado", 0);
							$(".contenido_servicio_"+i).slideUp();					
							//console.log("cerrado ="+i);  
							}
								
				$(".servicio_1, .servicio_2, .servicio_3, .servicio_4, .servicio_5, .servicio_6, .servicio_7, .servicio_8, .servicio_9, .servicio_10, .servicio_11, .servicio_12, .servicio_13, .servicio_14, .servicio_15, .servicio_16, .servicio_17, .servicio_18").click(function(){
					
										
					numero_id= ($(this).attr("class").charAt(9)+$(this).attr("class").charAt(10));
					//console.log(numero_id);    
					//$(".contenido_servicio_"+numero_id).slideToggle();
						if($(this).data("cerrado")==0){
							
							// cierra todos abiertos
							for(i=1; i<=numero_servicios ;i++){
								$(".servicio_"+i).data("cerrado", 0);
								$(".contenido_servicio_"+i).slideUp();	
							}
							// abre el seleccionado y asigna 1 a cerrado
							$(this).data("cerrado", 1);							
							//$(".contenido_servicio_"+numero_id).fadeIn('slide'); 
							$(".contenido_servicio_"+numero_id).slideDown( "slow" );
							
						}else{ 
							// cierra el seleccionado y asigna 0 a cerrado							
							$(this).data("cerrado", 0);							
							$(".contenido_servicio_"+numero_id).slideUp();					
						}
				
	  			});				
				//console.log($(".servicio_1").data("cerrado"));   
			
//------------------  slider de cursos --------------------------------- 
            
				consecutivo=1;
				consecutivo_peque=2;
				$('#afiche_1').css({'background-image' : 'url(imagenes/cursos/curso_'+consecutivo+'.png)', 'background-repeat' : 'repeat-x'});
				$('#afiche_2').css({'background-image' : 'url(imagenes/cursos/curso_'+consecutivo_peque+'.png)', 'background-repeat' : 'repeat-x'});
				function start() {	  				
	        	intervalo_slider = setInterval(function(){				
				consecutivo+=1;
				consecutivo_peque+=1;
				if(consecutivo==parseInt(document.getElementById('numeroFotos').value)+1){consecutivo=1;}	
				if(consecutivo_peque==parseInt(document.getElementById('numeroFotos').value)+1){consecutivo_peque=1;}						
					//console.log("consecutivo ="+consecutivo+"   consecutivo_peque ="+consecutivo_peque);
				$('#afiche_1').css({'background-image' : 'url(imagenes/cursos/curso_'+consecutivo+'.png)', 'background-repeat' : 'repeat-x'});				
				setTimeout(function(){$('#afiche_2').css({'background-image' : 'url(imagenes/cursos/curso_'+consecutivo_peque+'.png)', 'background-repeat' : 'repeat-x'});},200);
	                            },5000);
	                        }
					start();        
			
			});
			
	</script>	
</body>
</html>
	
	