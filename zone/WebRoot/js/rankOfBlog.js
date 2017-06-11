$(function(){
	//alert("123");
	var type=1;
	var page=2;
	//RankOfClicknum(type,"",page);
	//$(".main_left").append("123");
});//function 结束



function RankOfClicknum(type,keyword,page){
	 $.ajax({
		  url:"RankOfClicknum.do"
		  type:"POST",
		  data:{
			  keyword:keyword,
			  page:page,
			  type:type,
		        },
  success:function(response,status,xhr){
 	 var html="zxk";
		 $.each(response,function(index,value){
			 html+="<h1><a href=showDetailBlog.do?id="+value.id +">"+value.title+"</a></h1>";
			});
		 $(".main_left").append(html);
		 }
  });
}
}