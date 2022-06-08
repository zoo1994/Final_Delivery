<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list}" var="vo">

	<div class="card detail mb-3 shadow mb-5 bg-white rounded" style="width: 31.5%; margin: 0 10px; height: 438px; padding: 0 0;">
	<a href="./detail?menuNum=${vo.menuNum}&category=${vo.category}"><img src="../resources/upload/menu/${vo.menuFileVO.fileName}" class="card-img-top" alt="..." style="width: 100%; height: 300px;"></a>
		<div class="card-body">			
			<ul class="list-group list-group-flush">
				<li class="list-group-item text-center fw-bolder"><a href="./detail?menuNum=${vo.menuNum}">${vo.menuName}</a></li>
				<li class="list-group-item text-muted text-center">${vo.menuEng}</li>
			</ul>
		</div>
	</div>

</c:forEach>

<c:if test="${pager.pn * pager.perPage < count}">
	<div class="moreBtn" id="moreBtn" style="text-align: center; margin-top: 50px;">
		<a href="javascript:more();" class="more" style=""><img style="width: 100px; height: 100px;" alt="" src="../../upload/board/event/더하기.png"></a>
		
	</div>
</c:if>

