<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CSJobs - Job</title>
</head>
<body>
<table width="700" border="1" align="center"><tr><td>
<h2 align="center">CS Jobs</h2>
<p ><a href="../admin.html" >Back</a></p>
<h3 >Job Title: ${job.title}</h3>
<%-- <p><b>Posted on:</b> <fmt:formatDate value="${job.publishDate}" pattern="M/d/yyyy" /></p>
<p><b>Close on:</b>  <fmt:formatDate value="${job.closeDate}" pattern="M/d/yyyy" /></p>
<p><b>Job Description:</b></p>
<p>${job.description}</p>
<p><b>Review Committee Chair</b></p>
<p>${job.committeeChair.firstName } ${job.committeeChair.lastName }</p>
<p><b>Review Committee Members</b></p>
<c:forEach items="${job.committeeMembers}" var="j">
<p>${j.firstName } ${j.lastName } </p>
</c:forEach>
 --%>
<table class="table table-striped">
<tr><td>Posted on:</td>
<td><fmt:formatDate value="${job.publishDate}" pattern="M/d/yyyy" /></td></tr>

<tr><td>Close on:</td>
<td><fmt:formatDate value="${job.closeDate}" pattern="M/d/yyyy" /></td></tr>

<tr><td>Job Description:</td>
<td>${job.description}</td></tr>

<tr><td>Review Committee Chair</td>
<td>${job.committeeChair.firstName } ${job.committeeChair.lastName }</td></tr>

<tr><td>Review Committee Members</td>
<td>
<c:forEach items="${job.committeeMembers}" var="j">
<p>${j.firstName } ${j.lastName } </p>
</c:forEach>
</td></tr>
</table>

<table>
<tr>
<td>
<ul>
<c:forEach items="${job.applications}" var="App">
<li><a href="<c:url value='/application/reviewForAdmin.html?id=${App.id}' />">${App.applicant.firstName} ${App.applicant.lastName}</a></li>
</c:forEach>
</ul>
</td>
</tr>
</table>
</td></tr></table>
</body>
</html>
