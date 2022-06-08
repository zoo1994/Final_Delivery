<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<c:import url="../temp/header_script.jsp"></c:import>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>정산내역조회</title>
<style type="text/css">
.flex-nowrap a {
	color: white;
}

.title {
	color: gray !important;
	font-weight: bolder;
}
</style>
<link
	href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png"
	rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<c:import url="../temp/shopHeader.jsp"></c:import>
			<div class="col-2"></div>
			<div class="col-6 py-3">
				<div class="row">
					<h1>맥도날드 ${shopMaster.shopName}점, ${member.id}님</h1>
				</div>
				<input type="date" name="startDate" id="startDate"> <input
					type="date" name="endDate" id="endDate">
				<button class="btn btn-success" id="find">조회</button>
				<div id="list" class="mt-5">
				<div class="border rounded justify-content-center align-items-center d-flex" style="height: 300px; width: 100%">
					<h3>정산내역조회</h3>
				</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		let total = 0;

		$("#find").click(function() {
			$.ajax({
				url : './settlementList',
				method : 'POST',

				data : {
					startDate : $("#startDate").val(),
					endDate : $("#endDate").val()
				},
				success : function(data) {
					if(data.trim()==''){
						alert("조회내역이 없습니다.");
						return;
					}
					
					
					$("#list").html(data.trim());
					
				},
				error : function() {
					alert("error");
				}

			})
		})
	</script>

</body>
</html>