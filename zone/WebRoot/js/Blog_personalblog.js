$(function(){
	
	alert("123");
	var type=1;
	var page=2;
	showblog(type,"",page);
});//function 结束



function showblog(type,keyword,page){
	//$(".main_right").append("Hello,"+$.cookie("user"));
	 $.ajax({
		  url:"showBlog.do?Author=,
		  type:"POST",
		  data:{
			  user:"lili",
			  page:page,
			  type:type,
		        },
     success:function(response,status,xhr){
    	 var html="";
		 var arr=[];       //内容
		 var summary=[];   //摘要
		 $.each(response,function(index,value){
			 if(value.content.length>200){
				 summary[index]=value.content.substring(0,200)+"...";
			 	}else{
				 summary[index]=value.content;
			 	}
			 
			 
			 
			 html+="<h1><a href=showDetailBlog.do?id="+value.id +">"+value.title+"</a></h1>";
			 html+="<h2>"+value.pubtime+"</h2>"
			 html+="<p>"+summary[index]+"</p>"
			
			});
		 	$(".main_right").append(html);
		 }
     });
}



