package eu.telecom_bretagne.CESI.servlet;

import java.io.IOException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eu.telecom_bretagne.CESI.service.IGestionEmploye;
import eu.telecom_bretagne.CESI.service.IGestionService;

/**
 * Servlet implementation class CreationEmploye
 */
@WebServlet("/creer_employe")
public class CreationEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreationEmploye() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			InitialContext ctx = new InitialContext();
			IGestionEmploye gestionEmploye = (IGestionEmploye) ctx
					.lookup(IGestionEmploye.JNDI_NAME);
			gestionEmploye.creerEmploye(nom, prenom, id);
		} catch (NamingException e) {
			throw new ServletException(e);
		}
		response.sendRedirect("infos_service.jsp?id="+id);
	}

}
