/**
 * 
 */
 
	let select = $("select[name=kind]").val();
	const menuListResult = document.querySelector("#menuListResult");
	const menu_search_btn = document.querySelector("#menu_search_btn");
	const menu_search = document.querySelector("#menu_search");
	const urlParams = new URL(location.href).searchParams;
	const category = urlParams.get('category');
	let txt = '<div class="row text-center mt-4 fw-light text-muted"> <h1>메뉴가 없습니다.</h1> </div>';

	let pageMore = 0;
	getList();
	pageMore++;
	
	function removeResult(){
	    menuListResult.innerHTML="";
	}
	
	function getList(){
		console.log("start");
		$.ajax({
			type:"GET",
			url:"./list1",
	  		data:{
	  			search : menu_search.value,
	  			kind : select,
	            pn : pageMore,
				category : category
	 		},
			success:function(data){
				$("#menuListResult").append(data.trim()) ;
				console.log(data.trim());
				if(data.trim() == 0) {
					
					$("#menuListResult").append(txt);
				}
			}
		});
	    
	}
	
	menu_search_btn.addEventListener("click", function(event){
	    removeResult(); 
	    pageMore=1; 
	    getList();
	});
	
	function more(){
	    pageMore++;
	    console.log("pageMore==>"+pageMore);
	    menuListResult.removeChild(document.querySelector("#moreBtn"));
	    getList();    
	}