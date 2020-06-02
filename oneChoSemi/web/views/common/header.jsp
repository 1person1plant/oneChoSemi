<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Member adminUser = (Member)session.getAttribute("adminUser");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <title>Cho-당신을 위한 반려식물</title>
    <!--타이틀 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">

    <!-- 아이콘 -->
    <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

    <style>
        /* font start */
        @font-face {
            font-family: 'basicFont';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        * { font-family: "basicFont"; }
        /* font end */
    </style>

    <!-- header css -->
    <style>
        /* 로고 이미지 start */
        #mainlogo {
            width: 100%;
            height: 200px;
            background-color: #F2F1DF;
            text-align: center;
            display: block;
            float: left;
            position: relative;
            margin: 0;
        }
        /* 로고 이미지 end */
    
        /* scrollspy(하단 nav) start */
        .navbotspy {
            position: absolute;
            top: 55px;
            z-index: 1;
            width: 100%;
            background-color: #f1f1f1;
            margin: 0;
        }
        .navbotspy-progress-container { /* scrollspy 배경 */
            width: 100%;
            height: 8px;
            background: #ccc;
        }
        .navbotspy-progress-bar { /* scrollspy 진행상태 바 */
            height: 8px;
            background: #5B89A6;
            width: 0%;
        }
        /* scrollspy end */
        /* navbar 공통 start */
        #navbar-top,
        #navbar-bot {
            margin: 0;
            padding-left: 0;
        }
    
        #navbar-top .nav-item,
        #navbar-bot .nav-item{
            padding-left: 10px;
        }
        /* navbar 공통 end */
        /* 상단 navbar start */
        #navbar-top {
            z-index: 10;
            right: 0;
            position: absolute;
            border-width: 0px;
            -webkit-box-shadow: 0px 0px;
            box-shadow: 0px 0px;
            background-color: rgba(0, 0, 0, 0.0);
        }
        /* 상단 navbar end */
    
        /* 탑버튼 start */
        #top-btn {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 30px;
            z-index: 99;
            font-size: 18px;
            border: none;
            outline: none;
            background-color: #1f598c;
            color: white;
            cursor: pointer;
            padding: 15px;
            border-radius: 4px;
        }
        #top-btn:hover {
            background-color: #5b89a6;
        }
        /* 탑 버튼 end */
    </style>
</head>

<body>
    <header>
        <!--탑 버튼-->
        <button onclick="topFunction()" id="top-btn" title="Go to top">Top</button>

        <!--로고 이미지-->
        <div id="mainlogo">
            <img src="<%=request.getContextPath() %>/images/logo.png" class="img-fluid" alt="Responsive image" style="width: 150px; height: 100px; margin-top: 40px;">
        </div>
    <!--상단 navbar-->
	<%if(loginUser == null){ %>
	<!-- 로그인 실패 -->
        <div style="position: relative;">
            <nav class="navbar navbar-expand navbar-light" id="navbar-top">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" onclick="myPageBtn();">마이페이지</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
	<%}else {%>
	<!-- 로그인 성공 -->
		<div style="position: relative;">
		    <nav class="navbar navbar-expand navbar-light" id="navbar-top">
		        <div class="collapse navbar-collapse" id="navbarSupportedContent">
		            <ul class="navbar-nav ml-auto">
		                <li class="nav-item">
		                    <a class="nav-link" href="#">로그인</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link" onclick="myPageBtn();">마이페이지</a>
		                </li>
		            </ul>
		        </div>
		    </nav>
		</div>
    <%} %>   
    </header>
    
    <!-- sticky-top은 header안에서 작동안함 -->
    <!--하단 nav-->
    <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top" id="navbar-bot">
        <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><i class="fas fa-home"></i> HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">ALL</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">HANGING</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">PLANT</a>
                </li>
            </ul>
        </div>
        <button class="navbar-toggler order-first ml-2" type="button" data-toggle="collapse"
            data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item px-3">
                    <a class="nav-link" onclick="goCart();"><i class="fas fa-cart-plus"></i></a>
                </li>
            </ul>

            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        <div class="navbotspy spy d-none d-xl-block d-lg-block d-md-block">
            <div class="navbotspy-progress-container progress-container bg-light">
                <div class="navbotspy-progress-bar progress-bar" id="myBar"></div>
            </div>
        </div>
    </nav>

    <!--user가 scroll 내릴 때 발생하는 function 모음-->
    <script>
        // When the user scrolls the page, execute myFunction
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () { myFunction() };
        function myFunction() {
            //progress bar
            var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
            var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            var scrolled = (winScroll / height) * 100;
            document.getElementById("myBar").style.width = scrolled + "%";
            var goToTopBtn = document.getElementById("top-btn");
            //gototop button visible
            if (winScroll > 10) {
                goToTopBtn.style.display = "block";
            } else {
                goToTopBtn.style.display = "none";
            }
            //navbar-bottom transparent&opaque
            if (winScroll > 10) {
                $('#navbar-bot').css('opacity', '0.6');
                $('#navbar-bot').bind('mouseenter', function () {
                    $('#navbar-bot').css('opacity', '1');
                }).bind('mouseleave', function () {
                    $('#navbar-bot').css('opacity', '0.6');
                })
            } else {
                $('#navbar-bot').unbind('mouseenter').unbind('mouseleave');
                $('#navbar-bot').css('opacity', '1');
            }
        }
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
        function myPageBtn(){
			location.href="<%=request.getContextPath()%>/views/myPage/grade.jsp";
		}
        function goCart(){
			location.href="<%=request.getContextPath()%>/views/cart/cart.jsp";
		}
    </script>

</body>
</html>