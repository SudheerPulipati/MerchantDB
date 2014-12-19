package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IUrlMappingsDAO;
import com.dkl.merchantdb.dao.mapper.UrlMappingsMapper;
import com.dkl.merchantdb.to.UrlMappingsTO;

@Component
public class UrlMappingsDAO implements IUrlMappingsDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final static String READ_ALL_URL_MAPPINGS = "select role_name,url_pattern from role A,user_url_mappings B where A.role_id = B.role_id";

	@Override
	public List<UrlMappingsTO> getUrlMappings() {
		return jdbcTemplate.query(READ_ALL_URL_MAPPINGS, new UrlMappingsMapper());
	}

}
