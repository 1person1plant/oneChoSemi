package item.model.vo;

public class ItemImage {
	
	private String itemNo;//상품번호
	private String mItemImgeNo;//메인상품이미지 식별자 번호 II+
	private String mImgNo;//이미지 번호 I
	private String mImgName;//이미지 이름
	private String mPath;//이미지 경로
	private int mCategory;//이미지 카테고리
	private String sItemImgNo;//세부상품이미지 식별자 번호 
	private String sImgNo;//이미지 번호
	private String sImgName;//이미지 이름
	private String sPath;//이미지 경로
	private int sCategory;
	
	public ItemImage() {
		super();
	}

	public ItemImage(String itemNo, String mItemImgeNo, String mImgNo, String mImgName, String mPath, int mCategory,
			String sItemImgNo, String sImgNo, String sImgName, String sPath, int sCategory) {
		super();
		this.itemNo = itemNo;
		this.mItemImgeNo = mItemImgeNo;
		this.mImgNo = mImgNo;
		this.mImgName = mImgName;
		this.mPath = mPath;
		this.mCategory = mCategory;
		this.sItemImgNo = sItemImgNo;
		this.sImgNo = sImgNo;
		this.sImgName = sImgName;
		this.sPath = sPath;
		this.sCategory = sCategory;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}

	public String getmItemImgeNo() {
		return mItemImgeNo;
	}

	public void setmItemImgeNo(String mItemImgeNo) {
		this.mItemImgeNo = mItemImgeNo;
	}

	public String getmImgNo() {
		return mImgNo;
	}

	public void setmImgNo(String mImgNo) {
		this.mImgNo = mImgNo;
	}

	public String getmImgName() {
		return mImgName;
	}

	public void setmImgName(String mImgName) {
		this.mImgName = mImgName;
	}

	public String getmPath() {
		return mPath;
	}

	public void setmPath(String mPath) {
		this.mPath = mPath;
	}

	public int getmCategory() {
		return mCategory;
	}

	public void setmCategory(int mCategory) {
		this.mCategory = mCategory;
	}

	public String getsItemImgNo() {
		return sItemImgNo;
	}

	public void setsItemImgNo(String sItemImgNo) {
		this.sItemImgNo = sItemImgNo;
	}

	public String getsImgNo() {
		return sImgNo;
	}

	public void setsImgNo(String sImgNo) {
		this.sImgNo = sImgNo;
	}

	public String getsImgName() {
		return sImgName;
	}

	public void setsImgName(String sImgName) {
		this.sImgName = sImgName;
	}

	public String getsPath() {
		return sPath;
	}

	public void setsPath(String sPath) {
		this.sPath = sPath;
	}

	public int getsCategory() {
		return sCategory;
	}

	public void setsCategory(int sCategory) {
		this.sCategory = sCategory;
	}

	@Override
	public String toString() {
		return "ItemImage [itemNo=" + itemNo + ", mItemImgeNo=" + mItemImgeNo + ", mImgNo=" + mImgNo + ", mImgName="
				+ mImgName + ", mPath=" + mPath + ", mCategory=" + mCategory + ", sItemImgNo=" + sItemImgNo
				+ ", sImgNo=" + sImgNo + ", sImgName=" + sImgName + ", sPath=" + sPath + ", sCategory=" + sCategory
				+ "]";
	}
	
	
	
	
	
	
	
	
	

}
