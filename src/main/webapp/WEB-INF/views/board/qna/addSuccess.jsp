<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<h1>Question Add Success</h1>
	<div class="container my-5 d-flex justify-content-center">
		<div class="row">
			<div class="border" style="width: 400px; height: 300px;"></div>
		</div>

	</div>
	<div class="container my-5 d-flex justify-content-center">
		<div class="row d-flex align-item-center">
		<div>
				<h1>문의가 접수되었습니다.</h1>
				<a href="./list" class="btn btn-primary m-3">문의내역</a> 
				<a href="../" class="btn btn-primary m-3">홈으로</a>
		</div>
		</div>
	</div>
		<c:import url="../../temp/header_script.jsp"></c:import>
</body>
</html>
