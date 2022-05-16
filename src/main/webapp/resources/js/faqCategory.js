const faqCategoryBtn = document.querySelector("#faqCategoryBtn");
const faqCategoryBtnResult = document.querySelector("#faqCategoryBtnResult");
const btn_check = document.getElementsByClassName("form-check-input");
const preCategory= document.querySelector("#preCategory");
const update_btn_warning = document.getElementsByClassName("btn-warning");
getBtnCheckResult();

function getBtnCheckResult(){

    if(preCategory ==null){

    }else if((Number)(preCategory.getAttribute("value")) != 0){
        btn_check[preCategory.getAttribute("value")-1].checked = true;

        //시작 컬러 지정
        update_btn_warning[preCategory.getAttribute("value")-1].setAttribute("style","width: 100%; font-weight: bold; background-color: rgb(240,145,0);");  


        preCategory.setAttribute("value",0);
       
    }

    for(let i=0;i<btn_check.length;i++){
        if(btn_check[i].checked){   
            let result ="";
            if(i==0){
                result = "주문접수";
            }else if(i==1){
                result = "주문확인";
            }else if(i==2){
                result = "주문취소/변경";
            }else if(i==3){
                result = "서비스 이용";
            }else if(i==4){
                result = "결제";
            }else if(i==5){
                result = "가맹 및 기타";
            }
            console.log(result);
            faqCategoryBtnResult.setAttribute("value", result);
            console.log("hi1");
        }
    }
}

faqCategoryBtn.addEventListener("click", function(event){
    console.log(event.target);
    if(event.target.classList.contains('form-check-input')||event.target.classList.contains('btn-warning')){
        getBtnCheckResult();


        //버튼 클릭시 색바꾸기
        for(let i =0;i<update_btn_warning.length;i++){
            update_btn_warning[i].setAttribute("style","width: 100%; font-weight: bold; background-color: #ffc107;");            
        }
        console.log(event.target.getAttribute("id"));
        update_btn_warning[event.target.getAttribute("id").substr(8,1)-1].setAttribute("style","width: 100%; font-weight: bold; background-color: rgb(240,145,0);");  
        //버튼 클릭시 색바꾸기
    }
});



/*        
        let result ="";
        if(event.target.getAttribute("for")=="category1"){
            result = "주문접수";
        }else if(event.target.getAttribute("for")=="category2"){
            result = "주문확인";
        }else if(event.target.getAttribute("for")=="category3"){
            result = "주문취소/변경";
        }else if(event.target.getAttribute("for")=="category4"){
            result = "서비스 이용";
        }else if(event.target.getAttribute("for")=="category5"){
            result = "결제";
        }else if(event.target.getAttribute("for")=="category6"){
            result = "가맹 및 기타";
        }
        faqCategoryBtnResult.setAttribute("value",result);
*/


