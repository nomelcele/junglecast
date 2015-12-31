<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#main_body{background:#f1f1f2; margin:0 auto; font-family: Helvetica, 'Dotum', Arial, sans-serif;}
	#content_area{position: relative; margin : 0 auto; height:100%; width:auto; max-width:1280px; display:block; z-index:200;}
	#left_area{position:fixed; width: 284px; height:100%; z-index:190; top:50px;}
		#profile_card{width:282px; height: 287px; background:#fff; border:1px solid #e6e7e8; display:block; margin:8px 0; text-align: center;}
			#profile_card_img{width: 100px; height:100px; border-radius:50px; display: block; margin:36px auto; }
			#my_nickname{width:282px; line-height: 15px; color:#2ba9e0; font-size: 14px; margin:5px 0; font-weight: bold;}
			#my_introduce{width:282px; line-height: 15px; color:#a5a4a4; font-size: 13px; margin:0 0 10px;}
			#mypage_icons{color:#939597; font-size:13px; margin-top:30px;}
			#go_mypage_storage{background:url("resources/images/main/icons/storagebox_icon.png") no-repeat 0 0; background-size : auto 90%; width:60px; display:inline-block; line-height: 15px; text-align:right; }
			#go_mypage_record{background:url("resources/images/main/icons/Clock_icon.png") no-repeat 0 0; background-size : auto 90%; width:50px; display:inline-block; line-height: 15px; text-align:right; margin-left : 10px;}
		#left_menu{width:282px; background:#fff; border:1px solid #e6e7e8; display:block; margin:8px 0; height: 80%;}
		#left_menu_inner{width:100%; height:80%;/*  -ms-overflow-style: none;  */}
			#left_menu_home{color:#404041; font-size: 16px; margin:14px 0 12px 10px; font-weight: bold;}
			#left_menu_categories{background:#fbfbfb; padding: 14px 0 14px 10px;}
			#left_menu_categories>ul>li{list-style: none; margin : 8px 0 8px -4px;}
			#left_menu_categories>ul>li>a{text-decoration: none; color:#4b4b4b; font-size: 14px;}
			#left_menu_categories>ul>li>a:HOVER{color: #00a6de;}
			#categories{color: #a0a0a0; font-size:16px; font-weight: bold; }
	#articles_area{width:990px; height: 100%; float:left; left:288px; top:50px; position: relative; z-index:100;}
		#article_img_slider{height:288px; width:612px; float: left; border:1px solid #e6e7e8; margin:8px 1px; cursor: move; overflow: hidden;}
			#slider_container{position: relative; margin: 0 auto; width:610px;  height: 286px; overflow: hidden;}
			#slider_container>div{cursor: move; /* position: absolute; left: 0px; top: 0px;  */width: 100%; height: auto; overflow: hidden;}
			#article_img_slider>div img{height:100%; width:100%;}
		#best_article_area{height:288px; width:364px; float:right; background: #fff; border:1px solid #e6e7e8; margin:8px 1px;}
			#best_top{height:30px; line-height:30px; width:340px; margin:4px auto; padding: 2px 8px 0 8px; border-bottom: 1px solid #00a1ff;}
			#best_text{color:#00a1ff; font-weight: bolder; font-size: 14px; float:left;}
			#best_time{color:#a5a4a4; font-size:12px; float:right;}
		#contents_cards_area{width:100%; height:100%; float:left; left:288px; }
			.aCard{width:24%; float:left; background:#fff; height: 230px; overflow:hidden; margin:4px 3px 4px 4px; border:1px solid #e6e7e8;}
			.aCard_img_div{width:100%; height: 160px; overflow:hidden;}
			.aCard_img{width:100%; height:auto; z-index: 20;}
			.aCard_txt{width:90%; height: 20%; overflow: hidden; z-index: 50; color:#202021; font-size: 14px; padding:10px;}
	#scroll_up{width:50px; height: 50px; display: block; float: right;}	
			
			.jssorb05 {
                    position: absolute;
                }
                .jssorb05 div, .jssorb05 div:hover, .jssorb05 .av {
                    position: absolute;
                    /* size of bullet elment */
                    width: 16px;
                    height: 16px;
                    background: url(resources/images/main/b05.png) no-repeat;
                    overflow: hidden;
                    cursor: pointer;
                }
                .jssorb05 div { background-position: -7px -7px; }
                .jssorb05 div:hover, .jssorb05 .av:hover { background-position: -37px -7px; }
                .jssorb05 .av { background-position: -67px -7px; }
                .jssorb05 .dn, .jssorb05 .dn:hover { background-position: -97px -7px; }
                .jssora11l, .jssora11r {
                    display: block;
                    position: absolute;
                    /* size of arrow element */
                    width: 37px;
                    height: 37px;
                    cursor: pointer;
                    background: url(resources/images/main/a11.png) no-repeat;
                    overflow: hidden;
                }
                .jssora11l { background-position: -11px -41px; }
                .jssora11r { background-position: -71px -41px; }
                .jssora11l:hover { background-position: -131px -41px; }
                .jssora11r:hover { background-position: -191px -41px; }
                .jssora11l.jssora11ldn { background-position: -251px -41px; }
                .jssora11r.jssora11rdn { background-position: -311px -41px; }
</style>
<body id="main_body">
<jsp:include page="./header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	$('#scroll_up').click(function(){
		alert("clicked");
		$("html,body").stop().animate({'scrollTop' :0}, 400);
	});
});
</script>
<!-- 이미지 슬라이더를 위한 script 파일 -->
<script src="js/bootstrap.min.js"></script>
<script src="js/docs.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<!-- jssor slider scripts-->
<!-- use jssor.slider.debug.js for debug -->
<script src="js/jssor.slider.mini.js"></script>
<div id="content_area">
	<aside id="left_area">
		<div class="hidden">
			<input type="hidden" value=""> <!-- 로그인정보 들어오는곳 -->
		</div>
		<div id="profile_card">
			<img alt="my profile" src="resources/images/main/kangdongwon.jpg" id="profile_card_img">
			<div id="my_nickname">
				내이름이다
			</div>
			<div id="my_introduce">
				내소개다
			</div>
			<div id="mypage_icons">
				<a id="go_mypage_storage">보관함</a>
				<a id="go_mypage_record">기록</a>
			</div>
		</div>
		<div id="left_menu">
			<div id="left_menu_inner">
				<div id="left_menu_home">홈</div>
				<div id="left_menu_categories">
					<div id="categories">골라보기</div>
					<ul>
						<li><a href="">테스트1</a></li>
						<li><a href="">테스트2</a></li>
						<li><a href="">테스트3</a></li>
						<li><a href="">테스트4</a></li>
						<li><a href="">테스트5</a></li>
						<li><a href="">테스트6</a></li>
						<li><a href="">테스트7</a></li>
						<li><a href="">테스트8</a></li>
						<li><a href="">테스트9</a></li>
						<li><a href="">테스트10</a></li>
					</ul>
				</div>
				</div>
		</div>
	</aside>
	<section id="articles_area">
		<div id="article_img_slider">
			<div id="slider_container">
				<div>
					<div><img src="resources/images/main/slider1.jpg" /></div>
	            	<div><img src="resources/images/main/slider2.jpg" /></div>
	            	<div><img src="resources/images/main/slider3.jpg" /></div>
	            	<div><img src="resources/images/main/slider4.jpg" /></div>
				</div>
	            <!-- bullet navigator container -->
	            <div class="jssorb05" style="bottom: 16px; right: 6px;">
	                <!-- bullet navigator item prototype -->
	                <div></div>
	            </div>
	            <!-- Arrow Left -->
	            <span class="jssora11l" style="top: 123px; left: 8px;"></span>
	            <!-- Arrow Right -->
	            <span class="jssora11r" style="top: 123px; right: 8px;"></span>		
			</div>

		</div>
		<div id="best_article_area">
			<div id="best_top">
				<span id="best_text">BEST</span>
				<span id="best_time">2015.12.30.12:00</span>
			</div>
		</div>
		<div id="contents_cards_area">
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic1.png"></div>
				<div class="aCard_txt">미리 보는 12월 30일, <br>내일의 별자리 운세</div>
			</div>
			<div class="aCard"> 
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>
				<div class="aCard_txt">아름다운 우주가 담겨 있는 <br>NASA 인스타그램</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic3.jpg"></div>
				<div class="aCard_txt">아직 준비가 안됐는데 <br>자꾸 재촉하는 남자</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic1.png"></div>
				<div class="aCard_txt">2015년 한 해 가장 많이<br>불법 다운로드된 영화 10</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>
				<div class="aCard_txt">곧 성인되는 진구오빠<br>유정이랑 썸 타던 시절</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic3.jpg"></div>
				<div class="aCard_txt">------------------------------------------------------------!--------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic1.png"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic3.jpg"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic1.png"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic2.jpeg"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div class="aCard">
				<div class="aCard_img_div"><img class="aCard_img" src="resources/images/main/testpic3.jpg"></div>
				<div class="aCard_txt">------------------------------------------------------------</div>
			</div>
			<div id="scroll_up">SCROLL UP</div>
		</div>
	</section>
</div>
   <script>

        jQuery(document).ready(function ($) {
            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $AutoPlayInterval: 2000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideEasing: $JssorEasing$.$EaseOutQuint,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
                $SlideDuration: 800,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                /* $SlideWidth: 600,     */                             //[Optional] Width of every slide in pixels, default value is width of 'slides' container
               /*  $SlideHeight: 300,    */                             //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Scale: false                                   //Scales bullets navigator or not while slider scale
                },

                $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 12,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 4,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                    $Orientation: 1,                                //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                    $Scale: false                                   //Scales bullets navigator or not while slider scale
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth) {
                    jssor_slider1.$ScaleWidth(parentWidth - 30);
                }
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
</body>
</html>