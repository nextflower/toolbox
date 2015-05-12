package com.toolbox.cms.manager.main;

import com.toolbox.cms.entity.main.Content;
import com.toolbox.cms.entity.main.ContentTxt;

public interface ContentTxtMng {
	public ContentTxt save(ContentTxt txt, Content content);

	public ContentTxt update(ContentTxt txt, Content content);
}