console.log("hi");
const admin_member_search_btn = document.querySelector("#admin_member_search_btn");
const admin_member_search = document.querySelector("#admin_member_search");

getList();

function getList(){
	console.log("start");
	$.ajax({
		type:"GET",
		url:"./member1",
 		data:{
            search : admin_member_search.value
		}, 
		success:function(data){
			$("#adminMemberListReusult").html(data.trim());
            category_count.innerText = document.querySelector("#admin_member_count").getAttribute("value");
		}
	});
    
}


$('#adminMemberListReusult').click(function(event){
	/* event.preventDefault(); */
	if(event.target.classList.contains('modalBtn')){
/* 		console.log(event.target.getAttribute("id").substr(8));
		console.log(event.target.getAttribute("data-name")); */
		
		
		$('#modal_memberID').text(event.target.getAttribute("id").substr(8));
		$('#modal_memberNAME').text(event.target.getAttribute("data-name"));
		let cate = event.target.getAttribute("data-type");
		console.log(cate);
	/* 	$('option:selected', 'select[id="inputGroupSelect01"]').removeAttr('selected'); 
		$("#inputGroupSelect01 option:checked").removeAttr('selected');
		$('select[id="inputGroupSelect01"]').find('option[value='+cate+']').attr("selected",true);*/
		
		$("#inputGroupSelect01").val(cate).prop("selected", true);
		
		$('#modal').modal("show");
	}

    if(event.target.classList.contains('page-link')){
        const xhttp = new XMLHttpRequest();

        xhttp.open("GET", "./member1?search="+event.target.getAttribute("data-search")+"&pn="+event.target.getAttribute("data-page"));
    
        xhttp.send();
    
        xhttp.onreadystatechange = function(){
            if(this.readyState==4 && this.status==200){
     //           console.log(this.responseText);
                $("#adminMemberListReusult").html(this.responseText.trim());
                category_count.innerText = document.querySelector("#admin_member_count").getAttribute("value");
            }
        }
    }

}); 

$('#modalHide').click(function(e){
	$('#modal').modal("hide");
}); 
$('#modalHideX').click(function(e){
	$('#modal').modal("hide");
}); 

$('#modalSave').click(function(e){
/* 	console.log($("#modal_memberID").text()); */
 		$.ajax({
			type:"POST",
			url:"./mgUpdate",
/* 		    processData: false,
		    contentType: false, */
			data:{
				id: $("#modal_memberID").text(),
				userType: $("#inputGroupSelect01").val()
			},
			success:function(data){
				if(data.trim()=='1'){
					alert("등급 수정 완료");
					getList();
				}else {
					alert("등급 수정 실패");
				}				
			},
			error:function(){
				alert("error 발생");
			}
		});

 	$('#modal').modal("hide"); 
});

//search submit 버튼 클릭시
admin_member_search_btn.addEventListener("click", function(event){
    getList();
});


