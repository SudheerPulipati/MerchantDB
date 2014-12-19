package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.UrlMappingsTO;

public interface IUrlMappingsDAO {
	List<UrlMappingsTO> getUrlMappings();
}
