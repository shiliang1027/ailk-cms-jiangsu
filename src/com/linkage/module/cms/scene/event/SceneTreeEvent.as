package com.linkage.module.cms.scene.event
{
	import flash.events.Event;
	
	/**
	 * 
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneTreeEvent extends Event
	{
		//加载数据事件
		public static const SCENE_AREA_XML:String = "SCENE_AREA_XML";
		
		//点击节点抛出事件
		public static const SCENE_AREA_CLICK:String = "SCENE_AREA_CLICK";
		
		// 对象数据
		private var _data:* = null;
		
		public function SceneTreeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public function get data():*
		{
			return _data;
		}

		public function set data(value:*):void
		{
			_data = value;
		}

	}
}