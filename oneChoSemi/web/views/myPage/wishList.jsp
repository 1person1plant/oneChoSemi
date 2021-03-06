<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.container{
			padding-top:2%;
		}
		body{padding-top:10px;
		}
		fieldset {
            height: auto;
            margin: 5px;
            margin-bottom: 50px;
            background: white;
            padding-left: 50px;
            padding-right: 50px;
            text-align: center;
        } 
		        
        
        /* 테이블 가운데 정렬 */
        .table td, table th{
        	vertical-align:middle !important;
        }
        
        /* 버튼 CSS */
        .button1{
			padding:8px 18px;
			margin:5px;
			border-radius:8px;
			color:black;
			border: 1px solid #115D8C;
			background-color:white;
			width:105px;
			height:42px;
		}
		.button1 :hover{
			border-radius:8px !important;
			background:#6AAED9 !important;
			color:white !important;
			transition:0.2s !important;
		}
		.button1 :active{
			border-radius:8px !important;
			background:#012340 !important;
		}
		#countp {
            text-align: right;
            font-size: 14px;
            padding-right: 10%;
        }
        textarea:focus{
            outline: 2px solid #6AAED9;
        }
        p{
        	margin-bottom:0px !important;
        }
	</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	<div class="container">
        <div class="row">
            <%@include file="myPageCategory.jsp" %>
            <!-- 9단길이의 첫번째 열 -->
            <div class='col-md-9'>
                <fieldset>
                    <form>
                    <table class="table">
                        <thead>
                            <tr><br>
                                <th colspan="9" scope="col" style='border-bottom:2px solid black'>
                                    <h1>위시리스트</h1>
                                </th>
                            </tr>
                        </thead>
                        <tbody class='bodycss'>
                            <tr style='border-bottom:2px solid black'>
                                <th colspan='1'>번호</th>
                                <th colspan="2" class='wishmenu'>상품이미지</th>
                                <th scope="row" colspan='2' class="wishmenu">상품명</th>
                                <th colspan="2" class='wishmenu'>메모</th>
                                <th colspan="2" class='wishmenu'>기타</th>
                            </tr>
                            <tr style='border-bottom:2px solid black'>
                                <td colspan='1' class="mt-2">???</td>
                                <td colspan="2" class='mt-2'><a href='#'><img src='flo.jpg' width='150px' height='150px'></a></td>
                                <td scope="row" colspan='2' class="mt-2">???</td>
                                <td colspan="2" class='mt-2'><textarea id="memo1" class='textA' cols='25' rows='5' maxlength='150' disabled></textarea><br>
                                    <p id='countp'><span id='counter1'>0</span>/100</p>
                                </td>
                                <td id='orderbutton' colspan="2"><button type='button'
                                            class='button1' id='changeM'>메모수정</button><br>
                                    <a href='main.jsp' id='delete'><button type='button'
                                            class='button1'>상품구매</button></a><br>
                                    <a href='main.jsp' id='delete'><button type='button'
                                            class='button1'>상품삭제</button></a></td>
                            </tr>
                            <tr style='border-bottom:2px solid black'>
                                <td colspan='1' class="mt-2">???</td>
                                <td colspan="2" class='mt-2'><a href='#'><img src='flo.jpg' width='150px' height='150px'></a></td>
                                <td scope="row" colspan='2' class="mt-2">???</td>
                                <td colspan="2" class='mt-2'><textarea id='memo2' cols='25' rows='5' disabled></textarea><br>
                                    <p id='countp'><span id='counter2'>0</span>/100</p>
                                </td>
                                <td id='orderbutton' colspan="2"><a href='main.jsp' id='delete'><button type='button'
                                            class='button1'>메모수정</button></a><br>
                                    <a href='main.jsp' id='delete'><button type='button'
                                            class='button1'>상품구매</button></a><br>
                                    <a href='main.jsp' id='delete'><button type='button'
                                            class='button1'>상품삭제</button></a></td>

                            </tr>

                        </tbody>
                    </table>
                </form>
                </fieldset>

            </div>
            <script>
                $(function(){
                    $('#memo1').keyup(function(){
                        var minL = $(this).val().length;
                        $('#counter1').text(minL);
                        var maxL = 100-minL;
                        if(maxL>=0){
                            $('#counter1').parent().css('color','black');
                        }else{
                            $('#counter1').parent().css('color','red');
                            alert('입력 가능한 글자수를 초과하였습니다.');
                        }
                    })
                    $('#memo2').keyup(function(){
                        var minL = $(this).val().length;
                        $('#counter2').text(minL);
                        var maxL = 100-minL;
                        if(maxL>=0){
                            $('#counter2').parent().css('color','black');
                        }else{
                            $('#counter2').parent().css('color','red');
                            alert('입력 가능한 글자수를 초과하였습니다.');
                        }
                    })
                    $('#changeM').click(function(){
                        if($('.textA').prop('disabled')==true){
                            $('.textA').attr('disabled',false);
                        }else if($('.textA').prop('disabled')==false){
                            $('.textA').attr('disabled',true);
                        }
                    })
                    
                })
            </script>
            <script>
            	$(function(){
            		$(".button1").mouseenter(function(){
            			$(this).css({"background":"#6AAED9","color":"white","transition":"0.2s","border-radius":"8px"});
            		}).mouseout(function(){
            			$(this).css({"padding":"8px 18px","border-radius":"8px","color":"black","border":"1px solid #11538C","background-color":"white",
            			"width":"105px", "height":"42px"});
            		});
            	});
            </script>
			
	<%@ include file="../common/footer.jsp"%>
</body>
</html>