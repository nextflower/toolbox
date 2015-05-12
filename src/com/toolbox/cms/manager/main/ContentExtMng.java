package com.toolbox.cms.manager.main;

import com.toolbox.cms.entity.main.Content;
import com.toolbox.cms.entity.main.ContentExt;

public interface ContentExtMng {
	public ContentExt save(ContentExt ext, Content content);

	public ContentExt update(ContentExt ext);
}