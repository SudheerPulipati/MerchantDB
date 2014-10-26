package com.dkl.merchantdb.to;

public class CityGroupTO extends MerchantBaseTO {

	private static final long serialVersionUID = 4085944640528098594L;

	private Long companyID;

	private Long cityGroupID;

	private String cityGroupName;

	public String getCityGroupName() {
		return cityGroupName;
	}

	public void setCityGroupName(String cityGroupName) {
		this.cityGroupName = cityGroupName;
	}

	public Long getCompanyID() {
		return companyID;
	}

	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
	}

	public Long getCityGroupID() {
		return cityGroupID;
	}

	public void setCityGroupID(Long cityGroupID) {
		this.cityGroupID = cityGroupID;
	}

}
