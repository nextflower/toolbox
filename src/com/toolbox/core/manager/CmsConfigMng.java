package com.toolbox.core.manager;

import java.util.Date;

import com.toolbox.core.entity.CmsConfig;
import com.toolbox.core.entity.CmsConfigAttr;
import com.toolbox.core.entity.MarkConfig;
import com.toolbox.core.entity.MemberConfig;

public interface CmsConfigMng {
	public CmsConfig get();

	public void updateCountCopyTime(Date d);

	public void updateCountClearTime(Date d);

	public CmsConfig update(CmsConfig bean);

	public MarkConfig updateMarkConfig(MarkConfig mark);

	public void updateMemberConfig(MemberConfig memberConfig);
	
	public void updateConfigAttr(CmsConfigAttr configAttr);
}