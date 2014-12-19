package com.dkl.merchantdb.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IUrlMappingsDAO;
import com.dkl.merchantdb.to.UrlMappingsTO;

@Component
public class UrlMappingsBO {

	@Autowired
	private IUrlMappingsDAO urlMappingsDAO;

	public Map<String, List<String>> readAllUrlMappings() {
		Map<String, List<String>> urlMap = new HashMap<String, List<String>>();
		List<String> adminUrlList = new ArrayList<String>();
		List<String> clerkUrlList = new ArrayList<String>();
		List<UrlMappingsTO> urlMappingsList = urlMappingsDAO.getUrlMappings();
		for (UrlMappingsTO urlMappingsTO : urlMappingsList) {
			if ("admin".equals(urlMappingsTO.getRoleName())) {
				adminUrlList.add(urlMappingsTO.getUrlPattern());
			} else {
				clerkUrlList.add(urlMappingsTO.getUrlPattern());
			}
		}
		urlMap.put("adminUrlList", adminUrlList);
		urlMap.put("clerkUrlList", clerkUrlList);
		return urlMap;
	}
}
