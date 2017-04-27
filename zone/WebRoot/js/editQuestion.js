 
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
        	  var content=$(".uEditorIframe").contents().find("#iframeBody").html();
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
						
							$("#question").dialog("widget").find("button").eq(1).button("enable");
							$("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("发布成功.....");
							
							
							alert(content);
							var summary=content.substring(0,200);
							if(summary.substring(199,200)=='<')
							 {
								 summary=replacePos(summary,200,''); 
							 }
							 
							 if(summary.substring(198,200)=='</')
							 {
								 summary=replacePos(summary,200,'');
								 summary=replacePos(summary,199,''); 
							 }
							 if(content.length>200)
							 {
									summary=summary+'...'; 
							 }
							
							 var date=new Date();
							 var title=$("#question #title").val();
							var html="<div class='question_username'> <a href='#'>"+$.cookie("user")+"</a>发表于"+
							        date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+"</div>"+
						        "<div class='question_point'>积分<span class='badge '>"+$("#question_point").val()+"</span></div>"+
						        "<div class='answer_number'>回答  0</div>"+
								"<div class='question_summary'><h3><a href=showDetailQuestion.do?questionid="+responseText +">"+title+"</a></h3>" +
								"<div class='questionlistcss'>"+summary+"</div></div>" +
								"<div class='queston_share_bar'><em>浏览数  0</em><span>|</span><em>收藏数 0</em></div>"+
								"<hr noshade='noshade' size='1' />";
							 $("#loadmorequestion").before(html);
							
							setTimeout(function(){
								  $("#loading").dialog("close");
								  $("#question").dialog("close");
								  $(".uEditor").contents().find(".uEditorButtonHTML").click();
								  $(".uEditorIframe").contents().find("#iframeBody").html("");
								  $("#question").resetForm();
								  $("#loading").css("background","url(img/loading.gif) no-repeat 20px center").html("数据交互中.....");
								 },1000);
						
					}
					
				});
			}
		
		}
	});
	
	$(".uEditorCustom").uEditor();
	
	
	
	
	
});//function 结束

function replacePos(str,pos,replaceText){
	return str.substr(0,pos-1)+replaceText+str.substring(pos,str.length);
}