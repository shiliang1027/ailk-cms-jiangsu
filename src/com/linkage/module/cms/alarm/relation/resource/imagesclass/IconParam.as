package com.linkage.module.cms.alarm.relation.resource.imagesclass
{

	/**
	 * 图标类
	 * @author mengqiang
	 *
	 */
	public class IconParam
	{
		[Embed(source="/com/linkage/module/cms/alarm/relation/resource/images/icon_defind.png")]
		[Bindable]
		/**
		 *设置图片
		 */
		public static var iconDefind:Class;
	}
}