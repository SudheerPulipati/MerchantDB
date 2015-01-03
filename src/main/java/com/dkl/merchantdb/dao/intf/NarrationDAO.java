package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.NarrationTO;

public interface NarrationDAO {

	int createNarration(NarrationTO narrationTO);

	List<NarrationTO> readAllNarration();

}
