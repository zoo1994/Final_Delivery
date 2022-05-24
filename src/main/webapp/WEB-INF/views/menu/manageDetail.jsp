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
<title>Insert title here</title>
</head>
<body>

	<c:import url="./detail.jsp"></c:import>
	<div class="container">
	
		<div>
			<a href="./update?menuNum=${vo.menuNum}" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말 삭제하시겠습니까?');" href="./delete?menuNum=${vo.menuNum}" class="btn btn-danger">메뉴삭제</a>
		</div>

	</div>

</body>

</html>