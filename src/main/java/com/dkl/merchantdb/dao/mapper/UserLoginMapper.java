package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.UserLoginTO;

public class UserLoginMapper implements RowMapper<UserLoginTO> {

	@Override
	public UserLoginTO mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		UserLoginTO userLoginTO = new UserLoginTO();
		userLoginTO.setUsername(resultSet.getString("USER_NAME"));
		//userLoginTO.setPassword(rs.getString("PASSWORD"));
		userLoginTO.setUserID(resultSet.getInt("USER_ID"));
		return userLoginTO;
	}

}
