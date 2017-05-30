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
        <script type="text/javascript" src="js/bbsDetail.js"></script>
   
   
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

					<li><a  id="add_post_btn" ><span class="glyphicon glyphicon-plus"></span>发表帖子</a>
			       </li>
			       <li id="MyPost"><a  id="MyPost_a" >我的帖子</a>
			       </li>
			       <li id="PostCollect"><a  id="MyPostCollect_a" >我的收藏</a>
			       </li>
				</ul>
			</div>
			
		</div>
		</nav>
		
		<div class="left_main">
		
          <div>
             <h3><p >&nbsp;&nbsp;&nbsp;${post.title}</a></h3>
			   <div>
			      <div class='post_username'> 楼主 :&nbsp; <a href='#'>${post.username}</a> &nbsp;&nbsp;  ${post.date}</div>			      			        
			         <div class='num'>
			            <div><a class="collect_number" select="unselect">收藏  <em> ${post.collectnum} </em></a></div>
			       </div>
			   </div>
			   <div class='post_content'> ${post.content}</div>
			   <div class='myPost_div'>
		             <div><a class='delectMyPost' >删除</a></div>
		       </div>
			   <div class='post_content'>&nbsp;</div>
			   <div class='post_content'>&nbsp;</div>
		 </div>							
	     <hr noshade='noshade' size='1' />
          <div class='reply_number_detail'>&nbsp;回复数量&nbsp;&nbsp;<em> ${post.replynum}</em> </div>
		  <hr noshade='noshade' size='1' />
		    <div class='replylist'>
		       <c:forEach items="${replylist}" var="reply">
		         <div class="replylist_div">
		           <div>
		              <div class='reply_username'> <a href='#'> ${reply.username}</a>&nbsp;&nbsp;回复&nbsp;&nbsp;${reply.date}</div>
		              <div class="reply_floor_div">  楼层  <em>${reply.floor}</em></div>
		           </div>
		           <hr noshade='noshade' class="postlistLine" size='1' />
		           <div class='reply_content'>
		             ${reply.content}
		           </div>
		           <div class='reply_content'>&nbsp;</div>
			       <div class='reply_content'>&nbsp;</div>
		         </div>
		         <hr noshade='noshade' class="postlistLine" size='1' />
		       </c:forEach>
		    </div>
		    
		    <div class='replyEdit'>
		       <form id="addreplyform" class="replyform" title="回复" >
		         <input type='hidden' class="postid" name='postid' value="${postid}"/>
		         <input type='hidden' name='username' class="username" value=""/>
		         <input type='hidden' name='floor_num' class="floor_num" value=""/>
		         <p><textarea class="uEditorCustom" ></textarea></p>
		         <input type="button" value="回复" id="replybtn" class=" btn btn-primary">
		       </form>
		    </div>
			   		
		</div>
		
		
		<div class="right_main">
		    <div id="accordion">
              <h3><em>生活类</em></h3>
               <ul>
                  <li><a  onclick="showpostpid('3')">旅游</a></li>
                   <li><a onclick="showpostpid('4')">美食</a></li>
                   <li><a onclick="showpostpid('5')">新鲜事</a></li>
                   <li><a onclick="showpostpid('6')">娱乐</a></li>
                   <li><a onclick="showpostpid('7')">情感</a></li>
               </ul>
              <h3><em>技术类</em></h3>
                  <ul>
                  <li><a onclick="showpostpid('8')">移动开发</a></li>
                   <li><a onclick="showpostpid('9')">web开发</a></li>
                   <li><a onclick="showpostpid('10')">云计算</a></li>
                   <li><a onclick="showpostpid('11')">嵌入式开发</a></li>
                   <li><a onclick="showpostpid('12')">linux社区</a></li>
               </ul>
                
              <h3><em>我的帖子</em></h3>
                <ul>
                  <li><a onclick="showmypost()">我的帖子</a></li>
                </ul> 
                <h3><em>我的收藏</em></h3>
                 <ul>
                   <li><a onclick="showpostcollect()">收藏</a></li>
                 </ul>             
            </div>
		</div>
	</div>
    
	
	<form id="addpostform" title="发表帖子" >
		<p>
			<label>帖子标题:</label> <input type="text" name="title"
				style="width: 390px" class="text" id="title" />
		</p>
		
		<p>
			<textarea class="uEditorCustom" name="content"></textarea>
		</p>
       
        <p>
		   <select name="大类别" id="select_k1" class="addpostclass" onchange="func()">
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
