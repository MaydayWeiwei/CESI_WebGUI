package eu.telecom_bretagne.CESI.servlet;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eu.telecom_bretagne.CESI.service.IGestionEmploye;

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
		String statut = request.getParameter("statut");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date_debut = null;
		Date date_fin = null;
		try {
			date_debut = formatter.parse(request.getParameter("date_debut"));
			date_fin = formatter.parse(request.getParameter("date_fin"));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			InitialContext ctx = new InitialContext();
			IGestionEmploye gestionEmploye = (IGestionEmploye) ctx
					.lookup(IGestionEmploye.JNDI_NAME);
			gestionEmploye.creerEmploye(nom, prenom, id, statut, date_debut, date_fin);
		} catch (NamingException e) {
			throw new ServletException(e);
		}
		response.sendRedirect("infos_service.jsp?id="+id);
	}

}
