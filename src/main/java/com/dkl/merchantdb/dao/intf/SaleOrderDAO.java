package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.ItemStockRegisterTO;
import com.dkl.merchantdb.to.SaleOrderRequestTO;

public interface SaleOrderDAO {

	public SaleOrderRequestTO prepareRequestDataForSalesOrder(Long companyId);

	public Long getNextHighestTransactionSeqNo(String transactionType,String bookID);

}
