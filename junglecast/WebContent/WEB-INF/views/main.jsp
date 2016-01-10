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
<script src="js/main.js"></script>
<style type="text/css">
#article_img_container{height:288px; width:630px; float: left; border:1px solid #e6e7e8; margin:8px 1px; cursor: pointer;}
		#article_imgs{height: 288px; width: 100%; overflow: hidden; }
		#rank_article_area{height:288px; width:346px; float:right; background: #fff; border:1px solid #e6e7e8; margin:8px 1px;}
			#rank_top{height:30px; line-height:30px; width:310px; margin:4px auto; padding: 2px 8px 0 8px; border-bottom: 1px solid #00a1ff;}
			#rank_text{color:#00a1ff; font-weight: bolder; font-size: 14px; float:left;}
			#rank_time{color:#a5a4a4; font-size:12px; float:right;}
		#rank_content{margin: 4px 0 0 10px;padding: 0 6px 6px 6px; font-size:12px; }
			#rank-list a {color:#a5a4a4;}
			#rank-list a:hover {text-decoration: underline; cursor:pointer;}
			#rank-list {overflow: hidden; width: 280px;height: 240px;margin: 0;}
			#rank-list dt {display: none;}
			#rank-list dd {position: relative;margin: 0;}
			#rank-list ol {position: absolute; top: -30px; left: 0; margin: 0; padding: 0; list-style-type: none; width:100%;}
			#rank-list li {height: 30px;line-height: 30px; width:100%; overflow:hidden;}
			.rank_num{color:#00a1ff; font-size:15px; width:16px; display:inline-block; margin-right:16px; font-weight: bold; text-align: right;}
			
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
	#article_img_container{width:64.5%; margin:0px 0px; border: none;}
	#article_imgs{height: 100%;}
	.skdslider ul.slides li img{width: 100%; height:100%; border:0;}
	#rank_article_area{width:35%; float:right; margin:0px 0px;}
		#rank_top{width:90%;}
}

@media only screen and (min-width:768px) and (max-width:1023px){
	#article_img_container{width:64.5%; height: 230px; margin:0px 0px; border: none;}
	#article_imgs{height: 100%;}
	.skdslider ul.slides li img{width: 100%; height:100%; border:0;}
	#rank_article_area{width:35%; height:230px; float:right; margin:0px 0px; overflow:hidden;}
		#rank_top{width:90%;}
}

@media only screen and (max-width:767px){
	#article_img_container{width:100%; height:36%; margin:0px 0px; border: none;}
	#article_imgs{height: 100%;}
	.skdslider ul.slides li img{width: 100%; height:100%; border:0;}
	#rank_article_area{display:none;}
}

</style>
<script type="text/javascript">

$(document).ready(function(){

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

});

//스크롤 이벤트시 콘텐츠카드 더 로드하는 함수
function loadMore(){
 	$.ajax({
		url: "MainLoadMore",
		type: "POST",
		data: {num: $('.aCard').length},
		dataType:"JSON",
		success: function(data){
			var card='';
			$.each(data.cards, function(index, entry){
				card += '<div class="aCard"><div class="aCard_img_div"><img class="aCard_img" src="resources/articleContents/'+entry.pic_url+'"></div>';
				card += '<input type="hidden" value="'+entry.article_id +'"><div class="aCard_txt">'+ entry.article_title+'</div></div>'
			});
			$('#contents_cards_area').append(card);
		}
	});
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