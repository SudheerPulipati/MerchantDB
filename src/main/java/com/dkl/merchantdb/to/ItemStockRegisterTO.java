package com.dkl.merchantdb.to;

public class ItemStockRegisterTO {
	
	private String 	bookID;
	private String 	stockPointID;
	private String	stockPointName;
	private String 	itemID;
	private String	itemName;
	private String 	itemBatchID;
	private String	itemBatchName;
	private double	openQuantity;
	private double	purchaseQuantity;
	private double	saleQuantity;
	private double	transferIn;
	private double	transferOut;
	private double	stockOnHand;
	private String	creationDate;
	private String	modifiedDate;
	
	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	public String getStockPointID() {
		return stockPointID;
	}
	public void setStockPointID(String stockPointID) {
		this.stockPointID = stockPointID;
	}
	public String getStockPointName() {
		return stockPointName;
	}
	public void setStockPointName(String stockPointName) {
		this.stockPointName = stockPointName;
	}
	public String getItemID() {
		return itemID;
	}
	public void setItemID(String itemID) {
		this.itemID = itemID;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemBatchID() {
		return itemBatchID;
	}
	public void setItemBatchID(String itemBatchID) {
		this.itemBatchID = itemBatchID;
	}
	public String getItemBatchName() {
		return itemBatchName;
	}
	public void setItemBatchName(String itemBatchName) {
		this.itemBatchName = itemBatchName;
	}
	public double getOpenQuantity() {
		return openQuantity;
	}
	public void setOpenQuantity(double openQuantity) {
		this.openQuantity = openQuantity;
	}
	public double getPurchaseQuantity() {
		return purchaseQuantity;
	}
	public void setPurchaseQuantity(double purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}
	public double getSaleQuantity() {
		return saleQuantity;
	}
	public void setSaleQuantity(double saleQuantity) {
		this.saleQuantity = saleQuantity;
	}
	public double getTransferIn() {
		return transferIn;
	}
	public void setTransferIn(double transferIn) {
		this.transferIn = transferIn;
	}
	public double getTransferOut() {
		return transferOut;
	}
	public void setTransferOut(double transferOut) {
		this.transferOut = transferOut;
	}
	public double getStockOnHand() {
		return stockOnHand;
	}
	public void setStockOnHand(double stockOnHand) {
		this.stockOnHand = stockOnHand;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public String getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	
}
