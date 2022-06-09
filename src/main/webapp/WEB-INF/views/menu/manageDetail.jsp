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

<style type="text/css">
#menuImg {
	width:750px;
	height:550px;
	margin:0 auto;
}
</style>
<title>관리자 메뉴 관리</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>

	<c:import url="./detail.jsp"></c:import>
	<div class="container" style="float: none; margin:100 auto;">
		<div class="updateBtn row">
			<a href="./update?menuNum=${vo.menuNum}" class="btn btn-primary mt-4 col-md-2" style="float: none; margin:0 auto;">메뉴 정보 수정</a>
		</div>
	</div>
	
<script type="text/javascript">
	$(".cateBanner").remove();
	$('.updateBtn').insertBefore('.menuDetail');
</script>

</body>

</html>