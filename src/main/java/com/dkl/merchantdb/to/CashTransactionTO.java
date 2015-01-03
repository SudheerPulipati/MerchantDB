package com.dkl.merchantdb.to;

public class CashTransactionTO {

	private String bookID;
	private String ledgerID;
	private String ledgerName;
	private double amount;
	private String firmID;
	private String firmName;
	private String transactionID;
	private Long transactionSeqNo;
	
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
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
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
	public Long getTransactionSeqNo() {
		return transactionSeqNo;
	}
	public void setTransactionSeqNo(Long transactionSeqNo) {
		this.transactionSeqNo = transactionSeqNo;
	}
	public String getTransactionID() {
		return transactionID;
	}
	public void setTransactionID(String transactionID) {
		this.transactionID = transactionID;
	}
	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	
	

}
