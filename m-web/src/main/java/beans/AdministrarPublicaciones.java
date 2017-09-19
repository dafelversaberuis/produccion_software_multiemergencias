package beans;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AdministrarPublicaciones {

	public int eliminarCurso(String idAdministrador) {
		Conexion conexion = new Conexion();
		conexion.setAutoCommitBD(true);
		int g = 0;
		boolean actualizo = false;

		actualizo = conexion.actualizarBD("DELETE FROM tipo_certificacion WHERE id=" + Integer.parseInt(idAdministrador));

		conexion.cerrarConexion();
		if (actualizo) {
			g = 1;
		}
		return g;
	}

	public int editarCurso(String id, String curso, String proyecto) {
		Conexion conexion = new Conexion();
		int exito = 0;
		try {

			boolean actualizo = conexion.actualizarBD("UPDATE tipo_certificacion SET nombre_certificacion='" + curso.trim() + "' WHERE id=" + id);
			if (actualizo) {
				exito = 1;
			}

		} catch (Exception ee) {
			// e//e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}

		return exito;

	}

	public int crearCurso(String curso, String proyecto) {
		Conexion conexion = new Conexion();
		int exito = 0;
		try {

			boolean actualizo = conexion.actualizarBD("INSERT INTO tipo_certificacion(nombre_certificacion) VALUES('" + curso.trim() + "')");
			if (actualizo) {
				exito = 1;
			}

		} catch (Exception ee) {
			// e//e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}

		return exito;

	}

	public List<Object[]> getCursos() {

		List<Object[]> cursos = new ArrayList<Object[]>();
		Conexion conexion = new Conexion();
		String sentencia = "   SELECT * FROM tipo_certificacion a" + " ORDER BY a.nombre_certificacion";
		Object[] curso = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		try {
			while (rs.next()) {
				curso = new Object[2];

				curso[0] = rs.getObject(1);
				curso[1] = rs.getObject(2);

				cursos.add(curso);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return cursos;
	}

	public Object[] getCursoCompleto(String id) {

		Conexion conexion = new Conexion();
		String sentencia = "   SELECT *  FROM tipo_certificacion a" + " WHERE a.id=" + id + " ORDER BY a.nombre_certificacion";
		Object[] curso = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		try {
			if (rs.next()) {
				curso = new Object[2];

				curso[0] = rs.getObject(1);
				curso[1] = rs.getObject(2);

			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return curso;
	}

	public int contactar(String correo, String nombre, String telefono, String contenido) {

		int exito = 0;
		try {

			Parametro parametro = new Parametro();
			Email email = new Email();

			String[] parametros = parametro.getarametros();
			int c = 0;

			String asunto = "";
			String mensaje = "";

			if (c == 0) {
				asunto = "Nuevo contacto desde el sitio Web de Multiemergencias";
				mensaje = "<table width='100%' border='0'>" + "<tr>" + "<td colspan='2' align='left' valign='middle'><strong><span class='Estilo2'>SITIO WEB Multiemergencias</strong></td>" + "</tr>" + "<tr>" + "<td colspan='2'>&nbsp;</td>" + "</tr>" + "<tr>" + "<td colspan='2'><p>Estimado administrador(a) existe un nuevo comentario de contacto desde el sitio Web. Éstos son los datos:<br><br>-<strong>Nombres:</strong>" + nombre + "<br><br>-<strong>Correo:</strong>" + correo + "<br><br>-<strong>Teléfono:</strong>" + telefono + "<br><br>-<strong>Contenido</strong>:<br>" + contenido + "<br><br>* Puedes visitar nuestro portal en cualquier momento dirigi&eacute;ndote a la direcci&oacute;n de internet: <a href='" + parametros[0] + "'>" + parametros[0] + "</a> &oacute; contactarnos a nuestro correo: " + parametros[1] + " </span></td></tr></table>";

				try {
					email.enviarEmail(mensaje, asunto, parametros[1]);
				} catch (Exception e) {

					// e.printStackTrace();
				}

				exito = 1;

			}

		} catch (Exception ee) {
			// e//e.printStackTrace();
		} finally {

		}

		return exito;

	}

	public int crearPortafolio(String titulo, String contenido) {
		Conexion conexion = new Conexion();
		int exito = 0;
		try {

			boolean actualizo = conexion.actualizarBD("INSERT INTO portafolio(titulo_portafolio,contenido_portafolio) VALUES('" + titulo + "','" + contenido + "')");
			if (actualizo) {
				exito = 1;
			}

		} catch (Exception ee) {
			// e//e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}

		return exito;

	}

	public int crearAdmin(String pn, String sn, String pa, String sa, int doc, String correo, String clave) {
		Conexion conexion = new Conexion();
		int exito = 0;
		try {

			Parametro parametro = new Parametro();
			Email email = new Email();

			String[] parametros = parametro.getarametros();
			int c = 0;

			ResultSet rs = conexion.consultarBD("SELECT COUNT(*) FROM administradores WHERE documento= " + doc);
			try {
				if (rs.next()) {
					c = rs.getInt(1);
				}
				rs.close();

			} catch (SQLException e) {
				// e.printStackTrace();
			}

			String asunto = "";
			String mensaje = "";

			if (c == 0) {
				asunto = "Nueva cuenta en sitio Web Multiemergencias";
				mensaje = "<table width='100%' border='0'>" + "<tr>" + "<td colspan='2' align='left' valign='middle'><strong>Sistema de informaci&oacute;n de Multiemergencias </strong></td>" + "</tr>" + "<tr>" + "<td colspan='2'>&nbsp;</td>" + "</tr>" + "<tr>" + "<td colspan='2'><p>Estimado administrador(a) <strong>" + pn + " " + sn + " " + pa + " " + sa + "</strong> se le ha creado una nueva cuenta en sitio Web Multiemergencias. Le recordamos su nueva contraseña, cámbiela cuando desee desde el menú administrador. La contraseña es: " + clave + ".</p>" + "<p>&nbsp; </p></td>" + "</tr>" + "<tr>" + "<td colspan='2'><span class='Estilo6'>* Puedes visitar nuestro portal en cualquier momento dirigi&eacute;ndote a la direcci&oacute;n de internet: <a href='" + parametros[0] + "'>" + parametros[0] + "</a> &oacute; contactarnos a nuestro correo: " + parametros[1] + " </span></td>" + "</tr>" + "</table>";

				try {
					email.enviarEmail(mensaje, asunto, correo);
				} catch (Exception e) {

					// e.printStackTrace();
				}

				boolean actualizo = conexion.actualizarBD("INSERT INTO administradores(primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,documento,clave,correo) VALUES('" + pn + "','" + sn + "','" + pa + "','" + sa + "'," + doc + ",\"" + clave + "\",'" + correo + "')");
				if (actualizo) {
					exito = 1;
				}
			}

		} catch (Exception ee) {
			// e//e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}

		return exito;

	}

	public int getEnviarNuevaClaveAdmin(String correo, int id, String m, String clave) {
		Conexion conexion = new Conexion();
		int exito = 0;
		try {

			Parametro parametro = new Parametro();
			Email email = new Email();

			String[] parametros = parametro.getarametros();
			Administrador admin = new Administrador();

			String asunto = "";
			String mensaje = "";

			if (m.equals("0")) {
				admin.setClave(this.getClaveAleatoria());
			} else {
				admin.setClave(clave);
			}
			asunto = "Nueva clave para el portal de Multiemergencias";
			mensaje = "<table width='100%' border='0'>" + "<tr>" + "<td colspan='2' align='left' valign='middle'><strong>Sistema de informaci&oacute;n de Multiemergencias</strong></td>" + "</tr>" + "<tr>" + "<td colspan='2'>&nbsp;</td>" + "</tr>" + "<tr>" + "<td colspan='2'><p>Estimado administrador(a), se le ha asignado una nueva contraseña. Cámbiela cuando desee. La contraseña es: " + admin.getClave() + "</p>" + "<p>&nbsp; </p></td>" + "</tr>" + "<tr>" + "<td colspan='2'><span class='Estilo6'>* Puedes visitar nuestro portal en cualquier momento dirigi&eacute;ndote a la direcci&oacute;n de internet: <a href='" + parametros[0] + "'>" + parametros[0] + "</a> &oacute; contactarnos a nuestro correo: " + parametros[1] + " </span></td></tr>" + "</table>";

			try {
				email.enviarEmail(mensaje, asunto, correo);
			} catch (Exception e) {

				// e.printStackTrace();
			}

			boolean actualizo = conexion.actualizarBD("UPDATE administradores SET clave=(\"" + admin.getClave() + "\") WHERE id_administrador=" + id);
			if (actualizo) {
				exito = 1;
			}

		} catch (Exception ee) {
			// e//e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}

		return exito;

	}

	private String getClaveAleatoria() {
		String clave = "";
		for (int i = 0; i <= 3; i++) {
			int n = (int) (10.0 * Math.random()) + 0;
			clave = clave + String.valueOf(n);

		}
		return clave;

	}

	public int eliminarArchivoPlano(String pArchivo, String idArchivo) {
		Parametro parametro = new Parametro();
		String[] parametros = parametro.getarametros();
		java.io.File directorio = new java.io.File(parametros[5] + pArchivo);
		directorio.delete();

		Conexion conexion = new Conexion();
		conexion.setAutoCommitBD(true);
		int g = 0;
		boolean actualizo = false;
		actualizo = conexion.actualizarBD("DELETE FROM archivos_planos WHERE id_archivo=" + Integer.parseInt(idArchivo));
		// conexion.commitBD();
		conexion.cerrarConexion();
		if (actualizo) {
			g = 1;
		}
		return g;
	}

	public int eliminarPortafolio(String idPortafolio) {
		Conexion conexion = new Conexion();
		conexion.setAutoCommitBD(true);
		int g = 0;
		boolean actualizo = false;

		actualizo = conexion.actualizarBD("DELETE FROM portafolio WHERE id_portafolio=" + Integer.parseInt(idPortafolio));

		conexion.cerrarConexion();
		if (actualizo) {
			g = 1;
		}
		return g;
	}

	public int eliminarAdministrador(String idAdministrador) {
		Conexion conexion = new Conexion();
		conexion.setAutoCommitBD(true);
		int g = 0;
		boolean actualizo = false;

		ResultSet rs = conexion.consultarBD("SELECT COUNT(*) FROM administradores");
		int c = 0;
		try {
			while (rs.next()) {
				c = rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		}

		if (c > 1) {
			actualizo = conexion.actualizarBD("DELETE FROM administradores WHERE id_administrador=" + Integer.parseInt(idAdministrador));
		}

		conexion.cerrarConexion();
		if (actualizo) {
			g = 1;
		}
		return g;
	}

	public int eliminarCertificado(String id) {
		Conexion conexion = new Conexion();
		conexion.setAutoCommitBD(true);
		int g = 0;
		boolean actualizo = false;

		actualizo = conexion.actualizarBD("DELETE FROM certificados WHERE id_certificado=" + Integer.parseInt(id));

		conexion.cerrarConexion();
		if (actualizo) {
			g = 1;
		}
		return g;
	}

	public int eliminarArchivo(String pArchivo, String idFoto, String ruta) {
		Parametro parametro = new Parametro();
		String[] parametros = parametro.getarametros();
		java.io.File directorio = new java.io.File(pArchivo);
		// java.io.File directorio = new java.io.File(parametros[2] + pArchivo);
		// //antes
		directorio.delete();

		Conexion conexion = new Conexion();
		conexion.setAutoCommitBD(true);
		int g = 0;
		boolean actualizo = false;
		actualizo = conexion.actualizarBD("DELETE FROM repositorio_fotos WHERE id_foto=" + Integer.parseInt(idFoto));
		// conexion.commitBD();

		if (actualizo) {
			g = 1;
		}

		List<RepositorioFotos> fotos = new ArrayList<RepositorioFotos>();

		String sentencia = "";

		sentencia = "SELECT rf.fecha_publicacion, rf.direccion_foto, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, id_foto, archivo, content_type, id_foto FROM repositorio_fotos rf, egresados eg WHERE rf.id_egresado = eg.id_egresado" + " UNION ALL" + " SELECT rf.fecha_publicacion, rf.direccion_foto, 'ADMINISTRADOR' AS nombre, id_foto, archivo, content_type, id_foto FROM repositorio_fotos rf WHERE rf.id_administrador IS NOT NULL AND id_egresado IS NULL";

		RepositorioFotos foto2 = null;
		ResultSet rs = conexion.consultarBD(sentencia);

		try {
			while (rs.next()) {
				foto2 = new RepositorioFotos();
				foto2.setIdFoto(rs.getInt(4));
				foto2.setNombre(rs.getString(3));
				foto2.setFechaPublicacion(rs.getString(1));
				foto2.setDireccionFoto(rs.getString(2));
				foto2.setArchivo(rs.getBytes(5));
				foto2.setContentType(rs.getString(6));
				foto2.setIdFoto(rs.getInt(7));
				fotos.add(foto2);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {

		}

		int cuenta = 0;
		if (fotos != null && fotos.size() > 0) {
			for (RepositorioFotos p : fotos) {
				actualizo = false;
				cuenta++;
				g = cuenta;
				File f1 = new File(ruta + "/cursos/" + p.getDireccionFoto());
				f1.renameTo(new File(ruta + "/cursos/T" + p.getDireccionFoto()));

				if (!f1.exists()) {
					f1 = new File(ruta + "\\cursos\\" + p.getDireccionFoto());
					f1.renameTo(new File(ruta + "\\cursos\\T" + p.getDireccionFoto()));
				}

				actualizo = conexion.actualizarBD("UPDATE repositorio_fotos SET direccion_foto='curso_" + cuenta + ".jpg' WHERE id_foto=" + p.getIdFoto());
			}

			cuenta = 0;
			for (RepositorioFotos p : fotos) {

				cuenta++;

				File f3 = new File(ruta + "/cursos/T" + p.getDireccionFoto());
				f3.renameTo(new File(ruta + "/cursos/curso_" + cuenta + ".jpg"));

				if (!f3.exists()) {
					f3 = new File(ruta + "\\cursos\\T" + p.getDireccionFoto());
					f3.renameTo(new File(ruta + "\\cursos\\curso_" + cuenta + ".jpg"));
				}

			}

		}

		conexion.cerrarConexion();

		return g;
	}

	public List<RepositorioFotos> getRepositorioFotosEliminar(String tipoUsuario, String usuario) {
		List<RepositorioFotos> fotos = new ArrayList<RepositorioFotos>();
		Conexion conexion = new Conexion();
		String sentencia = "";
		if (tipoUsuario.equals("1")) {
			sentencia = "SELECT rf.fecha_publicacion, rf.direccion_foto, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, id_foto, archivo, content_type, id_foto FROM repositorio_fotos rf, egresados eg WHERE rf.id_egresado = eg.id_egresado AND eg.id_egresado=" + usuario;
		} else {
			sentencia = "SELECT rf.fecha_publicacion, rf.direccion_foto, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, id_foto, archivo, content_type, id_foto FROM repositorio_fotos rf, egresados eg WHERE rf.id_egresado = eg.id_egresado" + " UNION ALL" + " SELECT rf.fecha_publicacion, rf.direccion_foto, 'ADMINISTRADOR' AS nombre, id_foto, archivo, content_type, id_foto FROM repositorio_fotos rf WHERE rf.id_administrador IS NOT NULL AND id_egresado IS NULL";
		}
		RepositorioFotos foto = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		int c = 0;
		try {
			while (rs.next()) {
				foto = new RepositorioFotos();
				foto.setIdFoto(rs.getInt(4));
				foto.setNombre(rs.getString(3));
				foto.setFechaPublicacion(rs.getString(1));
				foto.setDireccionFoto(rs.getString(2));
				foto.setArchivo(rs.getBytes(5));
				foto.setContentType(rs.getString(6));
				foto.setIdFoto(rs.getInt(7));
				fotos.add(foto);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return fotos;
	}
	
	
	public RepositorioFotos getRepositorioFoto(Integer aId) {

		Conexion conexion = new Conexion();
		String sentencia = "SELECT rf.fecha_publicacion, rf.direccion_foto, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, archivo, content_type, id_foto FROM repositorio_fotos rf, egresados eg WHERE rf.id_egresado = eg.id_egresado AND rf.id_foto="+aId + " UNION ALL" + " SELECT rf.fecha_publicacion, rf.direccion_foto, 'ADMINISTRADOR' AS nombre, archivo, content_type, id_foto FROM repositorio_fotos rf WHERE rf.id_administrador IS NOT NULL AND id_egresado IS NULL  AND rf.id_foto="+aId;
		RepositorioFotos foto = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		int c = 0;
		try {
			if (rs.next()) {
				foto = new RepositorioFotos();
				foto.setNombre(rs.getString(3));
				foto.setFechaPublicacion(rs.getString(1));
				foto.setDireccionFoto(rs.getString(2));
				foto.setArchivo(rs.getBytes(4));
				foto.setContentType(rs.getString(5));
				foto.setIdFoto(rs.getInt(6));
			
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return foto;
	}
	
	

	public List<RepositorioFotos> getRepositorioFotos() {
		List<RepositorioFotos> fotos = new ArrayList<RepositorioFotos>();
		Conexion conexion = new Conexion();
		String sentencia = "SELECT rf.fecha_publicacion, rf.direccion_foto, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, archivo, content_type, id_foto FROM repositorio_fotos rf, egresados eg WHERE rf.id_egresado = eg.id_egresado" + " UNION ALL" + " SELECT rf.fecha_publicacion, rf.direccion_foto, 'ADMINISTRADOR' AS nombre, archivo, content_type, id_foto FROM repositorio_fotos rf WHERE rf.id_administrador IS NOT NULL AND id_egresado IS NULL";
		RepositorioFotos foto = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		int c = 0;
		try {
			while (rs.next()) {
				foto = new RepositorioFotos();
				foto.setNombre(rs.getString(3));
				foto.setFechaPublicacion(rs.getString(1));
				foto.setDireccionFoto(rs.getString(2));
				foto.setArchivo(rs.getBytes(4));
				foto.setContentType(rs.getString(5));
				foto.setIdFoto(rs.getInt(6));
				fotos.add(foto);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return fotos;
	}

	public int guardarArchivoPlano(String usuario, String archivo) {
		Conexion conexion = new Conexion();
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		int g = 0;
		boolean actualizo = false;
		actualizo = conexion.actualizarBD("INSERT INTO archivos_planos(archivo, id_administrador, fecha) VALUES('" + archivo + "'," + usuario + ",'" + formato.format(new Date()) + "' )");
		conexion.cerrarConexion();
		if (actualizo) {
			g = 1;
		}
		return g;

	}

	public void actualizarArchivo(File archivo) {

		Conexion conexion2 = new Conexion();
		String sentencia = "SELECT MAX(id_foto) FROM repositorio_fotos";
		int id = 0;

		ResultSet rs2 = conexion2.consultarBD(sentencia);

		try {
			if (rs2.next()) {
				id = rs2.getInt(1);
			}
			rs2.close();

		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion2.cerrarConexion();
		}

		Conexion conexion = new Conexion();
		byte[] array = null;

		// try {
		// array = Files.readAllBytes(archivo.toPath());
		// } catch (Exception e) {
		// array = null;
		// }

		try {
			FileInputStream is = new FileInputStream(archivo);

			// guarda el archivo

			String[][] condiciones = new String[1][2];
			condiciones[0][0] = "id_foto";
			condiciones[0][1] = "" + id;
			String[] campos = new String[1];
			campos[0] = "archivo";
			Object[] valores = new Object[1];
			valores[0] = array;
			boolean oka = conexion.actualizarBD3("repositorio_fotos", campos, condiciones, is, (int) archivo.length(), archivo);
			// revisa
			System.out.println(oka);

			conexion.cerrarConexion();

		} catch (Exception e) {

		}

	}

	public void guardarArchivoDisco(String directorio_ruta_con_nombre_archivo, byte[] array) {

		if (array != null) {
			FileOutputStream fileOuputStream = null;
			try {
				fileOuputStream = new FileOutputStream(directorio_ruta_con_nombre_archivo);
				fileOuputStream.write(array);
			} catch (Exception e) {

			} finally {
				try {
					fileOuputStream.close();
				} catch (IOException e) {

				}
			}
		}

	}

	public int guardarRepositorio(String tipoEgresado, String usuario, String foto, String contentType) {

		Conexion conexion = new Conexion();
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		int g = 0;
		boolean actualizo = false;

		actualizo = conexion.actualizarBD("INSERT INTO repositorio_fotos(direccion_foto, id_administrador, fecha_publicacion, content_type) VALUES('" + foto + "',1,'" + formato.format(new Date()) + "','"+contentType+"')");

		if (actualizo) {
			g = 1;

		}

		List<RepositorioFotos> fotos = new ArrayList<RepositorioFotos>();

		String sentencia = "";

		sentencia = "SELECT rf.fecha_publicacion, rf.direccion_foto, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, id_foto, archivo, content_type, id_foto FROM repositorio_fotos rf, egresados eg WHERE rf.id_egresado = eg.id_egresado" + " UNION ALL" + " SELECT rf.fecha_publicacion, rf.direccion_foto, 'ADMINISTRADOR' AS nombre, id_foto, archivo, content_type, id_foto FROM repositorio_fotos rf WHERE rf.id_administrador IS NOT NULL AND id_egresado IS NULL";

		RepositorioFotos foto2 = null;
		ResultSet rs = conexion.consultarBD(sentencia);

		try {
			while (rs.next()) {
				foto2 = new RepositorioFotos();
				foto2.setIdFoto(rs.getInt(4));
				foto2.setNombre(rs.getString(3));
				foto2.setFechaPublicacion(rs.getString(1));
				foto2.setDireccionFoto(rs.getString(2));
				foto2.setArchivo(rs.getBytes(5));
				foto2.setContentType(rs.getString(6));
				foto2.setIdFoto(rs.getInt(7));
				fotos.add(foto2);
			}
			rs.close();

		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {

		}

		int cuenta = 0;
		if (fotos != null && fotos.size() > 0) {
			for (RepositorioFotos p : fotos) {
				actualizo = false;
				cuenta++;
				g = cuenta;
				actualizo = conexion.actualizarBD("UPDATE repositorio_fotos SET direccion_foto='curso_" + cuenta + ".jpg' WHERE id_foto=" + p.getIdFoto());

			}

		}

		conexion.cerrarConexion();

		return g;

	}

	public int guardarCertificado(String[][] datos, int longitud) throws Exception {
		Conexion conexion = new Conexion();

		int g = 0;

		for (int i = 0; i <= longitud - 1; i++) {
			conexion.actualizarBD("INSERT INTO certificados(tipo_documento,documento,ciudad_documento,nombre_completo,fecha_inicio,fecha_fin,fecha_disponibilidad,tipo_certificado,ciudad_depto_curso,numero_horas) VALUES ('" + datos[i][9] + "','" + datos[i][2] + "','" + datos[i][1] + "','" + datos[i][6] + "','" + datos[i][5] + "','" + datos[i][4] + "','" + datos[i][3] + "','" + datos[i][8] + "','" + datos[i][0] + "','" + datos[i][7] + "')");

		}

		g = 1;

		return g;

	}

	public int guardarSeccion(String titulo, String contenido, String foto, String receptor) throws Exception {
		Conexion conexion = new Conexion();
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		int g = 0;
		boolean actualizo = false;
		if (foto == null || foto.equals("null")) {
			foto = "";
		}
		actualizo = conexion.actualizarBD("UPDATE secciones SET titulo_seccion = '" + titulo + "',  direccion_foto_seccion = '" + foto + "', fecha = '" + formato.format(new Date()) + "', contenido_seccion ='" + contenido + "' WHERE id_seccion =" + Integer.parseInt(receptor));

		if (actualizo) {
			g = 1;

		}
		return g;

	}

	public int guardarPublicacion(int tipoUsuario, int administrador, int egresado, int privacidad, String titulo, String contenido, String foto, String receptor) throws Exception {
		Conexion conexion = new Conexion();
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		int g = 0;
		boolean actualizo = false;
		if (receptor.equals("0")) {
			receptor = null;
		}

		Object[] objeto = new Object[7];

		objeto[0] = administrador;
		objeto[1] = privacidad;
		titulo = titulo.replace("“", "\'");
		titulo = titulo.replace("”", "\'");
		objeto[2] = titulo;
		contenido = contenido.replace("“", "\'");
		contenido = contenido.replace("”", "\'");
		objeto[3] = contenido;
		objeto[4] = foto;
		objeto[5] = receptor;
		objeto[6] = formato.format(new Date());

		String[] campos = { "id_administrador", "privacidad_publicacion", "titulo_publicacion", "contenido_publicacion", "direccion_foto_publicacion", "receptor", "fecha" };

		actualizo = conexion.insertarBD2("publicaciones", campos, objeto);

		if (actualizo) {
			g = 1;

		}
		return g;

	}

	public int eliminarPublicacion(int aIdPublicacion) {
		Conexion conexion = new Conexion();
		boolean actualizo = false;
		int g = 0;
		actualizo = conexion.actualizarBD("DELETE FROM publicaciones WHERE id_publicacion='" + aIdPublicacion + "'");

		conexion.cerrarConexion();
		if (actualizo) {
			g = 1;
		}
		return g;

	}

	public List<Publicacion> getPublicaciones(int aEgresado) {
		List<Publicacion> publicaciones = new ArrayList<Publicacion>();
		Conexion conexion = new Conexion();
		String sentencia = "SELECT pu.id_publicacion, pu.id_egresado, id_administrador, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, fecha, titulo_publicacion, contenido_publicacion, direccion_foto_publicacion, privacidad_publicacion  FROM publicaciones pu LEFT JOIN egresados eg  ON  pu.id_egresado = eg.id_egresado WHERE privacidad_publicacion = 1 UNION ALL" + " SELECT pu.id_publicacion, pu.id_egresado, id_administrador, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, fecha, titulo_publicacion, contenido_publicacion, direccion_foto_publicacion, privacidad_publicacion FROM publicaciones pu, egresados eg WHERE privacidad_publicacion =3 AND receptor = " + aEgresado + " AND pu.id_egresado = eg.id_egresado" + " ORDER BY fecha DESC, id_publicacion DESC FIRST 10";
		Publicacion publicacion = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		int c = 0;
		try {
			while (rs.next()) {
				publicacion = new Publicacion();
				publicacion.setIdPublicacion(rs.getInt(1));
				publicacion.setIdEgresado(rs.getInt(2));
				publicacion.setIdAdministrador(rs.getInt(3));
				publicacion.setNombre(rs.getString(4));
				publicacion.setFecha(rs.getString(5));
				publicacion.setTituloPublicacion(rs.getString(6));
				publicacion.setContenidoPublicacion(rs.getString(7));

				publicacion.setPrivacidadPublicacion(rs.getInt(9));

				if (rs.getString(8) == null || rs.getString(8).trim().equals("")) {
					c++;
					// publicacion.setDireccionFotoPublicacion("sinImagen" + c + ".jpg");
				} else {
					publicacion.setDireccionFotoPublicacion(rs.getString(8));
				}

				if (c == 4) {
					c = 0;
				}

				if (publicacion.getIdAdministrador() != 0) {
					publicacion.setNombre("Administrador");

				}

				publicaciones.add(publicacion);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return publicaciones;
	}

	public List<Publicacion> getPublicacionesEgresado(int aEgresado, int tipoUsuario) {
		List<Publicacion> publicaciones = new ArrayList<Publicacion>();
		Conexion conexion = new Conexion();
		String sentencia = "";
		if (tipoUsuario == 2) {
			sentencia = "SELECT pu.id_publicacion, pu.id_egresado, id_administrador, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, fecha, titulo_publicacion, contenido_publicacion, direccion_foto_publicacion, privacidad_publicacion  FROM publicaciones pu, egresados eg  WHERE  pu.id_egresado = eg.id_egresado AND (receptor IS NULL OR receptor = 0) ORDER BY fecha DESC, id_publicacion DESC";
		} else {
			sentencia = "SELECT pu.id_publicacion, pu.id_egresado, id_administrador, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, fecha, titulo_publicacion, contenido_publicacion, direccion_foto_publicacion, privacidad_publicacion  FROM publicaciones pu, egresados eg  WHERE  pu.id_egresado = eg.id_egresado AND eg.id_egresado=" + aEgresado + " ORDER BY fecha DESC, id_publicacion DESC FIRST 10";
		}
		Publicacion publicacion = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		int c = 0;
		try {
			while (rs.next()) {
				publicacion = new Publicacion();
				publicacion.setIdPublicacion(rs.getInt(1));
				publicacion.setIdEgresado(rs.getInt(2));
				publicacion.setIdAdministrador(rs.getInt(3));
				publicacion.setNombre(rs.getString(4));
				publicacion.setFecha(rs.getString(5));
				publicacion.setTituloPublicacion(rs.getString(6));
				publicacion.setContenidoPublicacion(rs.getString(7));

				publicacion.setPrivacidadPublicacion(rs.getInt(9));

				if (rs.getString(8) == null || rs.getString(8).trim().equals("")) {
					c++;
					// publicacion.setDireccionFotoPublicacion("sinImagen" + c + ".jpg");
				} else {
					publicacion.setDireccionFotoPublicacion(rs.getString(8));
				}

				if (c == 4) {
					c = 0;
				}

				publicaciones.add(publicacion);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return publicaciones;
	}

	public Publicacion getNotaPublica(int id) {
		Conexion conexion = new Conexion();
		String sentencia = "SELECT pu.id_publicacion, pu.id_egresado, id_administrador, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, fecha, titulo_publicacion, contenido_publicacion, direccion_foto_publicacion, privacidad_publicacion  FROM publicaciones pu LEFT JOIN egresados eg ON pu.id_egresado = eg.id_egresado WHERE privacidad_publicacion = 2 AND pu.id_publicacion=" + id;
		Publicacion publicacion = new Publicacion();
		ResultSet rs = conexion.consultarBD(sentencia);
		int c = 0;
		try {
			if (rs.next()) {
				publicacion = new Publicacion();
				publicacion.setIdPublicacion(rs.getInt(1));
				publicacion.setIdEgresado(rs.getInt(2));
				publicacion.setIdAdministrador(rs.getInt(3));
				publicacion.setNombre(rs.getString(4));
				publicacion.setFecha(rs.getString(5));
				publicacion.setTituloPublicacion(rs.getString(6));
				publicacion.setContenidoPublicacion(rs.getString(7));

				publicacion.setPrivacidadPublicacion(rs.getInt(9));

				if (rs.getString(8) == null || rs.getString(8).trim().equals("")) {
					c++;
					// publicacion.setDireccionFotoPublicacion("sinImagen" + c + ".jpg");
				} else {
					publicacion.setDireccionFotoPublicacion(rs.getString(8));
				}

				if (c == 4) {
					c = 0;
				}

				if (publicacion.getIdAdministrador() != 0) {
					publicacion.setNombre("Administrador");
				}

			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return publicacion;
	}

	public String getTextoCortado(String aTexto) {
		String texto = "";
		int longitud = 220;
		if (aTexto != null) {
			if (aTexto.trim().length() >= longitud) {
				String[] vector = aTexto.split("");
				for (int i = 0; i < longitud; i++) {
					texto += vector[i];
				}
				texto += " ...";
			} else {
				texto = aTexto.trim();
			}
		}

		return texto;

	}

	public Seccion getSeccion(int id) {

		Conexion conexion = new Conexion();
		String sentencia = "SELECT * FROM secciones s WHERE s.id_seccion=" + id;

		Seccion seccion = null;
		ResultSet rs = conexion.consultarBD(sentencia);

		try {
			if (rs.next()) {
				seccion = new Seccion();
				seccion.setSeccion(rs.getInt(1));

				seccion.setTitulo(rs.getString(2));
				seccion.setContenido(rs.getString(3));

				if (rs.getString(4) == null || rs.getString(4).trim().equals("")) {

				} else {
					seccion.setDireccionFoto(rs.getString(4));
				}
				seccion.setFecha(rs.getString(5));

			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return seccion;
	}

	public List<Seccion> getSecciones() {
		List<Seccion> secciones = new ArrayList<Seccion>();
		Conexion conexion = new Conexion();
		String sentencia = "SELECT * FROM secciones s ORDER BY s.id_seccion";

		Seccion seccion = null;
		ResultSet rs = conexion.consultarBD(sentencia);

		try {
			while (rs.next()) {
				seccion = new Seccion();
				seccion.setSeccion(rs.getInt(1));

				seccion.setTitulo(rs.getString(2));
				seccion.setContenido(rs.getString(3));

				if (rs.getString(4) == null || rs.getString(4).trim().equals("")) {

				} else {
					seccion.setDireccionFoto(rs.getString(4));
				}
				seccion.setFecha(rs.getString(5));

				secciones.add(seccion);

			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return secciones;
	}

	public List<Publicacion> getNotasPublicas() {
		List<Publicacion> publicaciones = new ArrayList<Publicacion>();
		Conexion conexion = new Conexion();
		String sentencia = "SELECT pu.id_publicacion, pu.id_egresado, id_administrador, (eg.primer_nombre||' '|| eg.segundo_nombre|| ' '|| eg.primer_apellido|| ' '|| eg.segundo_apellido) AS nombre, fecha, titulo_publicacion, contenido_publicacion, direccion_foto_publicacion, privacidad_publicacion  FROM publicaciones pu LEFT JOIN egresados eg ON pu.id_egresado = eg.id_egresado WHERE privacidad_publicacion = 2 ORDER BY fecha DESC, id_publicacion DESC";
		// " DESC, id_publicacion DESC";
		Publicacion publicacion = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		int c = 0;
		try {
			while (rs.next()) {
				publicacion = new Publicacion();
				publicacion.setIdPublicacion(rs.getInt(1));
				publicacion.setIdEgresado(rs.getInt(2));
				publicacion.setIdAdministrador(rs.getInt(3));
				publicacion.setNombre(rs.getString(4));
				publicacion.setFecha(rs.getString(5));
				publicacion.setTituloPublicacion(rs.getString(6));
				publicacion.setContenidoPublicacion(rs.getString(7));

				publicacion.setPrivacidadPublicacion(rs.getInt(9));

				if (rs.getString(8) == null || rs.getString(8).trim().equals("")) {
					c++;
					// publicacion.setDireccionFotoPublicacion("sinImagen" + c + ".jpg");
				} else {
					publicacion.setDireccionFotoPublicacion(rs.getString(8));
				}

				if (c == 4) {
					c = 0;
				}

				if (publicacion.getIdAdministrador() != 0) {
					publicacion.setNombre("Administrador");
				}

				publicaciones.add(publicacion);

			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return publicaciones;
	}

	public List<ArchivoPlano> getArchivosPlanos() {
		List<ArchivoPlano> archivos = new ArrayList<ArchivoPlano>();
		Conexion conexion = new Conexion();
		String sentencia = "SELECT *  FROM archivos_planos a ORDER BY a.fecha DESC, a.id_archivo DESC";
		ArchivoPlano archivo = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		try {
			while (rs.next()) {
				archivo = new ArchivoPlano();
				archivo.setIdArchivo(rs.getInt(1));
				archivo.setArchivo(rs.getString(2));
				archivo.setFecha(rs.getString(3));
				archivos.add(archivo);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return archivos;
	}

	public List<Portafolio> getPortafolios() {
		List<Portafolio> portafolios = new ArrayList<Portafolio>();
		Conexion conexion = new Conexion();
		String sentencia = "SELECT * FROM portafolio a ORDER BY id_portafolio DESC";
		Portafolio portafolio = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		try {
			while (rs.next()) {
				portafolio = new Portafolio();
				portafolio.setIdPortafolio(rs.getInt("id_portafolio"));
				portafolio.setTitulo(rs.getString("titulo_portafolio"));
				portafolio.setContenido(rs.getString("contenido_portafolio"));

				portafolios.add(portafolio);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return portafolios;
	}

	public List<Certificado> getTiposCertificados() {
		List<Certificado> tipos = new ArrayList<Certificado>();
		Conexion conexion = new Conexion();
		String sentencia = "SELECT * FROM tipo_certificacion a ORDER BY nombre_certificacion";
		Certificado tipo = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		try {
			while (rs.next()) {
				tipo = new Certificado();
				tipo.setId(rs.getInt("id"));
				tipo.setNombre(rs.getString("nombre_certificacion"));

				tipos.add(tipo);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return tipos;
	}

	public List<Administrador> getAdministradores() {
		List<Administrador> administradores = new ArrayList<Administrador>();
		Conexion conexion = new Conexion();
		String sentencia = "SELECT * FROM administradores a ORDER BY primer_nombre, segundo_nombre, primer_apellido, segundo_apellido";
		Administrador admin = null;
		ResultSet rs = conexion.consultarBD(sentencia);
		try {
			while (rs.next()) {
				admin = new Administrador();
				admin.setIdAdministrador(rs.getInt("id_administrador"));
				admin.setPrimerApellido(rs.getString("primer_apellido"));
				admin.setCorreo(rs.getString("correo"));
				admin.setDocumento(rs.getInt("documento"));
				admin.setPrimerNombre(rs.getString("primer_nombre"));
				admin.setSegundoApellido(rs.getString("segundo_apellido"));
				admin.setSegundoNombre(rs.getString("segundo_nombre"));

				administradores.add(admin);
			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return administradores;
	}

	public List<Certificado> getCertificados(String tipoCertificado, String documento, String nombre, String fechaI, String fechaF) {
		List<Certificado> certificados = new ArrayList<Certificado>();
		Certificado certificado = null;
		Conexion conexion = new Conexion();
		String sentencia = "SELECT c .* , t.nombre_certificacion FROM certificados c, tipo_certificacion t WHERE c.tipo_certificado = t.id ";

		if (tipoCertificado != null && !tipoCertificado.trim().equals("0")) {

			sentencia += " AND c.tipo_certificado='" + tipoCertificado + "'";
		}

		if (documento != null && !documento.trim().equals("")) {

			sentencia += " AND c.documento='" + documento + "'";
		}

		if (nombre != null && !nombre.trim().equals("")) {

			sentencia += " AND UPPER(c.nombre_completo) LIKE '%" + nombre.trim().toUpperCase() + "%'";
		}

		if (fechaI != null && !fechaI.trim().equals("")) {

			sentencia += " AND c.fecha_inicio >='" + fechaI + "'";
		}

		if (fechaF != null && !fechaF.trim().equals("")) {

			sentencia += " AND c.fecha_fin <='" + fechaF + "'";
		}

		sentencia += " ORDER BY c.nombre_completo";

		ResultSet rs = conexion.consultarBD(sentencia);
		try {
			while (rs.next()) {
				certificado = new Certificado();
				certificado.setCiudadDepartamentoCurso(rs.getString("ciudad_depto_curso"));
				certificado.setCiudadDocumento(rs.getString("ciudad_documento"));
				certificado.setDocumento(rs.getLong("documento"));
				certificado.setFechaDisponibilidad(rs.getString("fecha_disponibilidad"));
				certificado.setFechaFin(rs.getString("fecha_fin"));
				certificado.setFechaInicio(rs.getString("fecha_inicio"));
				certificado.setId(rs.getInt("id_certificado"));
				certificado.setNombre(rs.getString("nombre_completo"));
				certificado.setTipoCertificado(rs.getString("nombre_certificacion"));
				certificado.setTipoDocumento(rs.getString("tipo_documento"));
				certificado.setNumeroHoras(rs.getInt("numero_horas"));
				certificados.add(certificado);

			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return certificados;
	}

	public Certificado getCertificado(int id) {
		Certificado certificado = null;
		Conexion conexion = new Conexion();
		String sentencia = "SELECT c .* , t.nombre_certificacion FROM certificados c, tipo_certificacion t WHERE c.tipo_certificado = t.id AND c.id_certificado =" + id;

		ResultSet rs = conexion.consultarBD(sentencia);
		try {
			while (rs.next()) {
				certificado = new Certificado();
				certificado.setCiudadDepartamentoCurso(rs.getString("ciudad_depto_curso"));
				certificado.setCiudadDocumento(rs.getString("ciudad_documento"));
				certificado.setDocumento(rs.getLong("documento"));
				certificado.setFechaDisponibilidad(rs.getString("fecha_disponibilidad"));
				certificado.setFechaFin(rs.getString("fecha_fin"));
				certificado.setFechaInicio(rs.getString("fecha_inicio"));
				certificado.setId(rs.getInt("id_certificado"));
				certificado.setNombre(rs.getString("nombre_completo"));
				certificado.setTipoCertificado(rs.getString("nombre_certificacion"));
				certificado.setTipoDocumento(rs.getString("tipo_documento"));
				certificado.setNumeroHoras(rs.getInt("numero_horas"));

			}
			rs.close();
		} catch (SQLException e) {
			// e.printStackTrace();
		} finally {
			conexion.cerrarConexion();
		}
		return certificado;
	}
}
