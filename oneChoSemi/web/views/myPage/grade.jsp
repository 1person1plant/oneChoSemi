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
        input[type=text],
        input[type=password],
        input[type=email] {
            padding: 5px 10px;
            margin: 5px 0;
            display: inline-block;
            border: 1px solid #ccc;
        }
        td{
          text-align:left;
        }
        td.mt-2{
        	text-align:right;
        }
        
        /* 등급별 혜택 */
        .gradecolor{
          border-top:1px solid gray !important;
          border-bottom:1px solid gray;
          background:lightgray;
          text-align:center;
        }
        .aaa{
          width:20%;
          text-align:center;
        }

        .bbb{
          text-align:center;
          width:25%;
        }

        .ccc{
          text-align:center;
          width:20%;
        }

        .ddd{
          text-align:center;
        }
        .lasttr{
          border-bottom:1px solid lightgray;
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
								<tr>
									<br>
									<th colspan="5" scope="col"><h1>???님의 등급은 ★</h1></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td scope="row" class="mt-2"><label>누적 구매 금액 : </label></td>
									<td colspan="3"><label id='gradelb'>???</label></td>
								</tr>
								<tr>
									<td></td>
									<td scope="row" class="mt-2"><label>보유 포인트 : </label></td>
									<td colspan="3"><label id='gradelb'>???</label></td>
								</tr>
								<tr>
									<td scope="row" colspan='3' class="mt-2"><label><h1>
												<br>등급별 혜택
											</h1></label></td>
								</tr>
							</tbody>
							<tbody class='reward' text-align='center'>
								<tr class='gradecolor'>
									<td class='aaa'>단계</td>
									<td class='bbb'>등급</td>
									<td class='ccc'>포인트 적립률</td>
									<td class='ddd'>포인트 사용한도</td>
								</tr>
								<tr>
									<td class='aaa'>1단계</td>
									<td class='bbb'>씨앗</td>
									<td class='ccc'>1%</td>
									<td class='ddd'>1000P</td>
								</tr>
								<tr>
									<td class='aaa'>2단계</td>
									<td class='bbb'>새싹</td>
									<td class='ccc'>2%</td>
									<td class='ddd'>3000P</td>
								</tr>
								<tr>
									<td class='aaa'>3단계</td>
									<td class='bbb'>가지</td>
									<td class='ccc'>3%</td>
									<td class='ddd'>5000P</td>
								</tr>
								<tr>
									<td class='aaa'>4단계</td>
									<td class='bbb'>열매</td>
									<td class='ccc'>4%</td>
									<td class='ddd'>10000P</td>
								</tr>
								<tr class='lasttr'>
									<td class='aaa'>5단계</td>
									<td class='bbb'>나무</td>
									<td class='ccc'>5%</td>
									<td class='ddd'>15000P</td>
								</tr>
							</tbody>
						</table>
					</form>
				</fieldset>

			</div>

			<%@ include file="../common/footer.jsp"%>
</body>
</html>