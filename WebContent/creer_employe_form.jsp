<%@page import="javax.naming.InitialContext"%>
<%@page import="eu.telecom_bretagne.CESI.service.IGestionEmploye"%>
<%@page import="eu.telecom_bretagne.CESI.data.model.Employe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Création d'un employé</title>
</head>
<body>
	<h1>Création d'un employé</h1>
	<form method="post" action="creer_employe?id=<%=id %>">
		<table>
		<tr>
			<td><b>Nom:</b></td>
			<td><input type="text" name="nom" value=""></td>
		</tr>
		<tr>
			<td><b>Prénom:</b></td>
			<td><input type="text" name="prenom" value=""></td>
		</tr>
		</table>
		<input type="submit">
	</form>
	<a href="infos_service.jsp">Annuler / retour</a>
</body>
</html>