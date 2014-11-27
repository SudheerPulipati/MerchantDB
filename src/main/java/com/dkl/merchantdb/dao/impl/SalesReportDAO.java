package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.ISaleReportDAO;
import com.dkl.merchantdb.dao.mapper.SalesReportMapper;
import com.dkl.merchantdb.to.SalesReportTO;

@Component
public class SalesReportDAO implements ISaleReportDAO {

	private static final String READ_ALL_PURCHASE_RECORDS_QUERY = "SELECT distinct firm_name,B.item_batch_name,B.item_name,C.modified_date,stock_point_name,sale_quantity,price1,price2 from fin_book A,item_stock_register B,item_transaction C,ledger D where A.fib_id = B.book_id = C.book_id = D.bookid and A.fib_id = ? and date(C.modified_date) between ? and ?";
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<SalesReportTO> readAllSalesEntries(String finBookId, String startDate, String endDate) {
		return jdbcTemplate.query(READ_ALL_PURCHASE_RECORDS_QUERY, new SalesReportMapper(),finBookId,startDate,endDate);
	}

}
