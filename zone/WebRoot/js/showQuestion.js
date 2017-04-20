$(function(){
	
   
   function showQuestion(type,keyword){
	   $.ajax({
		  url:"showQuestion.do",
		  type:"POST",
		  data:{
			  keyword:keyword,
			  page:1,
			  type:'all',
		        },
		  success:function(response,status,xhr){
				 var html="";
				 var arr=[];       //内容
				 var summary=[];   //摘要
				 $.each(response,function(index,value){
					// console.info(value.userName+'   '+value.title+'   '+value.content);
					html+=" <h4>"+value.username+"发表于"+value.date+"</h4><h3>"+value.title+"</h3>" +
							"<div class='questionlistcss'>"+value.content+"</div><span class='up'>收起</span><hr noshade='noshade' size='1'/>";
				 });
				 $(".left_main").append(html);
				 
	        }
	   });
   }   
   
   showQuestion();
});//function 结束