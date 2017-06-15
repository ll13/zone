<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 	<div id="header">
	   	<div class="header_main">
	   	     <h1>MyZone</h1>
	   		
	          <div class="header_button">
                 <button id="blog_btn" class="btn">博客</button>
                 <button id="bbs_btn" class="btn"><a href=bbs.jsp>论坛</a></button>
                 <button id="question_btn" class="btn"><a href=ask.jsp>问答</a></button>
                 <button id="download_btn" class="btn">下载</button>
                 <button id="information_btn" class="btn"><a href=information.jsp>个人主页</a></button>
             </div>
		   	
		   	 <div class="header_member">
                <a href="javascript:void(0)" id="register_a">注册</a>
                <a href="javascript:void(0)" id="user_a">用户</a>               
                |
                <a href="javascript:void(0)" id="login_a">登录</a>
                <a href="javascript:void(0)" id="logout_a">退出</a>
             </div>		
		   	
	   		
   	      </div>
       </div>
       
        <form id="register" title="用户注册" >
          
          <ol class="register_error"></ol>
          
          <p>
             <label for="user">账号:</label>
             <input type="text" name="name" class="text" id="user"/>
             <span class="star">*</span>
          </p>
          <p>
             <label for="user">密码:</label>
             <input type="password" name="pass" class="text" id="pass" />
              <span class="star">*</span>
          </p>
          <p>
             <label for="email">邮箱:</label>
             <input type="text" name="email" class="text" id="email"/>
             <span class="star">*</span>
          </p>
          <p>
             <label for="user">性别:</label>
             <input type="radio" name="sex" value="男" id="male" checked="checked">
                <label for="male">男</label>
             
             <input type="radio" name="sex" value="女" id="female">
                <label for="female">女</label>
             
          </p>
          <p>
             <label for="date">生日:</label>
             <input type="text" name="birthday" readonly="readonly" class="text" id="date"/>
          </p>
     </form>
     
     
     <form id="login" title="用户登录" >
          
          <ol class="login_error"></ol>
          
          <p>
             <label for="user">账号:</label>
             <input type="text" name="name" class="text" id="login_user"/>
             <span class="star">*</span>
          </p>
          <p>
             <label for="user">密码:</label>
             <input type="password" name="pass" class="text" id="login_pass" />
              <span class="star">*</span>
          </p>
          <input type="checkbox" name="expires" id="expires" checked="checked"><label for="expires">登录有效期一周</label>
     </form>
     
     
     
     <div id="loading">数据交互中</div>
     <div id="error">请登录后操作...</div>
     


 
 
       
       