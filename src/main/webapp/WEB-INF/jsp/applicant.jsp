<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<title>CS Jobs - Applicant</title>
</head>
<body>
<table align="center" border="1" width="700" height="300"><tr><td>
<h2 align="center">CS Jobs</h2>

<p>You are logged in as <em>${authenticatedUser.firstName} ${authenticatedUser.lastName}</em>.
<form action="<c:url value='/logout'/>" method="post">
  <input name="_csrf" type="hidden" 
		value="${_csrf.token}" />
  <input name="submit" type="submit" value="Logout" class="btn btn-primary btn-xs"/>
</form></p>

<h3>Job Positions Applied</h3>
<c:if test="${user.applications.size() > 0}">
<ul>
  <c:forEach items="${user.applications}" var="application">
  <li><a href="<c:url value='/application/reviewForApplicant.html?id=${application.job.id}' />">${application.job.title}</a>
    [<a href="<c:url value='/application/review.html?id=${application.id}' />">Application</a>]
  </li>
  </c:forEach>
</ul>
</c:if>

<h3>Job Positions Available</h3>
<c:if test="${availableJobs.size() > 0}">
<ul>
  <c:forEach items="${availableJobs}" var="job">
  <li><a href="<c:url value='/application/reviewForApplicant.html?id=${job.id}' />">${job.title}</a>
    [<a href="<c:url value='/application/reapply.html?jobId=${job.id}' />">Apply</a>]
  </li>
  </c:forEach>
</ul>
</c:if>
</td></tr></table>
</body>
</html>
