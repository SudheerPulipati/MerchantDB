package com.dkl.merchantdb.to;

public class PurchaseReportTO extends MerchantBaseTO {

	private static final long serialVersionUID = 1716890023272063898L;

	String slipName;

	String partyName;

	String itemGroup;

	String itemName;

	String itemBond;

	String purchaseDate;

	String stockPoint;

	String quantity;

	String billPrice;

	String unbilledPrice;

	public String getSlipName() {
		return slipName;
	}

	public void setSlipName(String slipName) {
		this.slipName = slipName;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

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

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getStockPoint() {
		return stockPoint;
	}

	public void setStockPoint(String stockPoint) {
		this.stockPoint = stockPoint;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getBillPrice() {
		return billPrice;
	}

	public void setBillPrice(String billPrice) {
		this.billPrice = billPrice;
	}

	public String getUnbilledPrice() {
		return unbilledPrice;
	}

	public void setUnbilledPrice(String unbilledPrice) {
		this.unbilledPrice = unbilledPrice;
	}
}
