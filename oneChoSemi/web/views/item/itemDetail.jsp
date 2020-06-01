<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>Cho-당신을 위한 반려식물</title>
<!-- 타이틀 아이콘 -->
<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- popper -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
/* font start */
@font-face {
	font-family: 'basicFont';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: "basicFont";
}
/* font end */

/* itemdetail page start */
.item-container {
	margin-top: 10rem;
}

.iteminfo-row .row {
	margin-bottom: 0.2rem;
}

.title-row {
	border-bottom: 0.3rem solid lightgray;
	margin-bottom: 3rem;
}

.iteminfo-keyword {
	padding: 0.2rem;
	padding-bottom: 0.5rem;
	color: #1f598c
}

.iteminfo-keyword-hash {
	margin-right: 1rem;
}

.iteminfo-starRating {
	padding: 0rem;
}

.iteminfo-afterSale-left {
	padding: 0rem;
}

.beforeSale-price {
	margin: 0;
}

.afterSale-price {
	margin: 0;
}

.iteminfo-price {
	margin: 0;
}

.iteminfo-ship {
	border-top: 0.1rem solid lightgray;
	border-bottom: 0.1rem solid lightgray;
	padding: 0.5rem 0rem;
}

.iteminfo-shipinfo {
	font-size: 0.9rem;
}

.item-quantity {
	margin: 0.3rem 0rem;
}

input[type=number]::-webkit-inner-spin-button {
	opacity: 1;
}

input[type=number] {
	text-align: center;
}

.item-quantity {
	padding-left: 0.3rem;
	padding-right: 0.3rem;
}

.item-cancel {
	padding-right: 0.1rem;
}

.iteminfo-rating-count {
	padding: 0;
}

.iteminfo-starRating-text {
	margin-left: 0.5rem;
}

.iteminfo-afterSale-price {
	padding: 0;
}

.iteminfo-share {
	padding: 0;
}

.iteminfo-cart {
	padding: 0;
}

.iteminfo-wish {
	padding: 0;
}

.iteminfo-icons {
	padding: 0;
}

.icons-button {
	padding: 0;
}

.iteminfo-quantity {
	padding-right: 0.5rem;
}

.iteminfo-quantity-result {
	display: none;
	background-color: lightgray;
	padding-right: 1rem;
	padding-bottom: 0.5rem;
	padding-top: 0.5rem;
}

dd {
	margin: 0;
}
/* itemdetail page end */

/* detail start */
.detail-container {
	margin-top: 10rem;
}
/* detail end */

/* myReview start */
.myReview-container {
	margin-top: 10rem;
}

.myReview-content {
	text-align: center;
	padding: 0 1rem;
}

.title-col {
	padding: 0rem;
}

.title-writing {
	padding: 0rem;
	padding-top: 1rem;
}

#big-review-image {
	display: none;
}
/* myReview end */

/* review modal start */
.modal-header {
	padding: 0.5rem;
}

.modal-close {
	padding: 0;
}

.modal-body {
	padding-top: 0;
}

.title-modal-container {
	padding: 0.8rem;
	background-color: #5b89a6;
	color: white;
}

.iteminfo-modal-img {
	width: 12rem;
	height: 8rem;
}

.iteminfo-modal-image {
	width: 100%;
	height: 100%;
}

.modal-body>.row {
	margin-bottom: 1rem;
}

.ratingTitle-modal-container {
	margin: 0;
	padding: 0.5rem;
}

.writing-modal-container {
	margin-bottom: 1rem;
}

.textarea-modal-container {
	margin-left: 1rem;
	margin-right: 1rem;
	background-color: lightgray;
}

.textarea-row {
	padding: 0.5rem;
}

.attachPhoto-modal {
	padding-left: 1rem;
	padding-right: 1rem;
}
/* review modal end */

/* photo review start */
.photoDrop {
	padding: 0;
	border-color: gray;
	height: 10rem;
}

.upload-drop-zone {
	text-align: center;
}
/* photo review end */

/* star rating start */
.starRating {
	cursor: pointer;
	margin: 1rem 0rem;
	text-align: center;
}
/* star rating end*/

/* review start */
.review-container {
	margin-top: 10rem;
}

.review-title {
	border-bottom: 0.3rem solid lightgray;
	margin-bottom: 3rem;
}

.review-statistic {
	padding: 0 1rem;
}

.review-writing {
	padding: 0 1rem;
}

.review-content {
	text-align: center;
	padding: 0 1rem;
}

.fa-star {
	color: #FDC91B;
}

.fa-star-o {
	color: gray;
}

.review-pagination {
	margin-top: 2rem;
}

.user-grade-image {
	border-radius: 5rem;
}

td {
	padding: 1rem !important;
}

td:nth-of-type(1) {
	width: 10rem;
}

td:nth-of-type(2) {
	width: 45rem;
}

.pagination * {
	color: black;
}
/* review end */
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<section>
		<!--아이템 판매정보-->
		<div class="container item-container">
			<div class="row title-row">
				<p class="h1">ITEM
				</h1>
			</div>
			<div class="row iteminfo-row">
				<div class="col iteminfo-col-left"></div>
				<div class="col iteminfo-col-right">
					<div class="row iteminfo-title">
						<p class="h2 font-weight-bold my-auto iteminfo-title">스파티필럼
						</h2>
					</div>
					<div class="row iteminfo-keyword">
						<span class="h5 font-weight-bold my-auto iteminfo-keyword-hash">#산소뿜뿜</span>
						<span class="h5 font-weight-bold my-auto iteminfo-keyword-hash">#애완동물친화</span>
					</div>
					<div class="row iteminfo-explain-area">
						<p class="iteminfo-explain my-auto">공기정화에 탁월한 산소뿜뿜 반려식물</p>
					</div>
					<div class="row row-1 iteminfo-rating">
						<div class="col iteminfo-starRating">
							<i class="my-auto fa fa-star"></i> <i class="my-auto fa fa-star"></i>
							<i class="my-auto fa fa-star"></i> <i class="my-auto fa fa-star"></i>
							<i class="my-auto fa fa-star-o"></i> <span
								class="iteminfo-starRating-text my-auto" style="color: gray">5개
								구매평</span>
						</div>
					</div>
					<div class="row iteminfo-price" style="display: block;">
						<div class="row iteminfo-beforeSale" style="color: gray">
							<p class="h4 beforeSale-price">
								<s>&#8361;35,000</s>
							</p>
						</div>
						<div class="row iteminfo-afterSale">
							<div class="col-10 iteminfo-afterSale-price"
								style="color: #1f598c;">
								<p class="h3 afterSale-price">&#8361;30,000</p>
							</div>
							<div class="col-2 iteminfo-icons">
								<span class="col iteminfo-share"
									style="justify-content: center;">
									<button class="btn btn-default iteminfo-icons"
										id="share-button" data-toggle="popover">
										<i class="fa fa-paperclip"
											style="font-size: 1.5rem; color: #5b89a6;"></i>
									</button>
								</span> <span class="col iteminfo-cart"
									style="justify-content: center;">
									<button class="btn btn-default iteminfo-icons">
										<i class="fa fa-shopping-cart"
											style="font-size: 1.5rem; color: gray;"></i>
									</button>
								</span> <span class="col iteminfo-wish"
									style="justify-content: center;">
									<button class="btn btn-default iteminfo-icons">
										<i class="fa fa-heart" style="font-size: 1.5rem; color: pink;"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="row iteminfo-ship">
						<dl class="row my-auto iteminfo-shipinfo">
							<dt class="col-2 shipinfo-left">구매혜택</dt>
							<dd class="col-10 shipinfo-right">
								<button type="button" style="border: none; background: white;"
									data-toggle="tooltip" data-placement="right"
									title="누적금액에 따라 등급업">
									<i class="far fa-question-circle"></i>
								</button>
							</dd>
							<dt class="col-2 shipinfo-left">배송방법</dt>
							<dd class="col-10 shipinfo-right">택배</dd>
							<dt class="col-2 shipinfo-left">배송비</dt>
							<dd class="col-10 shipinfo-right">3,000원 (도서산간 지역 배송비 추가)</dd>
						</dl>
					</div>
					<div class="row iteminfo-quantity">
						<div class="col col-9 my-auto item-name">
							<span>스파티필럼</span>
						</div>
						<div class="col col-2 item-quantity">
							<input type="number"
								class="form-control form-control-sm item-quantity"
								id="quantityNumber" name="item-quantity" value="0" min="0"
								max="10" count="1">
						</div>
						<div class="col col-1 my-auto item-cancel">
							<button class="btn btn-default cancel-button">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="row iteminfo-quantity-result" style="text-align: right">
						<span class="quantity-result"> <span
							style="font-size: 0.9rem">총 수량: </span><span id="whole-quantity"
							style="font-weight: bold; color: #1f598c;"></span><span
							id="howmany" style="font-size: 0.9rem">개/ </span>
						</span> <span class="whole-price-result"> <span
							style="font-size: 0.9rem">총 구매금액: </span><span id="whole-price"
							style="font-weight: bold; color: #1f598c;">30000</span><span
							id="quantity-won" style="font-size: 0.9rem">원</span>
						</span>
					</div>
					<div class="row iteminfo-buy">
						<button type="button"
							class="btn btn-block btn-secondary btn-buybutton">구매하기</button>
					</div>
				</div>
			</div>
		</div>

		<!--수량 체크와 관련된 script-->
		<script>
			$(function() {
				$(".cancel-button").click(function(e) {

					$("#quantityNumber").val("0");

					if ($("#quantityNumber").val() == 0) {
						$(".iteminfo-quantity").css("background", "white");
						$(".iteminfo-quantity-result").css("display", "none");
					}

				});
			});

			$(function() {
				$("#quantityNumber").change(function(e) {

					var quantity = $("#quantityNumber").val();

					if (quantity > 0) {
						$(".iteminfo-quantity").css("background", "lightgray");
						$(".iteminfo-quantity").css("margin-bottom", "0");
						$(".iteminfo-quantity-result").css("display", "block");
					} else {
						$(".iteminfo-quantity").css("background", "white");
						$(".iteminfo-quantity-result").css("display", "none");
					}

					$("#whole-quantity").text(quantity);
				});
			});
		</script>

		<!--아이콘 버튼 관련 script-->
		<script>
			jQuery(function() {
				$("#share-button").popover({
					animation : true,
					title : "URL 복사하기",
					content : "나오나?",
					placement : "top auto"
				});
			});
		</script>




		<!--아이템 디테일사진-->
		<div class="container detail-container">
			<div class="row title-row">
				<p class="h1">DETAIL</p>
			</div>
			<div class="row detail-row"></div>
		</div>





		<!--내 리뷰-->
		<div class="container myReview-container">
			<div class="row title-row">
				<div class="col title-col">
					<p class="h1">MY REVIEW</p>
				</div>
				<div class="col title-writing">
					<p class="float-right">
						<a data-toggle="modal" href="#reviewModal"
							style="text-decoration: none; color: black;">null</a>
					</p>
				</div>
			</div>
			<div class="row myReview-content">
				<table class="table table-hover myReview-table">
					<tbody>
						<tr>
							<td><img src="<%=request.getContextPath() %>/images/sample/img_avatar2.png"
								class="user-grade-image" style="width: 5rem; height: 5rem;">
								<input type="button" style="font-size: 0.8rem; border: none"
								value="수정하기"><input type="button"
								style="font-size: 0.8rem; border: none" value="삭제하기"></td>
							<td>
								<div class="row review-star-score">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<div class="row review-set">
									<span class="review-id">kyeo**** /</span><span
										class="review-date">20-05-25</span>
								</div>
								<div class="row review-cont">
									<p class="review-cont-real">이걸 사고 로또에 당첨되었습니다. 너무 기쁩니다. 님들도
										꼭 사세요.</p>
								</div>
								<div class="row review-bigImage" style="margin-top: 1rem;">
									<img src="<%=request.getContextPath() %>/images/고무나무.jpg" id="big-review-image"
										style="width: 30rem; height: 30rem;">
								</div>
							</td>
							<td class="fadeout-image"><img src="<%=request.getContextPath() %>/images/고무나무.jpg"
								id="mini-review-image" style="width: 7rem; height: 7rem;">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


		<!--리뷰 사진 확대-->
		<script>
			$(function() {
				$("tr").click(
						function() {

							if ($(this).find("#big-review-image")
									.css("display") == "none") {
								$(this).find("#big-review-image").css(
										"display", "block");
								$(this).find("#mini-review-image").css(
										"visibility", "hidden");
							} else {
								$(this).find("#big-review-image").css(
										"display", "none");
								$(this).find("#mini-review-image").css(
										"visibility", "visible");
							}

						});
			});
		</script>



		<!--리뷰쓰기 모달-->
		<div class="modal fade" id="reviewModal">
			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close modal-close"
							data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div class="row title-modal">
							<div class="container-fluid title-modal-container">
								<p class="h4 my-auto" style="text-align: center">리뷰쓰기</p>
							</div>
						</div>
						<div class="row iteminfo-modal">
							<div class="col col-4 iteminfo-modal-img">
								<img class="iteminfo-modal-image" src="<%=request.getContextPath() %>/images/고무나무.jpg">
							</div>
							<div class="col col-8 iteminfo-modal-text">
								<div class="row iteminfo-modal-title">
									<p class="h6 my-auto" style="color: gray;">[스파티필럼]</p>
								</div>
								<div class="row iteminfo-modal-content">
									<p>공기정화에 탁월한 산소뿜뿜 반려식물</p>
								</div>
							</div>
						</div>
						<hr>
						<div class="row rating-modal">
							<div class="container-fluid rating-modal-container">
								<p class="h5 my-auto" style="text-align: center">상품은 어떠셨나요?</p>
							</div>
							<div class="container-fluid starRating">
								<span class="fa fa-star-o" data-rating="1"
									style="font-size: 3rem"></span> <span class="fa fa-star-o"
									data-rating="2" style="font-size: 3rem"></span> <span
									class="fa fa-star-o" data-rating="3" style="font-size: 3rem"></span>
								<span class="fa fa-star-o" data-rating="4"
									style="font-size: 3rem"></span> <span class="fa fa-star-o"
									data-rating="5" style="font-size: 3rem"></span> <input
									type="hidden" name="whatever" class="rating-value" value="3">
							</div>
						</div>
						<hr>
						<div class="row writing-modal">
							<div class="container writing-modal-container">
								<p class="h5 my-auto" style="text-align: center">어떤 점이 좋았나요?</p>
							</div>
							<div class="container textarea-modal-container">
								<div class="row textarea-row">
									<textarea class="form-control review-textarea" rows="5"
										placeholder="이곳에 작성해주세요." style="background-color: lightgray"></textarea>
								</div>
								<div class="row float-right textarea-count-row">
									<span id="counter">0</span><span class="textarea-count"
										style="margin-right: 0.5rem;">/150</span>
								</div>
							</div>
						</div>
						<hr>
						<div class="row attachPhoto-modal">
							<div id="dropbox">
								<span id="droplabel"> 이곳에 파일을 드랍해 주세요. </span>
							</div>
							<img id="preview" alt="[preview will display here]" />
						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-light">취소하기</button>
						<button type="button" class="btn btn-secondary">등록하기</button>
					</div>
				</div>
			</div>
		</div>

		<!--별 평점 주기(script)-->
		<script>
			var starRating = $(".starRating .fa");

			var SetRatingStar = function() {
				return starRating.each(function() {
					if (parseInt(starRating.siblings('input.rating-value')
							.val()) >= parseInt($(this).data('rating'))) {
						return $(this).removeClass('fa-star-o').addClass(
								'fa-star');
					} else {
						return $(this).removeClass('fa-star').addClass(
								'fa-star-o');
					}
				});
			};

			starRating.on('click', function() {
				starRating.siblings('input.rating-value').val(
						$(this).data('rating'));
				return SetRatingStar();
			});

			SetRatingStar();
		</script>



		<!--리뷰 글자 수 세기(script)-->
		<script>
			$(function() {
				$(".review-textarea").keyup(function() {
					var inputLength = $(this).val().length;

					$("#counter").text(inputLength);

					var remain = 150 - inputLength;

					if (remain >= 0) {
						$("#counter").parent().css("color", "black");
					} else {
						$("#counter").parent().css("color", "red");
					}
				});
			});

			$(function() {
				$(".review-textarea").keydown(function() {
					var inputLength = $(this).val().length;
					$("#counter").text(inputLength);
				});
			});
		</script>





		<!--다른 사람 리뷰-->
		<div class="container review-container">
			<div class="row review-title">
				<p class="h1">REVIEW
				</h1>
			</div>
			<div class="row review-statistic">
				<div class="col review-statistic-col1"
					style="height: 15rem; background-color: lightgray;"></div>
				<div class="col review-statistic-col2"
					style="height: 15rem; background-color: lightgray;"></div>
				<div class="col review-statistic-col3"
					style="height: 15rem; background-color: lightgray;"></div>
			</div>
			<div class="row review-writing"></div>
			<div class="row review-content">
				<table class="table table-hover review-table">
					<tbody>
						<tr>
							<td><img src="<%=request.getContextPath() %>/images/sample/img_avatar2.png"
								class="user-grade-image" style="width: 5rem; height: 5rem;">
							</td>
							<td>
								<div class="row review-star-score">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<div class="row review-set">
									<span class="review-id">kyeo**** /</span><span
										class="review-date">20-05-25</span>
								</div>
								<div class="row review-cont">
									<p class="review-cont-real">이걸 사고 로또에 당첨되었습니다. 너무 기쁩니다. 님들도
										꼭 사세요.</p>
								</div>
								<div class="row review-bigImage" style="margin-top: 1rem;">
									<img src="<%=request.getContextPath() %>/images/고무나무.jpg" id="big-review-image"
										style="width: 30rem; height: 30rem;">
								</div>
							</td>
							<td class="fadeout-image"><img src="<%=request.getContextPath() %>/images/고무나무.jpg"
								id="mini-review-image" style="width: 7rem; height: 7rem;">
							</td>
						</tr>
						<tr>
							<td><img src="<%=request.getContextPath() %>/images/sample/img_avatar2.png"
								class="user-grade-image" style="width: 5rem; height: 5rem;">
							</td>
							<td>
								<div class="row review-star-score">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<div class="row review-set">
									<span class="review-id">kyeo**** /</span><span
										class="review-date">20-05-25</span>
								</div>
								<div class="row review-cont">
									<p class="review-cont-real">이걸 사고 로또에 당첨되었습니다. 너무 기쁩니다. 님들도
										꼭 사세요.</p>
								</div>
								<div class="row review-bigImage" style="margin-top: 1rem;">
									<img src="<%=request.getContextPath() %>/images/고무나무.jpg" id="big-review-image"
										style="width: 30rem; height: 30rem;">
								</div>
							</td>
							<td class="fadeout-image"><img src="<%=request.getContextPath() %>/images/고무나무.jpg"
								id="mini-review-image" style="width: 7rem; height: 7rem;">
							</td>
						</tr>
						<tr>
							<td><img src="<%=request.getContextPath() %>/images/sample/img_avatar2.png"
								class="user-grade-image" style="width: 5rem; height: 5rem;">
							</td>
							<td>
								<div class="row review-star-score">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<div class="row review-set">
									<span class="review-id">kyeo**** /</span><span
										class="review-date">20-05-25</span>
								</div>
								<div class="row review-cont">
									<p class="review-cont-real">이걸 사고 로또에 당첨되었습니다. 너무 기쁩니다. 님들도
										꼭 사세요.</p>
								</div>
								<div class="row review-bigImage" style="margin-top: 1rem;">
									<img src="<%=request.getContextPath() %>/images/고무나무.jpg" id="big-review-image"
										style="width: 30rem; height: 30rem;">
								</div>
							</td>
							<td class="fadeout-image"><img src="<%=request.getContextPath() %>/images/고무나무.jpg"
								id="mini-review-image" style="width: 7rem; height: 7rem;">
							</td>
						</tr>
						<tr>
							<td><img src="<%=request.getContextPath() %>/images/sample/img_avatar2.png"
								class="user-grade-image" style="width: 5rem; height: 5rem;">
							</td>
							<td>
								<div class="row review-star-score">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<div class="row review-set">
									<span class="review-id">kyeo**** /</span><span
										class="review-date">20-05-25</span>
								</div>
								<div class="row review-cont">
									<p class="review-cont-real">이걸 사고 로또에 당첨되었습니다. 너무 기쁩니다. 님들도
										꼭 사세요.</p>
								</div>
								<div class="row review-bigImage" style="margin-top: 1rem;">
									<img src="<%=request.getContextPath() %>/images/고무나무.jpg" id="big-review-image"
										style="width: 30rem; height: 30rem;">
								</div>
							</td>
							<td class="fadeout-image"><img src="<%=request.getContextPath() %>/images/고무나무.jpg"
								id="mini-review-image" style="width: 7rem; height: 7rem;">
							</td>
						</tr>
						<tr>
							<td><img src="<%=request.getContextPath() %>/images/sample/img_avatar2.png"
								class="user-grade-image" style="width: 5rem; height: 5rem;">
							</td>
							<td>
								<div class="row review-star-score">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i>
								</div>
								<div class="row review-set">
									<span class="review-id">kyeo**** /</span><span
										class="review-date">20-05-25</span>
								</div>
								<div class="row review-cont">
									<p class="review-cont-real">이걸 사고 로또에 당첨되었습니다. 너무 기쁩니다. 님들도
										꼭 사세요.</p>
								</div>
								<div class="row review-bigImage" style="margin-top: 1rem;">
									<img src="<%=request.getContextPath() %>/images/고무나무.jpg" id="big-review-image"
										style="width: 30rem; height: 30rem;">
								</div>
							</td>
							<td class="fadeout-image"><img src="<%=request.getContextPath() %>/images/고무나무.jpg"
								id="mini-review-image" style="width: 7rem; height: 7rem;">
							</td>
						</tr>

					</tbody>
				</table>
				<nav class="review-pagination mx-auto">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>

	</section>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>