<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#headerBody{float:left; margin : 0; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
	#wrapper{float:left; width : 100%; line-height:50px; background : #00a1ff none repeat 0 0 scroll; position : fixed; z-index: 500;}
	#header{height:50px; margin : 0 auto; max-width: 1280px; position: relative;}
	#logo{background: url("resources/images/topbarImg/pikicast_white.png") no-repeat 0px 10px; float:left;
			background-size: 90% auto; height : 50px; width : 115px; margin : auto 30px;}
	#search{float:left; background-color: #3cb5fc; position:relative; top : 10px; width: auto; left:10%;}
	#search_input{width : 310px; border : medium none;  line-height: 25px; float:left; background-color: rgba(60,181,252,0.5); color:white;}
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
	
	
</style>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#logo').click(function(){
			alert("clicked");
		});
		$('#write_icon').click(function(){
			alert("clicked");
		});
		$('#menu_icon').click(function(){
			alert("clicked");
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
</header>

</body>
</html>