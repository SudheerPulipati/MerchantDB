package com.dkl.merchantdb.to;

public class BalanceSheetTO {

	private String liabilities;

	private Double amount1;

	private String assets;

	private Double amount2;

	public String getLiabilities() {
		return liabilities;
	}

	public void setLiabilities(String liabilities) {
		this.liabilities = liabilities;
	}

	public Double getAmount1() {
		return amount1;
	}

	public void setAmount1(Double amount1) {
		this.amount1 = amount1;
	}

	public String getAssets() {
		return assets;
	}

	public void setAssets(String assets) {
		this.assets = assets;
	}

	public Double getAmount2() {
		return amount2;
	}

	public void setAmount2(Double amount2) {
		this.amount2 = amount2;
	}
}
