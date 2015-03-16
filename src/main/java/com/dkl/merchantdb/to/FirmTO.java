package com.dkl.merchantdb.to;

public class FirmTO {
	private Long companyID;
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
	
	public String toString(){
		StringBuilder log = new StringBuilder("#Firm Detail#");
		log.append("Company ID : ").append(this.companyID);
		log.append("Firm ID : ").append(this.firmID);
		log.append("Firm Name : ").append(this.firmName);
		log.append("Creation Date : ").append(this.creationDate);
		log.append("Modified Date : ").append(this.modifiedDate);
		return log.toString();
	}
	public String getFirmID() {
		return firmID;
	}
	public void setFirmID(String firmID) {
		this.firmID = firmID;
	}
	public Long getCompanyID() {
		return companyID;
	}
	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
	}
	
}
