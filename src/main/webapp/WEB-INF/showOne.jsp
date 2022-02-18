<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-5">
	<h1> Expense Details </h1>
	<ul>
		<li> Expense Name : ${travel.expense }</li>
		<li> Description  : ${travel.description }</li>
		<li> Vendor : ${travel.vendor }</li>
		<li> Amount Spent : ${travel.amount }</li>
	</ul>
	<a href="/expenses">Go back</a>
</div>
</body>
</html>