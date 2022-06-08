<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<div class="row">
		<c:choose>
			<c:when test="${category eq 1}">
				<img alt="" src="https://ifh.cc/g/3omdbf.jpg">
			</c:when>
			<c:when test="${vo.category eq 1}">
				<img alt="" src="https://ifh.cc/g/3omdbf.jpg">
			</c:when>
			
			<c:when test="${category eq 2}">
				<img alt="" src="https://ifh.cc/g/MPYRsS.jpg">
			</c:when>
			<c:when test="${vo.category eq 2}">
				<img alt="" src="https://ifh.cc/g/MPYRsS.jpg">
			</c:when>
			
			<c:when test="${category eq 3}">
				<img alt="" src="https://ifh.cc/g/NbO4oH.jpg">
			</c:when>
			<c:when test="${vo.category eq 3}">
				<img alt="" src="https://ifh.cc/g/NbO4oH.jpg">
			</c:when>
			
			<c:when test="${category eq 4}">
				<img alt="" src="https://ifh.cc/g/LOdpxG.jpg">
			</c:when>
			<c:when test="${vo.category eq 4}">
				<img alt="" src="https://ifh.cc/g/LOdpxG.jpg">
			</c:when>
			
			<c:when test="${category eq 5}">
				<img alt="" src="https://ifh.cc/g/wZqWjV.jpg">
			</c:when>
			<c:when test="${vo.category eq 5}">
				<img alt="" src="https://ifh.cc/g/wZqWjV.jpg">
			</c:when>
			
			<c:when test="${category eq 6}">
				<img alt="" src="https://ifh.cc/g/FRkolM.jpg">
			</c:when>
			<c:when test="${vo.category eq 6}">
				<img alt="" src="https://ifh.cc/g/FRkolM.jpg">
			</c:when>
			
			<c:when test="${category eq 7}">
				<img alt="" src="https://ifh.cc/g/XBlb3V.jpg">
			</c:when>
			<c:when test="${vo.category eq 7}">
				<img alt="" src="https://ifh.cc/g/XBlb3V.jpg">
			</c:when>
			
			<c:otherwise>
				<img alt="" src="../resources/image/burger.PNG">
			</c:otherwise>
		</c:choose>
	</div>
