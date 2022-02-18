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
    <title>Travels</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<h1>Save Travels</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<td>Expense</td>
					<td>Vendor</td>
					<td>Amount</td>
					<td colspan="2">Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="travel" items="${travels }">
					<tr>
						<td><a href="/expenses/${travel.id}">${travel.expense }</a></td>
						<td>${travel.vendor }</td>
						<td>${travel.amount }</td>
						<td> <a href="/expenses/edit/${travel.id }"> Edit </a></td>
						<td>
							<form action="/expenses/delete/${travel.id }" method="post">
								<input type="hidden" name="_method" value="delete" />
								<input type="submit" value="Delete">
							</form>
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h1> Add an expense :</h1>
		<form:form action="/expenses" method="POST" modelAttribute="travel" >
			<div class="row mb-3">
				<form:label path="expense" class="col-sm-2 col-form-label"> Expense Name : </form:label>
				<form:input type="text" path="expense" />
				<form:errors path="expense" />
			</div>
			<div class="row mb-3">
				<form:label path="vendor" class="col-sm-2 col-form-label"> Vendor : </form:label>
				<form:input type="text" path="vendor" />
				<form:errors path="vendor" />
			</div>
			<div class="row mb-3">
				<form:label path="amount" class="col-sm-2 col-form-label"> Amount: </form:label>
				<form:input type="number" step="0.01" path="amount" />
				<form:errors path="amount" />
			</div>
			<div class="row mb-3">
				<form:label path="description" class="col-sm-2 col-form-label"> Description : </form:label>
				<form:textarea path="description"></form:textarea>
				<form:errors path="description" />
			</div>
			<button class="btn btn-primary"> Submit </button>
		</form:form>
	</div>
</body>
</html>