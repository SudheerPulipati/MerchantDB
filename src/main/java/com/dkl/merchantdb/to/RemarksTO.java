package com.dkl.merchantdb.to;

public class RemarksTO extends MerchantBaseTO {

	private static final long serialVersionUID = 7756644968513892221L;

	private String remarksID;

	private Long companyID;

	private String remarks;

	

	public Long getCompanyID() {
		return companyID;
	}

	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getRemarksID() {
		return remarksID;
	}

	public void setRemarksID(String remarksID) {
		this.remarksID = remarksID;
	}
}
