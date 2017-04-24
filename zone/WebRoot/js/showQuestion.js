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
					 arr[index]=value.content;
					 summary[index]=arr[index].substr(0,200);
					 
					 
					 if(summary[index].substring(199,200)=='<')
					 {
						 summary[index]=replacePos(summary[index],200,''); 
					 }
					 
					 if(summary[index].substring(198,200)=='</')
					 {
						 summary[index]=replacePos(summary[index],200,'');
						 summary[index]=replacePos(summary[index],199,''); 
					 }
					 if(arr[index].length>200)
					 {
							summary[index]=summary[index]+'...'; 
					 }
					
					   
					html+="<div class='question_username'> <a href='#'>"+value.username+"</a>发表于"+value.date +"</div>"+
					        "<div class='question_point'>积分<span class='badge '>42</span></div>"+
					        "<div class='answer_number'>回答15</div>"+
							"<div class='question_summary'><h3><a href=showDetailQuestion.do?questionid="+value.questionid +">"+value.title+"</a></h3>" +
							"<div class='questionlistcss'>"+summary[index]+"</div></div>" +
							"<div class='queston_share_bar'><em>浏览数 10</em><span>|</span><em>收藏数10</em></div>"+
							"<hr noshade='noshade' size='1' />";
				 });
				 $(".left_main").append(html);
				 
	        }
	   });
   }   
   
   showQuestion();
   
  
   
   
   
   
});//function 结束


function replacePos(str,pos,replaceText){
	return str.substr(0,pos-1)+replaceText+str.substring(pos,str.length);
}
