package com.dkl.merchantdb.to;

public class FirmTO {
	private String companyID;
	private String firmID;
	private String firmName;
	private String creationDate;
	private String modifiedDate;
	
	
	public String getFirmName() {
		return firmName;
	}
	public void setFirmName(String firmName) {
		this.firmName = firmName;
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
	public String getCompanyID() {
		return companyID;
	}
	public void setCompanyID(String companyID) {
		this.companyID = companyID;
	}
	public String getFirmID() {
		return firmID;
	}
	public void setFirmID(String firmID) {
		this.firmID = firmID;
	}

	
}
