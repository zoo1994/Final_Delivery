<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<c:import url="../temp/deli_header.jsp"></c:import>
	<div
		class="container mt-1 d-flex justify-content-center align-items-center"
		style="height: 500px;">

		<img class="rounded" src="https://t1.daumcdn.net/cfile/tistory/99BB9E3359BF9EF730" style="width: 600px; height: 400px;">
	</div>

	<div class="container mt-1 d-flex justify-content-center align-items-center">
		<div>
		<h1>주문이 완료되었습니다.</h1>
		</div>
	</div>
	<div class="container mt-3 d-flex justify-content-center align-items-center">
		<a href="../" class="btn btn-success">홈으로</a>
	</div>
	<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
</body>
</html>