<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
      <link rel="stylesheet" href="css/questionDetail.css" type="text/css"></link>     
    
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
	  <script type="text/javascript" src="js/detailQuestion.js"></script>

  </head>
  
  <body>
     <c:import url="/common/top.do"></c:import>
     <div id="main">

		<nav class="navbar navbar-default" role="navigation" id="asknav">
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
					<li><a  id="question_button"><span
							class="glyphicon glyphicon-plus"></span>提问</a>
					</li>
				</ul>
			</div>
		</div>
		</nav>
		
		<div class="left_main">
		    <div class='question_username'>  ${question.username}<a href='#'></a>发表于    ${question.date}</div>
		    <div class='question_point'>积分<span class='badge '>42</span></div>
		    <div class='answer_number'>回答15</div>
		    <div class='question_summary'>
		       <h3>${question.title}</h3>
		       <div class='questionlistcss'>
		          ${question.content}
		       </div>
		    </div>
		    <div class='queston_share_bar'><em>浏览数 10</em><span>|</span><em>收藏数10</em></div>
		    <hr noshade='noshade' size='1' />
		    
		    <div class='answerlist'></div>
		    <div class='answerEdit'>
		       <form id="answer" class="answer" title="回答" >
		         <p><textarea class="uEditorCustom" name="content"></textarea></p>
		         <input type="submit" value="我要回答" class=" btn btn-primary form_submit_answer_btn">
		       </form>
		    
		    
		    
		    </div>
		
		</div>
		<div class="right_main">
		   <div id="hotquestion">
		     <h4>热门问答</h4>
		     <li>问题1</li><hr noshade='noshade' size='1'/>
		     <li>问题2</li><hr noshade='noshade' size='1'/>
		     <li>问题3</li><hr noshade='noshade' size='1'/>
		     <li>问题4</li><hr noshade='noshade' size='1'/>
		     <li>问题5</li><hr noshade='noshade' size='1'/>
		   </div>
		</div>
	</div>

	
	
	
	<c:import url="/common/bottom.do"></c:import>
     
  </body>
</html>
