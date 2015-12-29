<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
body{float:left; margin : 0; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
	#wrapper{float:left; width : 100%; line-height:50px; background : #00a1ff none repeat 0 0 scroll; position : fixed;}
	#header{height:50px; margin : 0 auto; max-width: 1280px; position: relative;}
	#logo{background: url("resources/images/main/pikicast_white.png") no-repeat 0px 10px; float:left;
			background-size: 90% auto; height : 50px; width : 115px; margin : auto 30px;}
	#search{float:left; background-color: #3cb5fc; position:absolute; top : 10px; width: auto;}
	#search_input{width : 310px; border : medium none;  line-height: 25px; float:left; background-color: rgba(60,181,252,0.5); color:white;}
	#search_btn{width:36px; height:28px; cursor: pointer; background:url("resources/images/main/search_btn_skyblue.png") no-repeat; 
					   background-size : 100% auto; position:absolute;}
	#login_info{position:relative; top:10px; height : 30px; line-height: 30px; float:right; right:300px;}
	#prifile_img	{width: 30px; height: 30px; border-radius:15px;}
	#login_nickname{color:white; width:120px; height:28px; line-height:28px; vertical-align: top; font-size: 13px; margin-left: 5px;}
	
	
</style>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#logo').click(function(){
			alert("clicked");
		});
		$('#profile_img').css('width','30px');
		$('#profile_img').css('height','30px');
		$('#profile_img').css('border-radius', '15px');
	});
</script>
<body>
<header>
	<div id="wrapper">
		<div id="header">
			<span id="logo"></span>
			<span id="search">
				<input id="search_input" type="text" placeholder="검색하기"/>
				<span id="search_btn"></span>
			</span>
			<span id="login_info">
				<img src="resources/images/main/kangdongwon.jpg" alt="my profile" id="profile_img">
				<span id="login_nickname">블라블라</span>
			</span>
			
		</div>
	</div>
</header>

</body>
</html>