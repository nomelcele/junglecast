<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/leftMenu.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
<style>
ul{padding:0;}

#main_body{background:#f1f1f2; margin:0 auto; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
	#content_area{position: relative; margin : 0 auto; height:100%; width:auto; max-width:1280px;}
	
	
@media only screen and (min-width:1024px) and (max-width:1279px){
	#content_area{position: none; margin : 0 0; width:80%; max-width: none;}
}
	
@media only screen and (min-width:768px) and (max-width:1023px){
	#content_area{position: none; margin : 0 0; width:94%; max-width: none;}
	
}

@media only screen and (max-width:767px){
	#content_area{position: none; margin : 0 0; width:100%; max-width: none;}
	
}
</style>
<script src="js/leftMenu.js"></script>
<script>
$(document).ready(function(){
	//반응형 자바스크립트
	$(window).resize(function(){
		resizingEvent();
	});
	
});

//반응형 - 화면크기 바뀔때마다 호출되는 함수
function resizingEvent(){
	left_area_positioning();
};
function left_area_positioning(){
	if(matchMedia("only screen and (min-width:1280px)").matches){ //대형화면
		$('#left_area').css("display", "block");
	}else if (matchMedia("only screen and (min-width:1024px) and (max-width:1279px)").matches) {//일반 PC 모니터 크기
		if($('.body_cover').css("display")=="block"){
			$('.body_cover').css("display", "none");
			$('#left_area').css("display", "none");
		}else{
			$('#left_area').css("display", "block");
		}
		
	} else if(matchMedia("only screen and (min-width:768px) and (max-width:1023px)").matches){//태블릿 화면
		if($('.body_cover').css("display")=="block"){
			$('#left_area').css("display", "block");
		}else{
			$('#left_area').css("display", "none");
		}
	}else if(matchMedia("only screen and (max-width:767px)").matches){ //모바일 화면
		if($('.body_cover').css("display")=="block"){
			$('#left_area').css("display", "block");
		}else{
			$('#left_area').css("display", "none");
		}
		
	}
}

</script>
</head>
<body id="main_body">
	<div id="main_body_cover"></div>
	<jsp:include page="topLeft/header.jsp"></jsp:include>
	<div id="content_area">
		<jsp:include page="editInfoMenu.jsp"></jsp:include>
		<section id="articles_area">
			<div class="editBox profileBox">
				<h1>프로필</h1>
				<div class="profileImgBox">
					<div>
						<img src="resources/memberImg/gildong.jpg">
					</div>
				</div>
			</div>
			<div class="editBox accountInfoBox">
				<h1>계정정보</h1>
			</div>
			<div class="editBox pwdBox">
				<h1>비밀번호 변경</h1>
			</div>
		</section>
	</div>
</body>
</html>