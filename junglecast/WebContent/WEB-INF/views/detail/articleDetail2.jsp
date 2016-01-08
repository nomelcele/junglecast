<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="resources/css/leftMenu.css"/>
<link href="resources/css/article.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/article.js"></script>
<script src="js/leftMenu.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".closebtn").addClass("invisible");
	location.href="#detail";
	
	//상단바 메뉴 아이콘 클릭시
	$('#menu_icon').click(function(){
		var clientWidth = document.body.clientWidth;
		if(clientWidth<767){
			//left_area 보여줄 함수 호출
			menu_icon_clicked_left_area_showing();
			$(document).click(function(e){
				if(($('#main_body_cover').css("display") == "block") && (e.pageX>clientWidth*0.75)){
					//left_area 숨길 함수 호출
					menu_icon_clicked_left_area_hiding();
				}
			});
		}
	});
	
    //타블렛 화면일 때 메뉴 아이콘 클릭
	$('#tablet_aside_menu_icon').click(function(){
		//left_area 보여줄 함수 호출
		menu_icon_clicked_left_area_showing()
		
		$(document).click(function(e){
			if(($('#main_body_cover').css("display") == "block") && (e.pageX>220)){
				//left_area 숨길 함수 호출
				menu_icon_clicked_left_area_hiding();
			}    
		});
	});

    //스크롤 이벤트 캐치하는 함수
	$(window).scroll(function(){
		if($(window).scrollTop() == $(document).height()-$(window).height()){
			loadMore();
		}
	});

	//Top 버튼
	$('#scroll_up').click(function(){
		$("html,body").stop().animate({'scrollTop' :0}, 400);
	});
	
	
});
</script>
<body id="main_body">
	<div id="main_body_cover"></div>
	<jsp:include page="../topLeft/header.jsp"></jsp:include>
	<div id="content_area">
		<jsp:include page="../topLeft/leftMenu.jsp"></jsp:include>
		<jsp:include page="articleDetail.jsp"></jsp:include>	
	</div>
</body>
<style>
#main_body{background:#f1f1f2; margin:0 auto; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
	#content_area{position: relative; margin : 0 auto; height:100%; width:auto; max-width:1280px;}
	#left_area{display:none;}
	
	.modal{background-color:transparent; margin-top:20px; z-index:100;}
	.modal .link{background-color:rgba(0, 0, 0, 0.4);}
	
@media only screen and (min-width:1024px) and (max-width:1279px){
	#header{margin-left:0px;}
	#left_area{display:none;}
	
	#content_area{position: none; margin : 0 0; width:100%; max-width: none;}
	
	.modal{margin-top:50px;}
}
	
@media only screen and (min-width:768px) and (max-width:1023px){
	#header{margin-left:0px;}
	#content_area{position: none; margin : 0 0; width:100%; max-width: none;}
	#tablet_left_area{display:none;}
	
	.modal{margin-top:50px;}
}

@media only screen and (max-width:767px){
	#content_area{position: none; margin : 0 0; width:100%; max-width: none;}
	
	.modal{margin-top:50px;}
}
</style>
</html>