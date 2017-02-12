package com.linkage.module.cms.gsscene.view.components.emgyresource.event
{
	import flash.events.Event;

	/**
	 * 天气概况event
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-1
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class EmpyEvent extends Event
	{
		//展示应急概况
		public static const SHOW_EMPY_SITUATION:String = "SHOW_EMPY_SITUATION";
		//展示应急详情
		public static const SHOW_EMPY_DETAIL:String = "SHOW_EMPY_DETAIL";
		//展示应急资源经纬度
		public static const SHOW_EMPY_JW_INFO:String = "SHOW_EMPY_JW_INFO";
		//展示应急资源经纬度
		public static const SHOW_EMPY_TO_GIS:String = "SHOW_EMPY_TO_GIS";
		public static const LOAD_EMPY_TO_GIS:String = "LOAD_EMPY_TO_GIS";
		public static const LOAD_EMPY_TO_GIS_SUCC:String = "LOAD_EMPY_TO_GIS_SUCC";

		public static const SAVE_EMGY_DETAIL:String = "SAVE_EMGY_DETAIL";
		public static const RETURN_SAVE_EMGY_DETAIL:String = "RETURN_SAVE_EMGY_DETAIL";
		public static const SHOW_EMGY_SELECT_TIME:String="SHOW_EMGY_SELECT_TIME";
		public static const SHOW_EMGY_SELECT_TIME_GIS:String="SHOW_EMGY_SELECT_TIME_GIS";
		public static const LOAD_AREA_ID:String="LOAD_AREA_ID";
		public static const QUERY_COUNT_NUM:String="QUERY_COUNT_NUM";
		//应急资源类型ID
		public var emgyTypeId:String;
		//应急资源ID
		public var emgyResId:String;
		//应急资源ID
		public var emergresName:String;
		public var longitude:Number;
		public var latitude:Number;
		public var isChg:String;
		public var currentEmgyResId:Object;

		public var param:Object;
		public function EmpyEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}