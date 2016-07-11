<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<title>CS Jobs - Admin</title>
</head>
<body>
	
	<table width="700" border="1" align="center">
		<tr>
			<td>
			<h2 align="center">CS Jobs</h2>
				<p>
					You are logged in as <em>${authenticatedUser.firstName}
						${authenticatedUser.lastName}</em>.
				<form action="<c:url value='/logout'/>" method="post" >
					<p align="right"><input name="_csrf" type="hidden" value="${_csrf.token}" /> 
					<input
						name="submit" type="submit" value="Logout"
						class="btn btn-primary btn-xs" /></p>
				</form>
				<h3>Admin Home</h3> <a href="job/createJob.html">Create New Job</a>
				<table class="table table-striped">
					<tr>
						<th>Job</th>
						<th>Publish Date</th>
						<th>Close Date</th>
						<th>Operations</th>
					</tr>
					<c:forEach items="${jobs}" var="j">
						<tr>
							<td><a href="job/reviewJobAdmin.html?id=${j.id }">${j.title}
							</a></td>
							<td><fmt:formatDate value="${j.publishDate}"
									pattern="M/d/yyyy" /></td>
							<td><fmt:formatDate value="${job.closeDate}"
									pattern="M/d/yyyy" /></td>
							<td><a href="job/reedit.html?id=${j.id }">Edit</a></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
