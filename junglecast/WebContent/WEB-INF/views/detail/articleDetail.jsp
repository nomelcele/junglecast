<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
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
	        	<a href="http://www.facebook.com/sharer/sharer.php?u=http://localhost/junglecast/main#detail" id="fbBtn" target="_blank"><span class="invisible">fb</span></a>
	        	<a href="https://twitter.com/intent/tweet?text=TEXT&url=http://localhost/junglecast/main#detail" id="twBtn" target="_blank"><span class="invisible">tw</span></a>
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
		       	<img src="resources/memberImg/gildong.jpg">
		       	<textarea id="reply_text" placeholder="내용을 입력해 주세요."></textarea>
		       	<a id="writeReplyBtn">댓글 등록</a>
		       </div>
	       
	       <!-- 댓글 목록 -->
	       <div id="replyList">
	       	<ul>
	       		<li>
		       		<div class="replyContentBox">
		       			<div class="replyContent">
	   				       	<img src="resources/memberImg/gildong.jpg">
				       		<div class="replyDetail">
				       			<span class="best writerName">홍길동</span>
				       			<p class="replyText">댓글 내용입니다.</p>
				       			<span class="replyDate">2015.12.30. 10:46</span>
					       		<div class="replySubDetail">
				       				<a class="likeReplyBtn" href="javascript:likeReply(0);">좋아요 30개</a>
				       				<a class="rereplyBtn" href="javascript:rereplyList(0);">답글 23개</a>
				       			</div>			       			
				       		</div>
			       		</div>
		       			<div class="rereplyList" id="rereplyList0">
		       				<ul>
		       					<li>
		       					    <img src="resources/memberImg/gildong.jpg">
		       						<div class="replyDetail rereply">
		       							<span class="writerName">홍길동</span>
		       							<p class="replyText">답글 내용입니다.</p>
		       							<span class="replyDate">2015.12.30. 11:31</span>
		       						</div>
		       					</li>
		       				</ul>	
		       				<div class="rereplyWrite">
		       					    <img src="resources/memberImg/gildong.jpg">
			       					<input type="text" placeholder="내용을 입력해 주세요.">
			       					<a>답글 등록</a>
		       				</div>	       			
		       			</div>			       		
		       		</div>
	       		</li>
	       		<li>
	       			<div class="replyContentBox">
	       				<div class="replyContent">
	   				       	<img src="resources/memberImg/gildong.jpg">
			       			<div class="replyDetail">
				       			<span class="writerName">홍길동</span>
				       			<p class="replyText">댓글 내용입니다.</p>
				       			<span class="replyDate">2015.12.30. 10:46</span>
					       		<div class="replySubDetail">
				       				<a class="likeReplyBtn" href="javascript:likeArticle(1);">좋아요 30개</a>
				       				<a class="rereplyBtn" href="javascript:rereplyList(1);">답글 23개</a>
				       			</div>
			       			</div>
		       			</div>
		       			<div class="rereplyList" id="rereplyList1">
		       				<ul>
		       					<li>
		       					    <img src="resources/memberImg/gildong.jpg">
		       						<div class="replyDetail rereply">
		       							<span class="writerName">홍길동</span>
		       							<p class="replyText">답글 내용입니다.</p>
		       							<span class="replyDate">2015.12.30. 11:31</span>
		       						</div>
		       					</li>
		       					<li>
		       					    <img src="resources/memberImg/gildong.jpg">
		       						<div class="replyDetail rereply">
		       							<span class="writerName">홍길동</span>
		       							<p class="replyText">답글 내용입니다.</p>
		       							<span class="replyDate">2015.12.30. 11:31</span>
		       						</div>
		       					</li>	
		       				</ul>
		       				<div class="rereplyWrite">
		       					    <img src="resources/memberImg/gildong.jpg">
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

	<div id="copyLink" class="modal link">
		<div class="modal-dialog">
	    	<div class="modal-content link-content">
	    		<div class="link-container">
	    			<div id="linkArea">
			     		<a id="linkCloseBtn">×</a>
			     		<p>아래의 URL을 복사(Ctrl+C)하여 원하는 곳에 붙여넣기(Ctrl+V)하세요.</p>
			     		<input id="articleLink" type="text">
	    			</div>
	    		</div>
			</div>
		</div>
	</div>
