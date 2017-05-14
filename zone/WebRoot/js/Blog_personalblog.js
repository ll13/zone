$(function(){
	
	alert("123");
	var type=1;
	var page=2;
	showblog(type,"",page);
});//function 结束



function showblog(type,keyword,page){
	//alert(123);
	$(".main_right").append("Hello,"+$.cookie("user"));
	 $.ajax({
		  url:"showBlog.do",
		  type:"POST",
		  data:{
			  keyword:keyword,
			  page:page,
			  type:type,
		        },
     success:function(response,status,xhr){
    	 var html="";
		 var arr=[];       //内容
		 //var summary=[];   //摘要
		 $.each(response,function(index,value){
			 arr[index]=value.content;
			 html+="<h1><a href='#'>"+value.title+"</a></h1>";
			 html+="<h2>"+value.author+"&nbsp&nbsp&nbsp"+value.pubtime+"</h2>"
			 html+="<p>"+value.content+"</p>"
			
			 //html+=value.content;
			
			});
		 	$(".main_right").append(html);
		 }
     });
}



