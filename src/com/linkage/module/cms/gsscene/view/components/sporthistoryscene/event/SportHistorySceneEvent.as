package com.linkage.module.cms.gsscene.view.components.sporthistoryscene.event
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SportHistorySceneEvent extends Event
	{
		public static const INIT_MINIMAPWORK_DM:String = "INIT_MINIMAPWORK_DM";
		public static const LOAD_MINIMAPWORK_DATA:String = "LOAD_MINIMAPWORK_DATA";
		public static const LOAD_MINIMAPWORK_DATA_COMP:String = "LOAD_MINIMAPWORK_DATA_COMP";
		public static const LOAD_MAPWORK:String = "LOAD_MAPWORK";
		public static const SPORT_HISTORY_SCENE_CLICK:String = "SPORT_HISTORY_SCENE_CLICK"; //点击滚动历史图片触发事件
		public static const INIT:String = "INIT";

		public var param:Object = null;

		public function SportHistorySceneEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}