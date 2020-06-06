package order.model.vo;

import java.sql.Date;

public class Order {
	private String orderNo;				// 주문 번호 pk
	private String itemNo;				// 상품 번호 pk

	private String itemName;			// 상품 이름
	private int itemPrice;				// 상품 가격
	private int itemDisCount;			// 상품 할인가
	private int itemMax;				// 상품 구매 최대 수량
	
//	private String imageNo;				// 이미지 번호 fk
	private String imagepath;			// 이미지 경로
	private String imageName;			// 이미지 이름

//	private String memberNo;			// 회원 번호 fk
	private String memberId;			// 회원 아이디
	private String memberName;			// 회원 이름
	private int memberPhone1;			// 회원 전화번호 앞 자리
	private int memberPhone2;			// 회원 전화번호 중간 자리
	private int memberPhone3;			// 회원 전화번호 뒷 자리
	private int memberPostcode;			// 회원 우편번호
	private String memberAddress1;		// 회원 주소
	private String memberAddress2;		// 회원 상세 주소
	private int memberPoint;			// 회원 보유포인트
//	private String memberRank;			// 회원 등급 fk
	private String rankPointRat;		// 등급 적립율
	private String rankPointCap;		// 등급 포인트 사용 한도
	
	private Date orderDate; 			// 주문 일시
	private int	orderCount; 			// 주문 수량
	private int	orderUsePoint; 			// 사용 포인트
	private String orderName; 			// 수령자 이름
	private int orderPhone1;			// 수령자 전화번호 앞 자리
	private int orderPhone2;			// 수령자 전화번호 중간 자리
	private int orderPhone3;			// 수령자 전화번호 뒷 자리
	private int orderPostcode;			// 수령자 우편번호
	private String orderAddress1;		// 수형자 주소
	private String orderAddress2;		// 수령자 상세 주소
	private String orderRequest;		// 수령자 요청사항
	private int orderDCost;				// 배송비
	
//	private String orderCancleRequest;	// 취소 요청사항
//	private String orderCancelYN;		// 주문 취소 승인(y/n)
	
	private String deluveryCode;		// 배송상태(배송전/배송중/배송후)
	private String paymentCode;			// 입금코드(입금전/입금후)


}
