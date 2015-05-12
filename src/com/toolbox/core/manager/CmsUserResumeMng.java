package com.toolbox.core.manager;

import com.toolbox.core.entity.CmsUser;
import com.toolbox.core.entity.CmsUserResume;

public interface CmsUserResumeMng {
	public CmsUserResume save(CmsUserResume ext, CmsUser user);

	public CmsUserResume update(CmsUserResume ext, CmsUser user);
}