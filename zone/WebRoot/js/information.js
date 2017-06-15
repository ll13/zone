$(function(){
	insertinformation();
	
	$("#updateinformation").buttonset();
	$("#updatedate").datepicker();
	
	$("#updateemail").autocomplete({
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
	
	function insertinformation(){
		if($.cookie("user")){
		 var username=$.cookie("user");
		  $.ajax({
			url:"showinformation.do",
			type:"POST",
			data:{
				username:username,
			},
			success:function(response,statusText){
			    $(".username_div em ").html(response.name);
			    $(".usersex_div em ").html(response.sex);
			    $(".point_div em ").html(response.point);
			    $(".userdescription p ").html(response.description);
				$("#updateinformation #updateemail").val(response.email);
				$("#updateinformation #updatedate").val(response.birthday);
				$("#updateinformation #phone").val(response.phone);
				$("#updateinformation #occupation").val(response.occupation);
				$("#updateinformation #description").val(response.description);
			  
			}
			
		  });	
		}else{
			$("#error").dialog("open");
			setTimeout(function(){
				$("#error").dialog("close");
				$("#login").dialog("open");
			},1000);
		
			
		}
		
	}
	
	
	
});

