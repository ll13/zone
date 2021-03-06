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
	  <script type="text/javascript" src="js/questionFunction.js"></script>
	  <script type="text/javascript" src="js/editQuestion.js"></script>
	  <script type="text/javascript" src="js/detailQuestion.js"></script>
      
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
					<li id="QuestionCollect"><a id="showCollectQueston">我的收藏</a>
					</li>
					<div class="btn-group search-group">
	                  <input type="text" name="search" id="search" class="search btn btn-default">
	                  <button type="button" class="search_question_btn btn btn-default">查找</button>	                  
                    </div>
				</ul>
			</div>
		</div>
		</nav>
		
		<div class="left_main">
		    <div class='question_username'> <a href='#'> ${question.username}</a>发表于    ${question.date}</div>
		    <div class='question_point'>积分<span class='badge '>${question.point} </span></div>
		    <div class='myQuestion_div'>
		      <div><a class='editMyQuestion'>编辑</a></div><span>|</span>
		      <div><a class='delectMyQuestion' >删除</a></div>
		    </div>
		    <div class='question_summary'>
		       <h3>${question.title}</h3>
		       <div class='questionlistcss'>
		          ${question.content}
		       </div>
		    </div>
		    <div class='queston_share_bar'>
		        <div><a class="browseQuestion">浏览 <em>${question.browsenum}</em></a></div><span>|</span>
		        <div><a class="collectQuestion" select="unselect">收藏  <em> ${question.collectnum} </em></a></div>
		        <div type="hidden" class="QuestionRightAnswer"  style="display:none;"> ${question.haveright}</div>
		     </div>
		    <hr noshade='noshade' size='1' />
		    <div class='answer_number_detail'>回答<em> ${question.answernum}</em> </div>
		    <hr noshade='noshade' size='1' />
		    <c:choose>
		      <c:when test="${question.haveright==1}">
		        <div class='answerRight'>
		           <div>
		             <div class='answerRight_username'> <a href='#'> ${rightAnswer.username}</a>&nbsp;&nbsp;    ${rightAnswer.date}</div>
		             <lable  class="rightAnswerLabel">已采纳</label>
		           </div>
		           <div class='answerContent'>
		             ${rightAnswer.content}
		           </div>
		           <div class="answerid" style="display: none">${answer.answerid} </div>
		           <hr noshade='noshade' class="answerlistLine" size='1' />
		        </div>
		      </c:when>  
		   </c:choose>
		    <div class='answerlist'>
		       <c:forEach items="${answerlist}" var="answer">
		         <div class="answerlist_answer">
		           <div class='answer_username'> <a href='#'> ${answer.username}</a>&nbsp;&nbsp;    ${answer.date}</div>
		           <div class='answerContent'>
		             ${answer.content}
		           </div>
		           <div class="getRightAnswer_div"><a  class="getRightAnswer">采纳</a></div><div class="answerid" style="display: none">${answer.answerid} </div>
		           <hr noshade='noshade' class="answerlistLine" size='1' />
		         </div>
		       </c:forEach>
		    </div>
		    
		    
		    <div class='answerEdit'>
		       <form id="answer" class="answer" title="回答" >
		         <input type='hidden' class="question_id" name='questionid' value="${questionid}"/>
		         <input type='hidden' name='username' class="username" value=""/>
		         <p><textarea class="uEditorCustom" ></textarea></p>
		         <input type="button" value="我要回答" id="answerQuestionbtn" class=" btn btn-primary form_submit_answer_btn">
		       </form>
		    </div>
		
		</div>
		<div class="right_main">
		   <div id="hotquestion">
		     <h4>热门问答</h4>
		     <li></li>
		     <li></li>
		     <li></li>
		     <li></li>
		     <li></li>
		   </div>
		   
		   <div id="newquestion">
		     <h4>最新问答</h4>
		     <li></li>
		     <li></li>
		     <li></li>
		     <li></li>
		     <li></li>
		   </div>
		</div>
		</div>
		
		
    <form id="update_question" title="编辑提问" >
		<p>
			<label>问题名称:</label> <input type="text" name="title"
				style="width: 390px" class="text" id="updateQuestiontitle" value="${question.title}"/>
		</p>
		<p>
			<textarea class="updateQuestionEdit" >${question.content}</textarea>
		</p>
       
         <p>  <label>积分   </label> ${question.point}&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
              <label>增加积分 </label><input type="text" class="text"  name="updateQuestionPoint" id="updateQuestionPoint" value="0"/>
         </p>
        
	</form>
    <form id="question" title="提问" >
		<p>
			<label>问题名称:</label> <input type="text" name="title"
				style="width: 390px" class="text" id="title" />
		</p>
		<p>
			<textarea class="uEditorCustom" name="content"></textarea>
		</p>
       
         <p>  <label>积分</label> <input type="text" class="text"  name="question_point" id="question_point"/></p>
        
	</form>
	
	
	
	<c:import url="/common/bottom.do"></c:import>
     
  </body>
</html>
