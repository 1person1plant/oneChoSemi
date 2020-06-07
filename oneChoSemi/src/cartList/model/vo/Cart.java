package cartList.model.vo;

import java.io.Serializable;

public class Cart implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4898290017598692978L;
	private String cartListNo;		// 장바구니 번호
	private String itemNo;		// 상품 번호

	private String memberNo;	// 회원 번호
	
	private String itemName;	// 상품 이름
	private int itemPrice;		// 상품 가격
	private int itemMax;		// 상품 구매 최대 수량

	private int cartListCount;	// 상품 수량
	
	private String itemImageNo;	// 상품 이미지 번호
	private String imageNo;		// 이미지 번호
	private String imageName;	// 이미지 이름

	

}
