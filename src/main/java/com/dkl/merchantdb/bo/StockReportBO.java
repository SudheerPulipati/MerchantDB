package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IStockReportDAO;
import com.dkl.merchantdb.to.StockReportTO;

@Component
public class StockReportBO {

	@Autowired
	IStockReportDAO stockReportDAO;
	
	public StockReportTO read(String itemGroupId){
		return stockReportDAO.read(itemGroupId);
	}
	
	public List<StockReportTO> readAll(){
		return stockReportDAO.readAll();
	}
}
