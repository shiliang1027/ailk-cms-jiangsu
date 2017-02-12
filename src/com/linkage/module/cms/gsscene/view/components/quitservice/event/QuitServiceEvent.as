package com.linkage.module.cms.gsscene.view.components.quitservice.event
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	import flash.events.Event;

	import mx.collections.ArrayCollection;

	public class QuitServiceEvent extends Event
	{
		public static const LOAD_QUIT_DATA:String = "LOAD_QUIT_DATA";

		public static const SHOW_QUIT_CHART:String = "SHOW_QUIT_CHART";
		//新增概括统计sheet
		public static const LOAD_GKTJ_DATA:String = "LOAD_GKTJ_DATA";

		/**
		 * 获取地市查询详情内容
		 * */
		public static const CMS_SCENE_QUITSERVICE_CITYQUITGETDATA:String = "CMS_SCENE_QUITSERVICE_CITYQUITGETDATA";
		/**
		 * 导出详情
		 * */
		public static const EXPORT_CMS_SCENE_QUITSERVICE_DATA:String = "EXPORT_CMS_SCENE_QUITSERVICE_DATA";


		public var quitData:ArrayCollection = new ArrayCollection;

		private var _param:Object;

		public function QuitServiceEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
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