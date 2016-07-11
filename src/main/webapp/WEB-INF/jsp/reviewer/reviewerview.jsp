<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
</head>
<body>
<table width="700" border="1" align="center"><tr><td>
<h2 align="center">CS Jobs</h2>

<c:if test="${not empty authenticatedUser}">
<p>You are logged in as <em>${authenticatedUser.firstName}, ${authenticatedUser.lastName}</em>.
<form action="<c:url value='/logout'/>" method="post">
  <input name="_csrf" type="hidden" 
		value="${_csrf.token}" />
  <input name="submit" type="submit" value="Logout" class="btn btn-primary btn-xs" />
</form></p>
</c:if>

<h3>Applicant apply for this job</h3>

<ul>
<c:forEach items="${finalapplication}" var="app">
 <li><a href="<c:url value='/application/reviewForReviewer.html?id=${app.id}' />">${app.applicant.firstName} ${app.applicant.lastName}</a></li>
 </c:forEach>
</ul>
</td></tr></table>
</body>
</html>