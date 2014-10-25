package com.dkl.merchantdb.dao.intf;

import com.dkl.merchantdb.to.UserLoginTO;

public interface IUserLoginDAO {

	UserLoginTO readUserInfo(String userName, String password);
}
