<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<ul>
				<c:forEach var="aContent" items="${contents}">
					<li class="contents_li">
						<span class="aContent_img_area"><!-- 이미지 영역 -->
						<input type="hidden" value="${aContent.article_id }">
							<span><img src="resources/articleContents/${aContent.pic_url}"></span><!-- 이미지 틀 -->
						</span>
						<div class="aContent_title_area"><!-- 제목 간단내용 영역 -->
							<div class="writer_info"><!-- 작성자정보 -->
								<span class="writer_profile"><img src="resources/memberImg/${aContent.m_pic }"></span><!-- 프사 -->
								<span class="writer_nickname">${aContent.m_nickname }</span><!-- 닉넴 -->
							</div>
							<div class="aContent_info"><!-- 제목과 설명 -->
								<div class="aContent_title">${aContent.article_title }</div>
								<div class="aContent_subtitle">${aContent.article_subtitle }</div>
							</div>
							<div class="aContent_date">${aContent.article_date }</div>
						</div>
						<div class="aContent_popularity"><!-- 좋아요 공유 등 부가 정보 -->
							<ul>
								<li><div class="aContent_view">${aContent.article_view }</div></li>
								<li><div class="aContent_like">${aContent.article_like }</div></li>
								<li><div class="aContent_reply">${aContent.article_reply }</div></li>
								<li><div class="aContent_share">${aContent.article_share }</div></li>
							</ul>
						</div>
					</li>
				</c:forEach>
			</ul>
