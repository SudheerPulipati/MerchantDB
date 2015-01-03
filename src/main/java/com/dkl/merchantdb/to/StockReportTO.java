package com.dkl.merchantdb.to;

public class StockReportTO {

	private String itemGroup;
	private String itemName;
	private String itemBond;
	private String stockPoint;
	private String open;
	private String purchase;
	private String sale;
	private String stockInHand;
	public String getItemGroup() {
		return itemGroup;
	}
	public void setItemGroup(String itemGroup) {
		this.itemGroup = itemGroup;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemBond() {
		return itemBond;
	}
	public void setItemBond(String itemBond) {
		this.itemBond = itemBond;
	}
	public String getStockPoint() {
		return stockPoint;
	}
	public void setStockPoint(String stockPoint) {
		this.stockPoint = stockPoint;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getPurchase() {
		return purchase;
	}
	public void setPurchase(String purchase) {
		this.purchase = purchase;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getStockInHand() {
		return stockInHand;
	}
	public void setStockInHand(String stockInHand) {
		this.stockInHand = stockInHand;
	}
	
}
