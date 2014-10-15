package com.dkl.merchantdb.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.ICityGroupDAO;
import com.dkl.merchantdb.to.CityGroupTO;

@Component
public class CityGroupBO {
	
	@Autowired
	ICityGroupDAO cityGroupDAO;
	
	public void create(CityGroupTO cityGroupTO){
		cityGroupDAO.create(cityGroupTO);
	}
	
	public CityGroupTO read(String cityGroupID){
		return cityGroupDAO.read(cityGroupID);
	}
}
