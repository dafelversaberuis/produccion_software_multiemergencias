package beans;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperRunManager;

@WebServlet("/imprimir_certificado.jsp")
public class ImprimirCertificado extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2007916962156596630L;


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			
			
			AdministrarPublicaciones bAdministrarPublicaciones = new AdministrarPublicaciones();

			String meses[] = { " ", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };

			DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
			simbolo.setDecimalSeparator(',');
			simbolo.setGroupingSeparator('.');

			DecimalFormat formateador = new DecimalFormat("###,###.##", simbolo);
			String reporte = new String();
			reporte = "certificado.jasper";

			String id = request.getParameter("i");
			if (id != null && !id.equals("")) {

				//Ruta donde se encuentra la plantilla que diseña el admin del IPRED
				String ruta_servidor_plantilla = request.getRealPath("/reportes/");

				//
				String logo = request.getRealPath("/imagenes/");
				String logoSocio = request.getRealPath("/imagenes/cortecnicas.png");

				Map pars = new HashMap();

				Certificado certificado = bAdministrarPublicaciones.getCertificado(Integer.parseInt(id));
				if (certificado != null) {

					String[] fechaInicio = certificado.getFechaInicio().split("-");
					String[] fechaFin = certificado.getFechaFin().split("-");
					String[] fechaMax = certificado.getFechaDisponibilidad().split("-");

					pars.put("pLogo", logo);
					pars.put("pLogoSocio", logoSocio);
					pars.put("pNombre", certificado.getNombre());
					
					
					String ciudad = "";
					
					if(certificado.getCiudadDocumento()!=null && !certificado.getCiudadDocumento().trim().equals("")){
						ciudad = " de "+certificado.getCiudadDocumento();
					}
					
					if(certificado.getTipoDocumento().equals("C.E.") || certificado.getTipoDocumento().equals("T.I.")){
						
						pars.put("pDocumento", certificado.getTipoDocumento() + " " + certificado.getDocumento()+ciudad);
					}else{
						pars.put("pDocumento", certificado.getTipoDocumento() + " " + formateador.format(certificado.getDocumento())+ciudad);
					}
					
					String con = ""+certificado.getId();
					if(certificado.getId()<=1000){
						
						con = "0000"+certificado.getId();
					}else if(certificado.getId()<=10000){
						
						con = "000"+certificado.getId();
					}else if(certificado.getId()<=100000){
						con = "00"+certificado.getId();
						
					}else if(certificado.getId()<=1000000){
						con = "0"+certificado.getId();
						
					}
				
					
					
					pars.put("pCurso", "\"" + certificado.getTipoCertificado() + "\"");

					if (certificado.getFechaInicio().equals(certificado.getFechaFin())) {
						pars.put("pFechas", "Llevado a cabo el " + fechaInicio[2] + " de " + meses[Integer.parseInt(fechaInicio[1])] + " de " + fechaInicio[0] + ", con una intensidad de " + certificado.getNumeroHoras() + " horas, " + certificado.getCiudadDepartamentoCurso() + ", " + meses[Integer.parseInt(fechaFin[1])] + " " + fechaFin[2] + " de " + fechaFin[0]+", Consecutivo:"+con);
					} else {
						pars.put("pFechas", "Llevado a cabo del " + fechaInicio[2] + " de " + meses[Integer.parseInt(fechaInicio[1])] + " de " + fechaInicio[0] + " al " + fechaFin[2] + " de " + meses[Integer.parseInt(fechaFin[1])] + " de " + fechaFin[0] + ", con una intensidad de " + certificado.getNumeroHoras() + " horas, " + certificado.getCiudadDepartamentoCurso() + ", " + meses[Integer.parseInt(fechaFin[1])] + " " + fechaFin[2] + " de " + fechaFin[0]+", Consecutivo:"+con);

					}

					pars.put("pLeyenda", "Fecha sugerida de renovación de certificado y credencial: para reentrenamiento en " + certificado.getTipoCertificado() + ", " + meses[Integer.parseInt(fechaMax[1])] + " de " + fechaMax[0]);

					//

					//Cuando se quiere usar un listado
					// A la linea de bytes el ultimo parametro se cambia por datasource
					// y se descomentarea la siguiente linea y se le pasa el listado armado un List<>
					//JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(listado);

					//Si se quiere usar una conexion se pasa como parmetro un objeto de conexion this.con ó
					//Connection conexion algo asi
					// y el ultimo parametro se de bytes se cambia por la conexion

					//Si solo son parametros, sin conexion ni lista solo como ultimo parametro en la
					//linea de bytes lo siguiente: new JREmptyDataSource()

					byte[] bytes = JasperRunManager.runReportToPdf(ruta_servidor_plantilla + "/" + reporte, pars, new JREmptyDataSource());
					
		

					/*Indicamos que la respuesta va a ser en formato PDF*/

					response.setContentType("application/pdf");
					response.setContentLength(bytes.length);
					ServletOutputStream ouputStream = response.getOutputStream();
					try{
					ouputStream.write(bytes, 0, bytes.length);
					}catch(Exception ee){
						
					}

					/*Limpiamos y cerramos flujos de salida*/

					ouputStream.flush();
					ouputStream.close();
					return;

				} else {

					//out.println("NO SE PUEDE MOSTRAR EL CERTIFICADO");
				}

			} else {

				//out.println("NO SE PUEDE MOSTRAR EL CERTIFICADO");
			}

		} catch (Exception e) {
			//out.println("NO SE PUEDE MOSTRAR EL CERTIFICADO");
		}

	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
