package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.LedgerGroupTO;

public interface ILedgGroupDAO {
	
	void create(LedgerGroupTO ledgGroupTO);
	void update(LedgerGroupTO ledgGroupTO);
	void delete(String ledgGroupID);
	List<LedgerGroupTO> readByFK(int companyID);
	List<LedgerGroupTO> readAll(Long companyId);
	LedgerGroupTO read(String ledgGroupID);
}
