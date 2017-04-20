 
$(function(){
	
	
	$("#question_button").click(function(){
		if($.cookie("user")){
			$("#question").dialog("open");
			
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
	
	
	
	$("#question").dialog({
		autoOpen:false,
		modal:true,
		resizable:false,
		width:510,
		height:400,
		buttons:{
          "提交":function(){
				$(this).ajaxSubmit({
					url:"addQuestion.do",
					type:"POST",
					data:{
						user:$.cookie("user"),
						questionContent:$(".uEditorIframe").contents().find("#iframeBody").html(),
					},
					
					beforeSubmit:function(formData,jqForm,options){
							$("#question").dialog("widget").find("button").eq(1).button("disable");    //提交按钮置灰
							$("#loading").dialog("open");    //打开进度框
				    },
					
					
					success:function(responseText,statusText){
						if(responseText=="1")
						{
							$("#question").dialog("widget").find("button").eq(1).button("enable");
							$("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("发布成功.....");
							setTimeout(function(){
								  $("#loading").dialog("close");
								  $("#question").dialog("close");
								  $("#question").resetForm();
								  $(".uEditorCustom").uEditor();
								  $("#loading").css("background","url(img/loading.gif) no-repeat 20px center").html("数据交互中.....");
								 },1000);
						}
					}
					
				});
			}
		
		}
	});
	
	$(".uEditorCustom").uEditor();
	
	
	
	
	
});//function 结束