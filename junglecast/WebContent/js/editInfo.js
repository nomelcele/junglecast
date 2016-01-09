$(function(){
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
			scrollTop: $("#pwdBox").offset().top
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
});

