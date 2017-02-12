package com.linkage.module.cms.general.regional.important.venue.view.resource.imagesclass
{

	/**
	 * 图标类
	 * @author mengqiang
	 *
	 */
	public class IconParam
	{
		[Embed(source="/com/linkage/module/cms/general/regional/important/venue/view/resource/images/alarm_level.png")]
		[Bindable]
		/**
		 * 告警级别
		 * @return
		 *
		 */
		public static var alarm_level:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/venue/view/resource/images/alarm_level1.png")]
		[Bindable]
		/**
		 * 告警级别一
		 * @return
		 *
		 */
		public static var alarm_level1:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/venue/view/resource/images/alarm_level2.png")]
		[Bindable]
		/**
		 * 告警级别二
		 * @return
		 *
		 */
		public static var alarm_level2:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/venue/view/resource/images/alarm_level3.png")]
		[Bindable]
		/**
		 * 告警级别三
		 * @return
		 *
		 */
		public static var alarm_level3:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/venue/view/resource/images/alarm_level4.png")]
		[Bindable]
		/**
		 * 告警级别四
		 * @return
		 *
		 */
		public static var alarm_level4:Class;

		/**
		 *通过告警级别获取图标
		 * @param level 告警级别
		 * @return  图标
		 *
		 */
		public static function getIconByLevelAndNeType(level:String):Class
		{
			var result:Class=null;
			switch (level)
			{
				case '1':
					result=alarm_level1;
					break;
				case '2':
					result=alarm_level2;
					break;
				case '3':
					result=alarm_level3;
					break;
				case '4':
					result=alarm_level4;
					break;
				default:
					result=alarm_level;
			}
			return result;
		}
	}
}