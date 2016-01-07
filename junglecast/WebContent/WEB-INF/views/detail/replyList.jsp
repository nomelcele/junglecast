<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
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
					       				<a class="likeReplyBtn" href="javascript:likeReply(${bestReplyList.reply_id},${bestReplyList.article_id});">좋아요 ${bestReplyList.reply_like}개</a>
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
					       				<a class="likeReplyBtn" href="javascript:likeReply(${replyList.reply_id},${replyList.article_id});">좋아요 ${replyList.reply_like}개</a>
					       				<a class="rereplyBtn" href="javascript:rereplyList(${replyList.reply_id},'normal');">답글 ${replyList.rereply_count}개</a>
					       			</div>			       			
					       	</div>
					    </div>
			       		<div class="rereplyList" id="rereplyList${replyList.reply_id}">
			       		</div>
		       		</li>
		       	</c:forEach>		       	
	       	</ul>