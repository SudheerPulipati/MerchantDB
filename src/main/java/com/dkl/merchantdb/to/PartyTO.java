package com.dkl.merchantdb.to;

public class PartyTO extends MerchantBaseTO {

	private static final long serialVersionUID = 5284035728644911605L;

	private String partyID;

	private long companyID;

	private String partyName;

	private String partyType;

	private String streetName;

	private String city;

	private String telephone;

	private String ledgerGroupName;

	private String cityGroup;

	String creationDate;

	private String modifiedDate;

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

	

	public long getCompanyID() {
		return companyID;
	}

	public void setCompanyID(long companyID) {
		this.companyID = companyID;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public String getPartyType() {
		return partyType;
	}

	public void setPartyType(String partyType) {
		this.partyType = partyType;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getLedgerGroupName() {
		return ledgerGroupName;
	}

	public void setLedgerGroupName(String ledgerGroupName) {
		this.ledgerGroupName = ledgerGroupName;
	}

	public String getCityGroup() {
		return cityGroup;
	}

	public void setCityGroup(String cityGroup) {
		this.cityGroup = cityGroup;
	}

	public String getPartyID() {
		return partyID;
	}

	public void setPartyID(String partyID) {
		this.partyID = partyID;
	}
}
