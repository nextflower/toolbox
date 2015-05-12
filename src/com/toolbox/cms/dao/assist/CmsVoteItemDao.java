package com.toolbox.cms.dao.assist;

import com.toolbox.cms.entity.assist.CmsVoteItem;
import com.toolbox.common.hibernate3.Updater;
import com.toolbox.common.page.Pagination;

public interface CmsVoteItemDao {
	public Pagination getPage(int pageNo, int pageSize);

	public CmsVoteItem findById(Integer id);

	public CmsVoteItem save(CmsVoteItem bean);

	public CmsVoteItem updateByUpdater(Updater<CmsVoteItem> updater);

	public CmsVoteItem deleteById(Integer id);
}