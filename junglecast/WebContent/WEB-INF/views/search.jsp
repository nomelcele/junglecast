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
				border:1px solid #e6e7e8; padding:10px; display:block; overflow:hidden;}
.scroll_area_container{width:100%; height:100%;}
.scroll_area_container>ul>li{height:280px; background:gray; overflow:hidden; padding:15px;}
	.aContent_img_area{height:100%; width:20%; float:left;}
		.aContent_img_area span{height: 250px; width:80%; margin-top:15px; float:left;}
		.aContent_img_area span img{width:100%; height:auto;}
	.aContent_title_area{height:100%; width:55%; float:left;}
		.writer_info{height:30px; width:100%; margin-left:2%; float:left;}
		.writer_profile{height:30px; width:30px; float:left;}
			.writer_profile img{height:100%; width:100%;}
			.writer_nickname{width:80%; height:30px; line-height:30px; margin-left:10px; float:left;}
		
#search_recommend_area{width:282px; float:right; height:280px; background:#fff; margin:10px 0 0 996px; position:fixed; overflow:hidden;}
.recommend_title{padding:14px 0 0 20px; width:100%; height:30px; line-height:30px; color:#939597; font-size:16px; font-weight: bold;}
.recommend_keyword{margin-top:14px; width:100%; height:auto;}
.recommend_keyword_inner div{height:30px; line-height:30px; color:#9c9da0; font-size:12px; width:100%; padding:0 0 0 20px; cursor:pointer;}
.recommend_keyword_inner div:HOVER{color:white; background:#00a6de;}

/*반응형 css*/
@media only screen and (min-width:1280px){
	#left_area{display:none;}
}
@media only screen and (min-width:1024px) and (max-width:1279px){
#left_area{display:none;}
#search_recommend_area{display:none;}

	#search_total_wrapper{margin:50px auto; float:left;}
	#search_info_list_container{float:none; width:100%;}
		#search_info_container{width:98%;}
		#search_list_container{background: none; width:100%; border:none; padding:0 10px 0 10px; float:left; margin:196px 0;}
			.scroll_area_container{border:1px solid #e6e7e8; background:#fff; width:98%;}
}

@media only screen and (min-width:768px) and (max-width:1023px){
#search_recommend_area{display:none;}
	#search_total_wrapper{margin:50px auto; float:left;}
	#search_info_list_container{width:100%; float:none;}
	#search_info_container{margin-left: 50px;width:92%; float:left;}

		#search_list_container{background: none; width:94%; border:none; padding:0 10px 0 10px; float:left; margin:196px 0 0 50px;}
		.scroll_area_container{border:1px solid #e6e7e8; background:#fff; width:98%;}

}

@media only screen and (max-width:767px){
#search_recommend_area{width:100%; float:left; height:auto;margin:60px 0; position:relative; background:none;}
.recommend_title{padding:14px 0 0 14px; width:100%; height:24px; line-height:24px; font-size:14px; color:#404041; margin-top:14px;}
.recommend_keyword{height:100%; margin-top:0;}
.recommend_keyword_inner{width:97%; height:100%; margin:0 auto;}
.recommend_keyword_inner div{height:80px; line-height:80px; display:inline-block; background:#fff; text-align:center; color:#9c9da0; font-size:12px; width:30.5%; padding:0; border:1px solid #e6e7e8; margin:10px 0.5%;}
.recommend_keyword_inner div:HOVER{color:#9c9da0; background:#fff;}


#search_info_list_container{width:100%;}
#search_info_container{padding:0; width:100%;}
	.search_input_container{width:100%; height:60px; padding:0;}
	.search_input_container div{margin:10px auto 0; width:95%;}
	.search_section_container{margin-top:-2px; width:100%; padding:0; height:36px; display:none;}
	.search_section_container>div{margin:0 auto; width:100%;}
	.aSection{text-align: center; width:46%; height: 36px; line-height: 36px; margin-left:1%;}
	
#search_list_container{background: none; width:100%; border:none; padding:0; float:left; margin:110px 0; display:none;}
	.scroll_area_container{border:1px solid #e6e7e8; background:#fff; width:98%; margin:0 auto;}
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	if(matchMedia("only screen and (min-width:1024px) and (max-width:1279px)").matches){
		$('#header').css("margin-left", "10px");
	}
	$(window).resize(function(){
		if(matchMedia("only screen and (min-width:1280px)").matches){
			$('#header').css("margin", "0 auto");
		}else if(matchMedia("only screen and (min-width:1024px) and (max-width:1279px)").matches){
			$('#header').css("margin-left", "10px");
		}else if(matchMedia("only screen and (min-width:768px) and (max-width:1023px)").matches){
			$('#header').css("margin-left", "50px");
		}
	});
	$('#section_story').click(function(){
		$('#section_story').addClass('section_selected');
		$('#section_user').removeClass('section_selected');
	});
	$('#section_user').click(function(){
		$('#section_story').removeClass('section_selected');
		$('#section_user').addClass('section_selected');
	});

	//좌측 메뉴 열린채로 화면 resize시 메뉴닫음
	$(window).resize(function(){
		$('#left_area').css("display", "none");
		$('.body_cover').css("display", "none");
	});

});
</script>
</head>
<jsp:include page="./topLeft/header.jsp"></jsp:include>
<body style="background: #f1f1f2">
<div class="body_cover"></div>
<div id="search_total_wrapper">
	<jsp:include page="./topLeft/leftMenu.jsp"></jsp:include>
	<div id="search_info_list_container">
		<div id="search_info_container">
			<div class="search_input_container">
				<div>
					<input type="text" value="${key }">
					<span class="search_blue_btn"></span>
				</div>
			</div>
			<div class="search_section_container">
				<div>
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
				<ul>
					<li><!-- 콘텐츠하나 -->
						<span class="aContent_img_area"><!-- 이미지 영역 -->
							<span><img src="resources/images/main/testpic3.jpg"></span><!-- 이미지 틀 -->
						</span>
						<div class="aContent_title_area"><!-- 제목 간단내용 영역 -->
							<div class="writer_info"><!-- 작성자정보 -->
								<span class="writer_profile"><img src="resources/images/main/kangdongwon.jpg"></span><!-- 프사 -->
								<span class="writer_nickname">내닉넴</span><!-- 닉넴 -->
							</div>
							<div><!-- 제목과 설명 -->
								<div>제목</div>
								<div>설명</div>
							</div>
							<div>2016-01-07</div>
						</div>
						<div><!-- 좋아요 공유 등 부가 정보 -->
							<ul>
								<li><span>뷰</span></li>
								<li><span>좋아요</span></li>
								<li><span>댓글</span></li>
								<li><span>공유</span></li>
							</ul>
						</div>
					</li>
				</ul>

			</div>
		</div>
	</div>
	<div id="search_recommend_area">
		<div class="recommend_title">추천 검색어</div>
		<div class="recommend_keyword">
			<div class="recommend_keyword_inner">
				<div>추천검색어1</div>
				<div>추천검색어2</div>
				<div>추천검색어3</div>
				<div>추천검색어4</div>
				<div>추천검색어5</div>
				<div>추천검색어6</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>