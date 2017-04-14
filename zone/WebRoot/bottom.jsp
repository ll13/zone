  
     
       
   <div id="footer" >
       <div id="footer_up">
           <div class="footer_up_block">
               <div class="footer_up_block_ad">
                    <a href="#">关于空间</a>
               </div>
                <div class="footer_up_block_ad">
                    <a href="#">联系我们</a>
               </div>
                <div class="footer_up_block_ad">
                    <a href="#">版权声明</a>
               </div>
                <div class="footer_up_block_ad">
                    <a href="#">其他</a>
               </div>
           </div>
       </div>
       <div id="footer_down">
       		<div class="copyright">
       		    copyright &nbsp;@&nbsp;
       		    <a href="#" >我的空间 </a>
       		</div>
           
       
       </div>
      
    </div>
      
</body>
</html>

<script type="text/javascript">
						// Window load event used just in case window height is dependant upon images
						$(window).bind("load", function() {
							var footerHeight = 0,
									footerTop = 0,
									$footer = $("#footer");
							positionFooter();
							//定义positionFooter function
							function positionFooter() {
								//取到div#footer高度
								footerHeight = $footer.height();
								//div#footer离屏幕顶部的距离
								footerTop = ($(window).scrollTop()+$(window).height()-footerHeight)+"px";
								/* DEBUGGING STUFF
									console.log("Document height: ", $(document.body).height());
									console.log("Window height: ", $(window).height());
									console.log("Window scroll: ", $(window).scrollTop());
									console.log("Footer height: ", footerHeight);
									console.log("Footer top: ", footerTop);
									console.log("-----------")
								*/
								//如果页面内容高度小于屏幕高度，div#footer将绝对定位到屏幕底部，否则div#footer保留它的正常静态定位
								if ( ($(document.body).height()+footerHeight) < $(window).height()) {
									$footer.css({
										position: "absolute"
									}).stop().animate({
										top: footerTop
									});
								} else {
									$footer.css({
										position: "static"
									});
								}
							}
							$(window).scroll(positionFooter).resize(positionFooter);
						});
				</script>