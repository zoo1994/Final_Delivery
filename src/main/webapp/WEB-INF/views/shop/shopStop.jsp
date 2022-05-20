<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<c:import url="../temp/header_script.jsp"></c:import>
<title>매장관리</title>
<style type="text/css">
	.flex-nowrap a {
		color:white;
	}
	.title {
		color: gray!important;
		font-weight: bolder;
	}
	
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<c:import url="../temp/shopHeader.jsp"></c:import> 
			<div class="col-6 py-3">
				<div class="row mt-4">
					<h1>맥도날드 ${vo.shopName}점</h1>	
				</div>
				<div class="row mt-4">
					<h3>영업 일시중지</h3>
				</div>
				<div class="row mt-4">
					<h5>사유</h5>
				   <select class="form-select" aria-label="Default select example" name="reason" id="reason">
						 <option value="0">조기종료</option>
						 <option value="1">오픈지연</option>
						 <option value="2">매장사정</option>
					</select>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
					  <span class="input-group-text" id="inputGroup-sizing-default33">시작</span>
					</div>
				    <select class="form-select" aria-label="Default select example" name="startHour" id="startHour">
					</select>
					<select class="form-select" aria-label="Default select example" name="startMinute" id="startMinute">
				   </select>
				</div>
		</div>
	</div>
	<script type="text/javascript" src="../js/shopStop.js"></script>
</html>