<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<title>Insert title here</title>
<style type="text/css">
	.detail {
		cursor:pointer;
	}
</style>
</head>
<body>
	<div class="container mt-4">

	
	<div class="row mt-4 justify-content-left">
		<c:forEach items="${list}" var="vo">
	
			<div class="card col-3 detail mx-5 mb-3" data-num="${vo.menuNum}">
			  <img src="../resources/upload/menu/${vo.menuFileVO.fileName}" class="card-img-top" alt="...">
			  <div class="card-body">
			    <p class="card-text">${vo.menuName}</p>
			    <p class="card-text">${vo.menuEng}</p>
			  </div>
			</div>
		
		</c:forEach>
		
		
	</div>
	
	
		<div class="col-1">
			<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
		</div>

</div>

<!-- bootStrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(".detail").click(function() {
		console.log("click");
		let num = $(this).attr("data-num");
		location.href="./detail?menuNum="+num;
	});
</script>
</body>
</html>