<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Edit</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<h1> Edit Expense  </h1>
		<form:form action="/expenses/edit/${travel.id }" method="POST" modelAttribute="travel" class="form">
		<input type="hidden" name="_method" value="put" />
			<div>
				<form:label path="expense" class="form-label"> Expense Name : </form:label>
				<form:input type="text" path="expense" />
				<form:errors path="expense" />
			</div>
			<div>
				<form:label path="vendor" class="form-label"> Vendor : </form:label>
				<form:input type="text" path="vendor" />
				<form:errors path="vendor" />
			</div>
			<div>
				<form:label path="amount" class="form-label"> Amount: </form:label>
				<form:input type="number" step="0.01" path="amount" />
				<form:errors path="amount" />
			</div>
			<div>
				<form:label path="description" class="form-label"> Description : </form:label>
				<form:textarea path="description"></form:textarea>
				<form:errors path="description" />
			</div>
			<button class="btn btn-primary"> Submit </button>
		</form:form>
		<a href="/expenses">Go back</a>
	</div>
</body>
</html>