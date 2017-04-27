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
	
	
	
	$(".uEditorCustom").uEditor();
});//function 结束