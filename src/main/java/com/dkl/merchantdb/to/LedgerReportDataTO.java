package com.dkl.merchantdb.to;

public class LedgerReportDataTO {

	private String ledgerName;
	private String ledgerGroup;
	private String cityGroup;
	private String date;
	private long credit;
	private long debit;
	private long balance;
	private String mode;
	private String remarks;
	public String getLedgerName() {
		return ledgerName;
	}
	public void setLedgerName(String ledgerName) {
		this.ledgerName = ledgerName;
	}
	public String getLedgerGroup() {
		return ledgerGroup;
	}
	public void setLedgerGroup(String ledgerGroup) {
		this.ledgerGroup = ledgerGroup;
	}
	public String getCityGroup() {
		return cityGroup;
	}
	public void setCityGroup(String cityGroup) {
		this.cityGroup = cityGroup;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public long getCredit() {
		return credit;
	}
	public void setCredit(long credit) {
		this.credit = credit;
	}
	public long getDebit() {
		return debit;
	}
	public void setDebit(long debit) {
		this.debit = debit;
	}
	public long getBalance() {
		return balance;
	}
	public void setBalance(long balance) {
		this.balance = balance;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
