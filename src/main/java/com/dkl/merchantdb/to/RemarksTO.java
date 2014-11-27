package com.dkl.merchantdb.to;

public class RemarksTO extends MerchantBaseTO {

	private static final long serialVersionUID = 7756644968513892221L;

	private Long remarksID;

	private Long companyID;

	private String remarks;

	public Long getRemarksID() {
		return remarksID;
	}

	public void setRemarksID(Long remarksID) {
		this.remarksID = remarksID;
	}

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
}
