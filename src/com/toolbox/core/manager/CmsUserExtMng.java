package com.toolbox.core.manager;

import com.toolbox.core.entity.CmsUser;
import com.toolbox.core.entity.CmsUserExt;

public interface CmsUserExtMng {
	public CmsUserExt save(CmsUserExt ext, CmsUser user);

	public CmsUserExt update(CmsUserExt ext, CmsUser user);
}