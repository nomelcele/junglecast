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
<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<link href="resources/css/article.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/leftMenu.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	//반응형 자바스크립트
	$(window).resize(function(){
		resizingEvent();
	});
	
	aCardSizingEvent();

	//베스트 게시물 기준일(오늘)
    var date = new Date();
    var bestArticle_Date =  date.getFullYear() + "." +  date.getMonth()+1 + "." + date.getDate();
    $('#rank_time').text(bestArticle_Date);
	
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
	
	//콘텐츠 카드 클릭
	$('html body').on('click', '.aCard', function(){
		// 게시물 보기
		var articleNum = $(this).find('input').val(); // 게시물 번호
		alert(articleNum);
		clickedContent(articleNum);
	});
	
});

function clickedContent(articleNum){
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
				<span id="rank_time"></span>
			</div>
			<div id="rank_content">
	            <dl id="rank-list">
	                <dt>Article Ranking</dt>
	                <dd>
	                    <ol>
	                    	<li class="empty"><a href="#"></a></li>
	                    	<c:set var="cnt" value="1"/>
	                    	<c:forEach var="aRow" items="${bestArticles }" >
	                    		<li><span class="rank_num">${cnt }</span><a onclick="clickedContent(${aRow.article_id})">${aRow.article_title }</a></li>
	                    		<c:set var="cnt" value="${cnt+1 }"/>
	                    	</c:forEach>
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