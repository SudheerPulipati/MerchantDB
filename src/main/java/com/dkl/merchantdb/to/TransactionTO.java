package com.dkl.merchantdb.to;

public class TransactionTO {

	private String bookID;
	private Long transactionID;
	private String transactionType;
	private String transactionDate;
	private String paymentMode;
	private String ledgerID;
	private String ledgerName;
	private double totalAmount;
	private String slipNo;
	private String creationDate;
	private String modifiedDate;
	private ItemTransactionTO[] itemTransactionTOs;
	private String wayBillNo;
	private String vehicleNo;
	
	private CashTransactionTO[] cashTransactionTOs;
	
	
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
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getSlipNo() {
		return slipNo;
	}
	public void setSlipNo(String slipNo) {
		this.slipNo = slipNo;
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
	public ItemTransactionTO[] getItemTransactionTOs() {
		return itemTransactionTOs;
	}
	public void setItemTransactionTOs(ItemTransactionTO[] itemTransactionTOs) {
		this.itemTransactionTOs = itemTransactionTOs;
	}
	public String getWayBillNo() {
		return wayBillNo;
	}
	public void setWayBillNo(String wayBillNo) {
		this.wayBillNo = wayBillNo;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public Long getTransactionID() {
		return transactionID;
	}
	public void setTransactionID(Long transactionID) {
		this.transactionID = transactionID;
	}
	public CashTransactionTO[] getCashTransactionTOs() {
		return cashTransactionTOs;
	}
	public void setCashTransactionTOs(CashTransactionTO[] cashTransactionTOs) {
		this.cashTransactionTOs = cashTransactionTOs;
	}
	
}
