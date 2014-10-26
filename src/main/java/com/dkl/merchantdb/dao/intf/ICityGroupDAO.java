package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.CityGroupTO;

public interface ICityGroupDAO {

	 void create(CityGroupTO cityGroupTO);
	 CityGroupTO read(String id);
	 void update(CityGroupTO cityGroupTO);
	 void delete(String cityGroupID);
	List<CityGroupTO> readAllByFK(Long companyId);
}
