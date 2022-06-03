<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
	.detail {
		cursor:pointer;
	}
	
	.card {
		background-color:#F5F5F5;
	}
	.card:hover {
		background-color:#fff;
		border-color: orange !important;
	}
	
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../common/categoryBenner.jsp"></c:import>
	<div class="container mt-4">
		<div class="contArea">
			<div class="inner">
				<div class="container">
					
				
					<div class="" style="width: 1168px; margin: 0 auto;">
						<div class="mb-4 d-flex">
								<select name="kind" class="col-1 me-1">
									<option value="col1">메뉴이름</option>
									<option value="col2">메뉴설명</option>
								</select> 
								<input type="search" class="col-3 me-2" name="search" placeholder="검색어를 입력하세요." id="menu_search" onKeypress="javascript:if(event.keyCode==13) {removeResult(); pageMore=1; getList();}">
								<button type="submit" class="btn btn-outline-success" id="menu_search_btn" class="col-1">검색</button>
						</div>
						<div class="row mt-4" id="menuListResult" style="">
	
						</div>
					</div>	
 							<nav aria-label="Page navigation example mt-5 bs-warning" style="width: 1168px; margin: 0 auto;">
							<span class="col-2" style="display: inline-block;"></span>
							<span class="col-8" style="display: inline-block;">
<%-- 							  <ul class="pagination justify-content-center" style="display: flex; width: 90%; margin: 0 auto;">
							  	<li class="page-item"><a class="page-link" href="./list?pn=${pager.startNum-1}"><<</a></li>
							  	<c:if test="${pager.pre}">
							    	<li class="page-item"><a class="page-link" href="./list?pn=${pager.startNum-1}">prev</a></li>
							    </c:if>
							   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							   		<li class="page-item"><a class="page-link" href="./list?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
							   	</c:forEach>
							    <c:if test="${pager.next}">
							   		<li class="page-item"><a class="page-link" href="./list?pn=${pager.lastNum+1}">next</a></li>
							    </c:if>
							    <li class="page-item"><a class="page-link" href="./list?pn=${pager.lastNum+1}">>></a></li>
							  </ul>  --%>
							  </span> 
							</nav>
					
					
				</div>
			</div>
		</div>
	
	
	


</div>
	<div style="margin-bottom: 200px;"></div>
<c:import url="../temp/footer.jsp"></c:import>


<script type="text/javascript">
/* 	$(".detail").click(function() {
		console.log("click");
		let num = $(this).attr("data-num");
		location.href="./detail?menuNum="+num;
	}); */
	let select = $("select[name=kind]").val();
	const menuListResult = document.querySelector("#menuListResult");
	const menu_search_btn = document.querySelector("#menu_search_btn");
	const menu_search = document.querySelector("#menu_search");
	const urlParams = new URL(location.href).searchParams;

	const category = urlParams.get('category');
	
	
	let pageMore = 0;
	getList();
	pageMore++;
	
	function removeResult(){
	    menuListResult.innerHTML="";
	}
	
	function getList(){
		console.log("start");
		$.ajax({
			type:"GET",
			url:"./list1",
	  		data:{
	  			search : menu_search.value,
	  			kind : select,
	            pn : pageMore,
				category : category
	 		},
			success:function(data){
				$("#menuListResult").append(data.trim()) ;
	            console.log("pageMore==>"+pageMore);
	           /*  category_count.innerText = document.querySelector("#event_count").getAttribute("value"); */
			}
		});
	    
	}
	
	menu_search_btn.addEventListener("click", function(event){
	    removeResult(); 
	    pageMore=1; 
	    getList();
	});
	
	function more(){
	    pageMore++;
	    console.log("pageMore==>"+pageMore);
	    menuListResult.removeChild(document.querySelector("#moreBtn"));
	    getList();    
	}
	
</script>
</body>
</html>