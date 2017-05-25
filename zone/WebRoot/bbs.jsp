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
	  <link rel="stylesheet" href="css/ask.css" type="text/css"></link>
  
  
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
        <script type="text/javascript" src="js/questionFunction.js"></script>
        <script type="text/javascript" src="js/editQuestion.js"></script>       
        <script type="text/javascript" src="js/bbs.js"></script>
   
   
   </head>

<body>

  
   <c:import url="/common/top.do"></c:import>


	<div id="main">

		<nav class="navbar navbar-default" role="navigation" id="asknav">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="bbs.jsp">论坛</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li ><a href="bbs.jsp">全部帖子</a></li>
					  <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
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
		             <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		                                                                       生活类
		                    <b class="caret"></b>
		                </a>
		                <ul class="dropdown-menu">
		                    <li><a href="#">jmeter</a></li>
		                    <li><a href="#">EJB</a></li>
		                    <li><a href="#">Jasper Report</a></li>
		                    
		                </ul>
		            </li>
					<li><a  id="question_button" ><span class="glyphicon glyphicon-plus"></span>发表帖子</a>
			       </li>
			       <li><a  id="question_button" >我的帖子</a>
			       </li>
			       <li><a  id="question_button" >我的收藏</a>
			       </li>
				</ul>
			</div>
			
		</div>
		</nav>
		
		<div class="left_main">
		
		<div class='question_username'> <a href='#'>jack</a>发表于 2017-04-03</div>					        
		<div class='answer_number'>回复 3</div>
		<div class='question_summary'><h3><a href="#">少年冒雪骑行无人区—1956公里行稻城，只因心中那一抹向往与勇气</a></h3>
		<div class='questionlistcss'>第一次心血来潮写游记 可能是因为太留恋的东西 值得我们去怀念 值得我们用文字去记下那段旅途的点点滴滴～
　　                为什么选择去稻城 为什么选择骑摩托...</div></div>							
		<hr noshade='noshade' size='1' />
		<div class='question_username'> <a href='#'>jack</a>发表于 2017-04-05</div>					        
		<div class='answer_number'>回复 6</div>
		<div class='question_summary'><h3><a href="#">退休大妈也疯狂，一人一狗骑行世界（一）</a></h3>
		<div class='questionlistcss'>　云南之行回来一直忙于整理和写作，这之间有许多朋友提了不少问题，何不趁写作兴趣正浓时，对大家提的问题用简单问与答，着重用生动图片加文字...</div></div>							
		<hr noshade='noshade' size='1' />
		<div class='question_username'> <a href='#'>jack</a>发表于 2017-04-06</div>					        
		<div class='answer_number'>回复 1</div>
		<div class='question_summary'><h3><a href="#">我家的自驾旅程-2017年春节追逐彩云之旅（更新中）</a></h3>
		<div class='questionlistcss'>　这是我们全家第一次选择的春节自驾旅行，根据我们全家人不同的休假时间和季节，从正月初三到正月十六共计十四天的时间，我这个家庭旅行团长做了一份路书计划...</div></div>							
		<hr noshade='noshade' size='1' />
		
		</div>
		<div class="right_main">
		    <div id="accordion">
              <h3>生活类</h3>
              <div><p>内容1</p><p>内容2</p></div>
              <h3>技术类</h3>
              <div><p>移动开发</p><p>web开发</p><p>云计算</p><p>嵌入式开发</p><p>linux社区</p></div>
              <h3>我的帖子</h3>
              <div><p>内容5</p><p>内容6</p></div> 
              <h3>我的收藏</h3>
              <div><p>内容5</p><p>内容6</p></div>             
            </div>
		</div>
	</div>

	
	<form id="question" title="发表帖子" >
		<p>
			<label>帖子名称:</label> <input type="text" name="title"
				style="width: 390px" class="text" id="title" />
		</p>
		
		<p>
			<textarea class="uEditorCustom" name="content"></textarea>
		</p>
       
        <p>
		   <select name="大类别" id="select_k1" class="xla_k">
             <option value="生活类">生活类</option>
             <option value="选择品牌1">选择品牌1</option>
             <option value="选择品牌2">选择品牌2</option>
           </select>
           
           <select name="小类别" id="select_k1" class="xla_k">
             <option value="旅游">旅游</option>
             <option value="选择品牌1">选择品牌1</option>
             <option value="选择品牌2">选择品牌2</option>
           </select>
		</p>
        
	</form>
	
	<c:import url="/common/bottom.do"></c:import>
</body>
</html>
