<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> Add an expense :</h1>
	<form:form action="/expenses/new" method="POST" modelAttribute="travel">
		<div>
			<form:label path="expense"> Expense Name : </form:label>
			<form:input type="text" path="expense" />
			<form:errors path="expense" />
		</div>
		<div>
			<form:label path="vendor"> Vendor : </form:label>
			<form:input type="text" path="vendor" />
			<form:errors path="vendor" />
		</div>
		<div>
			<form:label path="amount"> Amount: </form:label>
			<form:input type="number" step="0.01" path="amount" />
			<form:errors path="amount" />
		</div>
		<div>
			<form:label path="description"> Description : </form:label>
			<form:textarea path="description"></form:textarea>
			<form:errors path="description" />
		</div>
		<button> Submit </button>
	</form:form>


</body>
</html>