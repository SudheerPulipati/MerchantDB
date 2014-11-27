package com.dkl.merchantdb.to;

import java.sql.Timestamp;

public class FinancialBookTO extends MerchantBaseTO{

	private static final long serialVersionUID = -3929507861874866023L;

	private String finBookId;

	private Long companyId;

	private String financialYear;
	
	private Timestamp creationDate;
	
	private Timestamp modifiedDate;

	public String getFinBookId() {
		return finBookId;
	}

	public void setFinBookId(String finBookId) {
		this.finBookId = finBookId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getFinancialYear() {
		return financialYear;
	}

	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
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
