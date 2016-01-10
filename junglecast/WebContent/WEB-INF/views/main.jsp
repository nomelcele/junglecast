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