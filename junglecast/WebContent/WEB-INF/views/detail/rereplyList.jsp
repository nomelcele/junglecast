<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
	<ul>
		<c:forEach var="rereplyList" items="${rereplyList}">
			<li>
				<div class="rereplyBox">
					<div class="replyImgBox">
				    	<img src="resources/memberImg/${rereplyList.rereplyWriterPic}">
					</div>
					<div class="replyDetail">
						<span class="writerName">${rereplyList.rereplyWriterName}</span>
						<div class="replyTextArea">
							<p class="replyText">${rereplyList.rereply_text}</p>
							<span class="replyDate">${rereplyList.rereply_date}</span>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>		       					
	</ul>	
	<div class="replyWriteBox">
		<div class="replyWrite">
			<div class="imgBox">
		    	<img src="resources/memberImg/gildong.jpg">
			</div>
			<div class="replyTextBox">
				<div class="replyInput">
					<input id="rereply_text${reply_id}" type="text" placeholder="내용을 입력해 주세요.">
				</div>
			</div>
			<a href="javascript:writeRereply(${reply_id});">답글 등록</a>
		</div>
	</div>	       			     	
