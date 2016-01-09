<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script>
		$(function(){
			
			$('.l_button').on('click',function(){
				var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
				if($('#id').val()==""){
					jQuery('#warning1').hide();
					jQuery('#warning2').hide();
					jQuery('#warning2').show();
				}
				else if(regex.test($('#id').val())){
					
				}
				else{
					jQuery('.darkwindow').show();
					jQuery('.error').show();
					jQuery('#warning1').hide();
					jQuery('#warning2').hide();
					jQuery('#warning1').show();
				}
			
				/* jQuery('.container').hide();
				jQuery('.layer_2').show(); */
			
			});
			$('.cancel').on('click',function(){
				jQuery('.darkwindow').hide();
				jQuery('.error').hide();				
			});
			$('.correct').on('click',function(){
				jQuery('.darkwindow').hide();
				jQuery('.error').hide();
			});
		});


	</script>
	<style>
		::-webkit-input-placeholder {
   			color:#828180;
		}

		:-moz-placeholder { /* Firefox 18- */
   			color:#828180;  
		}

		::-moz-placeholder {  /* Firefox 19+ */
   			color:#828180; 
		}

		:-ms-input-placeholder {  
   			color:#828180;  
		}
		.container{
			position:relative; margin-top:148px;
		}
		.header_1{
			width:230px; height:78px; margin:0 auto; padding-bottom:70px; 
		}
		.c_header{
			float:left;
		}
		#mid_contents{
			position:relative; margin:0 auto; width:430px;height:480px;background-color:#FFFFFF;
			background-color: rgba( 255, 255, 255, 0.7 ); border-radius: 7px 7px 7px 7px;
		}
		#c_board{
			width:336px; margin:0 auto; padding-top:65px;
		}
		#b_id{
			margin-bottom:18px; width: 336px; height:29px; border-bottom:2px solid #C4C5C4;
		}
		#b_pw{
			margin-bottom:13px; width: 336px; height:29px; border-bottom:2px solid #C4C5C4;
		}
		#id{
			border:none; font-size:15px; color:#828180; background-color: transparent; width:100%;
			
		}
		#pw{
			border:none; font-size:15px; color:#828180; background-color: transparent; width:100%;
		}
		#emailsave{
			margin-bottom:13px;
		}
		#loginbotton input{
			width:336px; height:50px; background-color:#00A1FF; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px;
		}
		#warning{
			display:block; width: 336px; height:25px; margin-top:7px; spanning-bottom:7px; border-bottom:1px solid #C4C5C4;
		}
		#fblogin input{
			width:336px; height:50px; background-color:#556D9C; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; margin-top:8px;
		}
		#kakaologin input{
			width:336px; height:50px; background-color:#B2AE40; color:#FFFFFF; font-size:16px; border:none; cursor:pointer;
			border-radius: 0px 0px 0px 0px; margin-top:8px;
		}
		#other{
			width:336px; margin-top:15px; padding-top:20px; border-top:1px solid #C4C5C4;
		}
		#join{
			float:left;
		}
		#password{
			float:right;
		}
		#join a {color:#00A1FF;}
		#password a {color:#626262;}
		.darkwindow{
			display:none; position: fixed; z-index: 100; left: 0px; top: 0px;width: 100%;height: 100%;background-color: rgba( 0, 0, 0, 0.6 ); height:100%; margin-bottom:0px;
		}
		.error{
			display:none;top:50%; left:50%; margin-top:-71px; margin-left:-150px; position:absolute; z-index:1001; border-radius:10px; background-color:#FFFFFF; padding-top:22px; margin-right:10px; width:300px;
			font-family:'돋움'; font-size:12px; color:#58595B;
		}
		.cancel{
			margin:0px; border:none;padding-top:10px; padding-bottom:10px; font-size:14px; display:inline-block; width:49%; background:#CFCFCF; border-bottom-left-radius:10px; text-align:center; font-weight: bold; color: #58595B; cursor:pointer; font-family: '돋움'
		}
		.correct{
			margin:0px; border:none;padding-top:10px; padding-bottom:10px; font-size:14px; display:inline-block; width:49%; background:#00A6DE; border-bottom-right-radius:10px; text-align:center; font-weight: bold; color: #FFFFFF; cursor:pointer; font-family: '돋움'
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
<div class="container">
	<div class = "header_1">
		<div class = "c_header">
			<a href = "/junglecast" target = "_self">
				<img src="resources/images/loginImg/pikicast_logo.png" width=212px height=78px>
			</a>
		</div>
	</div>
	<div id = "mid_contents">
		<div id = "c_board">
			<form action = "" method="post">
				<div id = "b_id">
					<input type = "text" name="id" placeholder = "이메일을 입력하세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력하세요.'" id = "id"/>
				</div>
				<div id = "b_pw">	
					<input type = "password" name="pw" placeholder = "비밀번호를 입력하세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호를 입력하세요.'" id = "pw"/>
				</div>
			</form>
			<div id = "emailsave" style="line-height:16px;">
				<label><input type = "checkbox" name ="emailsave">
				<span style="font-size:15px; vertical-align:top;">이메일 저장</span></label>
			</div>
			<div id = "loginbotton">
				<input type = "submit" value = "로그인" class="l_button">
			</div>
			<div id = "warning">
				<p id="warning1" style="display:none; font-size:10pt; color:red;">올바른 이메일 형식이 아닙니다.</p>
				<p id="warning2" style="display:none; font-size:10pt; color:red;">이메일은 필수 입력 항목입니다.</p>
			</div>
			<div id = "fblogin">
				<input type = "submit" value = "페이스북 로그인">
			</div>
			<div id = "kakaologin">
				<input type = "submit" value = "카카오톡 로그인">
			</div>
			<div id = "other">
				<div id = "join"><a href = "/junglecast/menu=join" target = "_self">회원가입</a></div>
				<div id = "password"><a href = "/junglecast/menu=password" target = "_self">비밀번호 찾기</a></div>
			</div>
		</div>
	</div>
</div>
<div class="darkwindow"></div>
<div class="error">
	<div class="e_text" style="background:#FFFFFF; margin:0px; font-family:'돋움'; font-size:12px;">
		<p style="padding-top:15px; padding-bottom:30px; font-weight:bold; text-align:center; line-height:20px; margin:0px; border:0px;">이메일 또는 비밀번호를 확인해주세요.</p>
	</div>
	<div class="buttons" style="text-align: left; background: #00a6de; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
		<input type = "submit" value="취소" class="cancel">
		<input type = "submit" value="확인" class="correct">
	</div>
</div>
</body>
</html>