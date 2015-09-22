package com.dkl.merchantdb.to;

public class SaleTransactionTO {
	
	private String bookID;
	private String transactionType;
	private String transactionDate;
	private String paymentMode;
	private String partyLedgerID;
	private String partyLedgerName;
	private String slipNo;
	private double coolieAmount;
	private double gunnyBagAmount;
	private double totlaPaid;
	private double narration;
	
	
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
	public String getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getPartyLedgerID() {
		return partyLedgerID;
	}
	public void setPartyLedgerID(String partyLedgerID) {
		this.partyLedgerID = partyLedgerID;
	}
	public String getPartyLedgerName() {
		return partyLedgerName;
	}
	public void setPartyLedgerName(String partyLedgerName) {
		this.partyLedgerName = partyLedgerName;
	}
	public String getSlipNo() {
		return slipNo;
	}
	public void setSlipNo(String slipNo) {
		this.slipNo = slipNo;
	}
	public double getCoolieAmount() {
		return coolieAmount;
	}
	public void setCoolieAmount(double coolieAmount) {
		this.coolieAmount = coolieAmount;
	}
	public double getGunnyBagAmount() {
		return gunnyBagAmount;
	}
	public void setGunnyBagAmount(double gunnyBagAmount) {
		this.gunnyBagAmount = gunnyBagAmount;
	}
	public double getTotlaPaid() {
		return totlaPaid;
	}
	public void setTotlaPaid(double totlaPaid) {
		this.totlaPaid = totlaPaid;
	}
	public double getNarration() {
		return narration;
	}
	public void setNarration(double narration) {
		this.narration = narration;
	}
	
	
}
