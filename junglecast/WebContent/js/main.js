$(function(){
	//반응형 자바스크립트
	$(window).resize(function(){
		resizingEvent();
	});

	aCardSizingEvent();
	
	$(window).scroll(function(){
		if($(window).scrollTop()>100){
			$("#scroll_up").css("display","block");
		} else {
			$("#scroll_up").css("display","none");
		}
	});
	
    //스크롤 이벤트 캐치하는 함수
	$(window).scroll(function(){
		if($(window).scrollTop() == $(document).height()-$(window).height()){
			loadMore();
		}
	});

	//Top 버튼
	$('#scroll_up').click(function(){
		$("html,body").stop().animate({'scrollTop' :0}, 400);
	});
	
	//콘텐츠 카드 클릭
	$('html body').on('click', '.aCard', function(){
		// 게시물 보기
		var articleNum = $(this).find('input').val(); // 게시물 번호
		clickedContent(articleNum);
	});
	
});


function clickedContent(articleNum){
	$.ajax({
		type: "POST",
		url: "articleDetail",
		data: {
			article_id: articleNum,
			type: 'modal'
		},
		success: function(result){
			$("#modalBox").html(result);
			$("#article_id").attr("value",articleNum);
			location.href="#detail";
			if(matchMedia("only screen and (min-width:1280px)").matches){
				$("#articles_area").css("position","fixed"); // 스크롤 시 뒷배경 움직이지 않게
			}
		}
	});
}

//반응형 - 화면크기 바뀔때마다 호출되는 함수
function resizingEvent(){
	left_area_positioning();
	aCardSizingEvent();
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

function aCardSizingEvent(){
	var aCard_width = $('.aCard').css("width");
	var aCard_height= Number(aCard_width.replace(/[^\d]/g,""));
	if(matchMedia("only screen and (min-width:1280px)").matches){ //대형화면
		$('#left_area').css("display","block");
	}else if (matchMedia("only screen and (min-width:768px) and (max-width:1279px)").matches) {//일반 PC 모니터 크기 + 태블릿화면
		$('.aCard').css("height", aCard_height);
	}else if(matchMedia("only screen and (min-width:371px) and (max-width:767px)").matches){ //큰 모바일 화면
		$('.aCard').css("height", aCard_height*0.9);
		$('.aCard_img_div').css("height", "65%");
	}else if(matchMedia("only screen and (max-width:370px)").matches){ //작은모바일 화면
		$('.aCard').css("height", aCard_height*1.2);
		$('.aCard_img_div').css("height", "58%");
	
	}
}
