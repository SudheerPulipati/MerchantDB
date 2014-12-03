package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.ProfitLossTO;

public interface IProfitLossDAO {
	
	List<ProfitLossTO> readAllProfitLossRecords(String bookId,String startDate,String endDate);
}
