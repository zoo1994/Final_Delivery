<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<div class="row">
		<c:choose>
			<c:when test="${category eq 1}">
				<img alt="" src="../resources/image/burger.PNG">
			</c:when>
			<c:when test="${category eq 2}">
				<img alt="" src="../resources/image/macLunch.PNG">
			</c:when>
			<c:when test="${category eq 3}">
				<img alt="" src="../resources/image/macMorning.PNG">
			</c:when>
			<c:when test="${category eq 4}">
				<img alt="" src="../resources/image/happySnack.PNG">
			</c:when>
			<c:when test="${category eq 5}">
				<img alt="" src="../resources/image/side.PNG">
			</c:when>
			<c:when test="${category eq 6}">
				<img alt="" src="../resources/image/macCafe.PNG">
			</c:when>
			<c:when test="${category eq 7}">
				<img alt="" src="../resources/image/happyMeal.PNG">
			</c:when>
			<c:otherwise>
				<img alt="" src="../resources/image/burger.PNG">
			</c:otherwise>
		</c:choose>
	</div>