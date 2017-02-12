package com.linkage.module.cms.perfmonitor.indexview.resource.imagesclass
{
	import mx.controls.Image;

	/**
	 * 图标类
	 * @author mengqiang
	 *
	 */
	public class IconParam
	{

		/**
		 * 告警等级1
		 * @return
		 *
		 */
		[Embed(source="../images/level1.png")]
		[Bindable]
		public static var Icon_alarm_level1:Class;
		
		/**
		 * 告警等级2
		 * @return
		 *
		 */
		[Embed(source="../images/level2.png")]
		[Bindable]
		public static var Icon_alarm_level2:Class;
		
		/**
		 * 告警等级3
		 * @return
		 *
		 */
		[Embed(source="../images/level3.png")]
		[Bindable]
		public static var Icon_alarm_level3:Class;
		
		/**
		 * 告警等级4
		 * @return
		 *
		 */
		[Embed(source="../images/level4.png")]
		[Bindable]
		public static var Icon_alarm_level4:Class;
	}
}