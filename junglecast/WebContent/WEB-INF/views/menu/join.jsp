<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
		.container_top{
			position:relative; margin-top:148px; margin-bottom:70px;
		}
		.header{
			width:230px; height:78px; margin:0 auto;
		}
		.c_header{
			float:left
		}
		.contents{
			height:392px;
		}
		.mid_contents{
			position:relative;width:427px;height:392px;background-color:#FFFFFF;
			background-color: rgba( 255, 255, 255, 0.7 ); border-radius: 7px 7px 7px 7px;  margin:0 auto;
		}
		.c_contents{
			width:337px; margin:0 auto; 
		}
		.c_text{
			width:337px; padding-top:56px;  padding-bottom:38px; text-align:center;
		}
		.emailbutton{
			padding-bottom:10px;
		}
		.emailbutton input{
			width:337px; height:48px; background-color:#00A1FF; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; margin:0 auto; font-family:"돋움";
		}
		.fbbutton{
			padding-bottom:10px;
		}
		.fbbutton input{
			width:337px; height:48px; background-color:#556D9C; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; margin:0 auto; font-family:"돋움";
		}
		.kakaobutton{
			padding-bottom:36px; border-bottom:1px solid #C4C5C4;
		}
		.kakaobutton input{
			width:337px; height:48px; background-color:#B2AE40; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; margin:0 auto; font-family:"돋움";
		}
		.last_text{
			text-align:center; padding-top:24px;
		}
</style>
</head>
<body>
<script type="text/javascript">
 var bgImg = ['resources/images/loginImg/login_1.jpg','resources/images/loginImg/login_2.jpg','resources/images/loginImg/login_3.jpg',
              'resources/images/loginImg/login_4.jpg','resources/images/loginImg/login_5.jpg','resources/images/loginImg/login_6.jpg']
  var ran = Math.floor(bgImg.length*Math.random())
 document.body.style.backgroundImage = 'url('+bgImg[ran]+')';
</script>
<div class="container_top">
	<div class = "header">
		<div class = "c_header">
			<a href = "/junglecast" target = "_self">
				<img src="resources/images/loginImg/pikicast_logo.png" width = 212px height = 78px>
			</a>
		</div>
	</div>
</div>
<div class = "contents">
	<div class = "mid_contents">
		<div class = "c_contents">
			<div class = "c_text">
				<span><font style = "font-size: 18px; font-weight: bold; color: #707070; font-family: '돋움';">원하시는 가입 유형을 선택해주세요.</font></span>
			</div>
			<div class = "emailbutton">
				<input type = "submit" value = "이메일 계정 만들기">
			</div>
			<div class = "fbbutton">
				<input type = "submit" value = "페이스북 계정 만들기">
			</div>
			<div class = "kakaobutton">
				<input type = "submit" value = "카카오톡 계정 만들기">
			</div>
			<div class = "last_text">
				<span><font style = "font-family: '돋움체';">이미 가입하셨나요?&nbsp;</font></span>
				<a href = "/junglecast/menu=login" target = "_self" style="color:#00A1FF;"><font style = "font-family: '돋움체';">로그인하기</font></a></div>
			</div>
		</div>
	</div>
</div>

</body>
</html>