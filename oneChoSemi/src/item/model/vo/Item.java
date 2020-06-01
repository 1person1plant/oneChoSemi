package item.model.vo;

import java.sql.Date;

public class Item {
	
	private String itemNo;
	private String itemName;
	private String itemCategory;
	private int itemKeywordNo;
	private int itemPrice;
	private int itemDiscount;
	private int itemRate;
	private int itemStock;
	private String itemDisplay;
	private String itemInfo;
	private Date CDate;
	private Date UDate;
	private int itemMax;
	private String itemSale;
	
	
	public Item() {
		super();
	}


	public Item(String itemNo, String itemName, String itemCategory, int itemKeywordNo, int itemPrice, int itemDiscount,
			int itemRate, int itemStock, String itemDisplay, String itemInfo, Date cDate, Date uDate, int itemMax,
			String itemSale) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemCategory = itemCategory;
		this.itemKeywordNo = itemKeywordNo;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemRate = itemRate;
		this.itemStock = itemStock;
		this.itemDisplay = itemDisplay;
		this.itemInfo = itemInfo;
		CDate = cDate;
		UDate = uDate;
		this.itemMax = itemMax;
		this.itemSale = itemSale;
	}


	public String getItemNo() {
		return itemNo;
	}


	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public String getItemCategory() {
		return itemCategory;
	}


	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}


	public int getItemKeywordNo() {
		return itemKeywordNo;
	}


	public void setItemKeywordNo(int itemKeywordNo) {
		this.itemKeywordNo = itemKeywordNo;
	}


	public int getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}


	public int getItemDiscount() {
		return itemDiscount;
	}


	public void setItemDiscount(int itemDiscount) {
		this.itemDiscount = itemDiscount;
	}


	public int getItemRate() {
		return itemRate;
	}


	public void setItemRate(int itemRate) {
		this.itemRate = itemRate;
	}


	public int getItemStock() {
		return itemStock;
	}


	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}


	public String getItemDisplay() {
		return itemDisplay;
	}


	public void setItemDisplay(String itemDisplay) {
		this.itemDisplay = itemDisplay;
	}


	public String getItemInfo() {
		return itemInfo;
	}


	public void setItemInfo(String itemInfo) {
		this.itemInfo = itemInfo;
	}


	public Date getCDate() {
		return CDate;
	}


	public void setCDate(Date cDate) {
		CDate = cDate;
	}


	public Date getUDate() {
		return UDate;
	}


	public void setUDate(Date uDate) {
		UDate = uDate;
	}


	public int getItemMax() {
		return itemMax;
	}


	public void setItemMax(int itemMax) {
		this.itemMax = itemMax;
	}


	public String getItemSale() {
		return itemSale;
	}


	public void setItemSale(String itemSale) {
		this.itemSale = itemSale;
	}


	@Override
	public String toString() {
		return "Item [itemNo=" + itemNo + ", itemName=" + itemName + ", itemCategory=" + itemCategory
				+ ", itemKeywordNo=" + itemKeywordNo + ", itemPrice=" + itemPrice + ", itemDiscount=" + itemDiscount
				+ ", itemRate=" + itemRate + ", itemStock=" + itemStock + ", itemDisplay=" + itemDisplay + ", itemInfo="
				+ itemInfo + ", CDate=" + CDate + ", UDate=" + UDate + ", itemMax=" + itemMax + ", itemSale=" + itemSale
				+ "]";
	}
	
	
	
	

}
