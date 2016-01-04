<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
	<ul>
		<c:forEach var="rereplyList" items="${rereplyList}">
			<li>
				<img src="resources/memberImg/${rereplyList.rereplyWriterPic}">
				<div class="replyDetail rereply">
					<span class="writerName">${rereplyList.rereplyWriterName}</span>
					<p class="replyText">${rereplyList.rereply_text}</p>
					<span class="replyDate">${rereplyList.rereply_date}</span>
				</div>
			</li>
		</c:forEach>
	</ul>
	<div class="rereplyWrite">
		<img src="resources/memberImg/${sessionScope.prvo.m_pic}">
		<input id="rereply_text" type="text" placeholder="내용을 입력해 주세요."> 
		<a href="javascript:writeRereply(${reply_id});">답글 등록</a>
	</div>