<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<title>CS Jobs - Apply</title>
</head>
<body>


<table width="700" border="1" align="center">

<tr><td>
<h2 align="center">CS Jobs</h2>
<p align="right"><a href="../applicant.html">Back</a></p>
<h3 align="center">${application.job.title}</h3>
<p align="center">Applicant: <b>${application.applicant.firstName} ${application.applicant.lastName}</b></p>

<form action="apply.html?${_csrf.parameterName}=${_csrf.token}"

        enctype="multipart/form-data" method="post">
<p align="center">Current Job Position Information</p>
<table class="table table-striped">
<tr>
  <th>Title</th>
  <td><input type="text" name="currentJobTitle" /></td>
</tr>
<tr>
  <th>Institution or Company</th>
  <td><input type="text" name="currentJobInstitution" /></td>
</tr>
<tr>
  <th>Starting Year</th>
  <td><input type="text" name="currentJobYear" />
  <input type="hidden" name="jobId" value="${job.id}"/>
  <input type="hidden" name="applicantId" value="${applicant.id}"/>
  </td>
</tr>

<tr>
  <th>CV</th>
  <td><input type="file" name="cv" /></td>
</tr>
<tr>
  <th>Research Statement</th>
  <td><input type="file" name="researchStatement" /></td>
</tr>
<tr>
  <th>Teaching Statement</th>
  <td><input type="file" name="teachingStatement" /></td>
</tr>
<tr>
  <th><br /></th>
  <td><input type="submit" name="next" value="Next" class="btn btn-primary"/></td>
</tr>
</table>

</form>
</td></tr></table>
</body>
</html>
