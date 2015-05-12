package com.toolbox.cms.dao.assist;

import java.util.List;

import com.toolbox.common.hibernate3.Updater;
import com.toolbox.common.page.Pagination;
import com.toolbox.cms.entity.assist.CmsSearchWords;

public interface CmsSearchWordsDao {
	public Pagination getPage(int pageNo, int pageSize);

	public List<CmsSearchWords> getList(String name,Integer orderBy,boolean cacheable);

	public CmsSearchWords findById(Integer id);
	
	public CmsSearchWords findByName(String name);

	public CmsSearchWords save(CmsSearchWords bean);

	public CmsSearchWords updateByUpdater(Updater<CmsSearchWords> updater);

	public CmsSearchWords deleteById(Integer id);

	
}