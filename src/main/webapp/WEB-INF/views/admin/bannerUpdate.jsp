<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${not empty list}">
	<div class="imgContainer row">
		<c:forEach items="${list}" var="vo" varStatus="i">

				<%-- <h6>${i.index+1}번째 이미지</h6>
				<div>
					<img alt="" src="../upload/banner/${vo.fileName}" style="width:200px; height:200px;">
				</div> --%>
				<div class="card col-2" style="width: 18rem;">
				  <img src="../upload/banner/${vo.fileName}" class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">${i.index+1}번째 이미지</h5>
 					<a href="#" class="btn btn-primary">이미지 삭제</a>
				</div>
							
			</div>
		</c:forEach>
		</div>
	</c:when>
	<c:otherwise>
		현재 파일 없음
	</c:otherwise>	
</c:choose>