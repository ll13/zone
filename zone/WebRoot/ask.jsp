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
        <script type="text/javascript" src="js/showAllQuestion.js"></script>
      
   
   
   </head>

<body>

  
   <c:import url="/common/top.do"></c:import>


	<div id="main">

		<nav class="navbar navbar-default" role="navigation" id="asknav">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="ask.jsp">问答</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="ask.jsp">全部问答</a>
					</li>
					<li id="Question_Point"><a id="showQuestionWithPoint" >悬赏</a>
					</li>
					<li id="Question_NoAnswer"><a id="showQuestionWithNoAnswer" >未回答</a>
					</li>
					<li id="Question_Answer"><a id="showQuestionWithAnswer">已解决</a>
					</li>
					<li><a  id="question_button"  "><span
							class="glyphicon glyphicon-plus"></span>提问</a>
					</li>
					<li id="myQuestion"><a id="showMyQueston">我的提问</a>
					</li>
				</ul>
			</div>
		</div>
		</nav>
		
		<div class="left_main"></div>
		<div class="right_main">
		   <div id="hotquestion">
		     <h4>热门问答</h4>
		     <li></li>
		     <li></li>
		     <li></li>
		     <li></li>
		     <li></li>
		   </div>
		</div>
	</div>

	
	<form id="question" title="提问" >
		<p>
			<label>问题名称:</label> <input type="text" name="title"
				style="width: 390px" class="text" id="title" />
		</p>
		<p>
			<textarea class="uEditorCustom" name="content"></textarea>
		</p>
       
         <p>  <label>积分</label> <input type="text" class="text"  name="question_point" id="question_point" value="0"/></p>
        
	</form>
	
	<c:import url="/common/bottom.do"></c:import>
</body>
</html>
