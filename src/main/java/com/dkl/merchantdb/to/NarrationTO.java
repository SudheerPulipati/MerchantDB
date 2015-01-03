package com.dkl.merchantdb.to;

public class NarrationTO {
	
	private Long companyID;
	private String narrationID;
	private String narration;
	private String creationDate;
	private String modifiedDate;
	
	public Long getCompanyID() {
		return companyID;
	}
	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
	}
	
	public String getNarration() {
		return narration;
	}
	public void setNarration(String narration) {
		this.narration = narration;
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
	public String getNarrationID() {
		return narrationID;
	}
	public void setNarrationID(String narrationID) {
		this.narrationID = narrationID;
	}

}
