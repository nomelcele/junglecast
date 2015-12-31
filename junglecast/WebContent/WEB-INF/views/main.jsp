<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#main_body{background:#f1f1f2; margin:0 auto; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
	a{text-decoration:none;}
	#content_area{position: relative; margin : 0 auto; height:100%; width:auto; max-width:1280px; display:block; z-index:200;}
	#left_area{position:fixed; width: 284px; height:100%; z-index:190; top:50px;}
		#profile_card{width:282px; height: 287px; background:#fff; border:1px solid #e6e7e8; display:block; margin:8px 0; text-align: center;}
			#goto_profile{width:18px; height: 18px; position: absolute; left: 256px; top:16px; cursor: pointer;}
			#profile_card_img{width: 100px; height:100px; border-radius:50px; display: block; margin:28px auto 20px; }
			#my_nickname{width:282px; line-height: 15px; color:#2ba9e0; font-size: 14px; margin:5px 0; font-weight: bold;}
			#my_introduce{width:282px; line-height: 15px; color:#a5a4a4; font-size: 13px; margin:0 0 10px;}
			#go_write_page{margin:18px auto 10px; background:url("resources/images/main/icons/write-icon-blue.png") no-repeat 5px 5px; background-size : auto 70%; text-align:right; 
								display:block; width:100px; height:26px; line-height: 26px; border:1px solid #00a1ff; padding:2px; border-radius:10px;}
			#go_write_page a{color:#00a1ff;  font-size:13px;}
			#mypage_icons{color:#939597; font-size:13px;}
			#go_mypage_storage{background:url("resources/images/main/icons/storagebox_icon.png") no-repeat 0 0; background-size : auto 90%; width:60px; display:inline-block; line-height: 15px; text-align:right; }
			#go_mypage_record{background:url("resources/images/main/icons/Clock_icon.png") no-repeat 0 0; background-size : auto 90%; width:50px; display:inline-block; line-height: 15px; text-align:right; margin-left : 10px;}
		#left_menu{width:282px; background:#fff; border:1px solid #e6e7e8; display:block; margin:8px 0; height: 80%;}
		#left_menu_inner{width:100%; height:80%;/*  -ms-overflow-style: none;  */}
			#left_menu_home{font-size: 16px; margin:14px 0 12px 10px; font-weight: bold;}
				#left_menu_home a{color:#404041;}
				#left_menu_home a:HOVER{color: #00a6de;}
			#left_menu_categories{background:#fbfbfb; padding: 14px 0 14px 10px;}
			#left_menu_categories>ul>li{list-style: none; margin : 8px 0 8px -4px;}
			#left_menu_categories>ul>li>a{color:#4b4b4b; font-size: 14px;}
			#left_menu_categories>ul>li>a:HOVER{color: #00a6de;}
			#categories{color: #a0a0a0; font-size:16px; font-weight: bold; }
	#articles_area{width:990px; height: 100%; float:left; left:288px; top:50px; position: relative; z-index:100;}
		#article_img_container{height:288px; width:630px; float: left; border:1px solid #e6e7e8; margin:8px 1px; cursor: pointer;}
		#article_imgs{height: 288px; width: 100%;/* background:url("http://cdnb.pikicast.com/300/2015/12/30/300_171360_1451479540.jpg"); */}
			.article_img{height: 100%; width: 100%; float:left;}
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
		#contents_cards_area{width:100%; height:100%; float:left; left:288px; }
			.aCard{width:24%; float:left; background:#fff; height: 230px; overflow:hidden; margin:4px 3px 4px 4px; border:1px solid #e6e7e8;}
			.aCard_img_div{width:100%; height: 160px; overflow:hidden;}
			.aCard_img{width:100%; height:auto; z-index: 20;}
			.aCard_txt{width:90%; height: 20%; overflow: hidden; z-index: 50; color:#202021; font-size: 14px; padding:10px;}
	#scroll_up{position:fixed; bottom:10px; width:50px; left:50%; margin-left:640px; height: 50px; display: block; background:#747474; text-align: center; line-height: 22px; color:white; font-size: 14px; cursor: pointer; z-index:500;}	

</style>	
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/stalker.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    var count = $('#rank-list li').length;
    var height = $('#rank-list li').height();
    
    step(1);
    
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
    
    //$('.article_img').hide();
    //$('.article_img:first-child').show();
	function imgSlide(){
		
	}
	
	//$('#scroll_up').css('top', $(document).height()-60+'px');
	//scroll event로 글 더 불러오기
	$(window).scroll(function(){
		if($(window).scrollTop() == $(document).height()-$(window).height()){
			loadMore();
		}
	});
	
	$('#scroll_up').click(function(){
		$("html,body").stop().animate({'scrollTop' :0}, 400);
	});
	
});

function loadMore(){
	var card='<div class="aCard"><div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>';
	card += '<div class="aCard_txt">미리 보는 12월 30일, <br>내일의 별자리 운세</div></div>'
	$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);
	$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);$('#contents_cards_area').append(card);
}

</script>

<body id="main_body">
<jsp:include page="./header.jsp"></jsp:include>
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
			<div id="go_write_page"><a href="">포스팅하기</a></div>
			<div id="mypage_icons">
				<a id="go_mypage_storage">보관함</a>
				<a id="go_mypage_record">기록</a>
			</div>
		</div>
		<div id="left_menu">
			<div id="left_menu_inner">
				<div id="left_menu_home"><a href="#">홈</a></div>
				<div id="left_menu_categories">
					<div id="categories">골라보기</div>
					<ul>
						<li><a href="">테스트1</a></li>
						<li><a href="">테스트2</a></li>
						<li><a href="">테스트3</a></li>
						<li><a href="">테스트4</a></li>
						<li><a href="">테스트5</a></li>
						<li><a href="">테스트6</a></li>
						<li><a href="">테스트7</a></li>
						<li><a href="">테스트8</a></li>
						<li><a href="">테스트9</a></li>
						<li><a href="">테스트10</a></li>
					</ul>
				</div>
				</div>
		</div>
	</aside>
	<section id="articles_area">
		<div id="article_img_container">			
			<div id="article_imgs">
				<img class="article_img" src="resources/images/main/slider1.jpg">
				<img class="article_img" src="resources/images/main/slider2.jpg">
				<img class="article_img" src="resources/images/main/slider3.jpg">
				<img class="article_img" src="resources/images/main/slider4.jpg">
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