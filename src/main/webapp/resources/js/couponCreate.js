console.log("hi");

const createBtn = document.querySelector("#createBtn");
const sendBtn = document.querySelector("#sendBtn");
const couponId = document.querySelector("#couponId");
const number = document.querySelector("#number");

createBtn.addEventListener("click",function(event){
    console.log("hi");

    const xhttp = new XMLHttpRequest();

    xhttp.open("POST", "./cpCreate");


    //요청 header 정보
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    //요청 전송
    //post 요청시 파라미터
    //send("이름=값&이름2=값2...")
    xhttp.send("number="+number.value+"&couponId="+couponId.value);
    
    //응답 처리
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            console.log(this.responseText);
            let result = this.responseText.trim();
            console.log(result);
            if(result=='1'){
                alert('쿠폰 생성 성공');
            }else {
                alert('쿠폰 생성 실패');
            }
        }
    }




});