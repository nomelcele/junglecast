<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<ul>
	<c:forEach var="replyList" items="${replyList}">
	       		<li>
		       		<div class="replyContent">
   				       	<img src="resources/memberImg/${replyList.replyWriterPic}">
			       		<div class="replyDetail">
			       			<span class="writerName">${replyList.replyWriterName}</span>
			       			<p class="replyText">${replyList.reply_text}</p>
			       			<span class="replyDate">${replyList.reply_date}</span>
				       		<div class="replySubDetail">
			       				<a href="javascript:likeArticle(${replyList.reply_id});">좋아요 ${replyList.reply_like}개</a>
			       				<a href="javascript:showRereply(${replyList.reply_id});">답글 ${replyList.rereply_count}개</a>
			       			</div>			       			
			       		</div>
		       			<div class="rereplyList" id="rereplyList${replyList.reply_id}">
		       			</div>			       		
		       		</div>
	       		</li>
	</c:forEach>
</ul>
	       