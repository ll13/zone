$(function(){
	
	 
	$("#answerQuestionbtn").click(function(){
		var questionid=$(".question_id").val();
		$(".username").val($.cookie('user'));
		
		if($.cookie("user")){
			
			$("#answer").ajaxSubmit({
				
				url:"addAnswer.do",
				type:"post",
				data:{
					content:$(".answerEdit .uEditorIframe").contents().find("#iframeBody").html(),
				},
				beforeSubmit:function(formData,jqForm,options){
					 
					 
					 $('#answerQuestionbtn').attr('disabled',"true");
					 $("#loading").dialog("open"); 
					 
				  },
				success:function(responseText,statusText){
					 $("#answerQuestionbtn").removeAttr("disabled");
					
					 $("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("数据新增成功...");
					 
					 setTimeout(function(){
						var date=new Date();
						var content=$(".answerEdit .uEditorIframe").contents().find("#iframeBody").html();
						$(".answerEdit .uEditorIframe").contents().find("#iframeBody").html("");
						$("#loading").dialog("close");
						$(".answerlist").prepend("<div class='answerlist_answer'>" +
								                     " <div class='answer_username'>" +
								                         " <a href='#'>"+$.cookie("user")+"</a>&nbsp;&nbsp;"+
								                         date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
								                      "</div>"+
								                       "<div class='answerContent'>" +   
								                       content+
								                       "</div><hr noshade='noshade' class='answerlistLine' size='1' />" +
						                            "</div>"); 								
					  },1000);
		 
				  }  
				  
				
			  });
			
		}else{
		  $("#error").dialog("open");
		  
		    setTimeout(function(){
		       $("#error").dialog("close");
		       $("#login").dialog("open");
		    },1000);
		 }
			
		
	});//click函数结束
	
	$(".left_main .collectQuestion").click(function(){
		var flag=this.getAttribute("select");
		if(flag=="unselect"){
			this.setAttribute("select","selected");
			var num=Number($(".left_main .collectQuestion em").html())+1;
			var value="已收藏<em>"+num+"</em>";
			var questionid=$(".question_id").val();
			$(this).html(value);
			$.ajax({
				url:"addCollectnum.do",
				type:"POST",
				data:{
					questionid:questionid,
				},
			});	
		}else{
			this.setAttribute("select","unselect");
			var num=Number($(".left_main .collectQuestion em").html())-1;
			var value="收藏<em>"+num+"</em>";
			var questionid=$(".question_id").val();
			$(this).html(value);
			$.ajax({
				url:"delectCollectnum.do",
				type:"POST",
				data:{
					questionid:questionid,
				},
			});	
			
		}
	});
	
	
	
	$(".left_main .editMyQuestion").click(function(){
		if($.cookie("user")){
			$("#update_question").dialog("open");
			insertQuestionContent();
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
	
	function insertQuestionContent(){
		var content=$("#update_question .uEditor input").val();
			$("#update_question .uEditorIframe").contents().find("#iframeBody").html(content);
	}
	
	$("#update_question").dialog({
		autoOpen:false,
		modal:true,
		resizable:false,
		width:510,
		height:400,
		buttons:{
          "提交":function(){
        	 
        	  var content=$("#update_question .uEditorIframe").contents().find("#iframeBody").html();
        	  var username=$.cookie("user");
        	  var point=$("#updateQuestionPoint").val();
        	  var questionid=$(".question_id").val();
        	  $(this).ajaxSubmit({
        		  url:"updateQuestion.do",
			      type:"POST",
				  data:{
					    questionid:questionid,
						user:username,
        	            content:content,
        	            point:point,
					},
					
					beforeSubmit:function(formData,jqForm,options){
						$("#update_question").dialog("widget").find("button").eq(1).button("disable");    //提交按钮置灰
						$("#loading").dialog("open");    //打开进度框
			       },
			       success:function(responseText,statusText){
						
						$("#update_question").dialog("widget").find("button").eq(1).button("enable");
						$("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("修改成功.....");
						
						setTimeout(function(){
							  $("#loading").dialog("close");
							  $("#update_question").dialog("close");
							  $(".uEditor").contents().find(".uEditorButtonHTML").click();
							  $(".uEditorIframe").contents().find("#iframeBody").html("");
							  $("#loading").css("background","url(img/loading.gif) no-repeat 20px center").html("数据交互中.....");
							  location.href = "showDetailQuestion.do?questionid="+questionid;
						},1000)
				  },
			    
			    
        	  });
        	 
        	  
          }
		         },
	 });         
	
	
    $(".left_main .delectMyQuestion").click(function(){
    	 if(confirm("是否删除问题")){
    	    var answernum=$(".answer_number_detail em ").html();
    	    var questionid=$(".question_id").val();
    	    if(answernum==0){
    	    	$.ajax({
    	    		url:"delectQuestion.do",
    	    		type:"POST",
    	    		data:{
    	    			questionid:questionid,
    	    		},
    	    		success:function(responseText,statusText){
    	    			$("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("删除问题成功");
    	    			setTimeout(function(){
    	    				 $("#loading").dialog("close");
    	    				 $("#loading").css("background","url(img/loading.gif) no-repeat 20px center").html("数据交互中.....");
    	    				 location.href = "ask.jsp"
    	    			},1000)
    	    		}
    	    		
    	    	});
    	    }else{
    	    	alert("问题已回答，无法删除");
    	    }
    	  }
	});
	
    function showMyQuestion_div(){
    	var cookiename=$.cookie("user");
    	var username=$(".question_username a").html().replace(/(^\s*)|(\s*$)/g,'');
    	
    	if(cookiename==username){
    		
    		 $(".myQuestion_div").show();
    		 
    	}
    }
    
    
    
    $(".myQuestion_div").hide();
    
    
    
    
    
    showMyQuestion_div();
	showHotQuestion();
	$(".uEditorCustom").uEditor();
	$(".updateQuestionEdit").uEditor();
});//function 结束