<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<input type="hidden" value="${key }" id="hidden_key">
			<ul>
				<c:forEach var="user" items="${users}">
					<li class="user_li list_num">
						<div class="aUerContainer">
							<div class="aUserInner">
								<input type="hidden" value="${user.m_id}">
								<c:choose>
									<c:when test="${user.m_pic == null }">
										<span class="aUserImg"><img src="resources/images/joinImg/default_avatar.png"></span><!-- 프사 -->
									</c:when>
									<c:otherwise>
										<div class="aUserImg"><img src="resources/memberImg/${user.m_pic }"></div><!-- 프사 -->
									</c:otherwise>
								</c:choose>
								<div class="aUserName">${user.m_nickname }</div>
								<div class="aUserIntroduce">${user.m_introduce }</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>