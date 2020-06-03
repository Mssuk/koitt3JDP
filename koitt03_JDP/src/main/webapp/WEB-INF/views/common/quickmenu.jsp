<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- quickmenu -->
		<div id="quick">
			<div class="cart"><a href="#">장바구니</a></div>
			<div class="wish">
				<p class="title">위시 리스트</p>
				
				<div class="list">
					<ul>	
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="images/img/sample_wish.gif" alt="" /></a>
					</ul>
				</div>

				<div class="total">
					<a href="#none" class="wishLeft"><img src="images/btn/wish_left.gif" alt="" /></a>
					 <span class="page">1</span> / <span class="sum">3</span>
					<a href="#none" class="wishRight"><img src="images/btn/wish_right.gif" alt="" /></a>
				</div>

			</div>

			<div class="top"><a href="#">TOP&nbsp;&nbsp;<img src="images/ico/ico_top.gif" alt="" /></a></div>
		</div>
		<script type="text/javascript">
		$(function(){
			
			$(window).scroll(function(){
				var tg = $("div#quick");
				var xg = $("div#container");
				var limit = xg.height()- 500;
				var tmp = $(window).scrollTop();

				if (tmp > limit) {
					tg.css({"position" : "absolute","right" : "-150px","bottom" : "220px","top" : "auto"});
				}
				else {
					tg.css({"position" : "fixed","top" : "314px" , "margin-left" : "940px","right" : "auto"});
				}
			});

		});
		</script>
		<!-- //quickmenu -->