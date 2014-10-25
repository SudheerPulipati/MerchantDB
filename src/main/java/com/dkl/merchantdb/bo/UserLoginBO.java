package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IUserLoginDAO;
import com.dkl.merchantdb.dao.intf.IUserRoleDAO;
import com.dkl.merchantdb.to.UserLoginTO;

@Component
public class UserLoginBO {

	@Autowired
	private IUserLoginDAO userLoginDAO;
	
	@Autowired
	private IUserRoleDAO userRoleDAO;
	
	public UserLoginTO getUserInfo(String userName, String password){
		return userLoginDAO.readUserInfo(userName, password);
	}

	public List<String> getUserRoles(int userId) {
		return userRoleDAO.getUserRoles(userId);
	}
}
