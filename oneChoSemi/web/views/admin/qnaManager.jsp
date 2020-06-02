<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!--title icon-->
    <link rel="shortcut icon" type="image⁄x-icon" href="img_main/logo.png">
    <title>Cho-당신을 위한 반려식물</title>
    
    <!--icon-->
    <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

    <!--datatable-->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
  
    

    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>

 .modal-body ul{
        list-style-type: none;
    }

    .modal-body ul li{
        margin-bottom: 2rem;
    }

    /*datatable css*/
    div.dataTables_wrapper {
        width: 70rem;
        margin: 0 auto;
       
    }
</style>


</head>
<body>

<%@ include file="../common/header.jsp" %>


<div class="container-fluid">
      <div class="row">


        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
  
              <h3 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                  <span>ADMIN</span>
                  <a class="d-flex align-items-center text-muted" href="#">
                    <span data-feather="plus-circle"></span>
                  </a>
                </h3>
  
                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                  <span><i class="fas fa-gifts"></i>상품관리</span>
                  <a class="d-flex align-items-center text-muted" href="#">
                    <span data-feather="plus-circle"></span>
                  </a>
                </h6>
  
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                  	상품등록 <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file"></span>
                 	 상품조회/수정
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="shopping-cart"></span>
                 	 재고관리
                </a>
              </li>
              
            </ul>
    
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span><i class="fas fa-money-check-alt"></i>판매관리</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
  
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                 	 주문내역 조회
                </a>
              </li>
            </ul>
  
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span><i class="fas fa-users"></i>고객관리</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
  
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  	고객계정 관리
                </a>
              </li>
            </ul>
  
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span><i class="far fa-question-circle"></i>고객센터</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
  
           <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="#">
              <span data-feather="home"></span>
              	리뷰관리 <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
             	 Q&A
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart"></span>
              	공지사항
            </a>
          </li>
          
        </ul>
          </div>
        </nav>

          <!--vertical nav 끝-->
 

          <!--form 시작-->
          
        <div class="col-9">
            <div class="container-fluid">
            <h1 style="margin-top: 30px;margin-bottom: 80px; text-align: left;">Q&A 관리</h1>

                

            <form class="mx-auto" style="margin-bottom: 10rem; width: 60rem;">
                
                <table style="border: double black; width: 100%;" id="searchTable">
                        <tr>
                        <th colspan="5" style="text-align: center;height: 7rem;">검색</th>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">기간</th>
                        <td>
                            <select style="position: relative;margin-left: 6px; width: 7rem;right: 9px;height: 2rem;" id="searchDate">
                                <option>작성일</option>
                        
                            </select>
                        </td>
                        <td>
                            <button type="button" id="today">오늘</button>
                            <button type="button" id="aweek">1주일</button>
                            <button type="button" id="amonth">1개월</button>
                        </td>
                        <td colspan="2" style="position: relative;top:2px;"><input type="date" id="date1"><label>~</label><input type="date" id="date2"></td>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">답변여부</th>
                        <td colspan="4" style="text-align: left;">
                            <input type="radio" name="reply" value="complete" id="complete"><label for="available">답변완료</label>
                            <input type="radio" name="reply" value="required" id="required"><label for="inavailable">미답변</label>
                           
                            
                            
                        </tr>
                        <tr style="height: 3rem;">
                            <th style="text-align: center; width: 10rem;">질문분류</th>
                            <td colspan="1">
                                <select style="width: 7rem;position: relative;right: 5px;height: 2rem;">
                                    <option selected>전체</option>
                                    <option>상품문의</option>
                                    <option>취소문의</option>
                                    <option>배송문의</option>
                                </select>
                            </td>
                            <td colspan="3">
                               
                            </td>
                            
                            
                        </tr>
                        <tr style="height: 3rem;">
                            <th style="text-align: center; width: 10rem;">상세조건</th>
                            <td colspan="1">
                                <select style="width: 7rem;position: relative;right: 5px;height: 2rem;">
                                    <option selected>전체</option>
                                    <option>게시자ID</option>
                                    <option>제목</option>
                                </select>
                            </td>
                            <td colspan="3">
                                <input type="text" style="width: 23rem;" placeholder="내용을 입력해주세요.">
                            </td>
                            
                            
                        </tr>
                        <tr>
                            
                            <td colspan="5" style="text-align: right; height: 6rem;">
                                <button type="submit" class="btn btn-dark" style="width: 7rem;margin-right: 2rem;">조회</button>
                                <button type="reset" class="btn btn-outline-dark" style="width: 7rem;margin-right: 2rem;">초기화</button>
                                
                            </td>
                                
                            </tr>
                        </table>
                    </form>

                    <div class="row mx-auto" style="text-align: center;">
                    <table id="qnalist" class="display nowrap mx-auto" style="width:100%;text-align: center;">
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>분류</th>
                                <th>제목</th>
                                <th>게시자ID</th>
                                <th>작성일</th>
                                <th>답변상태</th>
                                <th>수정/삭제</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>t01</td>
                                <td>상품문의</td>
                                <td>미니 스투키의 크기가 미니가 아니에요.</td>
                                <td>charlie123</td>
                                <td>2020-05-24</td>
                                <td>미답변</td>
                                <td><button>답변</button><button>삭제</button></td>
                            </tr>
                           
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>글번호</th>
                                <th>분류</th>
                                <th>제목</th>
                                <th>게시자ID</th>
                                <th>작성일</th>
                                <th>답변상태</th>
                                <th>수정/삭제</th>
                            </tr>
                        </tfoot>
                    </table>
                    </div>

                     <!-- The Modal -->
                     <div class="modal" id="myModal">
                        <div class="modal-dialog">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">Q&A</h4>
                            
                            <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                            <form>

                                
                                <ul style="padding: 0;">
                                    <li><label>분류</label><br><input type="text" readonly id="Qcategory"></li>
                                    <li><label>작성일</label><br><input type="date" readonly id="Qdate"></li>
                                    <li><label>제목</label><br><input type="text" readonly id="Qtitle" style="width: 100%;"></li>
                                    <li><label>문의내용</label><br><textarea id="question" readonly style="width: 100%;"></textarea></li>
                                    <li><label>이미지</label><br><img src="img_main/test2.jpg" style="width: 100%; height: 500px;"></li>
                                    <li><label>답변내용</label><br><textarea id="answer" style="width: 100%;"></textarea></li>
                                    
                                </ul>    
                            </form>
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="button" class="btn btn-outline-success" onclick="modifyConfirm();">답변하기</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteConfirm();">삭제하기</button>
                            </div>
                    
                        </div>
                        </div>
                    </div>
                    <!--모달 끝-->


              
              
              
            </div>  
            
        
            
          
            



        </div>
            
         
            
       
      

        </div>


    </div>

    <div class="container-fluid">
      <div class="jumbotron text-center" style="background-image:url('<%=request.getContextPath() %>/images/admin/head.jpg'); height: 300px;">
        
      </div>
    </div>



  </section>


	 <!--datatable 관련 script-->
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 <script>
     $(document).ready( function () {
         $('#qnalist').DataTable({
              "scrollX":true
         });
         
         var rows=$("#qnalist").children().children()
          
         
         for(var i=0;i<rows.length;i++){
             
             if(i>0&&i<=(rows.length-1)){
                 
                 console.log(i);
                 rows.eq(i).attr({"data-toggle":"modal","data-target":"#myModal"});
                 
                }
            }
            
            
            rows.click(function(){
                
                
                
                $("#Qtitle").val($(this).children().eq(2).text());
                $("#Qcategory").val($(this).children().eq(1).text());
                $("#Qdate").val($(this).children().eq(4).text());

                $("#question").val();
                $("#answer").val();
                
               
                
            })

          
          

            
            rows.children('button').click(function(){
                rows.trigger('click');
            })
            
            
            
        });
        
        
        </script>

        <!--수정/삭제 시 서버로 값 넘기기-->
        <script>
            
            function modifyConfirm(){
                
                var answer=confirm("답변하시겠습니까?");
                
                if(answer){
                    
                $('#modalClose').trigger('click');
                console.log($("#modifyDate").val());

            }
        }
        
        function deleteConfirm(){
            
            var answer=confirm("삭제하시겠습니까?");
        }
        
        </script>


        <!--date 관련-->
        <script>

            $(function(){

                $("#today").click(function(){

                    var date= new Date();
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    var today=date.getFullYear()+"-"+(month<10? '0':'')+month+"-"+(day<10? '0':'')+day;
                    
                    $("#date1").val(today);
                    $("#date2").val(today);

                   
                })


                $("#aweek").click(function(){

                    var date=new Date();
                    date.setDate(date.getDate()+7);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    var aweek=date.getFullYear()+"-"+(month<10? '0':'')+month+"-"+(day<10? '0':'')+day;
                    

                    
                    $("#date1").val(aweek);
                    $("#date2").val(aweek);

                })

                $("#amonth").click(function(){

                    var date=new Date();
                    date.setMonth(date.getMonth()+1);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    var amonth=date.getFullYear()+"-"+(month<10? '0':'')+month+"-"+(day<10? '0':'')+day;

                    $("#date1").val(amonth);
                    $("#date2").val(amonth);

                    
                })


                
            })
       
        </script>
</body>
</html>