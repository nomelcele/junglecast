<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<script type="text/javascript" src="js/article.js"></script>
	<div id="detail" class="modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    <input type="hidden" id="article_id">
	    <!-- 우측 메뉴 (S) -->
	     <div class="rightMenu">
	     	<div id="articleInfo">
		     		<a href="#" class="closebtn">×</a>
		     		<div id="editorInfo">
			     	  <img class="editorImg" src="resources/memberImg/${editorInfo.m_pic}">
			     	  <h4>${editorInfo.m_nickname}</h4>
			     	  <p class="editorIntro">${editorInfo.m_introduce}</p>
		     	  	</div>
		     	  	<div id="articleStats">
			     	  <ul>
				     	  <li><span class="articleHits">조회수</span>${articleContent.article_view}</li>
				     	  <li><span class="articleLikes">좋아요</span>${articleContent.article_like}</li>
				     	  <li><span class="articleReplies">댓글</span>${articleContent.article_reply}</li>
				     	  <li><span class="articleShares">공유</span>${articleContent.article_share}</li>
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
	        		<li><span class="articleHits">${articleContent.article_view}</span></li>
	        		<li><span class="articleLikes">${articleContent.article_like}</span></li>
	        		<li><span class="articleReplies">${articleContent.article_reply}</span></li>
	        		<li><span class="articleShares">${articleContent.article_share}</span></li>
	        	</ul>
	        </div>
	        
	        <!-- 작성자 프로필(모바일) -->
	        <div id="mobileEditorInfo">
	        	<a href="#" class="closebtn mobileCloseBtn">x</a>
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
	        	<a class="likeBtn"><span class="invisible">like</span><em>${articleContent.article_like}</em></a>
	        	<a class="saveBtn"><span class="invisible">share</span><em>248</em></a>
	        	<a href="http://www.facebook.com/sharer/sharer.php?u=http://localhost/junglecast/main#detail" class="fbBtn" target="_blank"><span class="invisible">fb</span></a>
	        	<a href="https://twitter.com/intent/tweet?text=TEXT&url=http://localhost/junglecast/main#detail" class="twBtn" target="_blank"><span class="invisible">tw</span></a>
	        	<a class="linkBtn"><span class="invisible">link</span></a>
	        </div>
	        
	        <!-- 좌측 공유 버튼 -->
	        <div id="verticalShare">
	        	<a class="likeBtn verticalBtn mobileNone"><span class="invisible">like</span></a>
	        	<a class="saveBtn verticalBtn mobileNone"><span class="invisible">share</span></a>
	        	<a href="http://www.facebook.com/sharer/sharer.php?u=http://localhost/junglecast/main#detail" class="fbBtn verticalBtn mobileNone" target="_blank"><span class="invisible">fb</span></a>
	        	<a href="https://twitter.com/intent/tweet?text=TEXT&url=http://localhost/junglecast/main#detail" class="twBtn verticalBtn mobileNone" target="_blank"><span class="invisible">tw</span></a>
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
<!-- 		        <p>Some text in the modal.</p> -->
<!-- 		        <p> -->
<!-- 		        	<img src="http://cdnb.pikicast.com/500/2015/12/19/500_22895045_1450501030.jpg"> -->
<!-- 		        	Some text in the modal. Some text in the modal.  -->
<!-- 		        	Some text in the modal. Some text in the modal. -->
<!-- 		        </p>  -->
<!-- 		        <p>Some text in the modal. Some text in the modal.  -->
<!-- 		        Some text in the modal. Some text in the modal.</p>  -->
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
<!-- 	       		<li> -->
<!-- 		       		<div class="replyContentBox"> -->
<!-- 		       			<div class="replyImgBox"> -->
<!-- 	   				       	<img src="resources/memberImg/gildong.jpg"> -->
<!-- 	   				    </div> -->
<!-- 				       	<div class="replyDetail"> -->
<!-- 				       			<span class="writerName">홍길동</span> -->
<!-- 				       			<div class="replyTextArea"> -->
<!-- 					       			<span class="replyText">댓글 내용입니다.</span> -->
<!-- 					       			<span class="replyDate">2015.12.30. 10:46</span> -->
<!-- 					       		</div> -->
<!-- 					       		<div class="replySubDetail"> -->
<!-- 				       				<a class="likeReplyBtn" href="javascript:likeReply(1);">좋아요 30개</a> -->
<!-- 				       				<a class="rereplyBtn" href="javascript:rereplyList(1);">답글 23개</a> -->
<!-- 				       			</div>			       			 -->
<!-- 				       	</div> -->
<!-- 				    </div> -->
<!-- 		       			<div class="rereplyList" id="rereplyList1"> -->
<!-- 		       				<ul> -->
<!-- 		       					<li> -->
<!-- 		       						<div class="rereplyBox"> -->
<!-- 		       							<div class="replyImgBox"> -->
<!-- 			       					    	<img src="resources/memberImg/gildong.jpg"> -->
<!-- 			       						</div> -->
<!-- 			       						<div class="replyDetail"> -->
<!-- 			       							<span class="writerName">홍길동</span> -->
<!-- 			       							<div class="replyTextArea"> -->
<!-- 				       							<p class="replyText">답글 내용입니다.</p> -->
<!-- 				       							<span class="replyDate">2015.12.30. 11:31</span> -->
<!-- 			       							</div> -->
<!-- 			       						</div> -->
<!-- 		       						</div> -->
<!-- 		       					</li> -->
<!-- 		       					<li> -->
<!-- 									<div class="rereplyBox"> -->
<!-- 		       							<div class="replyImgBox"> -->
<!-- 			       					    	<img src="resources/memberImg/gildong.jpg"> -->
<!-- 			       						</div> -->
<!-- 			       						<div class="replyDetail"> -->
<!-- 			       							<span class="writerName">홍길동</span> -->
<!-- 			       							<div class="replyTextArea"> -->
<!-- 				       							<p class="replyText">답글 내용입니다.</p> -->
<!-- 				       							<span class="replyDate">2015.12.30. 11:31</span> -->
<!-- 			       							</div> -->
<!-- 			       						</div> -->
<!-- 		       						</div> -->
<!-- 		       					</li>		       					 -->
<!-- 		       				</ul>	 -->
<!-- 		       				<div class="replyWriteBox"> -->
<!-- 		       					<div class="replyWrite"> -->
<!-- 		       						<div class="imgBox"> -->
<!-- 		       					    	<img src="resources/memberImg/gildong.jpg"> -->
<!-- 			       					</div> -->
<!-- 			       					<div class="replyTextBox"> -->
<!-- 			       						<div class="replyInput"> -->
<!-- 			       							<input type="text" placeholder="내용을 입력해 주세요."> -->
<!-- 			       						</div> -->
<!-- 			       					</div> -->
<!-- 			       					<a>답글 등록</a> -->
<!-- 			       				</div> -->
<!-- 		       				</div>	       			 -->
<!-- 		       		</div> -->
<!-- 	       		</li> -->
	       		
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
			     		<input id="articleLink" type="text">
	    			</div>
	    		</div>
			</div>
		</div>
	</div>
	</div>
	