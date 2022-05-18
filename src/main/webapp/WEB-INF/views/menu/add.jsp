<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	<div class="container">
	<h1 class="fw-bolder">새로운 메뉴 추가</h1>
		<div class="row mt-4">	
	
			<form:form method="POST" enctype="multipart/form-data" modelAttribute="menuVO">
				<div class="mb-3 row">
				 <label for="form-select" class="col-sm-2 col-form-label">카테고리</label>
					<div class="col-sm-10">
						<form:select path="category" cssClass="form-select">
							<form:option value="1">버거</form:option>
							<form:option value="2">맥런치</form:option>
							<form:option value="3">맥모닝</form:option>
							<form:option value="4">해피스낵</form:option>
							<form:option value="5">사이드&디저트</form:option>
							<form:option value="6">맥카페&음료</form:option>
							<form:option value="7">해피밀</form:option>
						</form:select>
					</div>					
				</div>
				
				 <div class="mb-3 row">
				    <label for="staticText" class="col-sm-2 col-form-label">메뉴이름</label>
				    <div class="col-sm-10">
				    	<form:input path="menuName" cssClass="form-control" id="menuName"/>
					    <div>
					    	<form:errors path="menuName"></form:errors>
					    </div>
				    </div>
				  </div>	
				  
				   <div class="mb-3 row">
				    <label for="staticText" class="col-sm-2 col-form-label">메뉴영문이름</label>
				    <div class="col-sm-10">
				    	<form:input path="menuEng" cssClass="form-control" id="menuEng"/>
					    <div>
					    	<form:errors path="menuEng"></form:errors>
					    </div>
				    </div>
				  </div>	
				  
				  <div class="mb-3 row">
				    <label for="staticText" class="col-sm-2 col-form-label">가격</label>
				    <div class="col-sm-10">
					    <form:input path="price" cssClass="form-control" id="price"/>
						    <div>
						    	<form:errors path="price"></form:errors>
						    </div>
				    </div>
				  </div>	
				  
				  <div class="mb-3 row">
				    <label for="staticText" class="col-sm-2 col-form-label">메뉴 설명</label>
				    <div class="col-sm-10">
				    	<form:textarea path="menuDetail" cssClass="form-control" id="menuDetail"/>
					       <div>
					      	<form:errors path="menuDetail"></form:errors>
					      </div>
				    </div>
				  </div>		
				  
			<div class="row mb-3">
			<div class="form-check">
			  <!-- <input class="form-check-input sale" type="radio" value="1" name="sale"> -->
			  <form:radiobutton path="menuSale" cssClass="form-check-input sale" value="1" id="flexRadioDefault1" checked="checked"/>
			  <label class="form-check-label" for="flexRadioDefault1">
			    판매
			  </label>
			</div>
			<div class="form-check">
			 <!--  <input class="form-check-input sale" type="radio" value="0" name="sale" checked> -->
			  <form:radiobutton path="menuSale" cssClass="form-check-input sale" value="0" id="flexRadioDefault2"/>
			  <label class="form-check-label" for="flexRadioDefault2">
			    판매중지
			  </label>
			</div>
			<div class="form-check">
			 <!--  <input class="form-check-input sale" type="radio" value="0" name="sale" checked> -->
			  <form:radiobutton path="menuSale" cssClass="form-check-input sale" value="2" id="flexRadioDefault2"/>
			  <label class="form-check-label" for="flexRadioDefault3">
			    단종
			  </label>
			</div>
			  <div>
		      	<form:errors path="menuSale"></form:errors>
		      </div>
		  </div>
				
				<div class="row mb-3 image-container">
					<label for="files" class="col-sm-2 col-form-label">File</label>
					<div class="col-sm-10">
						<input type="file" name="file" class="form-control" id="input-image">
						<img style="width: 500px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
					</div>
				</div>
				


					
				<table class="table">
				  <thead>
				    <tr>
				    	<th scope="col">중량(g)</th>
				    	<th scope="col">중량(ml)</th>
				    	<th scope="col">열량</th>
				    	<th scope="col">당</th>
				    	<th scope="col">단백질</th>
				    	<th scope="col">포화지방</th>
				    	<th scope="col">나트륨</th>
				    	<th scope="col">카페인</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td><form:input path="ingredientVO.weight_g"/></td>
				      <td><form:input path="ingredientVO.weight_ml"/></td>
				      <td><form:input path="ingredientVO.calory"/></td>
				      <td><form:input path="ingredientVO.sugar"/></td>
				      <td><form:input path="ingredientVO.protein"/></td>
				      <td><form:input path="ingredientVO.fat"/></td>
				      <td><form:input path="ingredientVO.sodium"/></td>
				      <td><form:input path="ingredientVO.caffeine"/></td>
				    </tr>
				  </tbody>
				</table>
				
		
				
			  
			    <button type="submit" class="btn btn-primary" id="add">메뉴 추가</button>
			
			  
			  </form:form>
		</div>
	</div>
	
	
	
	
<!-- bootStrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
	<script type="text/javascript">
	$('#menuDetail').summernote({
		height : 400
	});
	
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image");
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})
	</script>
</body>
</html>