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

<style type="text/css">
#main_body{background:#f1f1f2; margin:0 auto; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
#main_body_cover{background:rgba(18,18,18,0.8); margin:0,0; z-index:600; display:none; width:100%; height:100%; position:fixed;}
	a{text-decoration:none;}
	#content_area{position: relative; margin : 0 auto; height:100%; width:auto; max-width:1280px;}
	#left_area{position:fixed; width: 284px; height:100%; z-index:700; top:50px;}
		#profile_card{width:282px; height: 287px; background:#fff; border:1px solid #e6e7e8; display:block; margin:8px 0; text-align: center;}
			#goto_profile{width:18px; height: 18px; position: absolute; left: 256px; top:16px; cursor: pointer;}
			#profile_card_img{width: 100px; height:100px; border-radius:50px; display: block; margin:28px auto 20px; }
			#my_nickname{width:282px; line-height: 15px; color:#2ba9e0; font-size: 14px; margin:5px 0; font-weight: bold;}
			#my_introduce{width:282px; line-height: 15px; color:#a5a4a4; font-size: 13px; margin:0 0 10px;}
			#go_write_page{margin:18px auto 10px; background:url("resources/images/main/icons/write-icon-blue.png") no-repeat 5px 5px; background-size : auto 70%; text-align:right; 
								display:block; width:100px; height:26px; line-height: 26px; border:1px solid #00a1ff; padding:2px; border-radius:10px;}
			#go_write_page a{color:#00a1ff;  font-size:13px;}
			#mypage_icons{color:#939597; font-size:13px;}
				#notice_bell_icon{display:none;}
				#mypage_icons a span{height:15px; line-height: 15px; float:right; padding:2px 0;}
			#go_mypage_storage{width:60px; display:inline-block; height:16px; line-height: 16px; text-align:center; }
				#go_mypage_storage img{width:14px; height:16px; margin: 2px 6px 0 0;}
			#go_mypage_record{width:50px; display:inline-block; height:16px; line-height: 16px; text-align:center; margin-left : 10px;}
				#go_mypage_record img{width:15px; height:15px; margin: 2px 6px 0 0;}
		#left_menu{position:fixed; top:350px; bottom:2px; width:282px; background:#fff; border:1px solid #e6e7e8; display:block; margin:8px 0; overflow:hidden;}
		#left_menu_inner{position:relative; margin:4px auto; height:90%; width:340px; overflow-y:scroll;/*  -ms-overflow-style: none;  */}
			#left_menu_home{font-size: 16px; margin:14px 0 12px 10px; font-weight: bold;}
				#left_menu_home a{color:#404041;}
				#left_menu_home a:HOVER{color: #00a6de;}
			#left_menu_categories{background:#fbfbfb; padding: 14px 0 14px 10px;}
			#left_menu_categories>ul>li{list-style: none; margin : 8px 0 8px 0;}
			#left_menu_categories>ul>li>a{color:#4b4b4b; font-size: 14px; margin-left:12px;}
			#left_menu_categories>ul>li>a:HOVER{color: #00a6de;}
			.catogory_icon{width:20px; height:20px; display: inline-block; line-height: 20px;}
			#categories{color: #a0a0a0; font-size:16px; font-weight: bold; }
	#tablet_left_area{display:none;}
	#articles_area{position: relative; width:990px; height: 100%; float:left; margin:50px 0 0 288px; z-index:200;}
		#article_img_container{height:288px; width:630px; float: left; border:1px solid #e6e7e8; margin:8px 1px; cursor: pointer;}
		#article_imgs{height: 288px; width: 100%; overflow: hidden; }
		#rank_article_area{height:288px; width:346px; float:right; background: #fff; border:1px solid #e6e7e8; margin:8px 1px;}
			#rank_top{height:30px; line-height:30px; width:310px; margin:4px auto; padding: 2px 8px 0 8px; border-bottom: 1px solid #00a1ff;}
			#rank_text{color:#00a1ff; font-weight: bolder; font-size: 14px; float:left;}
			#rank_time{color:#a5a4a4; font-size:12px; float:right;}
		#rank_content{margin: 4px 0 0 10px;padding: 0 6px 6px 6px; font-size:12px; }
			#rank-list a {color:#a5a4a4;}
			#rank-list a:hover {text-decoration: underline;}
			#rank-list {overflow: hidden; width: 160px;height: 240px;margin: 0;}
			#rank-list dt {display: none;}
			#rank-list dd {position: relative;margin: 0;}
			#rank-list ol {position: absolute; top: -30px; left: 0; margin: 0; padding: 0; list-style-type: none;}
			#rank-list li {height: 30px;line-height: 30px;}
			.rank_num{color:#00a1ff; font-size:15px; width:16px; display:inline-block; margin-right:16px; font-weight: bold; text-align: right;}
		#contents_cards_area{width:100%; height:100%; float:left; }
			.aCard{width:24%; height:230px; float:left; background:#fff; overflow:hidden; margin:4px 3px 4px 4px; border:1px solid #e6e7e8;}
			.aCard_img_div{width:100%; height: 160px; overflow:hidden;}
			.aCard_img{width:100%; height:auto; z-index: 20;}
			.aCard_txt{width:90%; height: 66px; overflow: hidden; z-index: 50; color:#202021; font-size: 14px; padding:10px;}
	#scroll_up{position:fixed; bottom:10px; width:50px; left:50%; margin-left:640px; height: 50px; display: block; background:rgba(18,18,18,0.8); text-align: center; line-height: 22px; color:white; font-size: 14px; cursor: pointer; z-index:500;}	

/*이미지 슬라이더 관련 css*/
.skdslider{width:100%; position: relative; display: block; overflow:hidden; height: 100%;}
.skdslider:after {content: '';padding-top: 50%; display: block;}
.skdslider ul.slides{ margin:0; padding:0; list-style-type:none;}
.skdslider ul.slides li{display: none;}
.skdslider ul.slides li img{width: 100%; height:288px; border:0;}
.skdslider ul.slide-navs {bottom: 50px; left: 50%; position: absolute; list-style-type: none; margin: 0; padding: 0;}
.skdslider ul.slide-navs li {
    float: left; background: url("resources/images/main/imageSlider_icons/slide-bg.png") no-repeat scroll 0 0 transparent;
	height:12px; width:12px; margin-right:4px; cursor:pointer;
}
.skdslider ul.slide-navs li.current-slide {
  background: url("resources/images/main/imageSlider_icons/slide-bg-active.png") no-repeat scroll 0 0 transparent;
}
.skdslider .slide-desc {
    background: url("resources/images/main/imageSlider_icons/slide_desc.png") repeat scroll 0 0 transparent;
    left: 0; padding: 0 15px 0 15px; position: absolute; bottom: 15%; max-width: 85%; display:inline-block;
}
.skdslider a.prev{
    background:url("resources/images/main/imageSlider_icons/left.png") no-repeat scroll 0 0 transparent;
	width:35px; height:35px; display:block; cursor:pointer; position:absolute; top:50%; left:2%; margin-top:-17px;
}
.skdslider a.next{
    background: url("resources/images/main/imageSlider_icons/right.png") no-repeat scroll 0 0 transparent;
	width:35px; height:35px; display:block; cursor:pointer; position:absolute; top:50%; right:2%; margin-top:-17px;
}
/*이미지 슬라이더 관련 css 끝*/

/*반응형 css*/
@media only screen and (min-width:1024px) and (max-width:1279px){
#content_area{position: none; margin : 0 0; width:80%; max-width: none;}
#left_area{position:fixed; width:220px; z-index:700; top:0px; display:block;}
	#profile_card{width:218px; height: 138px; margin:0; padding: 38px 0 4px;}
		#goto_profile{visibility: hidden;}
		#profile_card_img{width: 50px; height:50px; border-radius:25px; margin:0 auto; }
  		#my_nickname{width:216px; line-height: 15px; color:#6d6e71; font-size: 13px; margin:10px 0 0;}
  		#my_introduce{display: none;}
  		#go_write_page{margin:14px 64px 4px; background:url("resources/images/main/icons/write-icon-blue.png") no-repeat 2px 0; background-size : auto 94%; text-align:center; 
								display:block; width:110px; height:15px; line-height: 15px; border:none; padding:0;}
		#go_write_page a:HOVER{font-weight: bold;}
	#left_menu{top:182px; bottom:0px; width:218px; margin:0 0;  z-index:1000; }
	#left_menu_inner{position:relative; margin:4px auto; height:90%; width:250px; }
		#left_menu_home{font-size: 15px; margin:12px 0 8px 16px; font-weight: bold;}
		#left_menu_categories{padding: 12px 0 12px 16px; font-size: 15px;}
			#categories{font-size:15px; color:black;}
			#left_menu_categories>ul>li{ margin : 6px 0 6px -4px;}
#articles_area{width:100%; margin-left:220px;}
	#article_img_container{width:64.5%; margin:0px 0px; border: none;}
	#article_imgs{height: 100%;}
	.skdslider ul.slides li img{width: 100%; height:100%; border:0;}
	#rank_article_area{width:35%; float:right; margin:0px 0px;}
		#rank_top{width:90%;}
	#contents_cards_area{}
		.aCard{width:24%; height: auto; margin:3px 0.3% 3px 0.3%;}
		.aCard_img_div{ height: 60%; }
		.aCard_img{height:auto;}

#scroll_up{bottom:2px; left:auto; right:2px; margin-left:0; }
}

@media only screen and (min-width:768px) and (max-width:1023px){
	#left_area{display:none;position:fixed; width:220px; z-index:700; top:0px;}
	#profile_card{width:218px; height: 138px; margin:0; padding: 38px 0 4px;}
		#goto_profile{visibility: hidden;}
		#profile_card_img{width: 50px; height:50px; border-radius:25px; margin:0 auto; }
  		#my_nickname{width:216px; line-height: 15px; color:#6d6e71; font-size: 13px; margin:10px 0 0;}
  		#my_introduce{display: none;}
  		#go_write_page{margin:14px 64px 4px; background:url("resources/images/main/icons/write-icon-blue.png") no-repeat 2px 0; background-size : auto 94%; text-align:center; 
								display:block; width:110px; height:15px; line-height: 15px; border:none; padding:0;}
		#go_write_page a:HOVER{font-weight: bold;}
	#left_menu{top:182px; bottom:0px; width:218px; margin:0 0;  z-index:1000; }
	#left_menu_inner{position:relative; margin:4px auto; height:90%; width:250px; }
		#left_menu_home{font-size: 15px; margin:12px 0 8px 16px; font-weight: bold;}
		#left_menu_categories{padding: 12px 0 12px 16px; font-size: 15px;}
			#categories{font-size:15px; color:black;}
			#left_menu_categories>ul>li{ margin : 6px 0 6px -4px;}
	#tablet_left_area{z-index:600; display:block; width:50px; background:#fff; border-right:1px solid #e6e7e8; position: fixed; margin:0 0; top:0; height: 100%;}
		#tablet_aside_menu_icon{width: 50px; height: 50px; float: left; background: #00a1ff;  border-color:#40b8e1; cursor:pointer;}
		#tablet_aside_menu_icon>div{width:100%; height: 100%; background:url("resources/images/topbarImg/menu.png") no-repeat 14px 14px; display:inline-block; background-size : 40% 40%;}
		#tablet_aside_icons{float:left; display:block; height: auto; width: 100%;}
			#tablet_aside_icons ul{ list-style-type: none; margin:0;}
			#tablet_aside_icons ul li{height: 35px; line-height: 35px; margin:10px auto 2px;;}
			#tablet_aside_icons ul li span{width:100%; height:100%; display: inline-block;}
			#aside_profile_icon{width:34px; height: 34px; border-radius:17px; margin : 0 0 0 8px;}
			#aside_storage_icon{background:url("resources/images/main/icons/storagebox_icon.png") no-repeat 15px 8px; background-size: 36% 50%;}
			#aside_record_icon{background:url("resources/images/main/icons/Clock_icon.png") no-repeat 13px 0; background-size: auto 54%;}
#content_area{position: none; margin : 0 0; width:94%; max-width: none;}
#articles_area{width:100%; margin-left:50px;}
	#article_img_container{width:64.5%; height: 230px; margin:0px 0px; border: none;}
	#article_imgs{height: 100%;}
	.skdslider ul.slides li img{width: 100%; height:100%; border:0;}
	#rank_article_area{width:35%; height:230px; float:right; margin:0px 0px; overflow:hidden;}
		#rank_top{width:90%;}
		
		.aCard{width:32.4%; height:auto; margin:3px 0.2% 3px 0.2%;}
		.aCard_img_div{ height: 65%;}
		.aCard_img{height:auto;}
#scroll_up{bottom:2px; left:auto; right:2px; margin-left:0; }
}

@media only screen and (max-width:767px){
	#left_area{display:none; position:fixed; width:75%; z-index:700; top:0px;}
	#profile_card{width:100%; height: auto; margin:0; padding: 38px 0 4px;}
		#goto_profile{visibility: hidden;}
		#profile_card_img{width: 50px; height:50px; border-radius:25px; margin:0 auto; }
		#my_nickname{width:100%; line-height: 16px; color:black; font-size: 13px; margin:8px 0 5px; font-weight: bold;}
  		#my_introduce{width:100%; line-height: 15px; height:28px; color:#939597; font-size: 13px; margin:6px 0 0; border-bottom: 1px solid #BDBDBD;}
  		#go_write_page{ border:none;  margin:14px auto 4px; background:none; text-align:center; 
								display:block; width:100px; height:24px; line-height: 24px; border:1px solid #939597; border-radius:1px; padding:0;}
		#go_write_page a{color:black;}
		
		#mypage_icons{color:#939597; font-size:13px;width:100%; height:50px; margin:10px auto 20px;}
			#mypage_icons a{width:40px; display:inline-block; height:50px; line-height: 16px; text-align:center; }
			#mypage_icons a span{height:15px; line-height: 15px; float:left; padding:2px 0; width:100%;}
		#go_mypage_storage{margin:0 auto;}
			#go_mypage_storage img{width:14px; height:16px; margin: 2px 6px 0 0;}
		#go_mypage_record{margin-left : 10px;}
			#go_mypage_record img{width:15px; height:15px; margin: 2px 6px 0 0;}		
		#notice_bell_icon{margin-left : 10px;}
		#notice_bell_icon img{width:15px; height:15px; margin: 2px 6px 0 0;}
		
	#left_menu{top:260px; bottom:0px; width:75%; margin:0 0;  z-index:1000; }
	#left_menu_inner{position:relative; margin:4px auto; height:90%; width:120%; }
		#left_menu_home{font-size: 15px; margin:12px 0 8px 16px; font-weight: bold;}
		#left_menu_categories{padding: 12px 0 12px 16px; font-size: 15px;}
			#categories{font-size:15px; color:black;}
			#left_menu_categories>ul>li{ margin : 6px 0 6px -4px;}
#content_area{position: none; margin : 0 0; width:100%; max-width: none;}
#articles_area{width:100%; margin-left:0px;}
	#article_img_container{width:100%; height:36%; margin:0px 0px; border: none;}
	#article_imgs{height: 100%;}
	.skdslider ul.slides li img{width: 100%; height:100%; border:0;}
	#rank_article_area{display:none;}

		.aCard{width:48.5%; height:auto;margin:3px 0.3% 3px 0.3%;}
		.aCard_img_div{ height: 65%; }
		.aCard_img{height:auto;}
		.aCard_txt{padding:5px;}
#scroll_up{bottom:2px; left:auto; right:2px; margin-left:0; }
}

</style>	
<script src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	//반응형 자바스크립트
	$(window).resize(function(){
		resizingEvent();
	});
	
	aCardSizingEvent();
	
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
	
	//이미지 슬라이더
	$('#demo2').skdslider({
		'delay' : 3000,
		'animationSpeed' : 1000,
		'showNextPrev' : true,
		'showPlayButton' : false,
		'autoSlide' : true,
		'animationType' : 'sliding'
	});
	$('#responsive').change(function() {
		$('#responsive_wrapper').width(jQuery(this).val());
	});
	
    var count = $('#rank-list li').length;
    var height = $('#rank-list li').height();
    step(1);
    
    //베스트 게시물 애니메이션
    function step(index) {
        $('#rank-list ol').delay(2000).animate({
        	top: -height * index,
        }, 500, function() {
        	$first_child = $('#rank-list li:first-child');
        	$first_child.remove();
        	if($first_child.attr('class') != 'empty'){
        		$('#rank-list ol').append('<li>'+$first_child.html()+'</li>');
        	}
            step((index) % count);
        });
    }

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
	
	//콘텐츠 카드 클릭 버튼
	$('.aCard').click(function(){
		// 게시물 보기
		var articleNum = $(this).find('input').val();
		location.href="#detail";
		if(matchMedia("only screen and (min-width:1280px)").matches){
			$("#articles_area").css("position","fixed"); // 스크롤 시 뒷배경 움직이지 않게
		}
	});
	
});

//반응형 - 화면크기 바뀔때마다 호출되는 함수
function resizingEvent(){
	left_area_positioning();
	aCardSizingEvent();
};
function left_area_positioning(display_how){
	var aCard_width = $('.aCard').css("width");
	var aCard_height= Number(aCard_width.replace(/[^\d]/g,"")); 
	if(matchMedia("only screen and (min-width:1280px)").matches){ //대형화면
		$('#left_area').css("display", "block");
	}else if (matchMedia("only screen and (min-width:1024px) and (max-width:1279px)").matches) {//일반 PC 모니터 크기
		if($('#main_body_cover').css("display")=="block"){
			$('#main_body_cover').css("display", "none");
			$('#left_area').css("display", "none");
		}else{
			$('#left_area').css("display", "block");
		}
		
	} else if(matchMedia("only screen and (min-width:768px) and (max-width:1023px)").matches){//태블릿 화면
		if($('#main_body_cover').css("display")=="block"){
			$('#left_area').css("display", "block");
		}else{
			$('#left_area').css("display", "none");
		}
	}else if(matchMedia("only screen and (max-width:767px)").matches){ //모바일 화면
		if($('#main_body_cover').css("display")=="block"){
			$('#left_area').css("display", "block");
		}else{
			$('#left_area').css("display", "none");
		}
		
	}
}

function aCardSizingEvent(){
	var aCard_width = $('.aCard').css("width");
	var aCard_height= Number(aCard_width.replace(/[^\d]/g,""));
	if(matchMedia("only screen and (min-width:1280px)").matches){ //대형화면
		$('#left_area').css("display","block");
	}else if (matchMedia("only screen and (min-width:768px) and (max-width:1279px)").matches) {//일반 PC 모니터 크기 + 태블릿화면
		$('.aCard').css("height", aCard_height);
	}else if(matchMedia("only screen and (min-width:371px) and (max-width:767px)").matches){ //큰 모바일 화면
		$('.aCard').css("height", aCard_height*0.9);
		$('.aCard_img_div').css("height", "65%");
	}else if(matchMedia("only screen and (max-width:370px)").matches){ //작은모바일 화면
		$('.aCard').css("height", aCard_height*1.2);
		$('.aCard_img_div').css("height", "58%");
		
	}
}


//메뉴 아이콘 클릭했을 때 left_area show/hide 함수
function menu_icon_clicked_left_area_showing(){
	$('#left_area').css("display", "block");
	$('#main_body_cover').css("display", "block");
	$('#articles_area').css("position", "fixed");
}
function menu_icon_clicked_left_area_hiding(){
	$('#main_body_cover').css("display", "none");
	$('#left_area').css("display", "none");
	$('#articles_area').css("position", "relative");
}


//스크롤 이벤트시 콘텐츠카드 더 로드하는 함수
function loadMore(){
	var card='<div class="aCard"><div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>';
	card += '<input type="hidden" value=""><div class="aCard_txt">미리 보는 12월 30일, <br>내일의 별자리 운세</div></div>'
	$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);
	$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);
}

</script>
<body id="main_body">
<div id="main_body_cover"></div>
<jsp:include page="./header.jsp"></jsp:include>
<jsp:include page="detail/articleDetail.jsp"/>
<div id="content_area">
	<aside id="left_area">
		<div class="hidden">
			<input type="hidden" value=""> <!-- 로그인정보 들어오는곳 -->
		</div>
		<div id="profile_card">
			<img alt="goto my profile page" src="resources/images/main/icons/gear_icon.png" id="goto_profile">
			<img alt="my profile" src="resources/images/main/kangdongwon.jpg" id="profile_card_img">
			<div id="my_nickname">
				내이름이다
			</div>
			<div id="my_introduce">
				내소개다
			</div>
			<div id="go_write_page"><a href="writeArticle">포스팅하기</a></div>
			<div id="mypage_icons">
				<a id="go_mypage_storage"><img src="resources/images/main/icons/storagebox_icon.png"><span>보관함</span></a>
				<a id="go_mypage_record"><img src="resources/images/main/icons/Clock_icon.png"><span>기록</span></a>
				<a id="notice_bell_icon"><img src="resources/images/main/icons/bell_gray.png"><span>알림</span></a>
			</div>
		</div>
		<div id="left_menu">
			<div id="left_menu_inner">
				<div id="left_menu_home"><a href="#">홈</a></div>
				<div id="left_menu_categories">
					<div id="categories">골라보기</div>
					<ul>
						<c:forEach var="aRow" items="${categories }">
							<li><span class="catogory_icon" style="background-image: url('resources/images/main/icons/${aRow.category_icon}'); background-size:100% 100%;"></span><a href="">${aRow.category_name }</a></li>
						</c:forEach>
					</ul>
				</div>
				</div>
		</div>
	</aside>
	<aside id="tablet_left_area">
		<div id="tablet_aside_menu_icon"><div></div></div>
		<div id="tablet_aside_icons">
			<ul>
				<li><img id="aside_profile_icon" src="resources/images/main/kangdongwon.jpg"></li>
				<li><span id="aside_storage_icon"></span></li>
				<li><span id="aside_record_icon"></span></li>
			</ul>
		</div>

	</aside>
	<script src="js/skdslider.min.js"></script>
	<section id="articles_area">
		<div id="article_img_container">			
			<div id="article_imgs">
				<ul id="demo2">
					<li><img src="resources/images/main/slider1.jpg"></li>
					<li><img src="resources/images/main/slider2.jpg"></li>
					<li><img src="resources/images/main/slider3.jpg"></li>
					<li><img src="resources/images/main/slider4.jpg"></li>
				</ul>
			</div>
		</div>
		<div id="rank_article_area">
			<div id="rank_top">
				<span id="rank_text">BEST</span>
				<span id="rank_time">2015.12.30.12:00</span>
			</div>
			<div id="rank_content">
	            <dl id="rank-list">
	                <dt>Article Ranking</dt>
	                <dd>
	                    <ol>
	                    	<li class="empty"><a href="#"></a></li>
	                        <li><span class="rank_num">1</span><a href="#">aaa</a></li>
	                        <li><span class="rank_num">2</span><a href="#">bbb</a></li>
	                        <li><span class="rank_num">3</span><a href="#">ccc</a></li>
	                        <li><span class="rank_num">4</span><a href="#">ddd</a></li>
	                        <li><span class="rank_num">5</span><a href="#">eee</a></li>
	                        <li><span class="rank_num">6</span><a href="#">fff</a></li>
	                        <li><span class="rank_num">7</span><a href="#"> ggg</a></li>
	                        <li><span class="rank_num">8</span><a href="#">hhh</a></li>
	                        <li><span class="rank_num">9</span><a href="#">iii</a></li>
	                        <li><span class="rank_num">10</span><a href="#">jjj</a></li>
	                        <li><span class="rank_num">11</span><a href="#">kkk</a></li>
	                        <li><span class="rank_num">12</span><a href="#">lll</a></li>
	                        <li><span class="rank_num">13</span><a href="#">mmm</a></li>
	                        <li><span class="rank_num">14</span><a href="#">nnn</a></li>
	                        <li><span class="rank_num">15</span><a href="#">ooo</a></li>
	                    </ol>
	                </dd>
	            </dl>
        	</div>
		</div>
		<div id="contents_cards_area">
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic1.png"></div>
				<input type="hidden" value="1">
				<div class="aCard_txt">미리 보는 12월 30일, <br>내일의 별자리 운세</div>
			</div>
			<div class="aCard"> 
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>
				<div class="aCard_txt">아름다운 우주가 담겨 있는 <br>NASA 인스타그램</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic3.jpg"></div>
				<div class="aCard_txt">아직 준비가 안됐는데 <br>자꾸 재촉하는 남자</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic1.png"></div>
				<div class="aCard_txt">2015년 한 해 가장 많이<br>불법 다운로드된 영화 10</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>
				<div class="aCard_txt">곧 성인되는 진구오빠<br>유정이랑 썸 타던 시절</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic3.jpg"></div>
				<div class="aCard_txt">------------------------------------------------------------!--------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic1.png"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic3.jpg"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic1.png"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic3.jpg"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
		</div>
		<div id="scroll_up">▲<br>TOP</div>		
	</section>
	
</div>
</body>
</html>