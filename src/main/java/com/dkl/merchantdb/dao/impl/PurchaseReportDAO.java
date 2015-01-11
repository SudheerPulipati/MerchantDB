package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.IPurchaseReportDAO;
import com.dkl.merchantdb.dao.mapper.PurchaseReportMapper;
import com.dkl.merchantdb.to.PurchaseReportTO;

@Repository
public class PurchaseReportDAO implements IPurchaseReportDAO {
	
	/*
	book_id transaction_id transaction_seq_no item_id item_name item_batch_id item_batch_name quantity weight 
	weight_difference price_per price1 price2 amount1 amount2 total_amount firm_id firm_name creation_date modified_date
	 */

	private static final String READ_ALL_PURCHASE_RECORDS_QUERY = "SELECT distinct D.firm_name,"
																				+ "B.item_batch_name"
																				+ ",B.item_name,"
																				+ "C.modified_date"
																				+ ",B.item_stock_point_id"
																				+ ",B.stock_purchase_qty"
																				+ ",B.stock_transfer_in"
																				+ ",B.stock_transfer_out "
																				+ "from dklf.fin_book A,dklf.item_stock_register B,dklf.item_transaction C,dklf.ledger D "
																				+ "where A.fib_id = B.fib_id = C.fib_id = D.fib_id and A.fib_id = ? "
																				+ "and C.MODIFIED_DATE between ? and ?";
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<PurchaseReportTO> readAllPurchaseEntries(String finBookId, String startDate, String endDate) {
		System.out.println(READ_ALL_PURCHASE_RECORDS_QUERY);
		System.out.println(finBookId+" : "+startDate+" : "+endDate);
		return jdbcTemplate.query(READ_ALL_PURCHASE_RECORDS_QUERY, new PurchaseReportMapper(),finBookId,startDate,endDate);
	}

}
