package com.linkage.module.cms.general.regional.important.scene.view.resource.imagesclass
{

	/**
	 * 图标类
	 * @author mengqiang
	 *
	 */
	public class IconParam
	{
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/u381.png")]
		[Bindable]
		/**
		 * 向上图标
		 * @return
		 *
		 */
		public static var upIcon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/u380.png")]
		[Bindable]
		/**
		 * 向下图标
		 * @return
		 *
		 */
		public static var underIcon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/u301.png")]
		[Bindable]
		/**
		 * 下载图标
		 * @return
		 *
		 */
		public static var downLoadIcon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/cell.png")]
		[Bindable]
		/**
		 * 小区图标
		 * @return
		 *
		 */
		public static var cellIcon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/cell_1.png")]
		[Bindable]
		/**
		 * 一级小区图标
		 * @return
		 *
		 */
		public static var cell1Icon:Class;

		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/cell_2.png")]
		[Bindable]
		/**
		 * 二级小区图标
		 * @return
		 *
		 */
		public static var cell2Icon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/cell_3.png")]
		[Bindable]
		/**
		 * 三级小区图标
		 * @return
		 *
		 */
		public static var cell3Icon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/cell_4.png")]
		[Bindable]
		/**
		 * 四级小区图标
		 * @return
		 *
		 */
		public static var cell4Icon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/bts.png")]
		[Bindable]
		/**
		 * 基站图标
		 * @return
		 *
		 */
		public static var btsIcon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/bts_1.png")]
		[Bindable]
		/**
		 * 一级基站图标
		 * @return
		 *
		 */
		public static var bts1Icon:Class;

		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/bts_2.png")]
		[Bindable]
		/**
		 * 二级基站图标
		 * @return
		 *
		 */
		public static var bts2Icon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/bts_3.png")]
		[Bindable]
		/**
		 * 三级基站图标
		 * @return
		 *
		 */
		public static var bts3Icon:Class;
		[Embed(source="/com/linkage/module/cms/general/regional/important/scene/view/resource/images/bts_4.png")]
		[Bindable]
		/**
		 * 四级基站图标
		 * @return
		 *
		 */
		public static var bts4Icon:Class;

		/**
		 *通过告警级别和网元类型获取图标
		 * @param type 网元类型
		 * @param level 告警级别
		 * @return  图标
		 *
		 */
		public static function getIconByLevelAndNeType(type:String, level:String):Class
		{
			var result:Class=null;
			if (type == 'cell')
			{
				switch (level)
				{
					case '1':
						result=cell1Icon;
						break;
					case '2':
						result=cell2Icon;
						break;
					case '3':
						result=cell3Icon;
						break;
					case '4':
						result=cell4Icon;
						break;
					default:
						result=cellIcon;
				}
			}
			else
			{
				switch (level)
				{
					case '1':
						result=bts1Icon;
						break;
					case '2':
						result=bts2Icon;
						break;
					case '3':
						result=bts3Icon;
						break;
					case '4':
						result=bts4Icon;
						break;
					default:
						result=btsIcon;
				}
			}
			return result;
		}
	}
}