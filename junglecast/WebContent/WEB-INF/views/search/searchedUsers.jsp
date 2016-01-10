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
								<div class="aUserImg"><img src="resources/memberImg/${user.m_pic }"></div>
								<div class="aUserName">${user.m_nickname }</div>
								<div class="aUserIntroduce">${user.m_introduce }</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>