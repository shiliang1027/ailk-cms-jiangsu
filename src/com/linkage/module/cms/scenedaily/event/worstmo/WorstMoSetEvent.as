package com.linkage.module.cms.scenedaily.event.worstmo
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WorstMoSetEvent extends Event
	{
		//获取最差网元列表
		public static const GET_WORST_MO_LIST:String = "GET_WORST_MO_LIST";
		//保存最差网元信息
		public static const SAVE_WORST_MO_INFO:String = "SAVE_WORST_MO_INFO";
		//返回结果标志
		public static const RETURN_WORST_MO_STR:String = "RETURN_WORST_MO_STR";
		//加载关联关系以及网元类型下拉列表
		public static const SHOW_WORST_KPI_SHIP_INFO:String = "SHOW_WORST_KPI_SHIP_INFO";

		private var _typeName:String;
		private var _saveWorstInfo:Object = new Object;

		public function WorstMoSetEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function get typeName():String
		{
			return _typeName;
		}

		public function set typeName(value:String):void
		{
			_typeName = value;
		}

		public function get saveWorstInfo():Object
		{
			return _saveWorstInfo;
		}

		public function set saveWorstInfo(value:Object):void
		{
			_saveWorstInfo = value;
		}


	}
}