<%@page import="eu.telecom_bretagne.CESI.data.model.Employe"%>
<%@page import="java.util.List"%>
<%@page import="eu.telecom_bretagne.CESI.service.IGestionEmploye"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
	InitialContext ctx = new InitialContext();
	IGestionEmploye gestionEmploye = (IGestionEmploye) ctx
	.lookup(IGestionEmploye.JNDI_NAME);
	List<Employe> employes = gestionEmploye.listeEmployes();
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
	<h2>Liste des employés:</h2>
	<form method="post" action="supprimer_employes">
		<table id="employes">
			<tr>
				<th>Identifiant</th>
				<th>Nom</th>
				<th>Département</th>
				<th></th>
			</tr>
			<%
				for (Employe employe : employes) {
			%>
			<tr>
				<td><input type="checkbox" name="liste_employes"
					value="<%=employe.getId()%>"> <%=employe.getId()%></td>

				<td><a href="infos_employe.jsp?id=<%=employe.getId()%>"><%=employe.getNom()%></a>
				</td>
				<td><%=employe.getService().getNom()%> (id: <%=employe.getService().getId()%>)</td>
				<td><a href="modifier_employe_form.jsp?id=<%=employe.getId()%>">Modifier</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<input type="submit" value="Supprimer les employes sélectionnés">
		
	</form>

	<a href="index.jsp">Retour</a>
	<a href="creer_employe_form.jsp">Créer un employe</a>

</body>
</html>