package wishPagination.model.vo;

public class wishBoard {
	private String wishListNo;
	private String imagePath;
	private String itemName;
	private String wishListMemo;
	public wishBoard() {
		super();
	}
	public wishBoard(String wishListNo, String imagePath, String itemName, String wishListMemo) {
		super();
		this.wishListNo = wishListNo;
		this.imagePath = imagePath;
		this.itemName = itemName;
		this.wishListMemo = wishListMemo;
	}
	@Override
	public String toString() {
		return "wishBoard [wishListNo=" + wishListNo + ", imagePath=" + imagePath + ", itemName=" + itemName
				+ ", wishListMemo=" + wishListMemo + "]";
	}
	public String getWishListNo() {
		return wishListNo;
	}
	public void setWishListNo(String wishListNo) {
		this.wishListNo = wishListNo;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getWishListMemo() {
		return wishListMemo;
	}
	public void setWishListMemo(String wishListMemo) {
		this.wishListMemo = wishListMemo;
	}

}
