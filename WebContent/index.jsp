<%@page import="eu.telecom_bretagne.CESI.data.model.Service"%>
<%@page import="java.util.List"%>
<%@page import="eu.telecom_bretagne.CESI.service.IGestionService"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
	InitialContext ctx = new InitialContext();
	IGestionService gestionService = (IGestionService) ctx
	.lookup(IGestionService.JNDI_NAME);
	List<Service> services = gestionService.listeServices();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CESI Home Page</title>
</head>
<body>
	<h1>Hello CESI</h1>
	<h2>Liste des services:</h2>
	<!-- <form method="post" action="supprimer_employes"> -->
		<table id="services">
			<tr>
				<th>Identifiant</th>
				<th>Nom</th>
				<th></th>
			</tr>
			<%
				for (Service service : services) {
			%>
			<tr>
				<td><%=service.getId() %></td>

				<td><a href="infos_service.jsp?id=<%=service.getId()%>"><%=service.getNom()%></a>
				</td>
<%-- 				<td><%=service.getNom()%> (id: <%=service.getId()%>)</td> --%>
				<td><a href="modifier_employe_form.jsp?id=<%=service.getId()%>">Modifier</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		
	<!-- </form> -->

	<a href="creer_service_form.jsp">Créer un service</a>

</body>
</html>