<%@page import="eu.telecom_bretagne.CESI.data.model.Service"%>
<%@page import="java.util.List"%>
<%@page import="eu.telecom_bretagne.CESI.service.IGestionService"%>
<%@page import="eu.telecom_bretagne.CESI.data.model.Employe"
	import="eu.telecom_bretagne.CESI.service.IGestionEmploye"
	import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
	InitialContext ctx = new InitialContext();
	IGestionEmploye gestionEmploye = (IGestionEmploye) ctx
	.lookup(IGestionEmploye.JNDI_NAME);
	int id = Integer.parseInt(request.getParameter("id"));
	Employe employe = gestionEmploye.lireEmploye(id);
	IGestionService gestionService = (IGestionService) ctx
	.lookup(IGestionService.JNDI_NAME);
	List<Service> services = gestionService
	.listeServices();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modification d'un employe</title>
</head>
<body>
	<h1>Modification d'un employe</h1>
	<form method="post" action="modifier_employe">
		<table>
			<tr>
				<td><b>ID:</b>
				</td>
				<td><%=employe.getId()%> <input type="hidden" name="id"
					value="<%=employe.getId()%>">
				</td>
			</tr>
			<tr>
				<td><b>Name:</b>
				</td>
				<td><input type="text" name="nom" value="<%=employe.getNom()%>">
				</td>
			</tr>
			<tr>
				<td valign="top"><b>D&eacute;partement:</b>
				</td>
				<td>
					<%
						for (Service service : services) {
					%> <input type="radio" name="service_id"
					value="<%=service.getId()%>"
					<%=service.getId().equals(
						employe.getService().getId()) ? "checked" : ""%>>
					<%=service.getNom()%><br /> <%
 	}
 %>
				</td>
			</tr>
		</table>
		<input type="submit">
	</form>
	<a href="index.jsp">Retour</a>
</body>
</html>
