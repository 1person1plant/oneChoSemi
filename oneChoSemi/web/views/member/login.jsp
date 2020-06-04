<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%-- <%
	Member loginUser = null;
boolean result = false;
String adminChk = "";
if (session != null || !request.isRequestedSessionIdValid()) {
	loginUser = (Member) session.getAttribute("loginUser");
	if (loginUser == null) {
		result = true;
	} else {
		//      adminChk = (String)session.getAttribute("admin");
		adminChk = loginUser.getMemberAdmin();
		result = false;
	}
	System.out.println("result " + result);
}
%> --%>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- 폰트 -->
    <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

    <style>
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

    <!-- 아라 스타일 적용 -->
    <style>
        #ara_btn_color {
            background: #1F598C;
            color: white;
            text-align: center bold;
        }
    </style>
    <!-- 아라 스타일 적용 -->
</head>

<body>
	<%-- <%if(loginUser == null){ %> --%>
    <!-- Modal -->
    <form id = "loginForm" action = "<%=request.getContextPath() %>/login.me" 
	method = "post">
	
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="col md-12" style="padding-top: 10px;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <svg class="bi bi-x-circle-fill" width="1em" height="1em" style="color: #6c757d;" viewBox="0 0 16 16" fill="currentColor"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.146-3.146a.5.5 0 0 0-.708-.708L8 7.293 4.854 4.146a.5.5 0 1 0-.708.708L7.293 8l-3.147 3.146a.5.5 0 0 0 .708.708L8 8.707l3.146 3.147a.5.5 0 0 0 .708-.708L8.707 8l3.147-3.146z" />
                            </svg>
                    </button>
                </div>

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                        <div class="col-md-12" align="center" style="position: relative">
                           <img src="<%=request.getContextPath() %>/images/logo.png" style="width: 40%">
                        </div>
                    </h5>

                </div>
                <br>
                <div class="modal-body">
                    <div class="col-md-12">
                        <h3><strong>아이디</strong></h3>
                    </div>
                    <div class="col-md-12">
                        <input type="text" class="form-control" placeholder="아이디를 입력해주세요" maxlength="16" required name="memberId" id="memberId">
                    </div>
                    <br>
                    <div class="col-md-12">
                        <h3><strong>비밀번호</strong></h3>
                    </div>
                    <div class="col-md-12">
                        <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" maxlength="12" required name="memberPwd" id="memberPwd">
                    </div>

                    <br>

                    <div class="col-md-12" align="center">
                        <input type="submit" value="로그인" class="btn btn-primary" id="ara_btn_color"
                            style="width: 80%; margin-bottom: 5px;" onclick="loginGo();"><br>
                        <input class="btn btn-secondary" style="width: 80%;" onclick="joinGo();"value="회원가입">
                    </div>
                </div>

                <div class="modal-footer" style="background: #F2F1DF;">
                    <div class="row  col-md-12">
                        <div class="col-md-6" align="left">
                            <button type="button" class="btn btn-secondary">카카오</button>
                        </div>
                        <div class="col-md-6" align="right">
                            <button type="button" class="btn btn-primary" id="ara_btn_color" onclick="findAcctGo();">계정찾기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
<%--     <!-- 로그인이 성공적으로 됐을 경우 -->
	<%}else { %>
		<div id="userInfo">
			<label><%=loginUser.getMemberName() %>님의 방문을 환영합니다.</label>
			<div class="btns" align="right">
				<div id="logoutBtn" onclick="logout();">로그아웃</div>
			</div>
		</div>
	<%} %> --%>
	
	</div>

	<script>
		function joinGo() {
			location.href="<%=request.getContextPath()%>/views/member/join.jsp";
		}
		
		function findAcctGo() {
			location.href="<%=request.getContextPath()%>/views/member/find_Account.jsp";
		}
		
		function loginGo(){
			if($.trim($("#userId").val()) == ""){ // 아이디는 공백 제거 후 입력 확인
				alert("아이디를 입력하세요");
				$("#memberId").focus();
				return false;
			}
			} else if($("#userPwd").val() == "") { // 비밀번호는 입력만 확인
				alert("비밀번호를 입력하세요");
				$("#memberPwd").focus();
				return false;
			}
				return true;
						
		}
		
<%-- 		// logout()
		function logout(){
			location.href="<%=request.getContextPath()%>/logout.me";
			// logout.me인 LogoutServlet 이동
		} --%>
	</script>







    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>