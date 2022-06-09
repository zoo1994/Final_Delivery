<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<c:import url="../temp/header_script.jsp"></c:import>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
<title>매장 목록</title>
<style type="text/css">
.ico {
	display: inline-block;
	width: 30px;
	height: 30px;
	margin: -2px 10px 0 0;
	color: #fff;
	font-size: 14px;
	font-weight: 500;
	line-height: 30px;
	text-align: center;
	vertical-align: middle;
	border-radius: 100%;
	background: #da0000;
}

.customoverlay {
	position: relative;
	bottom: 50px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #111;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: 500;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: 500;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

	.shopList {
		cursor:pointer;
	}
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div class="container">
		<div class="row mt-4">		
			<img alt="" src="../resources/image/shopBanner.PNG">
		 </div>
		<div class="row mt-3" style="width : 700px; margin:0 auto;">
			<div class="form row mt-4">
				<form class="d-flex" action="./shopList" method="get">
					<div class="col-sm-10">

						<input type="search" id="admin_shop_search"
							placeholder="매장명, 동명, 도로명을 검색해 주세요." title="검색어 입력"
							id="searchWord" name="search" class="form-control">

					</div>
					<div class="col-sm-2" style="margin-left:15px;">
						<button type="submit" class="searchBtn btn btn-warning">검색하기</button>
					</div>
				</form>
			</div>
		</div>

		<div class="row mt-4"  style="margin:0 auto;">
			<div id="map" style="width: 1200px; height: 600px; margin:0 auto;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a58574ac7b94ffdb63ca1f5c17c22c7&libraries=services"></script>
		</div>

		<div class="row mt-4" id="shopListResult">
			<%-- 			<input type="hidden" id="admin_shop_count" value="${count}"> --%>
			<table class="table" style="">
				<thead class="table-warning">
					<tr>
						<th class="col text-center align-items-center" style="">매장이름</th>
						<th class="col text-center align-items-center" style="">매장위치(도로명주소)</th>
						<th class="col text-center align-items-center" style="">전화번호</th>
						<th class="col text-center align-items-center" style="">운영시간</th>
					</tr>
				</thead>
				<tbody class="table-light">
					<c:forEach items="${list}" var="vo">
						<tr style="height: 60px;" data-x="${vo.x_axis}" data-y="${vo.y_axis}" class="shopList">
							<td class="col text-center align-items-center fw-bolder" style="">${vo.shopName}</td>
							<td class="col text-center align-items-center" style="">${vo.location}</td>
							<td class="col text-center align-items-center" style="">${vo.shopPhone}</td>
							<td class="col text-center align-items-center" style="">${vo.openTime}시 ~ ${vo.closeTime}시</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

			<div class="d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link"
								href="./shopList?pn=${pager.pre?pager.startNum-1:1}&kind=${kind}&search=${search}">&lt;</a></li>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
								var="i">
								<li class="page-item"><a class="page-link"
									href="./shopList?pn=${i}&kind=${kind}&search=${search}">${i}</a></li>
							</c:forEach>

							<li class="page-item"><a class="page-link"
								href="./shopList?pn=${pager.next? pager.lastNum+1:pager.lastNum}&kind=${kind}&search=${search}">&gt;</a></li>
						</ul>
					</nav>
				</div>


	</div>
	<script type="text/javascript">
		let mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.5707451369668, 126.983611410428), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//마커가 표시될 위치
		let markerPosition = new kakao.maps.LatLng(35.8755582, 128.6053956);

		// 마커를 생성
		let marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정
		//marker.setMap(map);

		let imageSrc = 'https://ifh.cc/g/zsbs7D.png'; // 마커이미지 주소
		imageSize = new kakao.maps.Size(34, 36); // 마커이미지의 크기
		imageOption = {
			offset : new kakao.maps.Point(17, 36)
		}; // 마커의 좌표와 일치시킬 이미지 안에서의 좌표설정

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성
		let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imageOption);

		//model에서 넘긴 값 뽑아오기
		let arr = [];
		<c:forEach items="${list}" var="vo">
		arr.push({
			shopName : "${vo.shopName}",
			location : "${vo.location}",
			x_axis : "${vo.x_axis}",
			y_axis : "${vo.y_axis}"
		});
		</c:forEach>
		
		//마커 설정을 위해 배열 가져온 list 값 저장
		let positions = new Array();
		for (let i = 0; i < arr.length; i++) {
			positions[i] = [ arr[i].shopName, arr[i].y_axis, arr[i].x_axis,
					arr[i].location ];
		}

		console.log(positions);

		let markerTmp; // 마커
		let customOverlay; // 오버레이
		let contentStr;

		//search 파라미터 값 가져오기
		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			let regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
					.exec(location.search);
			return results == null ? null : decodeURIComponent(results[1]
					.replace(/\+/g, " "));
		}
		let search = getParameterByName('search');

		for (let i = 0; i < arr.length; i++) {
			markerTmp = new daum.maps.Marker({
				position : new daum.maps.LatLng(positions[i][1],
						positions[i][2]),
				title : positions[i][0],
				image : markerImage,
				map : map
			});

			//마커 클릭시 해당 매장 네이버 검색으로 이동
			contentStr = "<div class='customoverlay'><a href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=맥도날드 "
					+ positions[i][0]
					+ "' target='_blank'><span class='title'>"
					+ positions[i][0] + "</span></a></div>";

			customOverlay = new kakao.maps.CustomOverlay({
				map : map,
				position : new daum.maps.LatLng(positions[i][1],
						positions[i][2]),
				content : contentStr,
				yAnchor : 1
			});

			// 검색어가 없을 경우 본사 위치로 중심좌표 셋팅, 있을 경우 해당 목록 리스트의 첫번째 점포의 위치로 지도 이동
			if (search != null) {
				let moveLatLon = new kakao.maps.LatLng(positions[0][1],
						positions[0][2]);
				map.setCenter(moveLatLon);
			} else {
				let moveLatLon = new kakao.maps.LatLng(37.5707451369668,
						126.983611410428);
				map.setCenter(moveLatLon);
			}
		}

		// 지도 타입 변경 컨트롤을 생성한다
		let mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도에 확대 축소 컨트롤을 생성한다
		let zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		//목록에서 매장 클릭시 해당 매장 좌표로 이동
		$(".shopList").click(function() {
			let x_axis = $(this).attr("data-x");
			let y_axis = $(this).attr("data-y");
			let moveLatLon = new kakao.maps.LatLng(y_axis,
					x_axis);
			 map.panTo(moveLatLon);   
						
		})
		
	</script>
</body>
</html>