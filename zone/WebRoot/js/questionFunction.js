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
	  	   showQuestion(loadtype,"",currenpage);
	  	   
	  	   checkloadmorequestion(loadtype);
	     });
	
	}
	
	
	function checkloadmorequestion(type){
		$.ajax({
			url:"getQuestionTotalPage.do",
			type:"POST",
			data:{
				type:type,
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
   
   function showQuestion(type,keyword,page){
	   $.ajax({
		  url:"showQuestion.do",
		  type:"POST",
		  data:{
			  keyword:keyword,
			  page:page,
			  type:type,
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
							"<div class='queston_share_bar'><em>浏览数 "+value.browsenum+"</em><span>|</span><em>收藏数"+value.collectnum+"</em></div>"+
							"<hr noshade='noshade' size='1' />";
				 });
				 $("#loadmorequestion").before(html);
				 
				 
	        }
	   });
   }  
   
   
 
   
   function replacePos(str,pos,replaceText){
		return str.substr(0,pos-1)+replaceText+str.substring(pos,str.length);
	} 
   
   
   
   
   
   
   
   
  
   
   
   
   




