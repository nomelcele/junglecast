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
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#logo').click(function(){
			location.href="main";
		});
		$('#write_icon').click(function(){
			location.href="writeArticle";
		});
		
		//검색 input 클릭
		$('#search_input').click(function(){
			if($('.search_option_wrapper').css("display") == "none"){
				showSearchOptionDIV();
			}
		});
		
		//검색 아이콘 클릭
		$('#search_btn').click(function(){
			goSearch();
		});
		
		//검색 section고름
		$('.search_which_option').click(function(){
			$('.search_which_option').removeClass('selected');
			$(this).addClass('selected');
		});
		
		//헤더의 메뉴 클릭
		$('#menu_icon').click(function(){	
			if(matchMedia("only screen and (min-width:1280px)").matches){ //대형화면
				var menuPos = $('#menu_icon').offset();
				$('.menu_option_wrapper').css({display:"block", top:40.5+'px', left:menuPos.left-100+'px'});
				$('.search_option_wrapper').css("display", "none");
			}
		});
		
		//로그아웃 클릭
		$('.logout_menu').click(function(){
			location.href="logout";

		});
		//로그인 클릭
		$('.login_menu').click(function(){
			location.href="menu=login";
		});
		

		$(window).resize(function(){
			$('.search_option_wrapper').css("display", "none");
			$('.menu_option_wrapper').css("display", "none");
		});
		
		$(document).click(function(e){
			var pos = $('.search_option_wrapper').offset();
			var menuPos = $('.menu_arrow').offset();
			if(matchMedia("only screen and (min-width:1280px)").matches){
				if(($('.search_option_wrapper').css("display") == "block") && (
						(e.pageX<pos.left) || (e.pageX>pos.left+348)|| (e.pageY>pos.top+256))){
					$('.search_option_wrapper').css("display", "none");
				}
				else 	if(($('.menu_option_wrapper').css("display") == "block") && (
						(e.pageX<menuPos.left) || (e.pageX>menuPos.left+130)|| (e.pageY>90))){
					$('.menu_option_wrapper').css("display", "none");
				}
			}
			else if(matchMedia("only screen and (min-width:768px) and (max-width:1279px)").matches){
				if(($('.search_option_wrapper').css("display") == "block") && (
						(e.pageX<pos.left) || (e.pageX>pos.left+340)|| (e.pageY>pos.top+250))){
					$('.search_option_wrapper').css("display", "none");
				}
			}
		});
	});
	
function showSearchOptionDIV(){
	$.ajax({
		type: "POST",
		url: "recommendKey",
		dataType: "JSON",
		success: function(data){
			var selections='';
			$.each(data.recommend, function(index, entry){
				selections += '<li><a href="search?section=story&key='+entry.search_txt+'">'+entry.search_txt+'</a></li>';
			});
			$('.search_recommend ul').empty();
			$('.search_recommend ul').append(selections);
		}
	});	
	$('.search_which_option').removeClass('selected').eq(0).addClass('selected');
	
	$('.menu_option_wrapper').css("display","none");
	var pos = $('#search_input').offset();
	if(matchMedia("only screen and (min-width:1280px)").matches){
		$('.search_option_wrapper').css({display:"block", top:38+'px', left:pos.left-1+'px'});
	}else if (matchMedia("only screen and (min-width:768px) and (max-width:1279px)").matches) {//일반 PC 모니터 크기 + 태블릿화면
		$('.search_option_wrapper').css({display:"block", top:50+'px', left:pos.left-94+'px'});
	}else if(matchMedia("only screen and (max-width:767px)").matches){ //작은모바일 화면
		$('.search_option_wrapper').css("display","none");
	}
}
function goSearch(){
	var search_key = $('#search_input').val();
	var search_section = $('.selected').text();
	if(search_section == '이야기') search_section = 'story';
	else if(search_section == '사용자') search_section = 'user';
	
	if(matchMedia("only screen and (min-width:768px)").matches){
		if(search_key.length < 1){
			showSearchOptionDIV();
		}else{
			location.href="search?section="+search_section+"&key="+search_key;
		}
	}else if(matchMedia("only screen and (max-width:767px)").matches){
		location.href="searchMobile";
	}
}

</script>
<body id="headerBody">
<header>
	<div id="wrapper"> 
		<div id="header">
			<span id="logo"></span>
			<span id="search">
				<input id="search_input" type="text" placeholder="검색하기"  onkeydown="if(event.keyCode==13){goSearch();}"/>
				<span id="search_btn"></span>
			</span>
  			<c:choose> 
				<c:when test="${m_id == 0 }">
					<span id="profile_icons">
						<span id="login_info">
							<span id="login_txt">로그인 하세요. 더욱 즐거워집니다!</span>
						</span>
						<span id="icons">
							<span id="menu_icon"></span>
						</span>
					</span>
 				</c:when>
				<c:otherwise>
					<span id="profile_icons">
						<span id="login_info">
							<c:choose>
								<c:when test="${userInfo.m_pic==null}">
									<img src="resources/images/joinImg/default_avatar.png"  id="profile_img">
								</c:when>
								<c:otherwise>
									<img src="resources/memberImg/${userInfo.m_pic }" alt="my profile" id="profile_img">
								</c:otherwise>
							</c:choose>
							<span id="login_nickname">${userInfo.m_nickname }</span>
							<span id="notice_bell"></span>
							<span id="write_icon"></span>
						</span>
						<span id="icons">
							<span id="menu_icon"></span>
						</span>
					</span>
 				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="search_option_wrapper"><!-- document 로딩시 숨김 -->
		<div class="search_whichpart">
			<div>
				<span>검색 : </span>
				<span class="search_which_option">이야기</span>
				<span class="search_which_option">사용자</span>
			</div>
		</div>
		<div class="search_recommend">
			<div>추천 검색어</div>
			<ul>

			</ul>
		</div>
	</div>
	<div class="menu_option_wrapper">
		<div class="menu_arrow"><img src="resources/images/topbarImg/arrow.png"></div>
		 <c:choose> 
			<c:when test="${m_id == 0 }">
				<div class="login_menu"><span>로그인</span></div>
			</c:when>
			<c:otherwise>
				<div class="logout_menu"><span>로그아웃</span></div>
			</c:otherwise>
		</c:choose>
	</div>

</header>

</body>
</html>