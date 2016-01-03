<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
textarea, input, select{font-family: 'Dotum', Arial, sans-serif; border:none;}
	#writeArticle_wrapper{float:left; background:#f1f1f2; position: relative; display:block;margin : 50px auto 0; height:100%; width:100%; font-family: Helvetica, 'Dotum', Arial, sans-serif;
									text-align: center;}
	#writingArea_wrapper{width:982px; height:1000px; margin:0 auto; padding:30px; position:relative; display:block;}
		#title_wrapper{width:80%; margin: 30px auto 10px; height:150px;}
			#category_select_div{width:180px; height:30px; line-height: 30px; float:left;}
				#category_select_div select{width:100%; height:100%; line-height:30px;}		
			#title_input_div{width:60%; height:30px; line-height: 30px; margin-left:15px; float: left;}
				#title_input_div input{width:100%; height:90%;}
			#subtitle_textarea_div{width:90%; height:100px; margin: 12px auto; float:left;}
				#subtitle_textarea_div textarea{width:100%; height:100%;}
		#imgCard_wrapper{width:80%; height:auto; margin:0 auto; }
		.an_imgCard_div{height:140px; width:90%; float:left; margin:0 auto; border:1px solid #00a1ff;}
			.add_img_btn{width:40px; height:40px; background:#00a1ff; margin:0; float:left;}
			.add_img_btn img{width:60%; height:60%; margin:7px 7px;}
			.img_preview_div{width:50%; height:100%; float:left; margin:4px 0 0 2%; text-align: center; color:#888888; line-height:80px;}
			.img_discription_div{width:40%; height:100%; float:right; margin-right:4px;}
			.img_discription_div textarea{width:100%; height:96%;}
		#add_imgCard_btn{width:72%; height:40px; text-align:center; font-weight:bold; line-height:40px; border:1px solid #00a1ff; color:#00a1ff;
									float:left; margin:10px 10%;}
		#ok_btn{width:60px; height:40px; line-height:40px; text-align:center; background:#00a1ff; color:white; font-weight:bold; margin:10px 0; float:right; font-size:14px;}
</style>
<jsp:include page="./header.jsp"></jsp:include>
<body>
<section id="writeArticle_wrapper">
	<div id="writingArea_wrapper">
	<form>
		<div id="title_wrapper">
			<div id="category_select_div">
				<select>
					<option>카테고리를 선택하세요</option>
					<c:forEach var="aRow" items="${categories }">
						<option value="${aRow.category_id }">${aRow.category_name }</option>
					</c:forEach>
				</select>
			</div>
			<div id="title_input_div"><input type="text" placeholder="제목을 입력하세요"></div>
			<div id="subtitle_textarea_div"><textarea draggable="false" placeholder="이 포스트를 간단히 설명하세요"></textarea></div>
		</div>
		<div id="imgCard_wrapper">
			<div class="an_imgCard_div">
				<div class="add_img_btn"><img src="resources/images/writeArticleIcons/camera_icon.png"/></div>
				<div class="img_preview_div">이미지 미리보기...</div>
				<div class="img_discription_div"><textarea placeholder="해당 이미지를 설명하세요"></textarea></div>
			</div>
		</div>
		<div id="add_imgCard_btn">+ 이미지 콘텐츠 추가</div>
		<div id="ok_btn">등록</div>
		</form>
	</div>
</section>

</body>
</html>