package com.toolbox.cms.dao.assist;

import java.util.List;

import com.toolbox.common.hibernate3.Updater;
import com.toolbox.common.page.Pagination;
import com.toolbox.cms.entity.assist.CmsScoreRecord;

public interface CmsScoreRecordDao {
	public Pagination getPage(int pageNo, int pageSize);
	
	public List<CmsScoreRecord> findListByContent(Integer contentId);
	
	public CmsScoreRecord findByScoreItemContent(Integer itemId,Integer contentId);

	public CmsScoreRecord findById(Integer id);

	public CmsScoreRecord save(CmsScoreRecord bean);

	public CmsScoreRecord updateByUpdater(Updater<CmsScoreRecord> updater);

	public CmsScoreRecord deleteById(Integer id);
}