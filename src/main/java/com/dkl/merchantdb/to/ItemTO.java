package com.dkl.merchantdb.to;

public class ItemTO {
	private Long companyId;

	private Long itemGroupId;

	private Long itemId;

	private String itemName;

	private String unitName;

	private String salesTaxExcemption;

	private String townCoolie;

	private String outOfTownCoolie;

	private String unloadingCoolie;
	
	private String eetaCoolie;

	private String pricePer;
	
	private Double weight;

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

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getEetaCoolie() {
		return eetaCoolie;
	}

	public void setEetaCoolie(String eetaCoolie) {
		this.eetaCoolie = eetaCoolie;
	}

	public String getSalesTaxExcemption() {
		return salesTaxExcemption;
	}

	public void setSalesTaxExcemption(String salesTaxExcemption) {
		this.salesTaxExcemption = salesTaxExcemption;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}
}
