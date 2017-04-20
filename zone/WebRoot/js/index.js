
$(function(){
	
	//导航的button
	$("#blog_btn").button();
	$("#bbs_btn").button();
	$("#question_btn").button({
		icons: { primary: "ui-icon-search" },
		
		
	});
	
	
	
	$("#download_btn").button();
	$("#score_btn").button();
	$("#information_btn").button();
	
	$("#register").dialog({
		 autoOpen:false,
		 modal:true,
		 width:320,
		 height:400,
		 resizable:false,
		 draggable:false,
		 buttons:{'注册':function(){
			 $(this).submit();
		 }}
	 });
	
	 $("#login").dialog({
		 autoOpen:false,
		 modal:true,
		 width:320,
		 height:300,
		 resizable:false,
		 draggable:false,
		 buttons:{'登录':function(){
			 $(this).submit();
		 }}
	 });
	 
	 
	//tabs
	$(function() {
	    $( "#tabs" ).tabs({
	    	
	    });
	  });
	
	
	
	
	//注册 登陆 退出 用户的显示	
    $("#user_a,#logout_a").hide();
	
	if($.cookie('user'))
	{
		 $("#user_a,#logout_a").show();
		 $("#register_a,#login_a").hide();
		 $("#user_a").html($.cookie('user'));
	}
	else
	{
		 $("#user_a,#logout_a").hide();
		 $("#register_a,#login_a").show();
	}
	
	$("#logout_a").click(function(){
		alert(123);
		$.cookie("user",null);
		window.location.href="/zone/";
	});
	
	

	
	//注册
	$("#register").buttonset();
	$("#date").datepicker();
	
	
	$("#register_a").click(function(){
		$("#register").dialog('open');
	});
	
	
	
	$("#register").validate({
		   
		   submitHandler:function(form){
			   var password=hex_md5($('#pass').val());				
				$('#pass').val(password) ;  //md5加密
				
				
			   $(form).ajaxSubmit({
				   url:'register.do',
				   type:'post',
				   beforeSubmit:function(formData,jqForm,options){
					$("#register").dialog("widget").find("button").eq(1).button("disable");    //提交按钮置灰
					$("#loading").dialog("open");    //进度框打开
					
					
				   },
				   success:function(responseText,statusText){
					  if(responseText=="1")
					  {
						  $("#register").dialog("widget").find("button").eq(1).button("enable");   //重新启用按钮
						  $("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("注册成功.....");
						  $.cookie('user',$("#user").val());
						  setTimeout(function(){
							  $("#loading").dialog("close");
							  $("#register").dialog("close");
							  $("#register").resetForm();
							  $("#register span.star").html("*").removeClass("success");
							  $("#loading").css("background","url(img/loading.gif) no-repeat 20px center").html("数据交互中.....");
							  $("#user_a,#logout_a").show();
							  $("#register_a,#login_a").hide();
							  $("#user_a").html($.cookie('user'));
							  
						  },1000);
						
					  }
					  
				   },
			   });
		   },
		   
		   
		   highlight: function(element, errorClass) {
			    $(element).css("border","1px solid red");
			    $(element).parent().find('span').html('*').removeClass('success');
		   },
		   unhighlight: function(element, errorClass) {
			   $(element).css("border","1px solid #ccc"); 
			   $(element).parent().find('span').html('&nbsp;&nbsp;').addClass('success');
		  },
		   
		   errorLabelContainer: "ol.register_error",
		   wrapper: "li",
		   rules:{
			   name:{
				   required:true,
				   minlength:2,
				   remote:{
					   url:"checkUser.do",
					   type:"POST",
				   }
			   },
	          pass:{
	        	  required:true,
				   minlength:6,
	          },
			  email:{
		        	  required:true,
					  email:true,
		      },
		   },
		   messages:{
			   name:{
				   required:"账号不得为空",
				   minlength:"账号不得小于2位",
				   remote:"账号被占用",
			   },
	          pass:{
	        	  required:"密码不得为空",
				  minlength:"密码不得小于6位",
	          },
			  email:{
		        	  required:"邮箱不得为空",
		        	  minlength:"请输入正确的邮箱地址",
		      },
		   },
		   
	   });


	
	//登录
	$("#login_a").click(function(){
		   $("#login").dialog("open");
	   });
	   
	  
	   
	   
	   
	   	$("#login").validate({
	   	    
		   submitHandler:function(form){
			   var password=hex_md5($('#login_pass').val());				
			   $('#login_pass').val(password) ;  //md5加密
			   $(form).ajaxSubmit({
				   url:'login.do',
				   type:'post',
				   beforeSubmit:function(formData,jqForm,options){
					$("#login").dialog("widget").find("button").eq(1).button("disable");    //登录按钮置灰
					$("#loading").dialog("open");    //进度框打开
				   },
				   success:function(responseText,statusText){
					  if(responseText=="1")
					  {
						  $("#login").dialog("widget").find("button").eq(1).button("enable");   //重新启用按钮
						  $("#loading").css("background","url(img/success.gif) no-repeat 20px center").html("登录成功.....");
						  if($("#expires").is(":checked"))
						  {
							  $.cookie('user',$("#login_user").val(),{
								  expires:7,
							  });
						  }
						  else
						  {
							  $.cookie('user',$("#login_user").val()); 
						  }
			  
						
						  setTimeout(function(){
							  $("#loading").dialog("close");
							  $("#login").dialog("close");
							  $("#login").resetForm();
							  $("#login span.star").html("*").removeClass("success");
							  $("#loading").css("background","url(img/loading.gif) no-repeat 20px center").html("数据交互中.....");
							  $("#user_a,#logout_a").show();
							  $("#register_a,#login_a").hide();
							  $("#user_a").html($.cookie('user'));
							  
						  },1000);
						
					  }
					  else
					  {
						  $("#loading").css("background","url(img/error.png) no-repeat 20px center").html("错误的账号名/密码.....");
						  
						  setTimeout(function(){
							  $("#loading").dialog("close");
							  $("#login").resetForm();
							  $("#login span.star").html("*").removeClass("success");
							  $("#login").dialog("widget").find("button").eq(1).button("enable");   //重新启用按钮
							  $("#loading").css("background","url(img/loading.gif) no-repeat 20px center").html("数据交互中.....");
						  },1000);
						  
					  }
					  
				   },
			   });
		   },
		   
		   
		   highlight: function(element, errorClass) {
			    $(element).css("border","1px solid red");
			    $(element).parent().find('span').html('*').removeClass('success');
		   },
		   unhighlight: function(element, errorClass) {
			   $(element).css("border","1px solid #ccc"); 
			   $(element).parent().find('span').html('&nbsp;&nbsp;').addClass('success');
		  },
		   
		   errorLabelContainer: "ol.login_error",
		   wrapper: "li",
		   rules:{
			   name:{
				   required:true,
				   minlength:2,
				  
			   },
	          pass:{
	        	  required:true,
				   minlength:6,
	          },
			 
		   },
		   messages:{
			   name:{
				   required:"账号不得为空",
				   minlength:"账号不得小于2位",
			   },
	          pass:{
	        	  required:"密码不得为空",
				  minlength:"密码不得小于6位",
	          },
		   },
		   
	   });
	   
	   	
	   //退出
	   	$("#logout_a").click(function(){
			$.cookie("user",null);
			window.location.href="/zone/";
		});
		
	  //提示框
		$("#loading").dialog({
			autoOpen:false,
			modal:true,
			width:180,
			height:80,
			resizable:false,
			draggable:false,
		}).parent().parent().find(".ui-widget-header").hide();
		
		//请登录
		$("#error").dialog({
			autoOpen:false,
			modal:true,
			width:180,
			height:80,
			resizable:false,
			draggable:false,
		}).parent().parent().find(".ui-widget-header").hide();   	
	   
		
		
	   //邮箱补全
		 $("#email").autocomplete({
			  autoFocus:true,
			  delay:0,
			  source:function(request,response){
				 var hosts=['qq.com','163.com','263.com','sina.com','gmail.com','hotmail.com','sina.com.cn'];
				 
				 term = request.term;      //获取用户输入的内容
				 name=term;                //邮箱的用户名
				 host="";                  //邮箱的域名
				 ix = term.indexOf('@');   //@的索引位置
			 
				 result=[];               //最终的提示内容
				 
				 result.push(term);       //将输入的内容加入第一条
				 
				 if(ix>-1)         //当输入内容中有@时候,重新分别赋值
				 {
					 name=term.slice(0,ix);   //得到用户名
					 host=term.slice(ix+1);   //得到域名
				 }
				 
				 
				 if(name)
				 {
					 //如果用户输入了@和后面的域名,
					 //那么就要找到相关域名提示 ,比如输入abb,出现  abb@163.com abb@qq.com;输入abb@1  提示abb@163.com
					 //如果用户还没有输入域名，就把所有的域名提示显示，
					 var findedHosts=(host?($.grep(hosts,function(value,index){
							return value.indexOf(host)>-1;
						})):hosts);
					 
					
					 
					 var findedResult=$.map(findedHosts,function(value){
						    return name+'@'+value;
					 });
							 
					result = result.concat(findedResult);		 
					
					 
				 }
				 
				 response(result);
			  }
		  });
		
		 
	
});//function 结束




	
	
