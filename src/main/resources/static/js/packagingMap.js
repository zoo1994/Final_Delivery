const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
const geocoder = new kakao.maps.services.Geocoder();
let shopList = document.getElementsByClassName("shopList");
let selectShop = document.getElementsByClassName("selectShop");
let x = 126.979502322878;
let y = 37.5668136314671;
//검색한 경우 지도의 중심좌표 첫번쨰 매장으로 바꿔주기
if(shopList[0].getAttribute("data-search")!=""){
	x = shopList[0].getAttribute("data-x");
	y = shopList[0].getAttribute("data-y");
}

let options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(y, x), //지도의 중심좌표.
		level: 4 //지도의 레벨(확대, 축소 정도)
	}
let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

const imageSrc = "../resources/image/logoMap.png";
    
for (const i of shopList) {
    
    // 마커 이미지의 이미지 크기 입니다
    const imageSize = new kakao.maps.Size(32, 32); 
    
    // 마커 이미지를 생성합니다    
    const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    const marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(i.getAttribute("data-y"), i.getAttribute("data-x")), // 마커를 표시할 위치
        title : i.innerText, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    }); 

}

for(const i of selectShop){
	i.addEventListener("click",function(){
		console.log(i.getAttribute("data-shopName"))
	});
}


