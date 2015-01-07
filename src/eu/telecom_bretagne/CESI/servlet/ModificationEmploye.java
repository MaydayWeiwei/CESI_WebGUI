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

/**
 * Servlet implementation class ModificationAgent
 */
@WebServlet("/modifier_employe")
public class ModificationEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificationEmploye() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		String nom = request.getParameter("nom");
		Integer service_id = Integer.parseInt(request
				.getParameter("service_id"));
		try {
			InitialContext ctx = new InitialContext();
			IGestionEmploye gestionEmploye = (IGestionEmploye) ctx
					.lookup(IGestionEmploye.JNDI_NAME);
			gestionEmploye.modifierEmploye(id, nom, service_id);
		} catch (NamingException e) {
			throw new ServletException(e);
		}
		response.sendRedirect("index.jsp");
	}

}
