<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<aside id="left_area">
		<c:choose> 
			<c:when test="${m_id == 0 }">
				<div id="logout_status">
					<p class="login_txt">로그인 하세요 <br> 더욱 즐거워 집니다!</p>
					<a class="goto_login" href="menu=login">로그인하기</a>
					<div class="goto_join"><a href="menu=join">회원가입</a></div>
				</div>
			</c:when>
			<c:otherwise>
				<div id="profile_card">
		 			<img alt="goto my profile page" src="resources/images/main/icons/gear_icon.png" id="goto_profile">
		 			<c:choose>
						<c:when test="${userInfo.m_pic==null}">
							<img src="resources/images/joinImg/default_avatar.png"  id="profile_card_img">
						</c:when>
						<c:otherwise>
							<img src="resources/memberImg/${userInfo.m_pic }" alt="my profile" id="profile_card_img">
						</c:otherwise>
					</c:choose>
					<div id="my_nickname">
						${userInfo.m_nickname }
					</div>
					<div id="my_introduce">
						${userInfo.m_introduce }
					</div>
					<div id="go_write_page"><a href="writeArticle">포스팅하기</a></div>
					<div id="mypage_icons">
						<a id="go_mypage_storage"><img src="resources/images/main/icons/storagebox_icon.png"><span>보관함</span></a>
						<a id="go_mypage_record"><img src="resources/images/main/icons/Clock_icon.png"><span>기록</span></a>
						<a id="notice_bell_icon"><img src="resources/images/main/icons/bell_gray.png"><span>알림</span></a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

		<div id="left_menu">
			<div id="left_menu_inner">
				<div id="left_menu_home"><a href="main">홈</a></div>
				<div id="left_menu_categories">
					<div id="categories">골라보기</div>
					<ul>
						<c:forEach var="aRow" items="${categories }">
							<li class="aCategory">
								<input type="hidden" value="${aRow.category_id }" class="leftmenu_category_id">
								<span class="catogory_icon" style="background-image: url('resources/images/main/icons/${aRow.category_icon}'); background-size:100% 100%;"></span>
								<c:choose>
									<c:when test="${aRow.category_id == category_info.category_id }"><span style="color:#00a6de;">${aRow.category_name }</span></c:when>
									<c:otherwise><span style="color:#4b4b4b;">${aRow.category_name }</span></c:otherwise>
								</c:choose>
								
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</aside>
	<aside id="tablet_left_area">
		<div id="tablet_aside_menu_icon"><div></div></div>
		<div id="tablet_aside_icons">
			<ul>		 			
				<c:choose>
					<c:when test="${userInfo.m_pic==null}">
						<li><img id="aside_profile_icon" src="resources/images/joinImg/default_avatar.png"></li>
					</c:when>
					<c:otherwise>
						<li><img id="aside_profile_icon" src="resources/memberImg/${userInfo.m_pic }"></li>
					</c:otherwise>
				</c:choose>
				<li><span id="aside_storage_icon"></span></li>
				<li><span id="aside_record_icon"></span></li>
			</ul>
		</div>
	</aside>
</body>
</html>