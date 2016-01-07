$(function(){
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
    
    //좌측 메뉴 홈 눌렀을 때 css
    $('#left_menu_home a').click(function(){
    	$('#left_menu_home a').css("color", "#00a6de");
    });;
    
    //카테고리 목록 눌렀을 때 해당 카테고리 콘텐츠 카드 새로 받아옴
    $('html body').on('click', '.aCategory span', function(){
    	$('#left_menu_home a').css("color", "#404041"); //홈버튼 클릭해제
    	$('.aCategory').find('span').css("color", "#4b4b4b");
    	$(this).parent().find('span').css("color", "#00a6de");
    	var getCategoryId = $(this).parent().find('.leftmenu_category_id').val();
    	$.ajax({
			url: "selectThisCategory",
			data: {categoryId : getCategoryId},
			dataType: 'JSON',
			type: 'POST',
			async:false,
			success: function (data) {
				$('#contents_cards_area').empty();
				var aCard='';
				$.each(data.result, function(index, entry){
					aCard += '<div class="aCard"><div class="aCard_img_div">';
					aCard += '<img class="aCard_img" src="resources/articleContents/'+ entry.pic_url +'"></div>';
					aCard += '<input type="hidden" value="'+ entry.article_id +'">';
					aCard += '<div class="aCard_txt">'+entry.article_title+'</div></div>';
				});
				$('#contents_cards_area').append(aCard);
				cardClickEvent(); //뒤늦게 받아온 콘텐츠 카드이므로 클릭 이벤트 다시 붙여줌
			}
    	})
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
