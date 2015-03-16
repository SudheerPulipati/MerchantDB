package com.dkl.merchantdb.to;

public class LedgerAccountTO {

	private String bookID;

	private String ledgerAccountID;

	private String ledgerAccountName;

	private String ledgerGroupID;

	private String ledgerGroupName;

	private String ledgerGroupType;

	private String firmID;

	private String firmName;

	private String cityGroupID;

	private double openBalance;

	private double credit;

	private double debit;

	private double closeBalance;

	private String creationDate;

	private String modifiedDate;

	public String getBookID() {
		return bookID;
	}

	public void setBookID(String bookID) {
		this.bookID = bookID;
	}

	public String getLedgerAccountID() {
		return ledgerAccountID;
	}

	public void setLedgerAccountID(String ledgerAccountID) {
		this.ledgerAccountID = ledgerAccountID;
	}

	public String getLedgerAccountName() {
		return ledgerAccountName;
	}

	public void setLedgerAccountName(String ledgerAccountName) {
		this.ledgerAccountName = ledgerAccountName;
	}

	public String getLedgerGroupID() {
		return ledgerGroupID;
	}

	public void setLedgerGroupID(String ledgerGroupID) {
		this.ledgerGroupID = ledgerGroupID;
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

	public String getFirmID() {
		return firmID;
	}

	public void setFirmID(String firmID) {
		this.firmID = firmID;
	}

	public String getFirmName() {
		return firmName;
	}

	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}

	public String getCityGroupID() {
		return cityGroupID;
	}

	public void setCityGroupID(String cityGroupID) {
		this.cityGroupID = cityGroupID;
	}

	public double getOpenBalance() {
		return openBalance;
	}

	public void setOpenBalance(double openBalance) {
		this.openBalance = openBalance;
	}

	public double getCredit() {
		return credit;
	}

	public void setCredit(double credit) {
		this.credit = credit;
	}

	public double getDebit() {
		return debit;
	}

	public void setDebit(double debit) {
		this.debit = debit;
	}

	public double getCloseBalance() {
		return closeBalance;
	}

	public void setCloseBalance(double closeBalance) {
		this.closeBalance = closeBalance;
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

}
