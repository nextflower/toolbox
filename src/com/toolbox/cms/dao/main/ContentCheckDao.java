package com.toolbox.cms.dao.main;

import com.toolbox.cms.entity.main.ContentCheck;
import com.toolbox.common.hibernate3.Updater;

public interface ContentCheckDao {
	public ContentCheck findById(Long id);

	public ContentCheck save(ContentCheck bean);

	public ContentCheck updateByUpdater(Updater<ContentCheck> updater);
}