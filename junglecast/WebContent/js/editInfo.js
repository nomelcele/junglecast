var webBtnNum = 1;

$(function(){
	$(".profileBtn").addClass("hovered");
	$("#currentNameNum").html($("#m_nickname").val().length); // 닉네임 글자수
	$("#currentIntroNum").html($("#m_introduce").val().length); // 자기 소개 글자수
	
	if($("#m_web2").val() != null){
		webBtnNum++;
	} 
	if($("#m_web3").val() != null){
		webBtnNum++;
	}
	
	$("#m_gender").val($("#userGender").val()); // 성별 
	
	$(".profileBtn").click(function(){
		// 메뉴에서 프로필 클릭
		$(".accountBtn").removeClass("hovered");
		$(".pwdBtn").removeClass("hovered");
		$(this).addClass("hovered");
		$("html, body").animate({
			scrollTop: $("#profileBox").offset().top-70
		},500);
	});
	
	$(".accountBtn").click(function(){
		// 메뉴에서 계정 정보 클릭
		$(".profileBtn").removeClass("hovered");
		$(".pwdBtn").removeClass("hovered");
		$(this).addClass("hovered");
		$("html, body").animate({
			scrollTop: $("#accountBox").offset().top-70
		},500);
	});

	$(".pwdBtn").click(function(){
		// 메뉴에서 비밀번호 클릭
		$(".profileBtn").removeClass("hovered");
		$(".accountBtn").removeClass("hovered");
		$(this).addClass("hovered");
		$("html, body").animate({
			scrollTop: $("#pwdBox").offset().top-65
		},500);
	});
	
	$("#m_pic").change(function(){
		// 프로필 이미지 파일 선택했을 때
		var ext = $(this).val().split('.').pop().toLowerCase(); // 파일의 확장자
		
		// 확장자가 이미지 파일인지 확인
		if($.inArray(ext,['gif','png','jpg','jpeg']) == -1){
			// 이미지 파일이 아닌 경우
			$(this).val("");
			alert("gif, png, jpg, jpeg 파일만 업로드 가능합니다.");
		} else {
			// 이미지 파일인 경우
			var file = $(this).prop("files")[0];
			blobURL = window.URL.createObjectURL(file);
			// 미리보기 영역에 이미지 표시
			$("#profileImgPreview").attr("src",blobURL);
		}
	});
	
	$("#m_nickname").keyup(function(){
		// 닉네임 입력 시 글자수 표시
		$("#currentNameNum").html($(this).val().length);
	});
	
	$("#m_introduce").keyup(function(){
		// 자기 소개 입력 시 글자수 표시
		$("#currentIntroNum").html($(this).val().length);
	});
	
	$(".addWebArea").click(function(){
		// 웹 사이트 추가 버튼 클릭
		if(webBtnNum == 1){
			$("#profileWebInput").append("<span><span class='profileNameInput'>"
					+"<span class='profileHttp'>http://</span>"
					+"<input type='text' id='m_web2' name='m_web2'></span><a class='removeWebBtn' onclick='removeWeb(this)'></a></span>");
			webBtnNum++;
		} else if(webBtnNum == 2) {
			$("#profileWebInput").append("<span><span class='profileNameInput'>"
					+"<span class='profileHttp'>http://</span>"
					+"<input type='text' id='m_web3' name='m_web3'></span><a class='removeWebBtn' onclick='removeWeb(this)'></a></span>");
			webBtnNum++;
		} else if(webBtnNum == 3){
			alert("생성할 수 있는 피드는 3개가 최대입니다.");
		}
	});
	
	$("#currentPwd").keyup(function(){
		if($(this).val() != $("#userPwd").val()){
			// 현재 비밀번호를 잘못 입력했을 경우
			$("#currentPwdWarning").html("비밀번호가 틀렸습니다.");
		} else {
			$("#currentPwdWarning").html("");
			$("#newPwd").attr("disabled",false);
			$("#newPwd2").attr("disabled",false);
		}
	});
	
	$("#newPwd2").keyup(function(){
		if($("#newPwd").val() != $(this).val()){
			// 새로운 비밀번호 재입력이 일치하지 않는 경우
			$("#newPwdWarning").html("비밀번호가 일치하지 않습니다.");
		} else {
			$("#newPwdWarning").html("");
		}
	});
	
	$(".editPwdBtn").click(function(){
		// 비밀번호 변경
		if($("#currentPwd").val() == "" || $("#currentPwdWarning").html() == "비밀번호가 틀렸습니다."){
			alert("현재 비밀번호를 입력한 후, 새로운 비밀번호를 입력해 주세요.");
		} else if($("#newPwd").val() == ""){
			alert("새로운 비밀번호를 입력해 주세요.")
		} else if($("#newPwd2").val() == "" || $("#newPwdWarning").html() == "비밀번호가 일치하지 않습니다."){
			alert("새로운 비밀번호를 다시 입력해 주세요.");
		} else {
			$("#changePwdForm").submit();
		}
	});
});


function removeWeb(obj){
	$(obj).parent().remove();
	webBtnNum--;
}