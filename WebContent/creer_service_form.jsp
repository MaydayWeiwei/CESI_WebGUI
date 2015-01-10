<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="eu.telecom_bretagne.CESI.service.IGestionEmploye"%>
<%@page import="eu.telecom_bretagne.CESI.data.model.Employe"%>
<%@page import="eu.telecom_bretagne.CESI.service.IGestionService"%>
<%@page import="eu.telecom_bretagne.CESI.data.model.Service"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	InitialContext ctx = new InitialContext();
	IGestionEmploye gestionEmploye = (IGestionEmploye) ctx
	.lookup(IGestionEmploye.JNDI_NAME);
	List<Employe> employes = gestionEmploye
	.listeEmployes();
		IGestionService gestionService = (IGestionService) ctx
	.lookup(IGestionService.JNDI_NAME);
	List<Service> services = gestionService
	.listeServices();
	Map<Integer, String> serviceMap = new HashMap<Integer, String>();
	serviceMap.put(0, "Sans service père");
	for(Service service : services) {
		serviceMap.put(service.getId(), service.getNom());
	}
	boolean firstEmployeSelected = false;
	boolean firstServiceSelected = false;
	
	String erreur = request.getParameter("erreur");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Création d'un service</title>
</head>
<body>
	<h1>Création d'un service</h1>
	<% 
	if(erreur != null) {
	%>
	<p><%=erreur %></p>
	<%} %>
	<form method="post" action="creer_service">
		<table>
			<tr>
				<td><b>Nom:</b>
				</td>
				<td><input type="text" name="nom" value=""></td>
			</tr>
			<tr>
				<td valign="top"><b>Responsable:</b>
				</td>
				<td>
					<%
						for (Employe employe : employes) {
					%> <input type="radio" name="responsable_id"
					value="<%=employe.getId()%>"
					<%=!firstEmployeSelected ? "checked" : ""%>>
					<%
						firstEmployeSelected = true;
					%> <%=employe.getNom()+" "+ employe.getPrenom()%><br /> <%
 	}
 %>
				</td>
			</tr>
			
			<tr>
				<td valign="top"><b>ServicePère:</b>
				</td>
				<td>
					<% 
						for (Entry<Integer, String> serviceEntry : serviceMap.entrySet()) {
					%> <input type="radio" name="serviceRattache_id"
					value="<%=serviceEntry.getKey()%>"
					<%=!firstServiceSelected ? "checked" : ""%>>
					<%
						firstServiceSelected = true;
					%> <%=serviceEntry.getValue()%> <br /> <%
	}
%>
				</td>
			</tr>
		</table>
		<input type="submit">
	</form>
	<a href="index.jsp">Annuler / retour</a>
</body>
</html>
