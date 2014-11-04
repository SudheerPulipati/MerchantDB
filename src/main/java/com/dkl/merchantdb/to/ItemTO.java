package com.dkl.merchantdb.to;


public class ItemTO {
	private Long itemGroupId;

	private Long itemId;

	private String itemName;

	private String unitName;

	private String salesTaxException;

	private String townCoolie;

	private String outOfTownCoolie;

	private String unloadingCoolie;

	private String pricePer;

	public Long getItemGroupId() {
		return itemGroupId;
	}

	public void setItemGroupId(Long itemGroupId) {
		this.itemGroupId = itemGroupId;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getSalesTaxException() {
		return salesTaxException;
	}

	public void setSalesTaxException(String salesTaxException) {
		this.salesTaxException = salesTaxException;
	}

	public String getTownCoolie() {
		return townCoolie;
	}

	public void setTownCoolie(String townCoolie) {
		this.townCoolie = townCoolie;
	}

	public String getOutOfTownCoolie() {
		return outOfTownCoolie;
	}

	public void setOutOfTownCoolie(String outOfTownCoolie) {
		this.outOfTownCoolie = outOfTownCoolie;
	}

	public String getUnloadingCoolie() {
		return unloadingCoolie;
	}

	public void setUnloadingCoolie(String unloadingCoolie) {
		this.unloadingCoolie = unloadingCoolie;
	}

	public String getPricePer() {
		return pricePer;
	}

	public void setPricePer(String pricePer) {
		this.pricePer = pricePer;
	}
}
