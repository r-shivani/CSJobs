<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<title>Create New Job</title>
</head>
<body>
<table border="1" align="center" width="700"><tr><td>
<h2 align="center" >CS Jobs</h2>
<a href="../admin.html">Back</a>
	
	<form action="createJob.html?${_csrf.parameterName}=${_csrf.token}"

        enctype="multipart/form-data" method="post">
		<table class="table table-striped">
			<tr>
				<th>Title</th>
				<td><input type="text" name="title" /></td>
			</tr>

			<tr>
				<th>Description</th>
				<td><textarea name="description" cols="30" rows="5"></textarea></td>
			</tr>

			<tr>
				<th>Publish Date</th>
				<td><input type="text" name="publishDate" /></td>
			</tr>

			<tr>
				<th>Close Date</th>
				<td><input type="text" name="closeDate" /></td>
			</tr>

			<tr>
				<th>Committee Chair</th>
				<td><select name="chair">
						<c:forEach items="${reviewers}" var="r">
							<option value="${r.email}">${r.firstName }${r.lastName }
							</option>
						</c:forEach>
				</select></td>
			</tr>

			<tr>
				<th>committee Members</th>
				<td><c:forEach items="${reviewers}" var="r1"><input type="checkbox" name="members" value="${r1.email}">${r1.firstName} ${r1.lastName} <br/> 
					</c:forEach></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="create" class="btn btn-primary"/></td>
			</tr>
		</table>
	</form>
	</td></tr></table>
</body>
</html>