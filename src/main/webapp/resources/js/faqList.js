const categoryResult = document.querySelector("#categoryResult");
const faqResult = document.querySelector("#faqResult");
const categorySelect = document.querySelector("#categorySelect");
const category_count = document.querySelector("#category_count");
const faq_search = document.querySelector("#faq_search");
const faq_search_btn = document.querySelector("#faq_search_btn");
const btn_warning = document.getElementsByClassName("btn-warning");


getList();
//faq 불러오기
function getList(){
    const xhttp = new XMLHttpRequest();

    xhttp.open("GET", "./list1?category="+categoryResult.getAttribute("value")+"&search="+faq_search.value);

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
 //           console.log(this.responseText);
            faqResult.innerHTML = this.responseText.trim();
            category_count.innerText = document.querySelector("#cate_count").getAttribute("value");
        }
    }

}


//카테고리 클릭시
categorySelect.addEventListener("click", function(event){
    if(event.target.classList.contains('btn-check')){
        categoryResult.setAttribute("value", event.target.getAttribute("id").substr(8,1));
        faq_search.value="";
        for(let i =0;i<btn_warning.length;i++){
            btn_warning[i].setAttribute("style","width: 100%; font-weight: bold; background-color: #ffc107;");            
        }
        btn_warning[event.target.getAttribute("id").substr(8,1)-1].setAttribute("style","width: 100%; font-weight: bold; background-color: rgb(240,145,0);");  
        getList();        
    }
});

//search submit 버튼 클릭시
faq_search_btn.addEventListener("click", function(event){
    getList(); 
});

faqResult.addEventListener("click", function(event){
    if(event.target.classList.contains('page-link')){
        const xhttp = new XMLHttpRequest();

        xhttp.open("GET", "./list1?category="+categoryResult.getAttribute("value")+"&search="+faq_search.value+"&pn="+event.target.getAttribute("data-page"));
    
        xhttp.send();
    
        xhttp.onreadystatechange = function(){
            if(this.readyState==4 && this.status==200){
     //           console.log(this.responseText);
                faqResult.innerHTML = this.responseText.trim();
                category_count.innerText = document.querySelector("#cate_count").getAttribute("value");
            }
        }
    }
});
