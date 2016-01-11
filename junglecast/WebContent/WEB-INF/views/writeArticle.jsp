<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<style type="text/css">
::-webkit-input-placeholder{color:#00a1ff; font-size:12px;}
:-moz-placeholder{color:#aaaaaa; font-size:12px;}
::-moz-placeholder{color:#aaaaaa; font-size:12px;}
:-ms-input-placeholder{color:#aaaaaa; font-size:12px;}
textarea, input, select{font-family: 'Dotum', Arial, sans-serif; border:none; font-size:14px; color:#605f5f;}
#wa_body_cover{background:rgba(18,18,18,0.8); margin:0,0; z-index:600; display:none;width:100%; height:100%; position:fixed;}
#middle_cover{width:80%; height:30%; margin: 200px auto;}
#middle_cover span{width:100%; text-align: center; font-size : 16px; height:30px; line-height: 30px; color : #00a1ff;}
#select_img{width:65%; margin:0 auto; max-height:80%; padding:10px; position:absolute; left:13%;}
	#select_img_txt{position:relative; float:left; width:100%; color:white; height:50px; padding:10px; text-align: center; background:#00a1ff; line-height:50px; font-weight:bold; font-size:16px; border-bottom:1px solid #00a1ff;}
	#select_img_imgsArea{position:relative; float:left; width:100%; min-height:200px; max-height: 400px;background:white; float:left; overflow-y: scroll; overflow-x:hidden; padding: 0px 10px 10px 10px;}
	.img_option{width:auto; height:150px;float:left; margin:10px 10px 0 5px; border:5px solid white; cursor:pointer;}
	.img_option img{height:100%; width:auto;}
	#select_btn{position:relative;width:100.5%; height:45px; float:left;background:white; padding: 8px;}
	#select_ok{width:110px; height:40px; line-height:40px; float:right; margin-right:20px; background:#00a1ff; color:white; cursor:pointer;}
	#select_ok:HOVER{background:white; color:#00a1ff; border:1px solid #00a1ff;}
#move_to_main{width:250px; height:100px; margin:0 auto;  padding:10px; position:absolute; left:35%; top : 10%; background:white; border:2px solid #00a1ff; border-radius:8px;}
	#move_to_main_txt{width:100%; height:60px; line-height: 26px; float:left; position:relative; text-align: center; font-size:13px;}
	#move_ok_wrapper{width:100%; height:30px; float:left; position:relative; margin-top:5px;}
	#move_ok{width:110px; height:26px; line-height: 26px; float:right; font-size:13px; color: white; cursor:pointer; background:#00a1ff;}
	#move_ok:HOVER{background:white; color:#00a1ff; border:1px solid #00a1ff;}
.input_file{display: none;}
	#writeArticle_wrapper{float:left; position: relative; display:block;margin : 50px auto 0; height:100%; width:100%; font-family: Helvetica, 'Dotum', Arial, sans-serif;text-align: center;}
	#writingArea_wrapper{width:982px; height:800px; margin:0 auto; padding:10px 30px; position:relative; display:block; text-align: center; background:#fff;}
		#title_wrapper{width:80%; margin: 30px auto 10px; height:150px;display:block;}
			#category_select_div{width:180px; height:30px; line-height: 30px; float:left; border:1px solid #00a1ff;}
				#category_select_div select{width:98%; height:96%; line-height:30px; color:#00a1ff; font-size:13px;}	
				#category_select_div option{font-size:13px; color:#605f5f;}	
			#title_input_div{width:60%; height:30px; line-height: 30px; margin-left:15px; float: left; border:1px solid #00a1ff;}
				#title_input_div input{width:98%; height:90%;}
			#subtitle_textarea_div{width:90%; height:100px; margin: 12px auto 0; float:left;border:1px solid #00a1ff;}
				#subtitle_textarea_div textarea{width:98%; height:98%;}
		#imgCard_wrapper{width:80%; height:180px; margin:0 auto; display:block;}
		.an_imgCard_form{height:180px; width:90%; float:left; border:1px solid #00a1ff; margin:10px auto 0; overflow: hidden; background:white; display:block;}
			.add_img_btn{width:40px; height:40px; background:#00a1ff; margin:0; float:left; cursor: pointer; z-index:100; margin-left:-390px;}
			.add_img_btn img{width:60%; height:60%; margin:7px 7px;}
			.img_preview_div{width:390px; height:100%; float:left; margin:0; text-align: center; color:#888888; line-height:150px; overflow: hidden; z-index:10; font-size:12px; color:#00a1ff;}
			.img_preview{width:auto; height:100%; display:none; margin:0 auto;}
			.img_discription_div{width:310px; height:100%; float:right; margin-right:4px;border-left:1px solid #00a1ff; }
			.img_discription_div textarea{width:100%; height:96%;}
		#add_imgCard_btn{width:72%; height:40px; text-align:center; font-weight:bold; line-height:40px; color:white; float:left; margin:10px 10%; background: #00a1ff; cursor: pointer;}
		#add_imgCard_btn:HOVER, #ok_btn:HOVER{color:#00a1ff; border:1px solid #00a1ff; background: white;}
		#ok_btn{width:60px; height:40px; line-height:40px; text-align:center; background:#00a1ff; color:white; font-weight:bold; margin:10px 0; float:right; font-size:14px; cursor: pointer;}

	.category_title{position:relative; width:99%; float:left; background:#fff; border-left:3px solid #11baf3; border-right:3px solid red; margin:8px 0 10px; overflow:hidden; height:30px; padding:5px;}
	.category_txt{font-size:18px; padding: 4px 4px 4px 13px; float:left; color:#605f5f; font-weight:bold;}
</style>
<script src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//콘텐츠 카드 추가 버튼 클릭
	$('#add_imgCard_btn').click(function(){
		var boolVal = 1;
		for(i=0; i<$('.input_file').length; i++){
			var imgName = $("input[name=pic_url]")[i].files[0];
			if(typeof imgName == 'undefined'){
				boolVal = 0;
			}
		}
		if(boolVal == 0){//이미지를 첨부하지 않은 카드가 있을 때
			alert("이미지를 첨부하십시오.");
		}else{
			add_imgCard();
			var imgCard_height = $('#imgCard_wrapper').css("height");
			var imgCard_height_num = Number(imgCard_height.replace(/[^\d]/g,"")) +180;
			var writingArea_wrapper_height=$('#writingArea_wrapper').css("height");
			var writingArea_wrapper_height_num = Number(writingArea_wrapper_height.replace(/[^\d]/g,"")) +180;
			$('#imgCard_wrapper').css("height", imgCard_height_num +'px');
			$('#writingArea_wrapper').css("height", writingArea_wrapper_height_num +'px');
		}
		
	});
	$('#imgCard_wrapper').on('click', '.add_img_btn', function(e){
		$(this).parent().find('.input_file').click();
	}).on('change', '.input_file', function(e){
		$(this).parent().find('.img_preview_div').empty();
		readURL(this);
	});
	
	$('#select_img_imgsArea').on('click', '.img_option', function(){
		$('.img_option').css('border', '5px solid white');
		$(this).attr('id', 'clicked_image_option').css('border', '5px solid #e78022');
		var selected_id=$(this).find('img').attr('id');
		var extract_id=selected_id.substr(selected_id.lastIndexOf("_")+1);
		$('#selected_img_id').val(extract_id);		
	});
	
	//대표 이미지 선택 후 확인
	$('#select_ok').click(function(){
		if($('#selected_img_id').val() == "0"){
			alert("대표 이미지를 선택하세요.");
		}else{
	 		$.ajax({
				url: "updateArticlePicID",
				data: {pic_id: $('#selected_img_id').val(), article_id: $('#this_article_id').val()},
				dataType: 'JSON',
				type: 'POST',
				success: function (data) {
					$('#select_img').css("display","none");
					$('#move_to_main').css("display", "block");
				}
			});
		}
	});
	
	//메인화면으로 이동 확인
	$('#move_ok').click(function(){
		location.href="main";
	});
	
	//등록 버튼 클릭
	$('#ok_btn').click(function(){ 
		var boolVal = 1;
		for(i=0; i<$('.input_file').length; i++){
			var imgName = $("input[name=pic_url]")[i].files[0];
			if(typeof imgName == 'undefined'){
				boolVal = 0;
			}
		}
		if(boolVal == 0){//이미지를 첨부하지 않은 카드가 있을 때
			alert("모든 카드에 이미지를 첨부하십시오.");
		}
		else if($('select[name=category_id]').val() == "0"){
			alert("카테고리를 지정하십시오.");
		}else if($('#title_input_div').find('input').val().length<5){
			alert("제목을 5자 이상 입력하십시오");
		}
		else{
			$('#wa_body_cover').css("display", "block");
			$('#select_img').css("display","none");
			$('#move_to_main').css("display", "none");
			var form = new FormData($('#insertArticle')[0]);
			
			$.ajax({/******************************************************/
				url: "insertArticle",
				data: form,
				dataType: 'JSON',
				processData: false,
				contentType: false,
				type: 'POST',
				success: function (data) {
					$('#this_article_id').val(data.article_id);
					$('.anImg_article_id').val(data.article_id);
					var img_num =$('.input_file').length;
					var img_form = new FormData();
					
					for(i=0; i<img_num; i++){
						img_form.append("pic_url",$("input[name=pic_url]")[i].files[0]);
					}
					
					$.ajax({/*************************************************/
						url: "uploadImgs",
						data: img_form,
						dataType: 'JSON',
						async: false,
						processData: false,
						contentType: false,
						type: 'POST',
						success: function(data2) {
							
							$('.input_file').attr("type","hidden");
							var imgs =data2.pic_names;
							var imgArr = imgs.split('*');
							var form2;
							
							var img_id;
							var id_arr= new Array(imgArr.length);

							for(j=0; j<imgArr.length; j++){
								$('.input_file').eq(j).val(imgArr[j]);
								form2 = new FormData(document.getElementById("form"+(j+1)));
								
								$.ajax({/*************************************************/
									url: "insertPicture",
									data: form2,
									dataType: 'JSON',
									async: false,
									processData: false,
									contentType: false,
									type: 'POST',
									success: function (data3) {
										console.log(data3.pic_id);
										id_arr.push(data3.pic_id);
										var imgs = '<div class="img_option"><img id="img_option_'+data3.pic_id+'" src="resources/articleContents/'+imgArr[j]+'"></div>';
										$('#select_img_imgsArea').append(imgs);
									}
								});//이미지 업로드 ajax 끝
							}//for문 끝

							$('#middle_cover').css("display","none");
							$('#writingArea_wrapper').css("display", "fixed");
							$('#select_img').css("display","block");
						}//success 함수 끝
					});//이미지 업로드 ajax 끝
					
				}
			});//글 전체 업로드 ajax 끝
		}//else 끝


	});//click함수 끝
});
/*----------------------------------------------------------------------*/
var imgSeq = 1;
function add_imgCard(){
	var aCard = '    <form class="an_imgCard_form" id="form'+ ++imgSeq +'" method="post">';
	aCard += '			  <div class="img_preview_div">이미지를 첨부해 주세요</div>';
	aCard += '			  <div class="add_img_btn"><img src="resources/images/writeArticleIcons/camera_icon.png"/></div>';
	aCard += '			  <input type="file" class="input_file" name="pic_url">';
	aCard += '			  <input type="hidden" name="article_id" class="anImg_article_id">';
	aCard += '			  <input type="hidden" name="pic_order" value="'+imgSeq+'">';
	aCard += '			  <div class="img_discription_div"><textarea placeholder="해당 이미지를 설명하세요" name="pic_text"></textarea></div>';
	aCard += '		  </form>';
		
	$('#imgCard_wrapper').append(aCard);
}

function readURL(input) {
     if (input.files && input.files[0]) {
        var reader = new FileReader();
        var imgTag = '<img src="" class="img_preview">';
        reader.onload = function (e) {
        	$(input).parent().find(".img_preview_div").append(imgTag).find(".img_preview").attr('src', e.target.result).css("display", "block");
        }
        reader.readAsDataURL(input.files[0]);
    }
}

</script>
</head>
<jsp:include page="./topLeft/header.jsp"></jsp:include>
<body style="background:#f1f1f2;">
<section id="writeArticle_wrapper">
<div id="wa_body_cover">
	<div id="middle_cover">
		<img src="resources/images/writeArticleIcons/loader.gif">
		<div><img src="resources/images/writeArticleIcons/loading_text.png"></div>
	</div>
	<div id="select_img">
		<div id="select_img_txt"> 이 포스트를 대표할 이미지를 골라 주세요</div>
		<div id="select_img_imgsArea">
		
		</div>
		<div id="select_btn">
			<input type="hidden" id="this_article_id"  value="">
			<input type="hidden" id="selected_img_id" value="0">
			<div id="select_ok">확인</div>
		</div>
	</div>
	<div id="move_to_main">
		<div id="move_to_main_txt">포스트가 등록되었습니다.<br>메인으로 이동합니다.</div>
		<div id="move_ok_wrapper"><div id="move_ok">확인</div></div>
	</div>
</div>
	<div id="writingArea_wrapper">
		<div class="category_title">
			<span class="category_txt">멋진 이야기를 제공해 주세요 !</span>
		</div>
	<form action="" method="post" id="insertArticle">
		<div id="title_wrapper">
			<div id="category_select_div">
				<select name="category_id">
					<option value="0">카테고리를 선택하세요</option>
					<c:forEach var="aRow" items="${categories }">
						<option value="${aRow.category_id }">${aRow.category_name }</option>
					</c:forEach>
				</select>
			</div>
			<div id="title_input_div"><input type="text" placeholder="제목을 입력하세요" name="article_title"></div>
			<div id="subtitle_textarea_div"><textarea draggable="false" placeholder="이 포스트를 간단히 설명하세요" name="article_subtitle"></textarea></div>
		</div>
	</form>
		<div id="imgCard_wrapper">
			<form class="an_imgCard_form" id="form1" method="post">
				<div class="img_preview_div">이미지를 첨부해 주세요</div>
				<div class="add_img_btn"><img src="resources/images/writeArticleIcons/camera_icon.png"/></div>
				<input type="file" class="input_file" name="pic_url">
				<input type="hidden" name="article_id" class="anImg_article_id">
				<input type="hidden" name="pic_order" value="1">
				<div class="img_discription_div"><textarea placeholder="해당 이미지를 설명하세요" name="pic_text"></textarea></div>
			</form>
		</div>
		<div id="add_imgCard_btn">+ 이미지 콘텐츠 추가</div>
		<div id="ok_btn">등록</div>
		
	</div>
</section>

</body>
</html>