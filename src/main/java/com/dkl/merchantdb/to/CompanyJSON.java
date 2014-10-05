package com.dkl.merchantdb.to;

import java.util.List;

public class CompanyJSON {

	private int draw;
	private int recordsTotal;
	private int recordsFiltered;
	private List<CompanyTO> data;
	
	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public List<CompanyTO> getData() {
		return data;
	}

	public void setData(List<CompanyTO> data) {
		this.data = data;
	}

}
