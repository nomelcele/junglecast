$(document).ready(function(){
	if($('#mobile').val() == 'mobile'){
		$('#search_recommend_area').css("display", "block");
	}
	
	//이야기 탭 클릭
	$('#section_story').click(function(){
		$('#section_story').addClass('section_selected');
		$('#section_user').removeClass('section_selected');
		$('.storyORuser').val("story");
		 getSearchedContents($('.search_input_container input').val(), "story", 0);
	});
	//사용자 탭 클릭
	$('#section_user').click(function(){
		$('#section_story').removeClass('section_selected');
		$('#section_user').addClass('section_selected');
		$('.storyORuser').val("user");
		getSearchedContents($('.search_input_container input').val(), "user", 0);
	});

	//좌측 메뉴 열린채로 화면 resize시 메뉴닫음
	$(window).resize(function(){
		$('#left_area').css("display", "none");
		$('.body_cover').css("display", "none");
	});

	$('.search_blue_btn').click(function(){
		getSearchedContents($('.search_input_container input').val(), $('.storyORuser').val(), 0);
	});
	
	$('.recommend_keyword_inner div').hover(function(){
		if(matchMedia("only screen and (min-width:768px)").matches){
			$(this).find('a').css("color", "white");
		}
	}, function(){
		$(this).find('a').css("color", "#9c9da0");
	}).click(function(){
		location.href=$(this).find('a').attr('href');
	});
	
	//페이지 로드 후 검색한 내용으로 다시 db 접근하여 데이터 받아옴
	var storyORuser =  $('.storyORuser').val();
	getSearchedContents($('.search_input_container input').val(), storyORuser, 0);
	
	//콘텐츠 카드 클릭
	$('html body').on('click', '.aContent_img_area', function(){
		// 게시물 보기
		var articleNum = $(this).find('input').val(); // 게시물 번호
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
					$("#search_total_wrapper").css("position","fixed"); // 스크롤 시 뒷배경 움직이지 않게
				}
			}
		});
	});
	
	
    //스크롤 이벤트 캐치하는 함수
	$(window).scroll(function(){
		if($(window).scrollTop() == $(document).height()-$(window).height()){
			loadMore();
		}
	});
});
function loadMore(){
	var loadMore_section = $('.storyORuser').val();
 	$.ajax({
		url: "searchLoadMore",
		type: "POST",
		data: {key: $('#hidden_key').val(), section: loadMore_section, num: $('.scroll_area_container').find('.list_num').length},
		dataType:"JSON",
		async:false,
		success: function(data){
			var cards='';
			if(loadMore_section == 'story'){
				cards += getMoreCardStory(data.cards);
			}else{
				cards += getMoreCardUser(data.cards);
			}
			$('.scroll_area_container ul').append(cards);
		}
	});
}

function getSearchedContents(key, section, num){
	if(key.length>0){
		//모바일 화면일 때 검색하면 추천검색어 div 없앰
		if(matchMedia("only screen and (max-width:767px)").matches){
			$('#search_recommend_area').css("display", "none");
		}
		$.ajax({
			url: "searchKey",
			type: "POST",
			data: {key: key, section: section, num:num},
			success: function(data){
				$('.scroll_area_container>ul').remove();
				$('#search_list_container').css("display", "block");
				$('.scroll_area_container').html(data);
			}
		});
	}
}

function enterEvent(key){
	getSearchedContents(key, $('.storyORuser').val(), 0);
}
function getMoreCardStory(cards){
	var card ='';
	$.each(cards, function(index, entry){
		card +='<li class="contents_li list_num">';
		card +='	<span class="aContent_img_area">';
		card +='		<input type="hidden" value="'+entry.article_id+'">';
		card +='		<span><img src="resources/articleContents/'+entry.pic_url+'"></span>';
		card +='	</span>';
		card +='	<div class="aContent_title_area">';
		card +='		<div class="writer_info">';
		card +='			<span class="writer_profile"><img src="resources/memberImg/'+entry.m_pic+'"></span>';
		card +='			<span class="writer_nickname">'+entry.m_nickname+'</span>';
		card +='		</div>';
		card +='		<div class="aContent_info">';
		card +='			<div class="aContent_title">'+entry.article_title+'</div>';
		card +='			<div class="aContent_subtitle">'+entry.article_subtitle+'</div>';
		card +='		</div>';
		card +='		<div class="aContent_date">'+entry.article_date+'</div>';
		card +='	</div>';
		card +='	<div class="aContent_popularity">';
		card +='		<ul>';
		card +='			<li><div class="aContent_view">'+entry.article_view+'</div></li>';
		card +='			<li><div class="aContent_like">'+entry.article_like+'</div></li>';
		card +='			<li><div class="aContent_reply">'+entry.article_reply+'</div></li>';
		card +='			<li><div class="aContent_share">'+entry.article_share+'</div></li>';
		card +='		</ul>';
		card +='	</div>';
		card +='</li>';
	});
	return card;
}
function getMoreCardUser(cards){
	var card ='';
	$.each(cards, function(index, entry){
		card +='<li class="user_li list_num">';
		card +='	<div class="aUerContainer">';
		card +=		'<div class="aUserInner">';
		card +='			<input type="hidden" value="'+entry.m_id+'">';
		card +='			<div class="aUserImg"><img src="resources/memberImg/'+entry.m_pic+'"></div>';
		card +='			<div class="aUserName">'+entry.m_nickname+'</div>';
		card +='			<div class="aUserIntroduce">'+entry.m_introduce+'</div>';
		card +='		</div>';
		card +='	</div>';
		card +='</li>';
	});
	return card;
}
