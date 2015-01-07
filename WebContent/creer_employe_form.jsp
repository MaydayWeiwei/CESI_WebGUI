<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="eu.telecom_bretagne.CESI.service.IGestionService"%>
<%@page import="eu.telecom_bretagne.CESI.data.model.Service"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	InitialContext ctx = new InitialContext();
	IGestionService gestionService = (IGestionService) ctx
	.lookup(IGestionService.JNDI_NAME);
	List<Service> services = gestionService
	.listeServices();
	boolean firstDeptSelected = false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Création d'un employé</title>
</head>
<body>
	<h1>Création d'un employé</h1>
	<form method="post" action="creer_employe">
		<table>
			<tr>
				<td><b>Name:</b>
				</td>
				<td><input type="text" name="nom" value=""></td>
			</tr>
			<tr>
				<td valign="top"><b>Service:</b>
				</td>
				<td>
					<%
						for (Service service : services) {
					%> <input type="radio" name="service_id"
					value="<%=service.getId()%>"
					<%=!firstDeptSelected ? "checked" : ""%>>
					<%
						firstDeptSelected = true;
					%> <%=service.getNom()%><br /> <%
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
