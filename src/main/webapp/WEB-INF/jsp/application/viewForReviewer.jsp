<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Jobs - Application</title>
</head>
<body>
	
	
	<table width="700" border="1" align="center"><tr><td>
	<h2 align="center">CS Jobs</h2>
	<p align="right"><a href="../reviewer/reviewerview.html">Back</a></p>
	<h3>${application.job.title}</h3>
	<table class="table table-striped">
		<tr>
			<td>Applicant:</td>
			<td> ${application.applicant.firstName}
		${application.applicant.lastName}</td>
		</tr>
		<tr><td>Submitted:</td><td><fmt:formatDate value="${application.submitDate}" pattern="M/d/yyyy" /></td></tr>
		
		<tr>
		<td>Current Position:</td>
		<td>${application.currentJobTitle} at<br/>
		${application.currentJobInstitution} since<br/>
		${application.currentJobYear}</td>
		</tr>
		
		<tr><td>CV :</td>
		<td>
		<c:if test="${application.cv!=null }">
			<a href="download.html?fileId=${application.cv.id }">Download CV</a>
		</c:if>
		<c:if test="${application.cv==null }">Not uploaded</c:if>
		</td></tr>
		
		<tr>
		<td>Research Statement :</td>
		<td>
		<c:if test="${application.researchStatement!=null }">
			<a href="download.html?fileId=${application.researchStatement.id }">Download
				Research Statement</a>
		</c:if>
		<c:if test="${application.researchStatement==null }">Not uploaded</c:if>
		</td>
		</tr>
		
		<tr>
		<td>Teaching Statement :</td>
		<td><c:if test="${application.teachingStatement!=null }">
			<a href="download.html?fileId=${application.teachingStatement.id }">Download
				Teaching Statement</a>
		</c:if>
		<c:if test="${application.teachingStatement==null }">Not uploaded</c:if></td>
		</tr>
	</table>
	</td></tr>
	
	<tr><td>
	<table class="table table-striped">
		<tr>
			<th>Degree</th>
			<th>School</th>
			<th>Year</th>
		</tr>
		<c:forEach items="${application.degrees}" var="degree">
			<tr>
				<td>${degree.name}</td>
				<td>${degree.school}</td>
				<td>${degree.year}</td>
			</tr>
		</c:forEach>
		
	</table>
	</td></tr>
		</table>
</body>
</html>
