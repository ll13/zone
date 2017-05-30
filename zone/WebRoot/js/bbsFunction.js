$(function(){
	
	//增加帖子
		
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
	        	  var content=$("#addpostform .uEditorIframe").contents().find("#iframeBody").html();
	        	  var pid=$("#select_k2 option:selected").attr("pid");
					$(this).ajaxSubmit({
						url:"addPost.do",
						type:"POST",
						pid:pid,
						data:{
							username:$.cookie("user"),
							postContent:$("#addpostform .uEditorIframe").contents().find("#iframeBody").html(),
							pid:pid,
						},
						
						beforeSubmit:function(formData,jqForm,options){
								$("#addpostform").dialog("widget").find("button").eq(1).button("disable");    //提交按钮置灰
								$("#loading").dialog("open");    //打开进度框
						
					    },
						
						
						success:function(responseText,statusText){
							
								$("#addpostform").dialog("widget").find("button").eq(1).button("enable");
								$("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("发布成功.....");
								
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
								var title=$("#addpostform #title").val();								
								html="<div><h3><a href=showDetailPost.do?postid="+responseText +">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+title+"</a></h3>" +
								"<div><div class='post_username'> 发帖人:<a href='#'>"+$.cookie("user")+"</a> &nbsp;&nbsp;"+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+"</div>"+				        
			                    "<div class='num'><div class='reply_number'>回复数 <em>0</em></div><div>|</div>"+
			                    "<div class='collect_number'>收藏数 <em>0</em></div></div></div>"+
			                    "<div class='post_content'>"+summary+"</div></div>"+							
			                    "<hr noshade='noshade' size='1' />";
								 $("#loadmorepost").before(html);
								 																
								setTimeout(function(){
									  $("#loading").dialog("close");
									  $("#addpostform").dialog("close");
									  $("#addpostform .uEditor").contents().find(".uEditorButtonHTML").click();
									  $("#addpostform .uEditorIframe").contents().find("#iframeBody").html("");
									  $("#addpostform").resetForm();
									  $("#loading").css("background","url(img/loading.gif) no-repeat 20px center").html("数据交互中.....");
									 },1000);
							
						}
						
					});
				}
			
			
		
		}
	});
	
	
	
	$("#MyPost_a").click(function(){
		showmypost();		
	});
	
	$("#MyPostCollect_a").click(function(){
		showpostcollect();		
	});
	
	$("#accordion").accordion({
		  heightStyle: "content",
	       icons:{"header": "ui-icon-plus", 
	    	   	  "activeHeader": "ui-icon-minus"
	    		 }
	  });
	
	
});//function结束



function func(){
	  var options=$("#select_k1 option:selected"); //获取选中的项
	  $("#select_k2 ").html("");
	  if(options.val()=="生活类"){
		 var html="<option value='小类别'>小类别</option>" +
		 		  "<option value='旅游' pid='3'>旅游</option>" +
		 		  "<option value='美食' pid='4'>美食</option>" +
		 		  "<option value='新鲜事'pid='5'>新鲜事</option>" +
		 		  "<option value='娱乐' pid='6'>娱乐</option>" +
		 		  "<option value='情感' pid='7'>情感</option>"; 	 
		 $("#select_k2 ").append(html);
	  }
	  if(options.val()=="技术类"){
			 var html="<option value='小类别' >小类别</option>" +
			 		  "<option value='移动开发' pid='8'>移动开发</option>" +
			 		  "<option value='web开发' pid='9'>web开发</option>" +
			 		  "<option value='云计算' pid='10'>云计算</option>" +
			 		  "<option value='嵌入式开发' pid='11'>嵌入式开发</option>" +
			 		  "<option value='linux社区'pid='12'>linux社区</option>"; 
			 		 
			 $("#select_k2 ").append(html);
		  }
	  if(options.val()=="大类别"){
		  var html="<option value='小类别' >小类别</option>" 
			  $("#select_k2 ").append(html);  
	  }
		
	}


//获得目录
function getCatalog(){
	
	$.ajax({
		url:"getcatalog.do",
		type:"POST",		
		success : function(data) {
          var Data=data;
          for(var key in Data) {      
        	   if(Data[key].pid==0){
        		  var html1="<li class='dropdown' catalogid="+Data[key].id+"><a  class='dropdown-toggle' data-toggle='dropdown'>"+Data[key].name+"<b class='caret'></b></a><ul class='dropdown-menu'></ul></li>";  
        		  $("#main .navbar-nav").children().first().after(html1);
        	   }       	                  
            }
          var list=$("#main li[catalogid]");  	  
          for(var key in Data) {        	        	    	 
       		  var html2="<li><a onclick='showpostpid("+Data[key].id+")'>"+Data[key].name+"</a></li>";   
       		  for(var i=0;i<list.length; i++ ){  
       			if(Data[key].pid!=0&&Data[key].pid==$(list[i]).attr("catalogid")){
       				$(list[i]).children().last().append(html2);
       		        
       		     }
       	      }          		  
           }
          
        

        },
	});
	
	
	
}

function loadmorepost(){
    $(".left_main").append("<input type='button' value='加载更多帖子' id='loadmorepost' " +
		"class='btn btn-primary '>" +
		"<input type='hidden' name='currenpage' class='currenpage' value='1'/>" +
		"<input type='hidden' name='loadtype' class='loadtype' value='all'/>" +
		"<input type='hidden' name='totalpage' class='totalpage' value=''/>"+
		"<input type='hidden' name='pid' class='pid' value=''/>");
    
    $("#loadmorepost").click(function(){
 	   
 	   $("#loadmorepost").html("<img src='img/more_load.gif'/>");
 	   
 	  var currenpage=parseInt($(".left_main .currenpage").val()) ;
 	  currenpage=currenpage+1;
 	  $(".left_main .currenpage").val(currenpage);
 	  var loadtype=$(".left_main .loadtype").val();
 	  var username=$.cookie('user');
 	  var pid=$(".left_main .pid").val();
 	   showPost(loadtype,pid,currenpage,username);
 	   
 	   checkloadmorepost(loadtype);
    });

}

function showpostpid(pid){
	$("#main nav li").removeClass("active");
	$(".left_main").html("");
	
	loadmorepost();	
	var type="pid";
	var page="1";
	var username=$.cookie("user");
	$(".left_main .loadtype").val(type);
	$(".left_main .currenpage").val(page);
	$(".left_main .pid").val(pid);
	showPost(type,pid,page,username);				
	checkloadmorepost(type);
}

function showmypost(){
	if($.cookie("user")){
		$("#main nav li").removeClass("active");
		$("#MyPost").addClass("active");
		$(".left_main").html("");
		
		loadmorepost();
		
		var type="mypost";
		var page="1";
		var username=$.cookie("user");
		$(".left_main .loadtype").val(type);
		$(".left_main .currenpage").val(page);
		showPost(type,"",page,username);				
		checkloadmorepost(type);
		
	}
	else
	{
		$("#error").dialog("open");
		setTimeout(function(){
			$("#error").dialog("close");
			$("#login").dialog("open");
		},1000);			
	}
}

function showpostcollect(){
	if($.cookie("user")){
		$("#main nav li").removeClass("active");
		$("#MyPostCollect").addClass("active");
		$(".left_main").html("");
		
		loadmorepost();
		
		var type="collect";
		var page="1";
		var username=$.cookie("user");
		$(".left_main .loadtype").val(type);
		$(".left_main .currenpage").val(page);		
		showPost(type,"",page,username);				
		checkloadmorepost(type);
		
	}
	else
	{
		$("#error").dialog("open");
		setTimeout(function(){
			$("#error").dialog("close");
			$("#login").dialog("open");
		},1000);			
	}
}

function checkloadmorepost(type){
	var username=$.cookie('user');
	var pid=$(".left_main .pid").val();		
	$.ajax({
		url:"getPostTotalPage.do",
		type:"POST",
		data:{
			type:type,
			username:username,
			pid:pid,
		},
		success:function(responseText,statusText){
			$(".left_main .totalpage").val(responseText);			
			var currenpage=$(".left_main .currenpage").val();
			var totalpage=$(".left_main .totalpage").val();
			if(currenpage>=totalpage){
				$(".left_main #loadmorepost").hide();
				
			}else{
				//显示加载更多问题
			}
		}
	});
	
	
}

function showPost(type,pid,page,username){
	   $.ajax({
		  url:"showPost.do",
		  type:"POST",
		  data:{
			  pid:pid,
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
						
					 
					
					html+="<div><h3><a href=showDetailPost.do?postid="+value.id +">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+value.title+"</a></h3>" +
							"<div><div class='post_username'> 发帖人:<a href='#'>"+value.username+"</a> &nbsp;&nbsp;"+value.date+"</div>"+				        
		               "<div class='num'><div class='reply_number'>回复数 <em>"+value.replynum+"</em></div><div>|</div>"+
		               "<div class='collect_number'>收藏数 <em>"+value.collectnum+"</em></div></div></div>"+
		               "<div class='post_content'>"+summary[index]+"</div></div>"+							
		               "<hr noshade='noshade' size='1' />";
				 });
				 $("#loadmorepost").before(html); 
				 				
	        }
	   });
}  

function replacePos(str,pos,replaceText){
	return str.substr(0,pos-1)+replaceText+str.substring(pos,str.length);
} 