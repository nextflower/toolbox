package com.toolbox.cms.dao.main;

import com.toolbox.cms.entity.main.ContentTxt;
import com.toolbox.common.hibernate3.Updater;

public interface ContentTxtDao {
	public ContentTxt findById(Integer id);

	public ContentTxt save(ContentTxt bean);

	public ContentTxt updateByUpdater(Updater<ContentTxt> updater);
}