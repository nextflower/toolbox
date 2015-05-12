package com.toolbox.cms.dao.assist;

import java.util.List;

import com.toolbox.common.hibernate3.Updater;
import com.toolbox.common.page.Pagination;
import com.toolbox.cms.entity.assist.CmsUserMenu;

public interface CmsUserMenuDao {
	public Pagination getPage(Integer userId,int pageNo, int pageSize);
	
	public List<CmsUserMenu> getList(Integer userId,int count);

	public CmsUserMenu findById(Integer id);

	public CmsUserMenu save(CmsUserMenu bean);

	public CmsUserMenu updateByUpdater(Updater<CmsUserMenu> updater);

	public CmsUserMenu deleteById(Integer id);
}