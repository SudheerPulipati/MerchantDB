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

	private String ledgerGroupId;

	private String ledgerGroupName;

	private String ledgerGroupType;

	private double openingBalance;

	private String cityGroupId;

	private String state;

	private int pincode;

	private String email;

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

	public String getLedgerGroupId() {
		return ledgerGroupId;
	}

	public void setLedgerGroupId(String ledgerGroupId) {
		this.ledgerGroupId = ledgerGroupId;
	}

	public String getCityGroupId() {
		return cityGroupId;
	}

	public void setCityGroupId(String cityGroupId) {
		this.cityGroupId = cityGroupId;
	}

	public String getPartyID() {
		return partyID;
	}

	public void setPartyID(String partyID) {
		this.partyID = partyID;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLedgerGroupName() {
		return ledgerGroupName;
	}

	public void setLedgerGroupName(String ledgerGroupName) {
		this.ledgerGroupName = ledgerGroupName;
	}

	public String getLedgerGroupType() {
		return ledgerGroupType;
	}

	public void setLedgerGroupType(String ledgerGroupType) {
		this.ledgerGroupType = ledgerGroupType;
	}

	public double getOpeningBalance() {
		return openingBalance;
	}

	public void setOpeningBalance(double openingBalance) {
		this.openingBalance = openingBalance;
	}
}
