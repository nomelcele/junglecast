<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/leftMenu.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/leftMenu.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<link href="resources/css/article.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
#search_total_wrapper{position : relative; margin : 50px auto 0; height:100%; width:100%; max-width:1280px; background: #f1f1f2;}
#search_info_list_container{position:relative; margin:0 auto; width:986px; height:100%; float:left;}
#search_info_container{position:fixed; margin:0 auto; padding:10px; width:966px; z-index:550; background: #f1f1f2;}
	.search_input_container{position:relative; width:100%; padding:10px 0 0; text-align: center; height:100px; background:#fff; border:1px solid #e6e7e8; }
	.search_input_container div{position:relative; width:65%; margin:25px auto 0; height:28px; border:2px solid #00a6de;}
	.search_input_container div input {width:80%; height:20px; line-height:20px; float:left; border:none; outline:medium none;}
	.search_blue_btn{float:right; margin:3px 5px 0 0; display:block; width:22px; height:22px; background:url("resources/images/searchImg/search_btn_blue.png") no-repeat; background-size : 80% auto; cursor:pointer;}
.search_section_container{position:relative; margin-top:5px; width:100%; padding:10px 0 0; height:50px; background: #fff; border:1px solid #e6e7e8;}
.search_section_container>div{margin:14px auto 0; width:460px; height:100%;}
.aSection{margin:0 auto; float:left; font-weight:bold; color:#919396; display:inline-block; text-align: center; width:220px; height:36px; line-height: 100%; margin-left:10px; cursor: pointer;}
.section_selected{color: #00a5dd; border-bottom : 3px solid #00a5dd}

#search_list_container{position:relative; margin:196px 0 0 10px; background: #fff; width:946px; height:100%;
				border:1px solid #e6e7e8; padding:10px; display:block; overflow:hidden; display:none;}
#search_list_container li{list-style-type: none;}
.scroll_area_container{width:100%; height:100%;}
.scroll_area_container>ul{padding:0 14px;}

/*사용자로 검색했을 때*/
.user_li{height:100px;  padding:0; margin:0; width:33%; border-bottom:1px solid #d1d2d4; display:inline-block;}
.aUerContainer{width:100%; height:100%; float:left;}
	.aUserInner{width:100%; height:100%; padding:0.2%; float:left;}
		.aUserImg{width: 85px; height:85px; float:left; overflow:hidden;}
		.aUserImg img{width: 100%; height:auto;}
		.aUserName{float:left; width:50%; height:20px; line-height:20px; margin-left:10px; color:#28a7df; font-size:16px;}
		.aUserIntroduce{float:left; width:50%; height:16px; line-height:16px; font-size:14px; margin:5px 0;margin-left:10px;}

/*이야기로 검색했을 때*/
.contents_li{height:130px; overflow:hidden; padding:25px 15px 15px 0; }
	.aContent_img_area{height:100%; width:20%; float:left; cursor:pointer;}
		.aContent_img_area span{height: 130px; width:90%; float:left; overflow:hidden;}
		.aContent_img_area span img{width:100%; height:auto;}
	.aContent_title_area{height:100%; width:55%; float:left;}
	.aContent_title_area>div{width:100%; margin-left:2%; float:left;}
		.writer_info{height:30px;}
			.writer_profile{height:28px; width:28px; float:left;}
			.writer_profile img{height:100%; width:100%;}
			.writer_nickname{width:80%; height:30px; line-height:30px; margin-left:10px; float:left; font-size:14px; color:#00a6de;}
		.aContent_info{height:70px; }
			.aContent_title{height:33px; width:100%; float:left; margin-top : 10px; font-size:16px; line-height:16px;}
			.aContent_subtitle{height:16px; width:100%; float:left; margin-top:5px; font-size:12px; line-height:16px;}
		.aContent_date{height:14px; margin-top:5px; font-size:12px; color:#929497;}
	.aContent_popularity{width:20%; height: 100%; float:right; padding:0 0 0 14px; border-left:1px solid #e6e7e8;}
		.aContent_popularity ul{margin:0; width:80%; float:left;}
		.aContent_popularity div{width:100%; height:30px; line-height:30px; color:#bbbdc0; font-weight: bold; padding-right:10px; font-size:16px; text-align: right;}
		.aContent_view{background:url("resources/images/detailIcons/articleHits.png") no-repeat 0 10px;}
		.aContent_like{background:url("resources/images/detailIcons/articleLikes.png") no-repeat 0 10px;}
		.aContent_reply{background:url("resources/images/detailIcons/articleReplies.png") no-repeat 0 10px;}
		.aContent_share{background:url("resources/images/detailIcons/articleShares.png") no-repeat 0 5px;}

/*추천검색어*/
#search_recommend_area{width:282px; float:right; height:280px; background:#fff; margin:10px 0 0 996px; position:fixed; overflow:hidden;}
.recommend_title{padding:14px 0 0 20px; width:100%; height:30px; line-height:30px; color:#939597; font-size:16px; font-weight: bold;}
.recommend_keyword{margin-top:14px; width:100%; height:auto;}
.recommend_keyword_inner div{height:30px; line-height:30px; width:100%; padding:0 0 0 20px; cursor:pointer;}
.recommend_keyword_inner div:HOVER{background:#00a6de;}
.recommend_keyword_inner a{text-decoration: none; color:#9c9da0; font-size:12px;}

/*반응형 css*/
@media only screen and (min-width:1280px){
	#left_area{display:none;}
}
@media only screen and (min-width:1024px) and (max-width:1279px){
#header{margin-left: 10px;}
#left_area{display:none;}
#search_recommend_area{display:none;}

	#search_total_wrapper{margin:50px auto; float:left;}
	#search_info_list_container{float:none; width:100%;}
		#search_info_container{width:98%;}
		#search_list_container{background: none; width:100%; border:none; padding:0 10px 0 10px; float:left; margin:196px 0;}
			.scroll_area_container{border:1px solid #e6e7e8; background:#fff; width:98%;}
			
		.aContent_img_area{width:170px;}
}

@media only screen and (min-width:768px) and (max-width:1023px){
#header{margin-left: 50px;}
.user_li{width:49.6%;}
#search_recommend_area{display:none;}
	#search_total_wrapper{margin:50px auto; float:left;}
	#search_info_list_container{width:100%; float:none;}
	#search_info_container{margin-left: 50px;width:92%; float:left;}
	#search_list_container{background: none; width:94%; border:none; padding:0 10px 0 10px; float:left; margin:196px 0 0 50px;}
		.scroll_area_container{border:1px solid #e6e7e8; background:#fff; width:98%;}
		.aContent_img_area{width:170px;}
		.aContent_title_area{width:50%;}
		.aContent_popularity{width:18%;}
		.aContent_popularity ul{width:80%; padding:0 0 0 14px;}
}

@media only screen and (max-width:767px){
.user_li{width:100%;}
.aUserImg{width: 75px; height:75px;}
.aUserImg img{border-radius:5px;}
.aUserName{font-size:14px;}
.aUserIntroduce{font-size:12px;}

#search_recommend_area{width:100%; float:left; height:auto;margin:85px 0; position:relative; background:none; display:none;}
.recommend_title{padding:14px 0 0 14px; width:100%; height:24px; line-height:24px; font-size:14px; color:#404041; margin-top:14px;}
.recommend_keyword{height:100%; margin-top:0;}
.recommend_keyword_inner{width:97%; height:100%; margin:0 auto;}
.recommend_keyword_inner div{height:80px; line-height:80px; display:inline-block; background:#fff; text-align:center; color:#9c9da0; font-size:12px; width:30.5%; padding:0; border:1px solid #e6e7e8; margin:10px 0.5%;}
.recommend_keyword_inner div:HOVER{color:#9c9da0; background:#fff;}

#search_info_list_container{width:100%;}
#search_info_container{padding:0; width:100%;}
	.search_input_container{width:100%; height:60px; padding:0;}
	.search_input_container div{margin:10px auto 0; width:95%;}
	.search_section_container{margin-top:-2px; width:100%; padding:0; height:36px;}
	.search_section_container>div{margin:0 auto; width:100%;}
	.aSection{text-align: center; width:46%; height: 36px; line-height: 36px; margin-left:1%;}
	
#search_list_container{background: none; width:100%; border:none; padding:0; float:left; margin:105px 0; }
	.scroll_area_container{border:1px solid #e6e7e8; background:#fff; width:98%; margin:0 auto;}
	
.scroll_area_container>ul{padding:0 8px; margin:4px 0 0;}
.scroll_area_container>ul>li{height:70px;padding:15px 15px 15px 0; }
	.aContent_img_area{width:110px;}
		.aContent_img_area span{height: 70px; width:95%;}
	.aContent_title_area>div{width:100%; margin-left:2%; float:left;}
		.writer_info{height:16px;}
			.writer_profile{display:none;}
			.writer_nickname{height:16px; line-height:16px; margin-left:0; font-size:12px;}
		.aContent_info{height:32px; margin-top:4px;}
			.aContent_title{height:32px; margin-top : 0; font-size:12px; line-height:14px;}
			.aContent_subtitle{display:none;}
		.aContent_date{height:14px; margin-top:4px; font-size:12px;}	
	.aContent_popularity{display:none;}
}

</style>
<script type="text/javascript">
$(document).ready(function(){
/* 	if(matchMedia("only screen and (min-width:1024px) and (max-width:1279px)").matches){
		$('#header').css("margin-left", "10px");
	} */
	
	if($('#mobile').val() == 'mobile'){
		$('#search_recommend_area').css("display", "block");
	}
	
	//이야기 탭 클릭
	$('#section_story').click(function(){
		$('#section_story').addClass('section_selected');
		$('#section_user').removeClass('section_selected');
		$('.storyORuser').val("story");
		 getSearchedContents($('.search_input_container input').val(), "story", 0);
	});
	//사용자 탭 클릭
	$('#section_user').click(function(){
		$('#section_story').removeClass('section_selected');
		$('#section_user').addClass('section_selected');
		$('.storyORuser').val("user");
		getSearchedContents($('.search_input_container input').val(), "user", 0);
	});

	//좌측 메뉴 열린채로 화면 resize시 메뉴닫음
	$(window).resize(function(){
		$('#left_area').css("display", "none");
		$('.body_cover').css("display", "none");
	});

	$('.search_blue_btn').click(function(){
		getSearchedContents($('.search_input_container input').val(), $('.storyORuser').val(), 0);
	});
	
	$('.recommend_keyword_inner div').hover(function(){
		$(this).find('a').css("color", "white");
	}, function(){
		$(this).find('a').css("color", "#9c9da0");
	});
	
	//페이지 로드 후 검색한 내용으로 다시 db 접근하여 데이터 받아옴
	var storyORuser =  $('.storyORuser').val();
	getSearchedContents($('.search_input_container input').val(), storyORuser, 0);
	
	//콘텐츠 카드 클릭
	$('html body').on('click', '.aContent_img_area', function(){
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
					$("#search_total_wrapper").css("position","fixed"); // 스크롤 시 뒷배경 움직이지 않게
				}
			}
		});
	});
	
    //스크롤 이벤트 캐치하는 함수
	$(window).scroll(function(){
		if($(window).scrollTop() == $(document).height()-$(window).height()){
			loadMore();
		}
	});
});
function loadMore(){
	var loadMore_section = $('.storyORuser').val();
 	$.ajax({
		url: "searchLoadMore",
		type: "POST",
		data: {key: $('#hidden_key').val(), section: loadMore_section, num: $('.scroll_area_container').find('.list_num').length},
		dataType:"JSON",
		async:false,
		success: function(data){
			var cards='';
			if(loadMore_section == 'story'){
				cards += getMoreCardStory(data.cards);
			}else{
				cards += getMoreCardUser(data.cards);
			}
			$('.scroll_area_container ul').append(cards);
		}
	});
}

function getSearchedContents(key, section, num){
	if(key.length>0){
		//모바일 화면일 때 검색하면 추천검색어 div 없앰
		if(matchMedia("only screen and (max-width:767px)").matches){
			$('#search_recommend_area').css("display", "none");
		}
		$.ajax({
			url: "searchKey",
			type: "POST",
			data: {key: key, section: section, num:num},
			success: function(data){
				$('.scroll_area_container>ul').remove();
				$('#search_list_container').css("display", "block");
				$('.scroll_area_container').html(data);
			}
		});
	}
}

function enterEvent(key){
	getSearchedContents(key, $('.storyORuser').val(), 0);
}
function getMoreCardStory(cards){
	var card ='';
	$.each(cards, function(index, entry){
		card +='<li class="contents_li list_num">';
		card +='	<span class="aContent_img_area">';
		card +='		<input type="hidden" value="'+entry.article_id+'">';
		card +='		<span><img src="resources/articleContents/'+entry.pic_url+'"></span>';
		card +='	</span>';
		card +='	<div class="aContent_title_area">';
		card +='		<div class="writer_info">';
		card +='			<span class="writer_profile"><img src="resources/memberImg/'+entry.m_pic+'"></span>';
		card +='			<span class="writer_nickname">'+entry.m_nickname+'</span>';
		card +='		</div>';
		card +='		<div class="aContent_info">';
		card +='			<div class="aContent_title">'+entry.article_title+'</div>';
		card +='			<div class="aContent_subtitle">'+entry.article_subtitle+'</div>';
		card +='		</div>';
		card +='		<div class="aContent_date">'+entry.article_date+'</div>';
		card +='	</div>';
		card +='	<div class="aContent_popularity">';
		card +='		<ul>';
		card +='			<li><div class="aContent_view">'+entry.article_view+'</div></li>';
		card +='			<li><div class="aContent_like">'+entry.article_like+'</div></li>';
		card +='			<li><div class="aContent_reply">'+entry.article_reply+'</div></li>';
		card +='			<li><div class="aContent_share">'+entry.article_share+'</div></li>';
		card +='		</ul>';
		card +='	</div>';
		card +='</li>';
	});
	return card;
}
function getMoreCardUser(cards){
	var card ='';
	$.each(cards, function(index, entry){
		card +='<li class="user_li list_num">';
		card +='	<div class="aUerContainer">';
		card +=		'<div class="aUserInner">';
		card +='			<input type="hidden" value="'+entry.m_id+'">';
		card +='			<div class="aUserImg"><img src="resources/memberImg/'+entry.m_pic+'"></div>';
		card +='			<div class="aUserName">'+entry.m_nickname+'</div>';
		card +='			<div class="aUserIntroduce">'+entry.m_introduce+'</div>';
		card +='		</div>';
		card +='	</div>';
		card +='</li>';
	});
	return card;
}

</script>
</head>
<jsp:include page="../topLeft/header.jsp"></jsp:include>
<body style="background: #f1f1f2">
<div id="modalBox"></div>
<div class="body_cover"></div>
<div id="search_total_wrapper">
	<input type="hidden" value="${mobile }" id="mobile">
	<jsp:include page="../topLeft/leftMenu.jsp"></jsp:include>
	<div id="search_info_list_container">
		<div id="search_info_container">
			<div class="search_input_container">
				<div>
					<input type="text" value="${key }" onkeypress="if(event.keyCode==13){enterEvent(this.value);}">
					<span class="search_blue_btn"></span>
				</div>
			</div>
			<div class="search_section_container">
				<div>
					<input type="hidden" class="storyORuser" value="${section }">
					<c:if test="${section=='story'}">
						<div id="section_story" class="aSection section_selected">이야기</div>
						<div id="section_user" class="aSection">사용자</div>
					</c:if>
					<c:if test="${section=='user'}">
						<div id="section_story" class="aSection">이야기</div>
						<div id="section_user" class="aSection section_selected">사용자</div>
					</c:if>
				</div>
			</div>
		</div>
		<div id="search_list_container">
			<div class="scroll_area_container">
				
			</div>
		</div>
	</div>
	<div id="search_recommend_area">
		<div class="recommend_title">추천 검색어</div>
		<div class="recommend_keyword">
			<div class="recommend_keyword_inner">
				<c:forEach var="aRow" items="${recommend }">
					<div><a href="search?section=story&key=${aRow.search_txt }">${aRow.search_txt }</a></div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</body>
</html>