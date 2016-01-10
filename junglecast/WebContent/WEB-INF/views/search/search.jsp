<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/leftMenu.js"></script>
<script src="js/search.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/leftMenu.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<link href="resources/css/article.css" rel="stylesheet" type="text/css"/>
<link href="resources/css/search.css" rel="stylesheet" type="text/css"/>
</head>
<jsp:include page="../topLeft/header.jsp"></jsp:include>
<body style="background: #f1f1f2">
<div id="modalBox"></div>
<div class="body_cover"></div>
<div id="search_total_wrapper">
	<input type="hidden" value="${mobile }" id="mobile">
	<jsp:include page="../topLeft/leftMenu.jsp"></jsp:include>
	<div id="search_info_list_container">
		<div id="search_info_container">
			<div class="search_input_container">
				<div>
					<input type="text" value="${key }" onkeypress="if(event.keyCode==13){enterEvent(this.value);}">
					<span class="search_blue_btn"></span>
				</div>
			</div>
			<div class="search_section_container">
				<div>
					<input type="hidden" class="storyORuser" value="${section }">
					<c:if test="${section=='story'}">
						<div id="section_story" class="aSection section_selected">이야기</div>
						<div id="section_user" class="aSection">사용자</div>
					</c:if>
					<c:if test="${section=='user'}">
						<div id="section_story" class="aSection">이야기</div>
						<div id="section_user" class="aSection section_selected">사용자</div>
					</c:if>
				</div>
			</div>
		</div>
		<div id="search_list_container">
			<div class="scroll_area_container">
				
			</div>
		</div>
	</div>
	<div id="search_recommend_area">
		<div class="recommend_title">추천 검색어</div>
		<div class="recommend_keyword">
			<div class="recommend_keyword_inner">
				<c:forEach var="aRow" items="${recommend }">
					<div><a href="search?section=story&key=${aRow.search_txt }">${aRow.search_txt }</a></div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</body>
</html>