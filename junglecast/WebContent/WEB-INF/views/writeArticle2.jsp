<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<script src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
textarea, input, select{font-family: 'Dotum', Arial, sans-serif; border:none; font-size:14px;}
	#writeArticle_wrapper{float:left; position: relative; display:block;margin : 50px auto 0; height:100%; width:100%; font-family: Helvetica, 'Dotum', Arial, sans-serif;text-align: center;}
	#writingArea_wrapper{width:982px; height:800px; margin:0 auto; padding:30px; position:relative; display:block;background:#f1f1f2; text-align: center; }
		#title_wrapper{width:100%; margin: 30px auto 5px; height:130px;display:block;}
			#category_select_div{width:180px; height:30px; line-height: 30px; float:left;}
				#category_select_div select{width:100%; height:100%; line-height:30px;}		
			#title_input_div{width:700px; height:30px; line-height: 30px; margin-left:15px; float: left;}
				#title_input_div input{width:100%; height:90%;}
			#subtitle_textarea_div{width:92%; height:70px; margin: 12px auto 0; float:left;}
				#subtitle_textarea_div textarea{width:100%; height:100%;}
		#content{width:900px; height:500px; float:left;}
		#writeArticle_btns{margin-top:10px; width:100%; float:left;}
		.writeArticle_btns_inner{float:right; margin-right:50px;}
		#writeArticle_btns input{width:70px; height:40px; background:#00a1ff; padding:6px 0; border:1px solid #00a1ff; color:white; margin-left:4px; cursor:pointer;}
</style>
<script type="text/javascript">
var oEditors = [];
$(function(){
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors,
						elPlaceHolder: "content",
						//SmartEditor2Skin.html 파일이 존재하는 경로
						sSkinURI: "resources/editor/SmartEditor2Skin.html",	
						htParams : {
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar : true,				
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true,		
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true,			
							fOnBeforeUnload : function(){
								
							}
						}, 
						fOnAppLoad : function(){
							//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
							oEditors.getById["content"].exec("PASTE_HTML", [""]);
						},
						fCreator: "createSEditor2"
					});
					
					$("#save").click(function(){
						oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
						$("#frm").submit();
					})
});
</script>
</head>

<jsp:include page="./topLeft/header.jsp"></jsp:include>
<body>
<section id="writeArticle_wrapper">
	<div id="writingArea_wrapper">
		<form id="frm" action="writeArticle2" method="post" >
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
				<div id="subtitle_textarea_div"><textarea  draggable="false" placeholder="이 포스트를 간단히 설명하세요" name="article_subtitle"></textarea></div>
			</div>
			<textarea rows="10" cols="30" id="content" name="content"></textarea>
			<div id="writeArticle_btns">
				<div class="writeArticle_btns_inner">
					<input type="button" id="save" value="저장"/>
					<input type="button" value="취소"/>
				</div>
			</div>
		
		
		</form>
	</div>
</section>
</body>
</html>