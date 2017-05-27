$(function(){
	
	//增加帖子
	$(".uEditorCustom").uEditor();	
	$("#add_post_btn").click(function(){
		if($.cookie("user")){
			$("#addpostform").dialog("open");
			
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
	$("#addpostform").dialog({
		autoOpen:false,
		modal:true,
		resizable:false,
		width:510,
		height:400,
		buttons:{
          "提交":function(){
        	  buttons:{}
          }
		
		}
	});
	
	$("#select_k2").click(function(){
	  var options=$("#select_k1 option:selected"); //获取选中的项
	  if(options.val()=="生活类"){
		 var html="<option value='小类别'>小类别</option>" +
		 		  "<option value='旅游'>旅游</option>" +
		 		  "<option value='美食'>美食</option>" +
		 		  "<option value='新鲜事'>新鲜事</option>" +
		 		  "<option value='娱乐'>娱乐</option>" +
		 		  "<option value='情感'>情感</option>"; 
		 $("#select_k2 ").html("");		 
		 $("#select_k2 ").append(html);
	  }
	  if(options.val()=="技术类"){
			 var html="<option value='小类别'>小类别</option>" +
			 		  "<option value='移动开发'>移动开发</option>" +
			 		  "<option value='web开发'>web开发</option>" +
			 		  "<option value='云计算'>云计算</option>" +
			 		  "<option value='嵌入式开发'>嵌入式开发</option>" +
			 		  "<option value='linux社区'>linux社区</option>"; 
			 $("#select_k2 ").html("");		 
			 $("#select_k2 ").append(html);
		  }
	  
		
	});
	
	
	
	
});