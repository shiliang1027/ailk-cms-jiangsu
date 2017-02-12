package com.linkage.module.cms.perfmonitor.monitor.alarm.resource.imagesclass
{
	import mx.controls.Image;

	/**
	 * 图标类
	 * @author mengqiang
	 *
	 */
	public class IconParam
	{

		[Embed(source="/com/linkage/module/cms/perfmonitor/monitor/alarm/resource/images/level1.png")]
		[Bindable]
		/**
		 * 告警等级1
		 * @return
		 *
		 */
		public static var Icon_alarm_level1:Class;
		[Embed(source="/com/linkage/module/cms/perfmonitor/monitor/alarm/resource/images/level2.png")]
		[Bindable]
		/**
		 * 告警等级2
		 * @return
		 *
		 */
		public static var Icon_alarm_level2:Class;
		[Embed(source="/com/linkage/module/cms/perfmonitor/monitor/alarm/resource/images/level3.png")]
		[Bindable]
		/**
		 * 告警等级3
		 * @return
		 *
		 */
		public static var Icon_alarm_level3:Class;
		[Embed(source="/com/linkage/module/cms/perfmonitor/monitor/alarm/resource/images/level4.png")]
		[Bindable]
		/**
		 * 告警等级4
		 * @return
		 *
		 */
		public static var Icon_alarm_level4:Class;
	}
}