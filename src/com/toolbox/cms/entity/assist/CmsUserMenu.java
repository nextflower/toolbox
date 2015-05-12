package com.toolbox.cms.entity.assist;

import com.toolbox.cms.entity.assist.base.BaseCmsUserMenu;



public class CmsUserMenu extends BaseCmsUserMenu {
	private static final long serialVersionUID = 1L;

/*[CONSTRUCTOR MARKER BEGIN]*/
	public CmsUserMenu () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public CmsUserMenu (java.lang.Integer id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public CmsUserMenu (
		java.lang.Integer id,
		com.toolbox.core.entity.CmsUser user,
		java.lang.String name,
		java.lang.String url,
		java.lang.Integer priority) {

		super (
			id,
			user,
			name,
			url,
			priority);
	}

/*[CONSTRUCTOR MARKER END]*/


}