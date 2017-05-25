$(function(){
	//导航跳转
	$("#showQuestionWithPoint").click(function(){
		$("#main nav li").removeClass("active");
		$("#Question_Point").addClass("active");
		$(".left_main").html("");
		
		loadmorequestion();
		
		var type="point";
		var page="1";
		$(".left_main .loadtype").val(type);
		$(".left_main .currenpage").val(page);
		showQuestion(type,"",page);				
		checkloadmorequestion(type);
	});
	
	$("#showQuestionWithNoAnswer").click(function(){
		$("#main nav li").removeClass("active");
		$("#Question_NoAnswer").addClass("active");
		$(".left_main").html("");
		
		loadmorequestion();
		
		var type="noanswer";
		var page="1";
		$(".left_main .loadtype").val(type);
		$(".left_main .currenpage").val(page);
		showQuestion(type,"",page);				
		checkloadmorequestion(type);
	});
	
	$("#showQuestionWithAnswer").click(function(){
		$("#main nav li").removeClass("active");
		$("#Question_Answer").addClass("active");
		$(".left_main").html("");
		
		loadmorequestion();
		
		var type="answer";
		var page="1";
		$(".left_main .loadtype").val(type);
		$(".left_main .currenpage").val(page);
		showQuestion(type,"",page);				
		checkloadmorequestion(type);
	});
	
	$("#showMyQueston").click(function(){
		if($.cookie("user")){
			$("#main nav li").removeClass("active");
			$("#myQuestion").addClass("active");
			$(".left_main").html("");
			
			loadmorequestion();
			
			var type="myquestion";
			var page="1";
			var username=$.cookie("user");
			$(".left_main .loadtype").val(type);
			$(".left_main .currenpage").val(page);
			showQuestion(type,"",page,username);				
			checkloadmorequestion(type);
			
		}
		else
		{
			$("#error").dialog("open");
			setTimeout(function(){
				$("#error").dialog("close");
				$("#login").dialog("open");
			},1000);
		
			
		}
		
		
	});
	
	
	
});//function 结束
	
	//加载更多问题
	function loadmorequestion(){
	     $(".left_main").append("<input type='button' value='加载更多问题' id='loadmorequestion' " +
			"class='btn btn-primary '>" +
			"<input type='hidden' name='currenpage' class='currenpage' value='1'/>" +
			"<input type='hidden' name='loadtype' class='loadtype' value='all'/>" +
					"<input type='hidden' name='totalpage' class='totalpage' value=''/>");
	     
	     $("#loadmorequestion").click(function(){
	  	   
	  	   $("#loadmorequestion").html("<img src='img/more_load.gif'/>");
	  	   
	  	  var currenpage=parseInt($(".left_main .currenpage").val()) ;
	  	  currenpage=currenpage+1;
	  	  $(".left_main .currenpage").val(currenpage);
	  	  var loadtype=$(".left_main .loadtype").val();
	  	  var username=$.cookie('user');
	  	   showQuestion(loadtype,"",currenpage,username);
	  	   
	  	   checkloadmorequestion(loadtype);
	     });
	
	}
	
	
	function checkloadmorequestion(type){
		var username=$.cookie('user');
		$.ajax({
			url:"getQuestionTotalPage.do",
			type:"POST",
			data:{
				type:type,
				username:username,
			},
			success:function(responseText,statusText){
				$(".left_main .totalpage").val(responseText);
				
				var currenpage=$(".left_main .currenpage").val();
				var totalpage=$(".left_main .totalpage").val();
				if(currenpage>=totalpage){
					$(".left_main #loadmorequestion").hide();
					
				}else{
					//显示加载更多问题
				}
			}
		});
		
		
	}
   
	function showHotQuestion(){
		$.ajax({
			url:"showHotQuestion.do",
			type:"POST",
			success:function(response,status,xhr){
				var list=$("#hotquestion li");
				
				 $.each(response,function(index,value){	
				     $(list[index]).append("<a href=showDetailQuestion.do?questionid="+value.questionid +">"+value.title+"</a>");
			  
				});
			 }
		});
	}
	
	function showNewQuestion(){
		$.ajax({
			url:"showHotQuestion.do",
			type:"POST",
			success:function(response,status,xhr){
				var list=$("#newquestion li");
				
				 $.each(response,function(index,value){	
				     $(list[index]).append("<a href=showDetailQuestion.do?questionid="+value.questionid +">"+value.title+"</a>");
			  
				});
			 }
		});
	}
	
   function showQuestion(type,keyword,page,username){
	   $.ajax({
		  url:"showQuestion.do",
		  type:"POST",
		  data:{
			  keyword:keyword,
			  page:page,
			  type:type,
			  username:username,
		        },
		  success:function(response,status,xhr){
				 var html="";
				 var arr=[];       //内容
				 var summary=[];   //摘要
				 $.each(response,function(index,value){
					 arr[index]=value.content;
					
					 summary[index]=arr[index].substring(0,200);
					 
					 
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
					        "<div class='question_point'>积分<span class='badge '>"+value.point+"</span></div>"+
					        "<div class='answer_number'>回答 "+value.answernum+"</div>"+
							"<div class='question_summary'><h3><a href=showDetailQuestion.do?questionid="+value.questionid +">"+value.title+"</a></h3>" +
							"<div class='questionlistcss'>"+summary[index]+"</div></div>" +
							"<div class='queston_share_bar'><div>浏览  <em> "+value.browsenum+"</em></div>" +
							"<span>|</span><div>收藏  <em>"+value.collectnum+"</em></div></div>"+
							"<hr noshade='noshade' size='1' />";
				 });
				 $("#loadmorequestion").before(html);
				 
				 var list=$(".question_point .badge");
				 for(var i=0;i<list.length;i++){
					 
					 if($(list[i]).html()=="0"){
						 $(list[i]).parent(".question_point").hide();
					 }
				 }
	        }
	   });
   }  
   
  
 
   
   function replacePos(str,pos,replaceText){
		return str.substr(0,pos-1)+replaceText+str.substring(pos,str.length);
	} 
   
   
   
   
   
   
   
   
  
   
   
   
   




