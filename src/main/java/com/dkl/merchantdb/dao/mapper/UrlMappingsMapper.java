package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.UrlMappingsTO;

public class UrlMappingsMapper implements RowMapper<UrlMappingsTO> {

	@Override
	public UrlMappingsTO mapRow(ResultSet resultSet, int row) throws SQLException {
		UrlMappingsTO urlMappingsTO = new UrlMappingsTO();
		urlMappingsTO.setRoleName(resultSet.getString("role_name"));
		urlMappingsTO.setUrlPattern(resultSet.getString("url_pattern"));
		return urlMappingsTO;
	}

}
