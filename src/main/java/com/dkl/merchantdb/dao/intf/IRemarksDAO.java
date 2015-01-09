package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.RemarksTO;

public interface IRemarksDAO {
	int create(RemarksTO remarksTO);

	int update(RemarksTO remarksTO);

	int delete(String remarksID);

	List<RemarksTO> readAllByFK(Long companyId);
}
