<%@page import="eu.telecom_bretagne.CESI.data.model.Service"
	import="eu.telecom_bretagne.CESI.data.model.Employe"
	import="eu.telecom_bretagne.CESI.service.IGestionEmploye"
	import="java.util.Set"
	import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
	InitialContext ctx = new InitialContext();
	IGestionEmploye gestionEmploye = (IGestionEmploye) ctx
	.lookup(IGestionEmploye.JNDI_NAME);
	int id = Integer.parseInt(request.getParameter("id"));
	Employe employe = gestionEmploye.lireEmploye(id);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Information sur employé</title>
</head>
<body>
	<h1>Information sur un employé : <%=employe.getNom() + " " + employe.getPrenom()%></h1>
	<table>
		<tr>
			<th>ID</th>
			<th>NOM</th>
			<th>PRENOM</th>
			<th>Service</th>
			<th>Statut</th>
			<th>Date début</th>
			<th>Date fin</th>
		</tr>
		<tr>
			<td><%=employe.getId() %></td>
			<td><%=employe.getNom()%></td>
			<td><%=employe.getPrenom() %></td>
			<td><%=employe.getService().getNom() %></td>
			<td><%=employe.getStatut() %></td>
			<td><%=employe.getDateDebut()%></td>
			<td><%=employe.getDateFin()%></td>
		</tr>
	</table>
	<a href="index.jsp">Retour</a>
</body>
</html>
