package com.toolbox.cms.entity.assist;

import com.toolbox.cms.entity.assist.base.BaseCmsSiteAccessPages;



public class CmsSiteAccessPages extends BaseCmsSiteAccessPages {
	private static final long serialVersionUID = 1L;

/*[CONSTRUCTOR MARKER BEGIN]*/
	public CmsSiteAccessPages () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public CmsSiteAccessPages (java.lang.Integer id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public CmsSiteAccessPages (
		java.lang.Integer id,
		com.toolbox.core.entity.CmsSite site,
		java.lang.String accessPage,
		java.lang.String sessionId,
		java.util.Date accessTime,
		java.util.Date accessDate,
		java.lang.Integer visitSecond,
		java.lang.Integer pageIndex) {

		super (
			id,
			site,
			accessPage,
			sessionId,
			accessTime,
			accessDate,
			visitSecond,
			pageIndex);
	}

/*[CONSTRUCTOR MARKER END]*/


}