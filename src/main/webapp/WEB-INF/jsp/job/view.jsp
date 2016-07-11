<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<title>CSJobs - Job</title>
</head>
<body>

<table width="700" border="1" align="center"><tr><td>
<h2 align="center">CS Jobs</h2>
<p align="right"><a href="list.html">Back</a></p>
<table class="table table-striped">
<tr>
	<th colspan="2"><h3 align="center">${job.title}</h3></th>
</tr>
<tr>
<td>Posted on</td>
<td><fmt:formatDate value="${job.publishDate}" pattern="M/d/yyyy" /></td>
</tr>
<tr>
<td>Close on</td>
<td><fmt:formatDate value="${job.closeDate}" pattern="M/d/yyyy" /></td>
</tr>
<tr>
<td>Job Description</td>
<td>${job.description}</td>
</tr>
</table>
</td></tr></table>
</body>
</html>
