<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<c:import url="/common/top.do"></c:import>
<link rel="stylesheet" href="css/Blog.css" type="text/css"></link>

  <script>
  $(function() {
    $( "#tabs" ).tabs();
    
  });
  </script>
  
<div id="main">
     <div class="main_left">
         <div id="tabs">
              <ul>
                  <li><a href="blog/Blog_overview.jsp">首页</a></li>
                  <li><a href="blog/Blog_experts.jsp">博客专家</a></li>
                  <li><a href="blog/Blog_rank.jsp">排行榜</a></li>
              </ul>
             </div>
      </div>
      
      
      
      
      

<c:import url="/common/bottom.do"></c:import>