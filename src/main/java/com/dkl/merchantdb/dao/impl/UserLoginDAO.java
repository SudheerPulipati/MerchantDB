package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.IUserLoginDAO;
import com.dkl.merchantdb.dao.mapper.UserLoginMapper;
import com.dkl.merchantdb.to.UserLoginTO;

@Repository
public class UserLoginDAO implements IUserLoginDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static String READ_QUERY = "SELECT user_id,user_name FROM user_details WHERE user_name= ? AND PASSWORD= ?";

	@Override
	public UserLoginTO readUserInfo(String userName, String password) {
		UserLoginTO userLoginTO;
		try {
			userLoginTO = jdbcTemplate.queryForObject(READ_QUERY, new UserLoginMapper(), userName, password);
		} catch (EmptyResultDataAccessException exception) {
			userLoginTO = null;
		}
		return userLoginTO;
	}

}
