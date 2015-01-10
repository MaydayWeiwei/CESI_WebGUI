<%@page import="eu.telecom_bretagne.CESI.data.model.Service"
	import="eu.telecom_bretagne.CESI.data.model.Employe"
	import="eu.telecom_bretagne.CESI.service.IGestionService"
	import="java.util.Set"
	import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
	InitialContext ctx = new InitialContext();
	IGestionService gestionService = (IGestionService) ctx
	.lookup(IGestionService.JNDI_NAME);
	int id = Integer.parseInt(request.getParameter("id"));
	Service service = gestionService.lireService(id);
	Set<Employe> employes = service.getEmployes();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Information sur service</title>
</head>
<body>
	<h1>Information sur un service : <%=service.getNom()%></h1>
	<table>
		<tr>
			<th>ID</th>
			<th>NOM</th>
			<th>PRENOM</th>
		</tr>
		<%for(Employe employe : employes) { %>
		<tr>
			<td><%=employe.getId() %></td>
			<td><%=employe.getNom()%></td>
			<td><%=employe.getPrenom() %></td>
		</tr>
		<%} %>
	</table>
	<a href="creer_employe_form.jsp?id=<%=id %>">Créer un Employé</a><br />
	<a href="index.jsp">Retour</a>
</body>
</html>
