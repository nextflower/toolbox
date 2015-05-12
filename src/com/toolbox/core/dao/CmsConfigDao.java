package com.toolbox.core.dao;

import com.toolbox.common.hibernate3.Updater;
import com.toolbox.core.entity.CmsConfig;

public interface CmsConfigDao {
	public CmsConfig findById(Integer id);

	public CmsConfig updateByUpdater(Updater<CmsConfig> updater);
}