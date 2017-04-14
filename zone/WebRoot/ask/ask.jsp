
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>



<c:import url="common/top.do"></c:import>
<link rel="stylesheet" href="../css/ask.css" type="text/css"></link>


<div id="main">
     <div class="main_top" id="tabs">
         <ul >
            <li><a href="all.jsp" id="tab1">首页</a></li>
            <li><a href="point.jsp" id="tab2">悬赏问题</a></li>
            <li><a href="nopoint.jsp" id="tab3">无积分问题</a></li>
            <li><a href="editQuestion.jsp" id="tab2">提问</a></li>
            <li><a href="editAnswer.jsp" id="tab3">回答</a></li>
         </ul>
         
      </div>
           





</div>




<c:import url="common/bottom.do"></c:import>