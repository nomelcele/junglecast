<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* Add animation (Chrome, Safari, Opera) */
@-webkit-keyframes example {
    from {top:-100px;opacity: 0;} to {top:0px;opacity:1;}
}

/* Add animation (Standard syntax) */
@keyframes example {
    from {top:-100px;opacity: 0;} to {top:0px;opacity:1;}
}

ul {
	padding:0;
}
/* The modal's background */
.modal {
  display: none; position: fixed; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0, 0, 0);
  background-color: rgba(0, 0, 0, 0.4); padding-top: 50px; padding-bottom: 50px;
}

/* Display the modal when targeted */
.modal:target {
  display: table; /* table*/ position: absolute;
}

/* The modal box */
.modal-dialog {
  display: table-cell; vertical-align: middle;
}

/* The modal's content */
.modal-dialog .modal-content {
  margin: auto; background-color: #f3f3f3; position: relative; padding: 0; outline: 0; border: 1px #777 solid; text-align: justify;
  width: 80%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); 

  /* Add animation */
  -webkit-animation-name: example; /* Chrome, Safari, Opera */ -webkit-animation-duration: 0.5s; /* Chrome, Safari, Opera */
  animation-name: example; animation-duration: 0.5s; 
}

/* The button used to close the modal */
.closebtn {
  text-decoration: none; float: right; font-size: 30px; color: #B6BDC1;
}

.closebtn:hover,
.closebtn:focus {
  color: #000; text-decoration: none;  cursor: pointer;
}

.container {
/*   padding: 2px 16px;  */
	margin-right: 270px;
}

.rightMenu{
	background-color: #414548; width:270px; height: 100%; position:absolute; right:0px; 
}

#articleDate{
	margin-top: 40px; color: #6a6e71; font-size: 13px;
}

#articleContent{
	padding: 100px;
}

#articleContent p{
	font-size: 14px; margin-top: 50px; margin-bottom: 50px;
}

#articleContent img{
	width: 100%;
}

#articleTitle{
	margin: 25px; border-bottom: 1px solid #B6BDC1;
}

#replyWrite{
	background-color: #e4e4e4; width: 100%; height: 130px;
}

#replyWrite img{
	width: 45px; height: 45px; padding: 22px 12px 22px 50px;
}

#replyWrite textarea{
	width: 70%; height: 49%; resize: none; border:none;
}

#replyWrite a{
	background-color: #2aa8e0; color: #fff; position:absolute; margin-top:21px; margin-bottom:27px;
	font-size:14px; padding: 25px 8px 25px 8px;
}

#replyList{
	width: 100%; margin: 0; 
}

#replyList li{
	list-style-type: none;
}

.replyContent{
	border-bottom: 1px solid #B6BDC1; padding: 13px 0px 13px 50px;
}

.replyContent img{
	width: 45px; height: 45px; position:absolute;
}

#editorImg{
	width: 100px; height: 100px; border-radius:50px;
}

#articleInfo{
	position: fixed; padding-left:15px; padding-right:15px; width:240px;
}

#editorInfo{
	text-align: center; border-bottom:1px solid #909599; padding-top:50px;
}

#editorInfo h4{
	color: #00a6de; margin-top:17px; margin-bottom:8px;
}

#editorIntro{
	font-size:12px; color: #B6BDC1; margin-top:7px; margin-bottom:40px; 
}

#articleInfo ul{
	padding: 0;
}

#articleInfo li{
	list-style-type: none; text-align:right; color: #E4E1E1; padding-top:5px; padding-bottom:5px; padding-left:12px; padding-right:12px;
}

#articleInfo li span{
	float: left; font-size: 13px; color: #B6BDC1; padding-left:30px; padding-bottom:5px; padding-top:3px;
}

#replyList ul{
	padding: 0;
}

.writerName{
	font-size: 15px; color: #414548; font-weight: bold;
}

.replyText{
	font-size:13px; margin-top:8px; margin-bottom:5px;
}

.replyDate{
	color: #B6BDC1; font-size:12px;
}

.replyDetail{
	display:inline-block; margin-left:70px;
}

.replySubDetail{
	margin-top:20px; margin-bottom:10px;
}

.replySubDetail a{
	padding-right: 40px; color:#6F7375; font-size:12px; text-decoration: none;
}

.rereplyList{
	background-color: #ECEEF1; width:79%; height:auto; display:none; padding-left:60px; padding-right:50px;
	padding-top:13px; margin-top:10px;
}

.rereplyWrite{
	width: 100%; margin-top:30px; border-top:1px solid #A7AEB3;
}

.rereplyWrite img{
	width:30px; height:30px; padding-left:10px;
}

.rereplyWrite input[type=text] {
	border:none; position:absolute; margin-left: 50px; width:40%; font-size:13px;
	padding: 8px 8px 8px 8px;
}

.rereplyWrite a{
 	background-color: #A7AEB3; color: #414548; 
/*margin-top:27px; margin-bottom:27px; */
	font-size:14px; padding: 25px 10px 8px 8px;
}

#articleHits{
	background: url(resources/images/detailIcons/articleHits.png) no-repeat 0;
}

#articleLikes{
	background: url(resources/images/detailIcons/articleLikes.png) no-repeat 0;
}

#articleReplies{
	background: url(resources/images/detailIcons/articleReplies.png) no-repeat 0;
}

#articleShares{
	background: url(resources/images/detailIcons/articleShares.png) no-repeat 0;
}

#articleShare{
	margin: 50px 25px 0 25px; text-align:center;

}

#articleShare a{
	text-decoration: none; color: #fff;
}

#likeBtn{
	background: #00a6de url(resources/images/detailIcons/likeBtn.png) no-repeat 12px; display:inline-block;
	width:90px; height:40px;
}

#saveBtn{
	background: #414548 url(resources/images/detailIcons/saveBtn.png) no-repeat 12px; display:inline-block;
	width:90px; height:40px;
}

#fbBtn{
	background: #4E6888 url(resources/images/detailIcons/fbBtn.png) no-repeat 15px; display:inline-block;
	width:40px; height:40px;
}

#twBtn{
	background: #61ABC4 url(resources/images/detailIcons/twBtn.png) no-repeat 10px; display:inline-block;
	width:40px; height:40px;
}

#linkBtn{
	background: #FCB040 url(resources/images/detailIcons/linkBtn.png) no-repeat 10px; display:inline-block;
	width:40px; height:40px;
}

.invisible{
	visibility: hidden;
}

#saveBtn em{
	font-style: normal; position:relative; top:8px; left:-5px;
}

#likeBtn em{
	font-style: normal; position:relative; top:8px; left:5px;
}

.rereply{
	padding: 10px;
}

.rereplyList li img{
	padding:10px;
}

</style>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
	function showRereply(num){
		// 답글 보여주기
		$("#rereplyList"+num).toggle();
	}
	
	function likeArticle(num){
		alert(num);
// 		$.ajax({
// 			type: "POST",
// 			url: "likeArticle",
// 			data: {
				
// 			},
// 			success: function(){
				
// 			}
// 		});
	}
</script>
</head>
<body>
	<a href="#detail">글 읽기</a>
	
	<div id="detail" class="modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	     <div class="rightMenu">
	     	<div id="articleInfo">
		     		<a href="#" class="closebtn">×</a>
		     		<div id="editorInfo">
			     	  <img id="editorImg" src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
			     	  <h4>레아</h4>
			     	  <p id="editorIntro">에디터 자기 소개 에디터 자기 소개 에디터 자기 소개 에디터 자기 소개 에디터 자기 소개 에디터 자기 소개 에디터 자기 소개 에디터 자기 소개 에디터 자기 소개</p>
		     	  	</div>
		     	  	<div id="articleStats">
			     	  <ul>
				     	  <li><span id="articleHits">조회수</span>2.6만</li>
				     	  <li><span id="articleLikes">좋아요</span>405</li>
				     	  <li><span id="articleReplies">댓글</span>71</li>
				     	  <li><span id="articleShares">공유</span>3</li>
				      </ul>
			      </div>
	     	  <!-- 페이스북 좋아요 -->
	     	</div>  
	     </div>
	      <div class="container">
	      	
	      	<!-- 제목, 날짜 -->
	      	<div id="articleTitle">
		      	<h2>Contents Title</h2>
		        <p>Contents Subtitle</p>
		        <p id="articleDate">2015.12.29. 09:30</p>
	        </div>
	        
  	        <!-- sns 공유 버튼 -->
	        <div id="articleShare">
	        	<a id="likeBtn"><span class="invisible">like</span><em>405</em></a>
	        	<a id="saveBtn"><span class="invisible">share</span><em>248</em></a>
	        	<a id="fbBtn"><span class="invisible">fb</span></a>
	        	<a id="twBtn"><span class="invisible">tw</span></a>
	        	<a id="linkBtn"><span class="invisible">link</span></a>
	        </div>
	        
	        <!-- 내용 -->
	        <div id="articleContent">
		        <p>
		        	<img src="http://cdnb.pikicast.com/500/2015/12/19/500_22895105_1450502260.jpg">
		        	Some text in the modal. Some text in the modal. 
		        	Some text in the modal. Some text in the modal.
		        </p> 
		        <p>Some text in the modal.</p>
		        <p>
		        	<img src="http://cdnb.pikicast.com/500/2015/12/19/500_22895045_1450501030.jpg">
		        	Some text in the modal. Some text in the modal. 
		        	Some text in the modal. Some text in the modal.
		        </p> 
		        <p>Some text in the modal. Some text in the modal. 
		        Some text in the modal. Some text in the modal.</p> 
	       </div>
	       
	      <!-- 댓글 작성 -->
		       <div id="replyWrite">
		       	<img src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
		       	<textarea placeholder="내용을 입력해 주세요."></textarea>
		       	<a>댓글 등록</a>
		       </div>
	       
	       <!-- 댓글 목록 -->
	       <div id="replyList">
	       	<ul>
	       		<li>
		       		<div class="replyContent">
   				       	<img src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
			       		<div class="replyDetail">
			       			<span class="writerName">홍길동</span>
			       			<p class="replyText">댓글 내용입니다.</p>
			       			<span class="replyDate">2015.12.30. 10:46</span>
				       		<div class="replySubDetail">
			       				<a href="javascript:likeArticle(0);">좋아요 30개</a>
			       				<a href="javascript:showRereply(0);">답글 23개</a>
			       			</div>			       			
			       		</div>
		       			<div class="rereplyList" id="rereplyList0">
		       				<ul>
		       					<li>
		       					    <img src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
		       						<div class="replyDetail rereply">
		       							<span class="writerName">홍길동</span>
		       							<p class="replyText">답글 내용입니다.</p>
		       							<span class="replyDate">2015.12.30. 11:31</span>
		       						</div>
		       					</li>
		       				</ul>	
		       				<div class="rereplyWrite">
		       					    <img src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
		       					    <input type="text" placeholder="내용을 입력해 주세요.">
		       					    <a>답글 등록</a>
		       				</div>	       			
		       			</div>			       		
		       		</div>
	       		</li>
	       		<li>
	       			<div class="replyContent">
   				       	<img src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
		       			<div class="replyDetail">
			       			<span class="writerName">홍길동</span>
			       			<p class="replyText">댓글 내용입니다.</p>
			       			<span class="replyDate">2015.12.30. 10:46</span>
				       		<div class="replySubDetail">
			       				<a href="javascript:likeArticle(1);">좋아요 30개</a>
			       				<a href="javascript:showRereply(1);">답글 23개</a>
			       			</div>
		       			</div>
		       			<div class="rereplyList" id="rereplyList1">
		       				<ul>
		       					<li>
		       					    <img src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
		       						<div class="replyDetail rereply">
		       							<span class="writerName">홍길동</span>
		       							<p class="replyText">답글 내용입니다.</p>
		       							<span class="replyDate">2015.12.30. 11:31</span>
		       						</div>
		       					</li>
		       					<li>
		       					    <img src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
		       						<div class="replyDetail rereply">
		       							<span class="writerName">홍길동</span>
		       							<p class="replyText">답글 내용입니다.</p>
		       							<span class="replyDate">2015.12.30. 11:31</span>
		       						</div>
		       					</li>	
		       				</ul>
		       				<div class="rereplyWrite">
		       					    <img src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
		       					    <input type="text" placeholder="내용을 입력해 주세요.">
		       					    <a>답글 등록</a>
		       				</div>
		       			</div>
		       		</div>
	       		</li>
	       		
	       	</ul>
	       </div>
	       
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>