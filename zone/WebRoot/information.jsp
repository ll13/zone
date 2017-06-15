<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

       
      <link rel="shortcut icon" type="image/x-icon" href="img/logo.ico"></link>
      <link rel="stylesheet" href="css/reset.css" type="text/css"></link>	  	  	  
      <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
      <link rel="stylesheet" href="css/smoothness/jquery.ui.css" type="text/css"></link>     
      <link rel="stylesheet" href="css/Top_Bottom.css" type="text/css"></link>
	  <link rel="stylesheet" href="css/information.css" type="text/css"></link>
  
  
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>		
	    <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
	    <script type="text/javascript" src="js/jquery.ui.js"></script>	    
	    <script type="text/javascript" src="js/jquery.validate.js"></script>
	    <script type="text/javascript" src="js/jquery.form.js"></script>
	    <script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/md5.js"></script>      				
		<script type="text/javascript" src="js/index.js"></script>		
        <script type="text/javascript" src="js/information.js"></script>
      
   
   
   </head>

<body>

  
   <c:import url="/common/top.do"></c:import>


	<div id="main">

		<nav class="navbar navbar-default"  id='usernav'>
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="user.jsp">个人主页</a>
			</div>
		</div>
		<hr noshade='noshade' class="Line" size='1' />	
		<div>
		    <div  class='username_bar'>
		        <div class='username_div'>用户名   :<em>  </em></div>
		        <div class='usersex_div'> 性别   :  <em>  </em></div>
		        <div class='point_div'> 积分   :  <em>  </em></div>
		    </div>
		    <div class='userdescription'>用户介绍 : &nbsp;&nbsp; <p></p> 
		    </div>
		</div>
		</nav>	
        
        	
		<div class="main_div">
		 	<ul id="myTab" class="nav nav-tabs">
	           <li class="active"><a href="#updateinformation" data-toggle="tab">修改信息 </a></li>
	           <li><a href="#updatepassword" data-toggle="tab">修改密码</a></li>
	           <li><a href="#showmessage" data-toggle="tab">查看信息</a></li>
	           <li><a href="#sendmessage" data-toggle="tab">发送信息</a></li>
	           <li><a href="#mycolletuser" data-toggle="tab">我关注的用户</a></li>
	           <li><a href="#collectme" data-toggle="tab">关注我的用户</a></li>
	        </ul>
            <div id="myTabContent" class="tab-content">
	           <div class="tab-pane fade in active" id="updateinformation">
		          <form id="updateinformationform" title="修改信息" >          
			          <p>
			             <label for="updateemail">邮箱:</label>
			             <input type="text" name="updateemail" class="text" id="updateemail"/>
			             <span class="star">*</span>
			          </p>
			          <p>
			             <label for="user">性别:</label>
			             <input type="radio" name="sex" value="男" id="male" checked="checked">
			                <label for="male">男</label>
			             
			             <input type="radio" name="sex" value="女" id="female">
			                <label for="female">女</label>
			             
			          </p>
			          <p>
			             <label for="updatedate">生日:</label>
			             <input type="text" name="updatebirthday" readonly="readonly" class="text" id="updatedate"/>
			          </p>
			          <p>
			             <label for="phone">电话:</label>
			             <input type="text" name="phoneContent"  class="text" id="phone" />
			          </p>
			          <p>
			             <label for="occupation">职业:</label>
			             <input type="text" name="occupationContent"  class="text" id="occupation"/>
			          </p>
			          <p>
			             <label for="description">介绍:</label>
			             <textarea  name="description" id="description">
                                                                                                             
                         </textarea>
			          </p>
			          <p>
			            <input type='button' value='提交' id='updateinformationbtn' class='btn btn-primary '>
			          </p>
			     </form>
	           </div>
	           <div class="tab-pane fade" id="updatepassword">
		            <form id="updatepasswordform" title="修改密码" >          
			          
			          <p>
			             <label for="oldpass">原密码:</label>
			             <input type="password" name="oldpass"   id="oldpass" />
			          </p>
			          <p>
			             <label for="newpass">新密码:</label>
			             <input type="password" name="newpass"   id="newpass" />
			          </p>
			          <p>
			             <label for="newpass2">新密码:</label>
			             <input type="password" name="newpass2"   id="newpass2" />
			          </p>
			           <p>
			            <input type='button' value='提交' id='updatepassbtn' class='btn btn-primary '>
			          </p>
			          
			     </form>
	           </div>
	           <div class="tab-pane fade" id="showmessage">
		          <div id="messagelist">
		             <h4>信息列表</h4>
		             <hr noshade='noshade' class='Line' size='1' />
		             <ul>
		                <li><a>jack的消息    </a><p>日期:2017-06-15</p></li>
		                <li><a>jack的消息    </a><p>日期:2017-06-15</p></li>
		                <li><a>jack的消息    </a><p>日期:2017-06-15</p></li>
		             </ul>
		          </div>
		          <div id="messagedetail">
		              <div class="messagedetail_header">
		                 <h4 class='message_title'>jack的消息</h4>
		                 <div class='message_date'>日期：<em>2017-06-05</em></div>
                         <div id='delectmessage'><a>删除</a></div>
                      </div>
		 
		              
		              <div class="message_content">内容：<em>内容</em></div>
		             
		          </div>
	           </div>
	           <div class="tab-pane fade" id="sendmessage">
		          <form id="sendmessagebtn" title="发送消息" >          
			          
			          <p>
			             <label for="senduser">发送给:</label>
			             <input type="text" name="senduser"   id="senduser" />
			          </p>
			          <p>
			             <label for="messageContent">内 &nbsp;&nbsp;容:</label>
			             <textarea  name="messageContent" id="messageContent">
                                                                                                             
                         </textarea>
			          </p>
			           <p>
			            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            <input type='button' value='提交' id='messagebtn' class='btn btn-primary '>
			          </p>
			          
			     </form>
	           </div>
	           <div class="tab-pane fade" id="mycolletuser">
		          <ul>
		             <li><a href="#" class='btn btn-primary'>admin</a></li>
		             <li><a href="#" class='btn btn-primary'>admin</a></li>
		             <li><a href="#" class='btn btn-primary'>admin</a></li>
		             <li><a href="#" class='btn btn-primary'>admin</a></li>
		             
		          </ul>
	           </div>
	           <div class="tab-pane fade" id="collectme">
		             <ul>
		             <li><a href="#" class='btn btn-primary'>admin</a></li>
		             <li><a href="#" class='btn btn-primary'>admin</a></li>
		             <li><a href="#" class='btn btn-primary'>admin</a></li>
		             <li><a href="#" class='btn btn-primary'>admin</a></li>		             
		          </ul>
	           </div>	
            </div>
		</div>
		
		
	</div>

	
	
	
	<c:import url="/common/bottom.do"></c:import>
</body>
</html>
