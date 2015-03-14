package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.FirmTO;

public interface FirmDAO{

	int createFirm(FirmTO firmTO);

	FirmTO readFirm(String firmID);

	List<FirmTO> readAllFirms();
	
	public List<FirmTO> readAllFirmsByFK(Long companyId);
	
	int updateFirm(FirmTO firmTO);

	void deleteParty(String firmID);
}
