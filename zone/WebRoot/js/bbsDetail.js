$(function(){
	  
	
	//增加回答
		$("#replybtn").click(function(){
			var postid=$("#post_id").val();
			$(".username").val($.cookie('user'));
			var floornum=parseInt($(".left_main .reply_number_detail em").html())+1;
			$(".floor_num").val(floornum);
			if($.cookie("user")){
				
				$("#addreplyform").ajaxSubmit({
					
					url:"addReply.do",
					type:"post",
					data:{
						content:$(".replyEdit .uEditorIframe").contents().find("#iframeBody").html(),
						floor:floornum,
					},
					beforeSubmit:function(formData,jqForm,options){
						 
						 
						 $('#replybtn').attr('disabled',"true");
						 $("#loading").dialog("open"); 
						 
					  },
					success:function(responseText,statusText){
						 $("#replybtn").removeAttr("disabled");
						 
						 $("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("数据新增成功...");
						 
						 setTimeout(function(){
							var date=new Date();
							var floornum=parseInt($(".left_main .reply_number_detail em").html())+1;
							$(".left_main .reply_number_detail em").html(floornum);
							var content=$(".replyEdit .uEditorIframe").contents().find("#iframeBody").html();
							$(".replyEdit .uEditorIframe").contents().find("#iframeBody").html("");
							$("#loading").dialog("close");
							$(".replylist").append("<div class='replylist_div'><div>" +
									                     " <div class='reply_username'>" +
									                         " <a href='#'>"+$.cookie("user")+"</a>&nbsp;&nbsp;回复&nbsp;&nbsp;"+
									                         date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+
									                      "</div><div class='reply_floor_div'>  楼层  <em>"+floornum+"</em></div></div>" +
									                      "<hr noshade='noshade' class='postlistLine' size='1' />"+
									                       "<div class='reply_content'>" +   
									                       content+
									                       "</div>" +
							                            "<div class='reply_content'>&nbsp;</div><div class='reply_content'>&nbsp;</div></div>" +
							                            "<hr noshade='noshade' class='postlistLine' size='1' />"); 	
							
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
				
			
		});//增加回答函数结束
	
		//初始化收藏
		function initCollect(){
			if($.cookie("user")){
				var username=$.cookie('user');
				var postid=$(".replyEdit .postid").val();
				$.ajax({
					url:"checkPostCollect.do",
					type:"POST",
					data:{
						postid:postid,
						username:username,
					},
					success:function(responseText,statusText){
					  if(responseText==1){					
	                    $(".left_main .collect_number").attr("select","selected");
						var num=Number($(".left_main .collect_number em").html());
						var value="已收藏<em>"+num+"</em>";
						$(".left_main .collect_number").html(value);
					  }
					}
					
				});	
			}
			
		}
		
		//收藏
		$(".left_main .collect_number").click(function(){
		  if($.cookie("user")){
			var flag=this.getAttribute("select");
			if(flag=="unselect"){
				this.setAttribute("select","selected");
				var num=Number($(".left_main .collect_number em").html())+1;
				var value="已收藏<em>"+num+"</em>";
				var postid=$(".replyEdit .postid").val();
				var username=$.cookie('user');
				$(this).html(value);
				$.ajax({
					url:"upCollectnum.do",
					type:"POST",
					data:{
						postid:postid,
						username:username,
					},
				});	
			}else{
				this.setAttribute("select","unselect");
				var num=Number($(".left_main .collect_number em").html())-1;
				var value="收藏<em>"+num+"</em>";
				var postid=$(".replyEdit .postid").val();
				var username=$.cookie('user');
				$(this).html(value);
				$.ajax({
					url:"downCollectnum.do",
					type:"POST",
					data:{
						postid:postid,
						username:username,
					},
				});	
				
			}
		  }else{
				$("#error").dialog("open");
				setTimeout(function(){
					$("#error").dialog("close");
					$("#login").dialog("open");
				},1000);
			
				
			}
		});
		
	
		//删除问题
	    $(".left_main .delectMyPost").click(function(){
	    	 if(confirm("是否删除帖子")){
	    	    var replynum=$(".reply_number_detail em ").html();
	    	    var collectnum=$(".collect_number em").html();
	    	    var postid=$(".postid").val();
	    	    if(replynum==0&&collectnum==0){
	    	    	$.ajax({
	    	    		url:"delectPost.do",
	    	    		type:"POST",
	    	    		data:{
	    	    			postid:postid,
	    	    		},
	    	    		success:function(responseText,statusText){
	    	    			 $("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("删除问题成功");
	    	    			 $("#loading").dialog("open");
	    	    			setTimeout(function(){
	    	    				 $("#loading").dialog("close");
	    	    				 $("#loading").css("background","url(img/loading.gif) no-repeat 20px center").html("数据交互中.....");
	    	    				 location.href = "bbs.jsp"
	    	    			},1000)
	    	    		}
	    	    		
	    	    	});
	    	    }else{
	    	    	alert("帖子有回复或收藏，无法删除");
	    	    }
	    	  }
		});
		
	    //修改和删除只在我的问题中的显示
	    function showMyPost_div(){
	    	var cookiename=$.cookie("user");
	    	var username=$(".post_username a").html().replace(/(^\s*)|(\s*$)/g,'');    	
	    	if(cookiename==username){
	    		
	    		 $(".myPost_div").show();
	    		 
	    	}
	    }
	    $(".myPost_div").hide();	
		
	  initCollect();
	  getCatalog();
	  showMyPost_div();
      $(".uEditorCustom").uEditor();
});


