<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<h1>Question Add</h1>
	<div class="container">
		<form:form modelAttribute="QnaVO" action="./add" method="Post"
			enctype="multipart/form-data">
			<label class="mt-5">TITLE</label>
			<div class="justify-content-center my-2">
				<form:input path="title" id="title" cssClass="form-control" />
				<form:errors path="title"></form:errors>
			</div>

			<label class="my-2">CONTENTS</label>
			<div class="justify-content-center">
				<form:textarea path="contents" id="contents" cssClass="form-control" />
				<form:errors path="contents"></form:errors>
			</div>
		</form:form>
	</div>
</body>
</html>
