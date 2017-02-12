package com.linkage.module.cms.scenedaily.event.hangandpick
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GedalDetailEvent extends Event
	{
		//获取挂牌网元详细信息
		public static const GET_HANG_DETAIL_INFO:String = "GET_HANG_DETAIL_INFO";
		//获取摘牌网元信息
		public static const GET_DOWN_DETAIL_INFO:String = "GET_DOWN_DETAIL_INFO";
		//获取摘牌信息
		public static const GET_PICK_OFF_MEDAL_INFO:String = "GET_PICK_OFF_MEDAL_INFO";
		//展示摘牌图表信息
		public static const SHOW_PICK_OFF_CHAR_INFO:String = "SHOW_PICK_OFF_CHAR_INFO";
		//获取历史信息
		public static const GET_HANG_HISTORY_LIST:String = "GET_HANG_HISTORY_LIST";

		private var _id:String;
		private var _startTime:String;
		private var _endTime:String;

		public function GedalDetailEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}



		public function get startTime():String
		{
			return _startTime;
		}

		public function set startTime(value:String):void
		{
			_startTime = value;
		}

		public function get endTime():String
		{
			return _endTime;
		}

		public function set endTime(value:String):void
		{
			_endTime = value;
		}

		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
		}


	}
}