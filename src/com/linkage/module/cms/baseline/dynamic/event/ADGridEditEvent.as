package com.linkage.module.cms.baseline.dynamic.event
{
	import flash.events.Event;
	
	/**
	 * AdvancedDataGrid可修改的呈现器需要的事件。
	 * @version 1.0
	 * @category com.linkage.module.cms.baseline.dynamic.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ADGridEditEvent extends Event
	{
		public static const EDITBUTTONCHANGE:String = "EditButtonChange";//修改的button改变
		public static const EDITBUTTONEDITOK:String = "servTypeEditOK";//修改成功
		public var param:Object;
		public function ADGridEditEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}	