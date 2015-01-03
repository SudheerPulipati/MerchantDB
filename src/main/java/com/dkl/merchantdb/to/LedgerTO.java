package com.dkl.merchantdb.to;

public class LedgerTO {

	private String bookID;
	private String transactionID;
	private String transactionType;
	private Long ledgerSeqNo;
	private String transactionDate;
	private String ledgerID;
	private String ledgerName;
	private String firmID;
	private String firmName;
	private String Cr_Dr;
	private double amount;
	private String creationDate;
	private String modifiedDate;
	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public Long getLedgerSeqNo() {
		return ledgerSeqNo;
	}
	public void setLedgerSeqNo(Long ledgerSeqNo) {
		this.ledgerSeqNo = ledgerSeqNo;
	}
	public String getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}
	public String getLedgerID() {
		return ledgerID;
	}
	public void setLedgerID(String ledgerID) {
		this.ledgerID = ledgerID;
	}
	public String getLedgerName() {
		return ledgerName;
	}
	public void setLedgerName(String ledgerName) {
		this.ledgerName = ledgerName;
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
	public String getCr_Dr() {
		return Cr_Dr;
	}
	public void setCr_Dr(String cr_Dr) {
		Cr_Dr = cr_Dr;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
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
	public String getTransactionID() {
		return transactionID;
	}
	public void setTransactionID(String transactionID) {
		this.transactionID = transactionID;
	}

}
