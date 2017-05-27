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
      <link rel="stylesheet" href="uEditor/uEditor.css" type="text/css"></link>
      <link rel="stylesheet" href="css/Top_Bottom.css" type="text/css"></link>
	  <link rel="stylesheet" href="css/bbs.css" type="text/css"></link>
  
  
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>		
	    <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
	    <script type="text/javascript" src="js/jquery.ui.js"></script>	    
	    <script type="text/javascript" src="js/jquery.validate.js"></script>
	    <script type="text/javascript" src="js/jquery.form.js"></script>
	    <script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/md5.js"></script>      		
		<script type="text/javascript" src="uEditor/uEditor.js"></script>
		<script type="text/javascript" src="js/index.js"></script>		
        <script type="text/javascript" src="js/bbsFunction.js"></script>       
        <script type="text/javascript" src="js/bbs.js"></script>
   
   
   </head>

<body>

  
   <c:import url="/common/top.do"></c:import>


	<div id="main">

		<nav class="navbar navbar-default" role="navigation" id="bbsnav">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="bbs.jsp">论坛</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li ><a href="bbs.jsp">全部帖子</a></li>
					 
		             <li class="dropdown">
		                <a id="lifepost" class="dropdown-toggle" data-toggle="dropdown">
		                                                                       生活类
		                    <b class="caret"></b>
		                </a>
		                <ul class="dropdown-menu">
		                    <li><a href="#">旅游</a></li>
		                    <li><a href="#">美食</a></li>
		                    <li><a href="#">新鲜事</a></li>
		                    <li><a href="#">娱乐</a></li>
		                    <li><a href="#">情感</a></li>
		                    
		                </ul>
		            </li>
		             <li class="dropdown">
		                <a id="technologypost" class="dropdown-toggle" data-toggle="dropdown">
		                                                                       技术类
		                    <b class="caret"></b>
		                </a>
		                <ul class="dropdown-menu">
		                    <li><a href="#">移动开发</a></li>
		                    <li><a href="#">web开发</a></li>
		                    <li><a href="#">云计算</a></li>
		                    <li><a href="#">嵌入式开发</a></li>
		                    <li><a href="#">linux社区</a></li>
		                </ul>
		            </li>
					<li><a  id="add_post_btn" ><span class="glyphicon glyphicon-plus"></span>发表帖子</a>
			       </li>
			       <li><a  id="MyPost" >我的帖子</a>
			       </li>
			       <li><a  id="MyPostCollect" >我的收藏</a>
			       </li>
				</ul>
			</div>
			
		</div>
		</nav>
		
		<div class="left_main">
		
		   <div class='post_username'> <a href='#'>jack</a>发表于 2017-04-03</div>					        
		   <div class='reply_number'>回复 3</div>
		   <div class='post_summary'><h3><a href="#">少年冒雪骑行无人区—1956公里行稻城，只因心中那一抹向往与勇气</a></h3>
		   <div class='postcontent'>第一次心血来潮写游记 可能是因为太留恋的东西 值得我们去怀念 值得我们用文字去记下那段旅途的点点滴滴～
　　                              为什么选择去稻城 为什么选择骑摩托...</div></div>							
		   <hr noshade='noshade' size='1' />		
		</div>
		
		
		<div class="right_main">
		    <div id="accordion">
              <h3><em>生活类</em></h3>
               <ul>
                  <li><a>旅游</a></li>
                   <li><a>美食</a></li>
                   <li><a>新鲜事</a></li>
                   <li><a>娱乐</a></li>
                   <li><a>情感</a></li>
               </ul>
              <h3><em>技术类</em></h3>
                  <ul>
                  <li><a>移动开发</a></li>
                   <li><a>web开发</a></li>
                   <li><a>云计算</a></li>
                   <li><a>嵌入式开发</a></li>
                   <li><a>linux社区</a></li>
               </ul>
                
              <h3><em>我的帖子</em></h3>
                <ul>
                  <li><a>我的帖子</a></li>
                </ul> 
                <h3><em>我的收藏</em></h3>
                 <ul>
                   <li><a>收藏</a></li>
                 </ul>             
            </div>
		</div>
	</div>

	
	<form id="addpostform" title="发表帖子" >
		<p>
			<label>帖子名称:</label> <input type="text" name="title"
				style="width: 390px" class="text" id="title" />
		</p>
		
		<p>
			<textarea class="uEditorCustom" name="content"></textarea>
		</p>
       
        <p>
		   <select name="大类别" id="select_k1" class="addpostclass">
             <option value="大类别">大类别</option>
             <option value="技术类">技术类</option>
             <option value="生活类">生活类</option>
             
           </select>
           
           <select name="小类别" id="select_k2" class="addpostclass">
             <option value="小类别">小类别</option>
             
           </select>
		</p>
        
	</form>
	
	<c:import url="/common/bottom.do"></c:import>
</body>
</html>
