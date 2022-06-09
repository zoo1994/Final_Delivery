/**
 * 
 */
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
		url:"../event/list1",
  		data:{
            pn : pageMore            
 		},
		success:function(data){
			$("#eventListResult").append(data.trim()) ;
			$(".card").removeAttr("a");
            console.log("pageMore==>"+pageMore);
		}
	});
    
}

function more(){
    pageMore++;
    console.log("pageMore==>"+pageMore);
    eventListResult.removeChild(document.querySelector("#moreBtn"));
    getList();    
}

