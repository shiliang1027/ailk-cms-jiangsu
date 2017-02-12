package com.linkage.module.cms.alarm.totalflow.event
{
	import flash.events.Event;

	/**
	 *统计点击事件
	 * @author mengqiang
	 *
	 */
	public class StatEvent extends Event
	{
		/**
		 *横坐标key值
		 */
		public static const XIDVALUE:String="x_id";
		/**
		 *横坐标Name值
		 */
		public static const XNAMEVALUE:String="x_name";
		/**
		 *纵坐标key值
		 */
		public static const YIDVALUE:String="y_id";
		/**
		 *纵坐标Name值
		 */
		public static const YNAMEVALUE:String="y_name";
		/**
		 * 统计数据弹出
		 */
		public static const STAT_OPEN:String="stat_open";
		/**
		 * 统计数据点击
		 */
		public static const STAT_CLICK:String="stat_click";
		/**
		 * 统计详情弹出
		 */
		public static const DETAIL_OPEN:String="detail_open";
		/**
		 * 详细信息分页
		 */
		public static const DETAIL_PAGE:String="detail_page";
		/**
		 * 消息对象
		 */
		private var _obj:Object=null;

		public function StatEvent(type:String, obj:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_obj=obj;
		}

		public function get obj():Object
		{
			return _obj;
		}
	}
}