package com.linkage.module.cms.baseline.dynamic.event
{
	import flash.events.Event;
	
	/**
	 * AdvancedDataGrid可修改的呈现器需要的事件。
	 * @version 1.0
	 * @category com.linkage.module.cms.baseline.dynamic.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class BaseLineEvent extends Event
	{
		/**
		 * 切换到基线展示面板，并加载数据
		 **/ 
		public static const OPENBASELINEVIEW:String = "OPENBASELINEVIEW";
		/**
		 * 切换到指标展示面板.
		 **/ 
		public static const OPENKPIVIEW:String = "OPENKPIVIEW";
		/**
		 * 指标启用停用操作.
		 **/ 
		public static const CHANGEKPISTATUS:String = "CHANGEKPISTATUS";
		public var param:Object;
		public function BaseLineEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}	