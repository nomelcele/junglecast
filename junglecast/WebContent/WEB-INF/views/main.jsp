<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/leftMenu.css"/>
<link href="resources/css/article.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
#main_body{background:#f1f1f2; margin:0 auto; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
	#content_area{position: relative; margin : 0 auto; height:100%; width:auto; max-width:1280px;}

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
<script src="js/leftMenu.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	//반응형 자바스크립트
	$(window).resize(function(){
		resizingEvent();
	});
	
	aCardSizingEvent();

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
	cardClickEvent();

});
//콘텐츠 카드 클릭 함수
function cardClickEvent() {
	$('.aCard').click(function(){
		// 게시물 보기
		var articleNum = $(this).find('input').val(); // 게시물 번호
		$.ajax({
			type: "POST",
			url: "articleDetail",
			data: {
				article_id: articleNum,
				type: 'modal'
			},
			success: function(result){
				$("#modalBox").html(result);
				$("#article_id").attr("value",articleNum);
				location.href="#detail";
				if(matchMedia("only screen and (min-width:1280px)").matches){
					$("#articles_area").css("position","fixed"); // 스크롤 시 뒷배경 움직이지 않게
				}
			}
		});
	});	
}

//반응형 - 화면크기 바뀔때마다 호출되는 함수
function resizingEvent(){
	left_area_positioning();
	aCardSizingEvent();
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


//스크롤 이벤트시 콘텐츠카드 더 로드하는 함수
function loadMore(){
	var card='<div class="aCard"><div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>';
	card += '<input type="hidden" value=""><div class="aCard_txt">미리 보는 12월 30일, <br>내일의 별자리 운세</div></div>'
	$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);
	$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);
}

</script>
</head>
<body id="main_body">
<div class="body_cover"></div>
<jsp:include page="./topLeft/header.jsp"></jsp:include>
<div id="modalBox"></div>
<div id="content_area">
	<jsp:include page="./topLeft/leftMenu.jsp"></jsp:include>
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
			<c:forEach var="aRow" items="${contents }">
				<div class="aCard"> 
					<div class="aCard_img_div"><img class="aCard_img" src="resources/articleContents/${aRow.pic_url }"></div>
					<input type="hidden" value="${aRow.article_id }">
					<div class="aCard_txt">${aRow.article_title }</div>
				</div>
			</c:forEach>
		</div>
		<div id="scroll_up">▲<br>TOP</div>		
	</section>
	
</div>
</body>
</html>