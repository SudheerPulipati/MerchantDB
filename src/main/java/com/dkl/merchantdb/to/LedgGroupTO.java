package com.dkl.merchantdb.to;

public class LedgGroupTO extends MerchantBaseTO{
	private static final long serialVersionUID = -8586191301211812240L;
	private String ledgGroupID;
	private Long companyID;
	private String ledgGroupName;
	private String ledgGroupType;
	private String ledgCreateDate;
	private String ledgModDate;
	public String getLedgGroupName() {
		return ledgGroupName;
	}
	public void setLedgGroupName(String ledgGroupName) {
		this.ledgGroupName = ledgGroupName;
	}
	public String getLedgGroupType() {
		return ledgGroupType;
	}
	public void setLedgGroupType(String ledgGroupType) {
		this.ledgGroupType = ledgGroupType;
	}
	public String getLedgCreateDate() {
		return ledgCreateDate;
	}
	public void setLedgCreateDate(String ledgCreateDate) {
		this.ledgCreateDate = ledgCreateDate;
	}
	public String getLedgModDate() {
		return ledgModDate;
	}
	public void setLedgModDate(String ledgModDate) {
		this.ledgModDate = ledgModDate;
	}
	
	public Long getCompanyID() {
		return companyID;
	}
	public void setCompanyID(Long companyID) {
		this.companyID = companyID;
	}
	public String getLedgGroupID() {
		return ledgGroupID;
	}
	public void setLedgGroupID(String ledgerGroupId) {
		this.ledgGroupID = ledgerGroupId;
	}
	
	
}
