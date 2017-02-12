package com.linkage.module.cms.scenedaily.event
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DailyMapEvent extends Event
	{

		public static const LOAD_JSMAP_DATA:String = "LOAD_JSMAP_DATA"; //加载江苏省地图坐标xml

		public static const LOAD_GISKPI_DATA:String = "LOAD_GISKPI_DATA"; //giskpi加载

		public static const LOAD_MOID_DATA:String = "LOAD_MOID_DATA"; //获取某地市网元列表

		public static const GISKPI_DYEHANDLER:String = "GISKPI_DYEHANDLER"; //渲染地图数据

		public static const GISID_THROWMAP:String = "GISID_THROWMAP"; //地市撒点

		private var _param:Object;

		public function DailyMapEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
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