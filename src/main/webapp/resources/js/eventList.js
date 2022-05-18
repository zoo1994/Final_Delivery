getList();

function getList(){
	console.log("start");
	$.ajax({
		type:"GET",
		url:"./list1",
  		data:{
//            search : admin_shop_search.value
 		}, 
		success:function(data){
			$("#eventListResult").html(data.trim());
//            category_count.innerText = document.querySelector("#admin_shop_count").getAttribute("value");
		}
	});
    
}
function more(){
    console.log($("#eventPn").val());
// 	$.ajax({
// 		type:"GET",
// 		url:"./list1",
//   		data:{
//             search : admin_shop_search.value

//  		}, 
// 		success:function(data){
// 			$("#eventListResult").html(data.trim());
// //            category_count.innerText = document.querySelector("#admin_shop_count").getAttribute("value");
// 		}
// 	});
    
}