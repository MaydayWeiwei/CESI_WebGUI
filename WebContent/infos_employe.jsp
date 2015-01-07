<%@page import="eu.telecom_bretagne.CESI.data.model.Employe"
	import="eu.telecom_bretagne.CESI.service.IGestionEmploye"
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
<title>Information sur employe</title>
</head>
<body>
	<h1>Information sur un employe</h1>
	<table>
		<tr>
			<td>ID</td>
			<td><%=employe.getId()%></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><%=employe.getNom()%></td>
		</tr>
	</table>
	<a href="index.jsp">Retour</a>
</body>
</html>
