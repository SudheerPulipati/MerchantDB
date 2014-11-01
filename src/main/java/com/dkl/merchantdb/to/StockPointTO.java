package com.dkl.merchantdb.to;

public class StockPointTO extends MerchantBaseTO {
	private static final long serialVersionUID = -4030764215054744316L;
	private Long stockID;
	private Long companyID;
	private String stockPointName;
	private String stockPointAddress;
	private String stockPointCity;
	private String stockPointState;
	private String stockPointPhone;

	public Long getStockID() {
		return stockID;
	}

	public void setStockID(Long stockID) {
		this.stockID = stockID;
	}

	public Long getCompanyID() {
		return companyID;
	}

	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
	}

	public String getStockPointName() {
		return stockPointName;
	}

	public void setStockPointName(String stockPointName) {
		this.stockPointName = stockPointName;
	}

	public String getStockPointAddress() {
		return stockPointAddress;
	}

	public void setStockPointAddress(String stockPointAddress) {
		this.stockPointAddress = stockPointAddress;
	}

	public String getStockPointCity() {
		return stockPointCity;
	}

	public void setStockPointCity(String stockPointCity) {
		this.stockPointCity = stockPointCity;
	}

	public String getStockPointState() {
		return stockPointState;
	}

	public void setStockPointState(String stockPointState) {
		this.stockPointState = stockPointState;
	}

	public String getStockPointPhone() {
		return stockPointPhone;
	}

	public void setStockPointPhone(String stockPointPhone) {
		this.stockPointPhone = stockPointPhone;
	}

}
