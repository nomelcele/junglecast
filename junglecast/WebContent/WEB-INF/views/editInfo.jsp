<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/leftMenu.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<style>
ul{padding:0;}

#main_body{background:#f1f1f2; margin:0 auto; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
	#content_area{position: relative; margin : 0 auto; height:100%; width:auto; max-width:1280px;}
	
	
@media only screen and (min-width:1024px) and (max-width:1279px){
	#content_area{position: none; margin : 0 0; width:80%; max-width: none;}
}
	
@media only screen and (min-width:768px) and (max-width:1023px){
	#content_area{position: none; margin : 0 0; width:94%; max-width: none;}
	
}

@media only screen and (max-width:767px){
	#content_area{position: none; margin : 0 0; width:100%; max-width: none;}
	
}
</style>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script src="js/leftMenu.js"></script>
<script src="js/editInfo.js"></script>
<script>
$(document).ready(function(){
	//반응형 자바스크립트
	$(window).resize(function(){
		resizingEvent();
	});
	
});

//반응형 - 화면크기 바뀔때마다 호출되는 함수
function resizingEvent(){
	left_area_positioning();
};
function left_area_positioning(){
	if(matchMedia("only screen and (min-width:1280px)").matches){ //대형화면
		$('#left_area').css("display", "block");
	}else if (matchMedia("only screen and (min-width:1024px) and (max-width:1279px)").matches) {//일반 PC 모니터 크기
		if($('.body_cover').css("display")=="block"){
			$('.body_cover').css("display", "none");
			$('#left_area').css("display", "none");
		}else{
			$('#left_area').css("display", "block");
		}
		
	} else if(matchMedia("only screen and (min-width:768px) and (max-width:1023px)").matches){//태블릿 화면
		if($('.body_cover').css("display")=="block"){
			$('#left_area').css("display", "block");
		}else{
			$('#left_area').css("display", "none");
		}
	}else if(matchMedia("only screen and (max-width:767px)").matches){ //모바일 화면
		if($('.body_cover').css("display")=="block"){
			$('#left_area').css("display", "block");
		}else{
			$('#left_area').css("display", "none");
		}
		
	}
}

</script>
</head>
<body id="main_body">
	<div id="main_body_cover"></div>
	<jsp:include page="topLeft/header.jsp"></jsp:include>
	<div id="content_area">
		<jsp:include page="editInfoMenu.jsp"></jsp:include>
		<div class="editBox editInfoTabletMenu">
				<ul class="menuList">
					<li>
						<a class="profileBtn"><span>프로필</span></a>
					</li>
					<li>
						<a class="accountBtn"><span>계정정보</span></a>
					</li>
					<li>
						<a class="pwdBtn"><span>비밀번호</span></a>
					</li>
				</ul>			
			</div>
			
		<section id="articles_area">
			<div id="profileBox" class="editBox profileBox">
				<form id="profileForm" action="editProfile" method="post" enctype="multipart/form-data">
					<h1>프로필</h1>
					<div class="profileImgBox">
						<div class="profileImgSubBox">
							<img id="profileImgPreview" src="resources/memberImg/${myProfile.m_pic}">
							<a class="editImgBtn"><input type="file" id="m_pic" name="m_picFile"></a>
						</div>
					</div>
					<div class="profileTxtBox">
						<div class="profileSubBox profileNameBox">
							<h1>닉네임</h1>
							<div class="profileNameInputBox">
								<span class="profileNameInput">
									<input type="text" id="m_nickname" name="m_nickname" maxlength="14" value="${myProfile.m_nickname}">
									<span class="profileTxtNum"><em id="currentNameNum">0</em>/14</span>
								</span>
							</div>
							<span class="warningTxt">홍보성 / 선정적인 닉네임은 타인에게 불쾌감을 줄 수 있으므로 삭제될 수 있습니다.</span>
						</div>
						<div class="profileSubBox profileIntroBox">
							<h1>나의 한 줄 소개</h1>
							<div class="profileIntroInputBox">
								<span class="profileNameInput">
									<input type="text" id="m_introduce" name="m_introduce" maxlength="17" value="${myProfile.m_introduce}">
									<span class="profileTxtNum"><em id="currentIntroNum">0</em>/17</span>
								</span>
							</div>
						</div>
						<div class="profileSubBox profileWebBox">
							<h1>웹 사이트</h1>
							<div class="profileWebInputBox">
								<div id="profileWebInput">
									<span>
										<span class="profileNameInput" id="profileWeb1">
											<span class="profileHttp">http://</span>
											<input type="text" id="m_web1" name="m_web1" value="${myProfile.m_web1}">
										</span>
									</span>
									<c:if test="${myProfile.m_web2 ne null}">
										<span>
											<span class="profileNameInput">
												<span class="profileHttp">http://</span>
												<input type="text" id="m_web2" name="m_web2" value="${myProfile.m_web2}">
											</span>
											<a class="removeWebBtn" onclick="removeWeb(this)"></a>
										</span>
									</c:if>
									<c:if test="${myProfile.m_web3 ne null}">
										<span>
											<span class="profileNameInput">
												<span class="profileHttp">http://</span>
												<input type="text" id="m_web3" name="m_web3" value="${myProfile.m_web3}">
											</span>
											<a class="removeWebBtn" onclick="removeWeb(this)"></a>
										</span>
									</c:if>
								</div>
								<a class="addWebArea"><span class="addWebBtn"></span></a>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div id="accountBox" class="editBox accountInfoBox">
				<h1>계정정보</h1>
				<div class="accountInfoTxtBox">
					<div class="profileSubBox">
						<h1>이메일</h1>
						<span class="profileNameInput">
							<input type="text" value="${myAccount.m_mail}" readonly>
						</span>
					</div>
					<div class="profileSubBox">
						<h1>생년월일</h1>
						<div class="accountSubBox accountBirthday">
							<select disabled>
								<option selected>${birthYear}년</option>	
							</select>
							<select disabled>
								<option selected>${birthMonth}월</option>
							</select>
							<select disabled>
								<option selected>${birthDay}일</option>
							</select>
						</div>
						<span class="warningTxt">생년월일은 가입 후엔 변경할 수 없습니다.</span>
					</div>
					<div class="profileSubBox">
						<h1>성별</h1>
						<div class="accountSubBox accountGender">
							<input type="hidden" id="userGender" value="${myAccount.m_gender}">
							<select id="m_gender" disabled>
								<option value="male">남성</option>
								<option value="female">여성</option>
							</select>
						</div>
						<span class="warningTxt">성별은 가입 후엔 변경할 수 없습니다.</span>
					</div>
					<a class="deleteAccount">계정 삭제</a>
				</div>
			</div>
			<div id="pwdBox" class="editBox pwdBox">
				<h1>비밀번호 변경</h1>
				<div>
					<input type="hidden" id="userPwd" value="${myAccount.m_pw}">
					<div class="profileSubBox">
						<h1>현재 비밀번호 입력</h1>
						<span class="profileNameInput">
							<input type="password" id="currentPwd" placeholder="현재 비밀번호">
						</span>
						<span class="warningTxt" id="currentPwdWarning"></span>
					</div>
					<div class="profileSubBox">
						<h1>새로운 비밀번호 입력</h1>
						<span class="profileNameInput">
							<input type="password" id="newPwd" placeholder="새로운 비밀번호" disabled>
						</span>
						<span class="warningTxt" id="newPwdWarning"></span>
					</div>
					<div class="profileSubBox">
						<form id="changePwdForm" action="changePwd" method="post">
							<h1>새로운 비밀번호 재입력</h1>
							<span class="profileNameInput">
								<input type="password" id="newPwd2" name="m_pw" placeholder="새로운 비밀번호 재입력" disabled>
							</span>
						</form>
					</div>
					<a class="editBtn editPwdBtn">비밀번호 변경</a>				
				</div>
			</div>
			<div class="editBox editSaveBox">
				<div class="editSaveSubBox">
					<a class="editBtn editCancelBtn" onclick="location='main'">취소</a>
					<a class="editBtn editSaveBtn">저장</a>
				</div>
			</div>
		</section>
	</div>
	<div id="copyLink" class="modal link">
		<div class="modal-dialog">
	    	<div class="modal-content link-content">
	    		<div class="link-container">
	    			<div id="linkArea">
			     		<a id="linkCloseBtn">×</a>
			     		<h2>비밀번호 확인</h2>
			     		<div class="pwdInputBox">
			     			<p>계정을 삭제하기 전<br/>비밀번호를 한 번 더 확인해 주세요.</p>
			     			<div class="pwdInputSubBox">
			     				<span class="pwdLabel">비밀번호</span>
			     				<input type="password" id="deleteAccountPwd" placeholder="비밀번호를 입력하세요.">
			     			</div>
			     			<span class="warningTxt" id="deleteAccountWarning"></span>
			     		</div>
			     		<a class="deleteAccountBtn">계정 삭제</a>
	    			</div>
	    		</div>
			</div>
		</div>
	</div>
</body>
</html>