package com.linkage.module.cms.machroomlayout.event
{
	import flash.events.Event;
	
	/**
	 * 编辑事件
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-23 下午09:18:12
	 * @category com.linkage.module.cms.machroomlayout.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class EditorEvent extends Event
	{
		public static const DELETE:String = "delete";
		public static const ARROW:String = "arrow";
		public function EditorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}