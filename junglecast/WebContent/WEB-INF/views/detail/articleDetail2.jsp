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
<link rel="stylesheet" type="text/css" href="resources/css/leftMenu.css"/>
<link href="resources/css/article.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/article.js"></script>
<script src="js/leftMenu.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(window).resize(function(){
		resizingEvent();
	});
	
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
	
	
});

//반응형 - 화면크기 바뀔때마다 호출되는 함수
function resizingEvent(){
// 	left_area_positioning();
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
</script>
<body id="main_body">
<div id="main_body_cover"></div>
<jsp:include page="../topLeft/header.jsp"></jsp:include>
<div id="content_area">
<jsp:include page="../topLeft/leftMenu.jsp"></jsp:include>
	<div id="detail" class="modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    <input type="hidden" id="article_id" value="${articleContent.article_id}">
	    <!-- 우측 메뉴 (S) -->
	     <div class="rightMenu">
	     	<div id="articleInfo">
		     		<div id="editorInfo">
			     	  <img class="editorImg" src="resources/memberImg/${editorInfo.m_pic}">
			     	  <h4>${editorInfo.m_nickname}</h4>
			     	  <p class="editorIntro">${editorInfo.m_introduce}</p>
		     	  	</div>
		     	  	<div id="articleStats">
			     	  <ul>
				     	  <li><span class="articleHits">조회수</span><em>${articleContent.article_view}</em></li>
				     	  <li><span class="articleLikes">좋아요</span><em class="articleLikeNumRight">${articleContent.article_like}</em></li>
				     	  <li><span class="articleReplies">댓글</span><em>${articleContent.article_reply}</em></li>
				     	  <li><span class="articleShares">공유</span><em>${articleContent.article_share}</em></li>
				      </ul>
			      </div>
	     	  <!-- 페이스북 좋아요 -->
	     	</div>  
	     </div>
	     <!-- 우측 메뉴 (E) -->
	     
	     <!-- 좌측 콘텐츠 (S) -->
	      <div class="container">
	      	<!-- 제목, 날짜 -->
	      	<div id="articleTitle">
		      	<h2>${articleContent.article_title}</h2>
		        <p id="articleSubTitle">${articleContent.article_subtitle}</p>
		        <p id="articleDate">${articleContent.article_date}</p>
	        </div>
	        
	        <!-- 콘텐츠 통계(모바일) -->
	        <div id="mobileArticleInfo">
	        	<ul>
	        		<li><span class="articleHits"><em>${articleContent.article_view}</em></span></li>
	        		<li><span class="articleLikes"><em class="articleLikeNumRight">${articleContent.article_like}</em></span></li>
	        		<li><span class="articleReplies"><em>${articleContent.article_reply}</em></span></li>
	        		<li><span class="articleShares"><em>${articleContent.article_share}</em></span></li>
	        	</ul>
	        </div>
	        
	        <!-- 작성자 프로필(모바일) -->
	        <div id="mobileEditorInfo">
	        	<div id="editorProfile">
	        		<div id="editorImgBox">
	        			<img class="editorImg" src="resources/memberImg/${editorInfo.m_pic}">
	        		</div>
	        		<p id="editorNameIntro">
	        			<span class="editorName">${editorInfo.m_nickname}</span>
	        			<span class="editorIntro">${editorInfo.m_introduce}</span>
	        		</p>
	        	</div>
	        </div>
	        
  	        <!-- sns 공유 버튼 -->
	        <div id="articleShare">
	        	<a class="likeBtn"><span class="invisible">like</span><em id="articleLikeNum">${articleContent.article_like}</em></a>
	        	<a href="http://www.facebook.com/sharer/sharer.php?u=http://localhost/junglecast/articleDetail?article_id=${articleContent.article_id}&type=link#detail" class="fbBtn" target="_blank"><span class="invisible">fb</span></a>
	        	<a href="https://twitter.com/intent/tweet?text=${articleContent.article_title}&url=http://localhost/junglecast/articleDetail?article_id=${articleContent.article_id}&type=link#detail" class="twBtn" target="_blank"><span class="invisible">tw</span></a>
	        	<a class="linkBtn"><span class="invisible">link</span></a>
	        </div>
	        
	        <!-- 좌측 공유 버튼 -->
	        <div id="verticalShare">
	        	<a class="likeBtn verticalBtn mobileNone"><span class="invisible">like</span></a>
	        	<a href="http://www.facebook.com/sharer/sharer.php?u=http://localhost/junglecast/articleDetail?article_id=${articleContent.article_id}&type=link#detail" class="fbBtn verticalBtn mobileNone" target="_blank"><span class="invisible">fb</span></a>
	        	<a href="https://twitter.com/intent/tweet?text=${articleContent.article_title}&url=http://localhost/junglecast/articleDetail?article_id=${articleContent.article_id}&type=link#detail" class="twBtn verticalBtn mobileNone" target="_blank"><span class="invisible">tw</span></a>
	        	<a class="linkBtn verticalBtn mobileNone"><span class="invisible">link</span></a>
	        	<a class="topBtn verticalBtn"><em>TOP</em></a>
	        </div>
	        
	        <!-- 내용 -->
	        <div id="articleContentBox">
	        	<c:forEach var="articlePicture" items="${articlePicture}">
		        <div class="articleContent">
		        	<img src="resources/articleContents/${articlePicture.pic_url}">
		        	<p class="articleText">${articlePicture.pic_text}</p>
		        </div> 
		        </c:forEach>
	       </div>
	       
	      <!-- 댓글 작성 -->
		       <div class="replyWriteBox">
		       		<div class="replyWrite">
		       			<div class="imgBox">
				       		<img src="resources/memberImg/gildong.jpg">
					    </div>
					    <div class="replyTextBox">
					    	<div class="replyInput">
					    		<textarea id="reply_text" placeholder="내용을 입력해 주세요."></textarea>
				       		</div>
				       		<p class="charNumBox"><span id="currentCharNum">0</span>/160자</p>
				       	</div>
				       	<a id="writeReplyBtn">댓글 등록</a>
		       		</div>
		       </div>
	       
	       <!-- 댓글 목록 -->
	       <div id="replyList">
	       	<ul>
				<c:forEach var="bestReplyList" items="${bestReplyList}">
		       		<li>
			       		<div class="replyContentBox">
			       			<div class="replyImgBox">
		   				       	<img src="resources/memberImg/${bestReplyList.replyWriterPic}">
		   				    </div>
					       	<div class="replyDetail">
					       			<span class="best writerName">${bestReplyList.replyWriterName}</span>
					       			<div class="replyTextArea">
						       			<span class="replyText">${bestReplyList.reply_text}</span>
						       			<span class="replyDate">${bestReplyList.reply_date}</span>
						       		</div>
						       		<div class="replySubDetail">
					       				<a class="likeReplyBtn" href="javascript:likeReply(${bestReplyList.reply_id});">좋아요 ${bestReplyList.reply_like}개</a>
					       				<a class="rereplyBtn" href="javascript:rereplyList(${bestReplyList.reply_id},'best');">답글 ${bestReplyList.rereply_count}개</a>
					       			</div>			       			
					       	</div>
					    </div>
			       		<div class="rereplyList" id="rereplyList${bestReplyList.reply_id}b">
			       		</div>
		       		</li>
		       	</c:forEach>
				<c:forEach var="replyList" items="${replyList}">
		       		<li>
			       		<div class="replyContentBox">
			       			<div class="replyImgBox">
		   				       	<img src="resources/memberImg/${replyList.replyWriterPic}">
		   				    </div>
					       	<div class="replyDetail">
					       			<span class="writerName">${replyList.replyWriterName}</span>
					       			<div class="replyTextArea">
						       			<span class="replyText">${replyList.reply_text}</span>
						       			<span class="replyDate">${replyList.reply_date}</span>
						       		</div>
						       		<div class="replySubDetail">
					       				<a class="likeReplyBtn" href="javascript:likeReply(${replyList.reply_id});">좋아요 ${replyList.reply_like}개</a>
					       				<a class="rereplyBtn" href="javascript:rereplyList(${replyList.reply_id},'normal');">답글 ${replyList.rereply_count}개</a>
					       			</div>			       			
					       	</div>
					    </div>
			       		<div class="rereplyList" id="rereplyList${replyList.reply_id}">
			       		</div>
		       		</li>
		       	</c:forEach>		       	
	       	</ul>
	       </div>
	       
	      </div>
	      <!-- 좌측 콘텐츠 (E) -->
	    </div>
	  </div>

	<div id="copyLink" class="modal link">
		<div class="modal-dialog">
	    	<div class="modal-content link-content">
	    		<div class="link-container">
	    			<div id="linkArea">
			     		<a id="linkCloseBtn">×</a>
			     		<p>아래의 URL을 복사(Ctrl+C)하여 원하는 곳에 붙여넣기(Ctrl+V)하세요.</p>
			     		<input id="articleLink" type="text" value="http://localhost/junglecast/articleDetail?article_id=${articleContent.article_id}&type=link#detail">
	    			</div>
	    		</div>
			</div>
		</div>
	</div>
	</div>
	
</div>
</body>
<style>
#main_body{background:#f1f1f2; margin:0 auto; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
	#content_area{position: relative; margin : 0 auto; height:100%; width:auto; max-width:1280px;}
	#left_area{display:none;}
	
	.modal{background-color:transparent; margin-top:20px; z-index:100;}
	.modal .link{background-color:rgba(0, 0, 0, 0.4);}
	
@media only screen and (min-width:1024px) and (max-width:1279px){
	#header{margin-left:0px;}
	#left_area{display:none;}
	
	#content_area{position: none; margin : 0 0; width:100%; max-width: none;}
	
	.modal{margin-top:50px;}
}
	
@media only screen and (min-width:768px) and (max-width:1023px){
	#content_area{position: none; margin : 0 0; width:100%; max-width: none;}
	
	.modal{margin-top:50px;}
}

@media only screen and (max-width:767px){
	#content_area{position: none; margin : 0 0; width:100%; max-width: none;}
	
	.modal{margin-top:50px;}
}
</style>
</html>