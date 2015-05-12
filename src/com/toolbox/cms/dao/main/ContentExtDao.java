package com.toolbox.cms.dao.main;

import com.toolbox.cms.entity.main.ContentExt;
import com.toolbox.common.hibernate3.Updater;

public interface ContentExtDao {
	public ContentExt findById(Integer id);

	public ContentExt save(ContentExt bean);

	public ContentExt updateByUpdater(Updater<ContentExt> updater);
}