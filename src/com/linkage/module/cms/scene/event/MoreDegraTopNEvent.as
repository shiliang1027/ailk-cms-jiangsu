package com.linkage.module.cms.scene.event
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-2
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MoreDegraTopNEvent extends Event
	{

		/**
		 * 获取所有需要展示的topn chart数据
		 * */
		public static const CMS_SCENE_MOREDEGRATOPN_CHARTSGETHANDLER:String = "CMS_SCENE_MOREDEGRATOPN_CHARTSGETHANDLER";

		/**
		 * 展示多个topn chart数据
		 * */
		public static const CMS_SCENE_MOREDEGRATOPN_CHARTSSHOWHANDLER:String = "CMS_SCENE_MOREDEGRATOPN_CHARTSSHOWHANDLER";

		/**
		 * 获取多指标图表配置数据信息
		 * */
		public static const CMS_SCENE_MOREDEGRATOPN_GETTOPNCONFIG:String = "CMS_SCENE_MOREDEGRATOPN_GETTOPNCONFIG";
		/**
		 * 保存多指标图表配置数据信息
		 * */
		public static const CMS_SCENE_MOREDEGRATOPN_SAVETOPNCONFIG:String = "CMS_SCENE_MOREDEGRATOPN_SAVETOPNCONFIG";
		/**
		 * 保存多指标图表配置数据信息成功后，处理后续事件
		 * */
		public static const CMS_SCENE_MOREDEGRATOPN_SAVETOPNCONFIGCOMPLETE:String = "CMS_SCENE_MOREDEGRATOPN_SAVETOPNCONFIGCOMPLETE";

		private var _param:Object;

		public function MoreDegraTopNEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function get param():Object
		{
			return _param;
		}

		public function set param(value:Object):void
		{
			_param = value;
		}

	}
}