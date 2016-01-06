<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="resources/css/article.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
#headerBody{float:left; margin : 0; font-family: Helvetica, 'Dotum', Arial, sans-serif; width:100%; height:auto;}
	#wrapper{float:left; width : 100%; line-height:50px; background : #00a1ff; position : fixed; z-index:500;}
	#header{height:50px; margin : 0 auto; max-width: 1280px; position: relative;}
	#logo{background: url("resources/images/topbarImg/pikicast_white.png") no-repeat 0px 10px; float:left;
			background-size: 90% auto; height : 50px; width : 115px; margin : auto 30px; cursor: pointer;}
	#search{float:left; background-color: #3cb5fc; position:relative; top : 10px; width: auto; left:10%;}
	#search_input{width : 310px; border : medium none; height:25px; line-height: 25px; float:left; background-color: rgba(60,181,252,0.5); color:white;}
	#search_btn{width:36px; height:28px; cursor: pointer; background:url("resources/images/topbarImg/search_btn_skyblue.png") no-repeat; 
					   background-size : 100% auto; position:absolute;}
	#profile_icons{position:relative; float:right; display:inline-block;}
	#login_info{position:absolute; top:10px; right : 110px; height : 30px; width:240px; border-right: 1px solid #80d3ef; display:inline-block; }
	#profile_img{width: 30px; height: 30px; border-radius:15px; float:left;}
	#login_nickname{color:white; float:left;width:120px; height:28px; line-height:28px; vertical-align: top; font-size: 13px; margin-left: 5px;}
	#notice_bell{width:28px; height:30px; background:url("resources/images/topbarImg/bell_white.png") no-repeat 0 3px; 
						background-size : 80% auto; float:right; vertical-align:middle; margin-right:7px; }
	#icons{float:right; height:40px; width:100px; position:relative; margin-left:10px; top : 8px;}
	#write_icon{cursor:pointer; width:28px; height:28px; background:url("resources/images/topbarImg/write-icon.png") no-repeat 0 0; display:inline-block; background-size : 100% auto;}
	#menu_icon{cursor:pointer; width:28px; height:28px; background:url("resources/images/topbarImg/menu.png") no-repeat 0 3px; display:inline-block; background-size : 80% auto; margin-left:5px;}
	
	
@media only screen and (min-width:1024px) and (max-width:1279px){
	#header{margin-left : 218px; max-width: none;}
		#search{float:none; background-color: inherit; position:fixed; top : 10px; width: 260px; left:auto; right:20px;}
		#search_input{width : 204px;  position:relative;}
		#search_btn{ position:relative; background:url("resources/images/topbarImg/search_btn.png") no-repeat; background-size : 70% auto; display:block; float:right;}
		#profile_icons, #icons{display:none;}
}
@media only screen and (min-width:768px) and (max-width:1023px){
	#header{margin-left : 50px; max-width: none;}
		#search{float:none; background-color: inherit; position:fixed; top : 10px; width: 260px;; left:auto; right:20px;}
		#search_input{width : 204px; position:relative;}
		#search_btn{ position:relative; background:url("resources/images/topbarImg/search_btn.png") no-repeat; background-size : 70% auto; display:block; float:right;}
		#profile_icons{display:none;}
}
@media only screen and (max-width:767px){
	#header{max-width: none;}
		#search{position:fixed; right:40px; left:auto; float: none;}
		#search_input,#login_info{display:none; }
		#search_btn{background:url("resources/images/topbarImg/search_btn.png") no-repeat; 
					   background-size : 70% auto; display:block;}
		#logo{float:none; margin : 0 auto; display:block;}
		#icons{float:none; height:40px; width:64px; position:fixed; margin-left:0; top : 8px; display:block; left:4px;}
			#write_icon{float:right; position:relative; display:block;}
			#menu_icon{float:left; position:relative; display:block;}
}

.search_option_wrapper{width:348px; z-index:1000; position:fixed; background:white; display:none; border:1px solid #e7e7e8;}
.search_whichpart{width:100%; height: 32px; border-bottom: 1px solid #e7e7e8; color:#808285; padding:10px; font-size: 14px; cursor:pointer;}
.search_which_option{margin-left:10px;border:1px solid #bbbdc0; display:inline-block; border-radius:20px; padding:5px;}
.search_which_option:HOVER{background:#00a1ff; color:white;}
.search_recommend{width:100%; }
.search_recommend>div{color:#939598; font-size:16px; font-weight: bold; height:25px; line-height:25px; margin:10px 0 0 10px;}
.search_recommend ul li a{color:#939598; font-size: 14px; display:block; }

.menu_option_wrapper{width:120px; height:100px; position:fixed; z-index:1000; display:none;}
.menu_arrow{width:100%; height:14px;}
.menu_arrow img{width:auto; height:100%; float:right;}
.logout_menu{float:left; width:100%; height:22px; line-height:22px;background:white; padding:5px; text-align: center; font-size: 14px; 
					border-left: 1px solid #e7e7e8; border-right:1px solid #e7e7e8; border-bottom:1px solid #e7e7e8; cursor: pointer;}
.logout_menu:HOVER{background: #e7e7e8;}
.logout_menu span{width:100%; height:100%; padding:5px; }

</style>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#logo').click(function(){
			location.href="main";
		});
		$('#write_icon').click(function(){
			location.href="writeArticle";
		});
		$('#menu_icon').click(function(){

		});
		
		$('#search').click(function(){
			$('.menu_option_wrapper').css("display","none");
			var pos = $('#search_input').offset();
			$('.search_option_wrapper').css({display:"block", top:pos.top+28+'px', left:pos.left-1+'px'});
			
			//var search_option 
		});
		
		$('#menu_icon').click(function(){
			$('.search_option_wrapper').css("display", "none");
			var menuPos = $('#menu_icon').offset();
			$('.menu_option_wrapper').css({display:"block", top:menuPos.top+30+'px', left:menuPos.left-100+'px'});
		});
		
		$('.logout_menu').click(function(){
			location.href="#";
		});
		
		$('#search_btn').click(function(){
			location.href="search";
		});
		$(window).resize(function(){
			$('.search_option_wrapper').css("display", "none");
			$('.menu_option_wrapper').css("display", "none");
		});
		
	});
</script>
<body id="headerBody">
<header>
	<div id="wrapper"> 
		<div id="header">
			<span id="logo"></span>
			<span id="search">
				<input id="search_input" type="text" placeholder="검색하기"/>
				<span id="search_btn"></span>
			</span>
			<span id="profile_icons">
				<span id="login_info">
					<img src="resources/images/main/kangdongwon.jpg" alt="my profile" id="profile_img">
					<span id="login_nickname">블라블라</span>
					<span id="notice_bell"></span>
				</span>
				<span id="icons">
					<span id="write_icon"></span>
					<span id="menu_icon"></span>
				</span>
			</span>
		</div>
	</div>
	<div class="search_option_wrapper"><!-- document 로딩시 숨김 -->
		<div class="search_whichpart">
			<span>검색 : </span>
			<span class="search_which_option">이야기</span>
			<span class="search_which_option">사용자</span>
		</div>
		<div class="search_recommend">
			<div>추천 검색어</div>
			<ul>
				<li><a></a></li>
			</ul>
		</div>
	</div>
	<div class="menu_option_wrapper">
		<div class="menu_arrow"><img src="resources/images/topbarImg/arrow.png"></div>
		<div class="logout_menu"><span>로그아웃</span></div>
	</div>

</header>

</body>
</html>