
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>





<c:import url="common/top.do"></c:import>

<div id="main">
     <div class="main_left">
         <div id="tabs">
              <ul>
                  <li><a href="tab1.html">tab1</a></li>
                  <li><a href="tab2.html">tab2</a></li>
                  <li><a href="tab3.html">tab3</a></li>
              </ul>
             </div>
             <div class="content">
                
          </div>
      </div>
      <div class="main_right">
          <div id="accordion">
              <h3>菜单1</h3>
              <div><p>内容1</p><p>内容2</p></div>
              <h3>菜单2</h3>
              <div><p>内容3</p><p>内容4</p></div>
              <h3>菜单3</h3>
              <div><p>内容5</p><p>内容6</p></div>
           </div>
        
       </div>     




</div>




<c:import url="common/bottom.do"></c:import>