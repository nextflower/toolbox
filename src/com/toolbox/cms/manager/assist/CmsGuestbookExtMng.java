package com.toolbox.cms.manager.assist;

import com.toolbox.cms.entity.assist.CmsGuestbook;
import com.toolbox.cms.entity.assist.CmsGuestbookExt;

public interface CmsGuestbookExtMng {
	public CmsGuestbookExt save(CmsGuestbookExt ext, CmsGuestbook guestbook);

	public CmsGuestbookExt update(CmsGuestbookExt ext);
}