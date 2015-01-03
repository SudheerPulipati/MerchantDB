package com.dkl.merchantdb.to;

public class ItemTO
{
	private Long companyId;

	private String itemId;

	private String itemName;
	
	private String unitId;

	private String unitName;
	
	private double itemNoOfKgs;
	
	private String vat;
	
	private String salesTaxExcemption;
	
	private String townCoolie;

	private double outOfTownCoolie;

	private double unloadingCoolie;

	private double eetaCoolie;

	private String pricePer;

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getUnitId() {
		return unitId;
	}

	public void setUnitId(String unitId) {
		this.unitId = unitId;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public double getItemNoOfKgs() {
		return itemNoOfKgs;
	}

	public void setItemNoOfKgs(double itemNoOfKgs) {
		this.itemNoOfKgs = itemNoOfKgs;
	}

	public String getVat() {
		return vat;
	}

	public void setVat(String vat) {
		this.vat = vat;
	}

	public String getSalesTaxExcemption() {
		return salesTaxExcemption;
	}

	public void setSalesTaxExcemption(String salesTaxExcemption) {
		this.salesTaxExcemption = salesTaxExcemption;
	}

	public String getTownCoolie() {
		return townCoolie;
	}

	public void setTownCoolie(String townCoolie) {
		this.townCoolie = townCoolie;
	}

	public double getOutOfTownCoolie() {
		return outOfTownCoolie;
	}

	public void setOutOfTownCoolie(double outOfTownCoolie) {
		this.outOfTownCoolie = outOfTownCoolie;
	}

	public double getUnloadingCoolie() {
		return unloadingCoolie;
	}

	public void setUnloadingCoolie(double unloadingCoolie) {
		this.unloadingCoolie = unloadingCoolie;
	}

	public double getEetaCoolie() {
		return eetaCoolie;
	}

	public void setEetaCoolie(double eetaCoolie) {
		this.eetaCoolie = eetaCoolie;
	}

	public String getPricePer() {
		return pricePer;
	}

	public void setPricePer(String pricePer) {
		this.pricePer = pricePer;
	}
	
	

}
