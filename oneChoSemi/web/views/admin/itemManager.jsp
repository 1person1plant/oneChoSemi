<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<!--내용 시작-->

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
        <h3 style="margin-top: 30px;margin-bottom: 80px;">상품조회/수정</h3>
        
        <div class="row">
            
            <form class="mx-auto" style="margin-bottom: 10rem; width: 60rem;">
                
                <table class="mx-auto" style="border: double black; width: 100%;" id="searchTable">
                        <tr>
                        <th colspan="5" style="text-align: center;height: 7rem;">검색</th>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">기간</th>
                        <td>
                            <select style="position: relative;margin-left: 6px; width: 7rem;right: 9px;height: 2rem;" id="searchDate">
                                <option value="register">상품등록일</option>
                                <option value="modify">최종수정일</option>
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
                        <th style="text-align: center; width: 10rem;">전시상태</th>
                        <td colspan="4" style="text-align: left;">
                            <input type="radio" name="exhibit" value="shipping" id="available"><label for="available">전시중</label>
                            <input type="radio" name="exhibit" value="complete" id="inavailable"><label for="inavailable">전시중지</label></td>
                            
                        </tr>
                        <tr style="height: 3rem;">
                            <th style="text-align: center; width: 10rem;">상품명</th>
                            <td colspan="4">
                                <input type="text" placeholder="상품명을 입력하세요." id="pName" style="width: 30rem; position: relative;right: 5px;" >
                                
                            </td>
                            
                        </tr>
                        <tr style="height: 3rem;">
                            <th style="text-align: center; width: 10rem;">카테고리</th>
                            <td colspan="1">
                                <select style="width: 7rem;position: relative;right: 5px;height: 2rem;">
                                    <option selected>전체</option>
                                    <option>HANGING</option>
                                    <option>PLANT</option>
                                </select>
                            </td>
                            <td colspan="3"></td>
                            
                        </tr>
                        <tr>
                            
                            <td colspan="5" style="text-align: right; height: 5rem;">
                                <button type="submit" class="btn btn-dark" style="width: 7rem;margin-right: 2rem;">조회</button>
                                <button type="reset" class="btn btn-outline-dark" style="width: 7rem;margin-right: 2rem;">초기화</button>
                                
                            </td>
                                
                            </tr>
                        </table>
                    </form>
                </div>
                
                <div class="row">
                   
                        
                        <table id="productlist" class="display" style="width:100%;text-align: center;">
                            <thead>
                                <tr>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>전시상태</th>
                                    <th>정가</th>
                                    <th>할인</th>
                                    <th>최대구매수량</th>
                                    <th>카테고리</th>
                                    <th>상품등록일</th>
                                    <th>상품수정일</th>
                                    <th>수정/삭제</th>
                                </tr>
                                </tr>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>p01</td>
                                    <td>리틀스투키</td>
                                    <td>전시중</td>
                                    <td>9800</td>
                                    <td>1200</td>
                                    <td>100</td>
                                    <td>PLANT</td>
                                    <td>2020-05-22</td>
                                    <td>2020-05-23</td>
                                    <td><button>수정</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td>p02</td>
                                    <td>고무나무</td>
                                    <td>전시중</td>
                                    <td>9800</td>
                                    <td>1200</td>
                                    <td>100</td>
                                    <td>PLANT</td>
                                    <td>2020-05-22</td>
                                    <td>2020-05-23</td>
                                    <td><button>수정</button><button>삭제</button></td>
                                </tr>
                               
                                <tr>
                                    <td>p03</td>
                                    <td>미니선인장</td>
                                    <td>전시중</td>
                                    <td>9800</td>
                                    <td>1200</td>
                                    <td>100</td>
                                    <td>PLANT</td>
                                    <td>2020-05-22</td>
                                    <td>2020-05-23</td>
                                    <td><button>수정</button><button>삭제</button></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>전시상태</th>
                                    <th>정가</th>
                                    <th>할인</th>
                                    <th>최대구매수량</th>
                                    <th>카테고리</th>
                                    <th>상품등록일</th>
                                    <th>상품수정일</th>
                                    <th>수정/삭제</th>
                                </tr>
                            </tfoot>
                        </table>

                        
                        
                        
                
            
                 </div>
                    <!--제품 상세 내용 Modal-->
                    
                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">상품 수정</h4>
                            
                            <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                            <form>

                                
                                <ul>
                                    <li><label>상품번호</label><br><input type="text" readonly id="productNum"></li>
                                    <li><label>상품명</label><br><input type="text" readonly id="productName"></li>
                                    <li><label>전시상태</label><br><input type="text" readonly id="exhibitStatus">
                                        <select id="modifyExhibitStatus">
                                            <option selected>상태수정</option>
                                            <option>전시중</option>
                                            <option>전시중지</option>
                                            
                                        </select>
                                    </li>
                                    <li><label>정가</label><br><input type="number" readonly id="price"></li>
                                    <li><label>할인</label><br><input type="number" readonly id="discount"></li>
                                    <div id="warning" style="display:none;position: relative;top: -2rem;">
                                    할인가는 정가를 초과할 수 없어요.
                                    </div>
                                    <li><label>최대구매수량</label><br><input type="number" readonly id="limit"></li>
                                    <li><label>카테고리</label><br><input type="text" readonly id="category">
                                        <select id="modifyCategory">
                                            <option selected>상태수정</option>
                                            <option>HANGING</option>
                                            <option>PLANT</option>
                                        </select>
                                    </li>
                                    <li><label>상품등록일</label><br><input type="date" readonly id="registerDate"></li>
                                    <li><label>상품수정일</label><br><input type="date" readonly id="modifyDate"></li>
                                    
                                </ul>    
                            </form>
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="button" class="btn btn-outline-success" onclick="modifyConfirm();">수정하기</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteConfirm();">삭제하기</button>
                            </div>
                    
                        </div>
                        </div>
                    </div>
                    <script>
                        $(function(){

                            $("#discount").change(function(){
                                
                                var price=$("#price").val();
                                var discount=$("#discount").val();
                                console.log(price);
                                console.log(discount);

                                if((price-discount)<0){
                                    console.log("할인 심하다~")
                                    $("#warning").css("display","block").css("color","#d9534f");
                                }else{
                                    $("#warning").css("display","none");
                                }
                            })
                        })
                    </script>
                 </div>
        
        
        
    </div>  
       
</div>
</div>




</div>


<div class="container-fluid" >
    <div class="jumbotron text-center" style="background-image:url('<%=request.getContextPath()%>/images/admin/head.jpg'); height: 300px;">
        
    </div>
</div>

<!--datatable 관련 script-->
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 <script>
     $(document).ready( function () {
         $('#productlist').DataTable();
         
         var rows=$("#productlist").children().children()
          
         
         for(var i=0;i<rows.length;i++){
             
             if(i>0&&i<(rows.length-1)){
                 
                 rows.eq(i).attr({"data-toggle":"modal","data-target":"#myModal"});
                 
                }
            }
            
            
            rows.click(function(){
                
                
                
                $("#productNum").val($(this).children().eq(0).text());
                $("#productName").val($(this).children().eq(1).text());
                $("#exhibitStatus").val($(this).children().eq(2).text());
                $("#price").val($(this).children().eq(3).text());
                $("#discount").val($(this).children().eq(4).text());
                $("#limit").val($(this).children().eq(5).text());
                $("#category").val($(this).children().eq(6).text());
                $("#registerDate").val($(this).children().eq(7).text());
                $("#modifyDate").val($(this).children().eq(8).text());
                
            })

            $(".modal-body input").click(function(){
                if($("#exhibitStatus").val()=="전시중"){
                    alert("전시중인 상품은 값을 수정할 수 없어요.");
                 }
                })
            
            $("#modifyExhibitStatus").change(function(){
                var selected=$('#modifyExhibitStatus').children("option:selected").text();
                $("#exhibitStatus").val(selected);

                if(selected=="전시중지"){
                    $(".modal-body input").not($("#productNum")).not($("#registerDate")).not($("#modifyDate")).prop("readonly",false);
                }else if(selected=="전시중"){
                    $(".modal-body input").prop("readonly",true);
                }
            })

            $("#modifyCategory").change(function(){

                var display=$("#modifyExhibitStatus").children("option:selected").text();
                var selected=$('#modifyCategory').children("option:selected").text();

                if(display=="전시중지"){
                    $("#category").val(selected);
                }
            })

            
            rows.children('button').click(function(){
                rows.trigger('click');
            })
            
            
            
        });
        
        
        </script>

        <!--수정/삭제 시 서버로 값 넘기기-->
        <script>
            
            function modifyConfirm(){
                
                var answer=confirm("수정하시겠습니까?");
                
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