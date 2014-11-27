package com.dkl.merchantdb.to;

import java.sql.Timestamp;

public class LedgerTO {
	
	private String legerId;

	private String bookId;

	private String transactionId;

	private String transactionType;

	private Timestamp transactionDate;

	private Long ledgerSeqNo;

	private String ledgerName;

	private Long firmId;

	private String firmName;

	private String depositType;

	private Double amount;

	private String narration;

	private Timestamp creationDate;

	private Timestamp modifiedDate;

	public String getLegerId() {
		return legerId;
	}

	public void setLegerId(String legerId) {
		this.legerId = legerId;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public Timestamp getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Timestamp transactionDate) {
		this.transactionDate = transactionDate;
	}

	public Long getLedgerSeqNo() {
		return ledgerSeqNo;
	}

	public void setLedgerSeqNo(Long ledgerSeqNo) {
		this.ledgerSeqNo = ledgerSeqNo;
	}

	public String getLedgerName() {
		return ledgerName;
	}

	public void setLedgerName(String ledgerName) {
		this.ledgerName = ledgerName;
	}

	public Long getFirmId() {
		return firmId;
	}

	public void setFirmId(Long firmId) {
		this.firmId = firmId;
	}

	public String getFirmName() {
		return firmName;
	}

	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}

	public String getDepositType() {
		return depositType;
	}

	public void setDepositType(String depositType) {
		this.depositType = depositType;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getNarration() {
		return narration;
	}

	public void setNarration(String narration) {
		this.narration = narration;
	}

	public Timestamp getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Timestamp creationDate) {
		this.creationDate = creationDate;
	}

	public Timestamp getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Timestamp modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
}
