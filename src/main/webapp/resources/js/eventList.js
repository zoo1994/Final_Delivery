const event_search = document.querySelector("#event_search");
const event_search_btn = document.querySelector("#event_search_btn");
const eventListResult = document.querySelector("#eventListResult");

let pageMore = 0;
getList();
pageMore++;

function removeResult(){
    eventListResult.innerHTML="";
}

function getList(){
	console.log("start");
	$.ajax({
		type:"GET",
		url:"./list1",
  		data:{
            search : event_search.value,
            pn : pageMore            
 		},
		success:function(data){
			$("#eventListResult").append(data.trim()) ;
            console.log("pageMore==>"+pageMore);
            category_count.innerText = document.querySelector("#event_count").getAttribute("value");
		}
	});
    
}
event_search_btn.addEventListener("click", function(event){
    removeResult(); 
    pageMore=1; 
    getList();
});

function more(){
    pageMore++;
    console.log("pageMore==>"+pageMore);
    eventListResult.removeChild(document.querySelector("#moreBtn"));
    getList();    
}