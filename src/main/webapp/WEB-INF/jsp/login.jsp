<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<title>CS Jobs - Login</title>
</head>
<body>

<table width="500" border="1" align="center">
<tr><td>
<h2 align="center">CS Jobs</h2>
<p align="right"><a href="job/list.html">Back</a></p>
<form name="login" action="<c:url value='/login'/>" method="post" >

<table class="table table-striped">
<tr><th colspan="2"><p align="center">Login Form</p></th></tr>
<tr>
  <th>Email:</th>
  <td><input type="text" name="username" /></td>
</tr>
<tr>
  <th>Password:</th>
  <td><input type="password" name="password" /></td>
</tr>
<tr>
  <th><br /></th>
  <td>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input type="submit" name="login" value="Login" class="btn btn-primary"/></td>
</tr>
</table>

</form>
</td></tr>
</table>
</body>
</html>
