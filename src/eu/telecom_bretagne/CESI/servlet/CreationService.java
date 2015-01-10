package eu.telecom_bretagne.CESI.servlet;

import java.io.IOException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eu.telecom_bretagne.CESI.service.IGestionService;

/**
 * Servlet implementation class CreationAgent
 */
@WebServlet("/creer_service")
public class CreationService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreationService() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String responsable_id = request.getParameter("responsable_id");
		String serviceRattache_id = request.getParameter("serviceRattache_id");
		try {
			InitialContext ctx = new InitialContext();
			IGestionService gestionService = (IGestionService) ctx
					.lookup(IGestionService.JNDI_NAME);
			if("0".equals(serviceRattache_id)) {
				gestionService.creerService(nom, Integer.parseInt(responsable_id));
			}
			else{
				gestionService.creerService(nom, Integer.parseInt(responsable_id), Integer.parseInt(serviceRattache_id));
			}
		} catch (NamingException e) {
			throw new ServletException(e);
		}
		response.sendRedirect("index.jsp");
	}

}
