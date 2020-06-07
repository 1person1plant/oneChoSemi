package review.model.vo;

import java.sql.Date;

public class Review {
	
	private String reviewNo;
	private String orderNo;
	private String itemNo;
	private String memberName;
	private Date reviewCDAte;
	private Number reviewRate;
	private String reviewContent;
	private Date reviewUDate;
	private String ImageNo;
	
	public Review() {
	}

	public Review(String reviewNo, String orderNo, String itemNo, String memberName, Date reviewCDAte,
			Number reviewRate, String reviewContent, Date reviewUDate, String imageNo) {
		this.reviewNo = reviewNo;
		this.orderNo = orderNo;
		this.itemNo = itemNo;
		this.memberName = memberName;
		this.reviewCDAte = reviewCDAte;
		this.reviewRate = reviewRate;
		this.reviewContent = reviewContent;
		this.reviewUDate = reviewUDate;
		ImageNo = imageNo;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getReviewCDAte() {
		return reviewCDAte;
	}

	public void setReviewCDAte(Date reviewCDAte) {
		this.reviewCDAte = reviewCDAte;
	}

	public Number getReviewRate() {
		return reviewRate;
	}

	public void setReviewRate(Number reviewRate) {
		this.reviewRate = reviewRate;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewUDate() {
		return reviewUDate;
	}

	public void setReviewUDate(Date reviewUDate) {
		this.reviewUDate = reviewUDate;
	}

	public String getImageNo() {
		return ImageNo;
	}

	public void setImageNo(String imageNo) {
		ImageNo = imageNo;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", orderNo=" + orderNo + ", itemNo=" + itemNo + ", memberName="
				+ memberName + ", reviewCDAte=" + reviewCDAte + ", reviewRate=" + reviewRate + ", reviewContent="
				+ reviewContent + ", reviewUDate=" + reviewUDate + ", ImageNo=" + ImageNo + "]";
	}
	
	
	


}
