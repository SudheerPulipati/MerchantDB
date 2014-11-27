package com.dkl.merchantdb.to;

public class StockPointReportTO extends MerchantBaseTO {

	private static final long serialVersionUID = 3271929197153229143L;

	private long bookID;
	private long stockPointID;
	private String stockPointName;
	private long itemID;
	private String itemName;
	private long itemBatchID;
	private String itemBatchName;
	private int openQty;
	private int purchaseQty;
	private int saleQty;
	private int transferIn;
	private int transferOut;
	private int stockOnHand;
	private String creationDate;
	private String modifiedDate;

	public long getBookID() {
		return bookID;
	}

	public void setBookID(long bookID) {
		this.bookID = bookID;
	}

	public long getStockPointID() {
		return stockPointID;
	}

	public void setStockPointID(long stockPointID) {
		this.stockPointID = stockPointID;
	}

	public String getStockPointName() {
		return stockPointName;
	}

	public void setStockPointName(String stockPointName) {
		this.stockPointName = stockPointName;
	}

	public long getItemID() {
		return itemID;
	}

	public void setItemID(long itemID) {
		this.itemID = itemID;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public long getItemBatchID() {
		return itemBatchID;
	}

	public void setItemBatchID(long itemBatchID) {
		this.itemBatchID = itemBatchID;
	}

	public String getItemBatchName() {
		return itemBatchName;
	}

	public void setItemBatchName(String itemBatchName) {
		this.itemBatchName = itemBatchName;
	}

	public int getOpenQty() {
		return openQty;
	}

	public void setOpenQty(int openQty) {
		this.openQty = openQty;
	}

	public int getPurchaseQty() {
		return purchaseQty;
	}

	public void setPurchaseQty(int purchaseQty) {
		this.purchaseQty = purchaseQty;
	}

	public int getSaleQty() {
		return saleQty;
	}

	public void setSaleQty(int saleQty) {
		this.saleQty = saleQty;
	}

	public int getTransferIn() {
		return transferIn;
	}

	public void setTransferIn(int transferIn) {
		this.transferIn = transferIn;
	}

	public int getTransferOut() {
		return transferOut;
	}

	public void setTransferOut(int transferOut) {
		this.transferOut = transferOut;
	}

	public int getStockOnHand() {
		return stockOnHand;
	}

	public void setStockOnHand(int stockOnHand) {
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
