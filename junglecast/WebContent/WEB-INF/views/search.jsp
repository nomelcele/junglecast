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
<style type="text/css">
#search_total_wrapper{position : relative; margin : 50px auto 0; height:100%; width:100%; max-width:1280px; background: #f1f1f2;}
#search_info_list_container{position:fixed; margin:0 auto 0; width:986px; height:100%; overflow:hidden; float:left;}
#search_info_container{position:relative; margin:0 auto; padding:10px;}
.search_input_container{position:relative; width:100%; padding:10px 0 0; text-align: center; height:100px; background:#fff; border:1px solid #e6e7e8;}
.search_input_container div{position:relative; width:65%; margin:25px auto 0; height:28px; border:2px solid #00a6de;}
.search_input_container div input {width:80%; height:20px; line-height:20px; float:left; border:none; outline:medium none;}
.search_blue_btn{float:right; margin:3px 5px 0 0; display:block; width:22px; height:22px; background:url("resources/images/searchImg/search_btn_blue.png") no-repeat; background-size : 80% auto;}

.search_section_container{position:relative; margin-top:5px; width:100%; padding:10px 0 0; height:50px; background: #fff; border:1px solid #e6e7e8;}
.search_section_container>div{margin:14px auto 0; width:460px; height:100%;}
.aSection{margin:0 auto; float:left; font-weight:bold; color:#919396; display:inline-block; text-align: center; width:220px; height:36px; line-height: 100%; margin-left:10px; cursor: pointer;}

#search_list_container{position:fixed; margin-left:10px;width:966px; height:auto; overflow:hidden; border:1px solid #e6e7e8; bottom:10px; z-index:1200; top:244px;}
.list_scroll_area{width:110%; height:100%; overflow-y : scroll; background: #fff;}

#search_recommend_area{width:282px; float:right; height:300px; background:#fff; margin-top:10px;}
#search_recommend_area div{padding:14px 0 0 14px; width:100%; height:24px; line-height:24px; color:#939597; font-size:16px; font-weight: bold;}
.recommend_keyword{}


/*반응형 css*/
@media only screen and (min-width:1024px) and (max-width:1279px){
	#search_recommend_area{display:none;}
	#search_info_list_container{float:none; width:100%;}
	#search_list_container{width:98%;}
}

@media only screen and (min-width:768px) and (max-width:1023px){

}

@media only screen and (max-width:767px){


}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#section_story').click(function(){
		$('#section_user').css({color: '#919396', borderBottom:'none'});
		$(this).css({color: '#00a5dd', borderBottom : '3px solid #00a5dd'});
	});
	$('#section_user').click(function(){
		$('#section_story').css({color: '#919396', borderBottom:'none'});
		$(this).css({color: '#00a5dd', borderBottom : '3px solid #00a5dd'});
	});
});
</script>
</head>
<jsp:include page="./header.jsp"></jsp:include>
<body style="background: #f1f1f2">
<div id="search_total_wrapper">
	<div id="search_info_list_container">
		<div id="search_info_container">
			<div class="search_input_container">
				<div>
					<input type="text">
					<span class="search_blue_btn"></span>
				</div>
			</div>
			<div class="search_section_container">
				<div>
					<div id="section_story" class="aSection">이야기</div>
					<div id="section_user" class="aSection">사용자</div>
				</div>
			</div>
		</div>
		<div id="search_list_container">
			<div class="list_scroll_area">
			
			</div>
		</div>
	</div>
	<div id="search_recommend_area">
		<div>추천 검색어</div>
		<div class="recommend_keyword"></div>
	</div>
</div>
</body>
</html>