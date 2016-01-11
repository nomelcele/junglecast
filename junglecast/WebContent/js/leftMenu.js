
$(function(){
	var loc = location.href;
	if(loc.indexOf("main")>0){//메인페이지이면

	}else{//메인페이지 외 search페이지, category 페이지 일 때
		$('#left_menu_home a').css("color", "#404041");
	}
	
	//상단바 메뉴 아이콘 클릭시
	$('#menu_icon').click(function(){
		var clientWidth = document.body.clientWidth;
		if(clientWidth<767){
			//left_area 보여줄 함수 호출
			menu_icon_clicked_left_area_showing();
			$(document).click(function(e){
				if(($('.body_cover').css("display") == "block") && (e.pageX>clientWidth*0.75)){
					//left_area 숨길 함수 호출
					menu_icon_clicked_left_area_hiding();
				}
			});
		}
	});
	
    //타블렛 화면일 때 메뉴 아이콘 클릭
	$('#tablet_aside_menu_icon').click(function(){
		//left_area 보여줄 함수 호출
		menu_icon_clicked_left_area_showing()
		
		$(document).click(function(e){
			if(($('.body_cover').css("display") == "block") && (e.pageX>220)){
				//left_area 숨길 함수 호출
				menu_icon_clicked_left_area_hiding();
			}    
		});
	});
	
	
    //좌측 메뉴 포스팅하기 버튼
    $('#go_write_page').click(function(){
    	location.href="writeArticle";
    });

    
    //카테고리 목록 눌렀을 때 해당 카테고리 콘텐츠 카드 새로 받아옴
    $('html body').on('click', '.aCategory span', function(){
    	$('.aCategory').find('span').css("color", "#4b4b4b");
    	$(this).parent().find('span').css("color", "#00a6de");
    	
    	var getCategoryId = $(this).parent().find('.leftmenu_category_id').val();
    	location.href="category?category_id="+getCategoryId;

    });
    
    $("#goto_profile").click(function(){
    	// 개인 정보 수정
    	location="editInfo";
    });
});

//메뉴 아이콘 클릭했을 때 left_area show/hide 함수
function menu_icon_clicked_left_area_showing(){
	$('#left_area').css("display", "block");
	$('.body_cover').css("display", "block");
	$('#articles_area').css("position", "fixed");
}
function menu_icon_clicked_left_area_hiding(){
	$('.body_cover').css("display", "none");
	$('#left_area').css("display", "none");
	$('#articles_area').css("position", "relative");
}

function aCardSizingEvent(){
	var aCard_width = $('.aCard').css("width");
	var aCard_height= Number(aCard_width.replace(/[^\d]/g,""));
	if(matchMedia("only screen and (min-width:1280px)").matches){ //대형화면
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
