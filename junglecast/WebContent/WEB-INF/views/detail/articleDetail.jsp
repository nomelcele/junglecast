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
  text-decoration: none; float: right; font-size: 30px; color: #B6BDC1; padding-right: 5px;
}

.closebtn:hover,
.closebtn:focus {
  color: #000; text-decoration: none;  cursor: pointer;
}

.container {
  padding: 2px 16px;  margin-right: 270px;
}

.right{
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
	background-color: #e4e4e4; width: 100%; height: 150px;  margin-left:0; margin-right:0;
}

#replyWrite img{
	width: 45px; height: 45px; padding: 25px; padding-right: 15px;
}

#replyWrite textarea{
	width: 70%; height: 43%; resize: none; border:none;
}

#replyWrite a{
	background-color: #2aa8e0; color: #fff; position:absolute; margin-top:27px; margin-bottom:27px;
	font-size:14px; padding-top:25px; padding-bottom:25px; padding-left:8px; padding-right:8px;
}

#replyList{
	width: 100%; margin: 0; 
}

#replyList li{
	list-style-type: none;
}

.replyContent{
	border-bottom: 1px solid #B6BDC1; padding-top:13px; padding-bottom:13px;
}

.replyContent img{
	width: 45px; height: 45px; padding: 25px; padding-right: 15px;
}

#editorImg{
	width: 100px; height: 100px; border-radius:50px; margin-top:75px; margin-left:58px; margin-right:58px;
}

#articleInfo{
	position: fixed; padding:15px;
}

#articleInfo h4{
	color: #00a6de; text-align: center;
}

#editorIntro{
	font-size:13px; color: #B6BDC1; text-align: center;
}

#articleInfo ul{
	padding: 0;
}

#articleInfo li{
	list-style-type: none; text-align:right; color: #E4E1E1; padding-top:5px; padding-bottom:5px; padding-left:12px; padding-right:12px;
}

#articleInfo li span{
	float: left; font-size: 13px; color: #B6BDC1; padding-left:30px; padding-bottom:5px;
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
	display:inline-block;
}

.replySubDetail{
	margin-top:20px; margin-bottom:10px;
}

.replySubDetail a{
	padding-right: 40px; color:#6F7375; font-size:12px; text-decoration: none;
}

.rereplyList{
	background-color: #ECEEF1; width:79%; height:auto; display:none; padding-left:65px; padding-right:97px;
}

.rereplyWrite{
	width: 100%; margin-top:30px; border-top:1px solid #A7AEB3;
}

.rereplyWrite img{
	width:30px; height:30px;
}

.rereplyWrite input[type=text] {
	border:none; position:absolute; margin-top: 25px; width:40%; font-size:13px;
	padding: 8px 8px 8px 8px;
}

.rereplyWrite a{
 	background-color: #A7AEB3; color: #414548; 
/*margin-top:27px; margin-bottom:27px; */
	font-size:14px; padding: 25px 10px 8px 8px;
}

#articleHits{
	background: url(resources/images/detailIcons/articleHits.png) no-repeat;
}

#articleLikes{
	background: url(resources/images/detailIcons/articleLikes.png) no-repeat;
}

#articleReplies{
	background: url(resources/images/detailIcons/articleReplies.png) no-repeat;
}

#articleShares{
	background: url(resources/images/detailIcons/articleShares.png) no-repeat;
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
	     <div class="right">
	     	<div id="articleInfo">
	     	  <a href="#" class="closebtn">×</a>
	     	  <img id="editorImg" src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
	     	  <h4>레아</h4>
	     	  <p id="editorIntro">에디터 자기 소개</p>
	     	  <hr/>
	     	  <ul>
		     	  <li><span id="articleHits">조회수</span>2.6만</li>
		     	  <li><span id="articleLikes">좋아요</span>405</li>
		     	  <li><span id="articleReplies">댓글</span>71</li>
		     	  <li><span id="articleShares">공유</span>3</li>
		      </ul>
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
	        
	        <!-- 내용 -->
	        <div id="articleContent">
	        <!-- sns 공유 버튼 -->
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
		       						<div class="replyDetail">
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
		       						<div class="replyDetail">
		       							<span class="writerName">홍길동</span>
		       							<p class="replyText">답글 내용입니다.</p>
		       							<span class="replyDate">2015.12.30. 11:31</span>
		       						</div>
		       					</li>
		       					<li>
		       					    <img src="https://s-media-cache-ak0.pinimg.com/736x/a9/82/69/a982694f692b517178779dd0b5e35f17.jpg">
		       						<div class="replyDetail">
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