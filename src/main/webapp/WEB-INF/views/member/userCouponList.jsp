<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
		<c:forEach items="${list}" var="vo" varStatus="i">
			<div style="display:inline-block; width: 30%; margin: 5px 1%; height: 180px; min-width:300px;  border: rgb(224,228,232) solid 2px; border-radius :5px;">
				<div class="" style="display:inline-block; width: 70%;">
					<input hidden id="couponId" value="213">
					<strong style="text-align: left; margin: 0 20px; ">${vo.couponVO.couponName}</strong>
					<div style="display: block; margin-top:30px; text-align:left; line-height: 33px;">
						<p style="margin: -10px 25px;">할인금액 : ${vo.couponVO.discount}원</p>							
						<p style="margin: -10px 25px;">~${vo.dueDate}</p>
					</div>
				</div>
				<div class="" style="display:inline-block; text-align:center; height:100%; border-left:1px dashed; width: 27%;">
					<div style=" margin: 50% 0; color: rgb(221,59,74); font-weight: bold; border-radius: 5px;">
						<p><span>${vo.activeDate}</span>일</p>
						<p>남음</p>
					</div>
				</div>
			</div>		
		</c:forEach>