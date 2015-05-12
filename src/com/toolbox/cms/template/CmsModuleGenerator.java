package com.toolbox.cms.template;


public class CmsModuleGenerator {
	private static String packName = "com.toolbox.cms.template";
	private static String fileName = "toolbox.properties";

	public static void main(String[] args) {
		new ModuleGenerator(packName, fileName).generate();
	}
}
