package com.linkage.module.cms.alarm.relation.event
{
	import flash.events.Event;

	/**
	 *关联关系事件
	 * @author mengqiang
	 *
	 */
	public class MatrixEvent extends Event
	{
		/**
		 * 矩阵点击
		 */
		public static const MATRIX_CLICK:String="matrix_click";
		/**
		 * 消息对象
		 */
		private var _obj:Object=null;

		public function MatrixEvent(type:String, obj:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
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