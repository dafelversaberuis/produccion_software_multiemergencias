package beans;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ver_archivo_adjunto.jsp")
public class VerArchivoAdjunto extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4955971162143236208L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {

			String id = request.getParameter("id");
			RepositorioFotos repositorioFotos = new AdministrarPublicaciones().getRepositorioFoto(Integer.parseInt(id));

			byte[] bytes = repositorioFotos.getArchivo();

			/* Indicamos que la respuesta va a ser en formato PDF */

			response.setContentType(repositorioFotos.getContentType());
			response.setContentLength(bytes.length);
			ServletOutputStream ouputStream = response.getOutputStream();
			ouputStream.write(bytes, 0, bytes.length);

			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			// out.println("NO SE PUEDE MOSTRAR EL CERTIFICADO");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
