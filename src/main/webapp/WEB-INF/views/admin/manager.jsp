<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
 a {
	text-decoration: none;
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
<!-- 	<div style="margin-top: 200px;"></div> -->
	
	<!-- 사이드바 -->
	<c:import url="./admin_sidebar.jsp"></c:import>
	<!-- 사이드바 끝 -->
	
	
	<div class="d-flex" style="min-height: 1000px;">
		<div class="" style="position: relative; width: 200px; min-width:150px; background-color: gray;"></div>
		<div class="" style="position: relative;  width: 100%; border: 1px solid;">
			<div style="width: 100%; height:100%; background-color: #dee2e6;">manager</div>
		</div>
	</div>
	<!-- <div style="height: 1500px; width: 4000px;"></div> -->
<!-- <div style="margin-bottom: 200px;"></div> -->
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>