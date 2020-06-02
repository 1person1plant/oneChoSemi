
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

  <!--title icon-->
  <link rel="shortcut icon" type="image⁄x-icon" href="img_main/logo.png">
  <title>Cho-당신을 위한 반려식물</title>

  <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

  <style>
    .carousel-control-prev-icon {
      background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
    }

    .carousel-control-next-icon {
      background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
    }

    .carousel-inner {
      width: 100%;
      max-height: 700px !important;
    }

    .carousel-caption {
      position: absolute;
      top: 300px;
      color: black;
    }

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

    /*progress bar css*/
    .spy {
      position: absolute;
      top: 55px;
      z-index: 1;
      width: 100%;
      background-color: #f1f1f1;
      margin: 0;
    }

    /* The progress container (grey background) */
    .progress-container {
      width: 100%;
      height: 8px;
      background: #ccc;
    }

    /* The progress bar (scroll indicator) */
    .progress-bar {
      height: 8px;
      background: #5B89A6;
      width: 0%;
    }

    .navbar {
      margin: 0;
      padding-left: 0;
    }

    .nav-item {
      padding-left: 10px;
    }

    /* BackToTop button css */
    #go-to-top-btn {
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

    #go-to-top-btn:hover {
      background-color: #5b89a6;
    }

    /*상단 navbar*/
    #navbar-top {
      z-index: 10;
      right: 0;
      position: absolute;
      border-width: 0px;
      -webkit-box-shadow: 0px 0px;
      box-shadow: 0px 0px;
      background-color: rgba(0, 0, 0, 0.0);
    }

    /*card는 margin:auto*/
    .container-fluid .card {
      margin: auto;
    }

    .row {
      margin-left: 5rem;
      /*rem:반응형 웹에 좋은듯*/
      margin-right: 5rem;
    }

    /* font 추가*/
    @font-face {
      font-family: 'basicFont';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }

    /* font 적용할 때는 아래와 같이*/
    * {
      font-family: "basicFont";
    }
  </style>

  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
  <header>
    <!-- BackToTop Button -->
    <button onclick="topFunction()" id="go-to-top-btn" title="Go to top">Top</button>
    <script>
      //Get the button
      var goToTopBtn = document.getElementById("go-to-top-btn");
      // When the user clicks on the button, scroll to the top of the document
      function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
      }
    </script> <!-- BackToTop Button end -->

    <!--로고 이미지-->
    <div id="mainlogo">
      <img src="<%=request.getContextPath() %>/images/logo.png" class="img-fluid" alt="Responsive image"
        style="width: 150px; height: 100px; margin-top: 40px;">
    </div>

    <!--상단 nav-->
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

  </header> 
  <section>
    <!-- sticky-top은 header안에서 작동안함 -->
    <!--하단 nav-->
    <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top" id="navbar-bot">
      <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#"><i class="fas fa-home"></i> HOME</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="//codeply.com">ALL</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="//codeply.com">HANGING</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">PLANT</a>
          </li>
        </ul>
      </div>

      <button class="navbar-toggler order-first ml-2" type="button" data-toggle="collapse" data-target=".dual-collapse2">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item px-3">
            <a class="nav-link" href="#"><i class="fas fa-cart-plus"></i></a>
          </li>
        </ul>

        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
        </form>

      </div>

      <div class="spy d-none d-xl-block d-lg-block d-md-block">
        <div class="progress-container bg-light">
          <div class="progress-bar" id="myBar"></div>
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
      function myPageBtn(){
			location.href="<%=request.getContextPath()%>/views/myPage/grade.jsp";
		}
    </script>



</body>
</html>