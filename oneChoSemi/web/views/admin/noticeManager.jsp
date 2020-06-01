<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 		
        <!--datatable-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
        
         <!--jQuery-->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
         <!-- include summernote css/js -->
         <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
       
<title>Insert title here</title>
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
        <h3 style="margin-top: 30px;margin-bottom: 80px;">공지사항 관리</h3>
        
        <div class="row">
            
            <div class="container mx-auto">
                        
                <table id="notice" class="display nowrap" style="width:100%;text-align: center;">
                    <thead>
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>수정/삭제</th>
                        </tr>
                        </tr>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>스투키가 입고!</td>
                            <td>2020-05-24</td>
                            <td>0</td>
                            <td><button>수정</button><button>삭제</button></td>
                        </tr>
                       
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>수정/삭제</th>
                        </tr>
                    </tfoot>
                </table>

                
            </div>  
            
                </div>
                <hr>
               
                   
                    <div class="row" style="width: 100%;">
             
                        <div class="container mx-auto" style="margin-top: 50px; width: 100%;">
                        <form method="post">
   
                           <ul style="list-style-type: none;padding: 0;width: 100%;">
                               <li><label>제목</label><br><input type="text" style="width: 100%;" id="noticeTitle"></li>
                               <li><label>내용</label><br><textarea id="summernote" name="editordata"></textarea></li>
                           </ul>
                            
   
                            <button type="button" class="btn btn-outline-info btn-lg btn-block" style="margin-top: 50px;" id="ask">수정하기</button>
                            <button type="button" class="btn btn-info btn-lg btn-block" style="margin-top: 20px;" id="ask">작성하기</button>
                          </form>
                        </div>
           
                       </div>
                       
                        
                        
                        
                
            
                
                    <!--제품 상세 내용 Modal-->
                    
                    <!-- The Modal -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">공지사항</h4>
                            
                            <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                            <form>

                                
                                <ul style="padding: 0;">

                                    <li><label>글번호</label><br><input type="text" readonly id="noticeId"></li>
                                    <li><label>제목</label><br><input type="text" readonly id="title" style="width: 100%;"></li>
                                    <li><label>내용</label><br><textarea id="content" readonly style="width: 100%;height: 100%;"></textarea></li>
                                   
                                    
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
                   
                 </div>
        
        
        
    </div>  
       
</div>
</div>




</div>


<div class="container-fluid">
    <div class="jumbotron text-center" style="background-image:url('<%=request.getContextPath() %>/images/admin/head.jpg'); height: 300px;">
        
    </div>
</div>

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


<!--summerNote-->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             
            maxHeight: null,             
            focus: true   

        });
    });
</script>

 <!--datatable 관련 script-->
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 <script>
     $(document).ready( function () {
         $('#notice').DataTable({
              "scrollX":true
         });
         
         var rows=$("#notice").children().children()
          
         
         for(var i=0;i<rows.length;i++){
             
             if(i>0&&i<=(rows.length-1)){
                 
                 rows.eq(i).attr({"data-toggle":"modal","data-target":"#myModal"});
                 
                }
            }
            
            
           
            rows.click(function(){
                
                var count=$(this).children().eq(3).text();
                count++;
                $(this).children().eq(3).text(count);
                
                $("#noticeId").val($(this).children().eq(0).text());
                $("#title").val($(this).children().eq(1).text());
                $("#content").html(test);
               
               
                
            })

          
          

            
            rows.children('button').click(function(){
                rows.trigger('click');
            })
            
            
            
        });
        
        
        </script>

        <!--수정/삭제 시 서버로 값 넘기기-->
        <script>

            test="인기쟁이 스투키가 다시 입고되었어요~!많이 사주세요~!";
            
            function modifyConfirm(){
                
                var id=$("#noticeId").val();
                var title=$("#title").val();
                var content=$("#content").val();
               
                $("#noticeTitle").val(title);
                $("#summernote").summernote('reset');
                $("#summernote").summernote('insertText',content);

                $("#modalClose").trigger('click');

               
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