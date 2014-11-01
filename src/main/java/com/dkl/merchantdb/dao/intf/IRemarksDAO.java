package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.RemarksTO;

public interface IRemarksDAO {
	int create(RemarksTO remarksTO);

	RemarksTO read(Long remarksID);

	List<RemarksTO> readAll();

	int update(RemarksTO remarksTO);

	int delete(Long remarksID);
}
