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
	  <link rel="stylesheet" href="css/smoothness/jquery.ui.css" type="text/css"></link>
	  <link rel="stylesheet" href="css/Top_Bottom.css" type="text/css"></link>
  
  
  
		<script type="text/javascript" src="js/jquery.js"></script>
	    <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
	    <script type="text/javascript" src="js/jquery.ui.js"></script>
	    <script type="text/javascript" src="js/index.js"></script>
	    <script type="text/javascript" src="js/jquery.validate.js"></script>
	    <script type="text/javascript" src="js/jquery.form.js"></script>
	    <script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/md5.js"></script>




		<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
		<link rel="stylesheet" href="uEditor/uEditor.css" type="text/css"></link>
		<link rel="stylesheet" href="css/ask.css" type="text/css"></link>
		
		<script type="text/javascript" src="js/bootstrap.js"></script>
		
		<script type="text/javascript" src="uEditor/uEditor.js"></script>
		<script type="text/javascript" src="js/ask.js"></script>

</head>

<body>

  
   <c:import url="/common/top.do"></c:import>


	<div id="main">

		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">问答</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">全部问答</a>
					</li>
					<li><a href="#">悬赏</a>
					</li>
					<li><a href="#">无悬赏</a>
					</li>
					<li><a href="#">已解决</a>
					</li>
					<li><a href="ask/ask.jsp"><span
							class="glyphicon glyphicon-plus"></span>提问</a>
					</li>
				</ul>
			</div>
		</div>
		</nav>
	</div>

	<form id="question" title="提问">
		<p>
			<label>问题名称:</label> <input type="text" name="title"
				style="width: 390px" class="text" id="title" />
		</p>
		<p>
			<textarea class="uEditorCustom" name="content">请输入问题描述</textarea>
		</p>

	</form>
</body>
</html>
