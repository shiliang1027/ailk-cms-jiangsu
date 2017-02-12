package com.linkage.module.cms.gsscene.view.components.mapvector.event
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MapVectorEvent extends Event
	{

		public static const CMS_SCENE_GENERAL_MAPVECTOR_LOADMAP:String = "CMS_SCENE_GENERAL_MAPVECTOR_LOADMAP"; //加载地图
		public static const CMS_SCENE_GENERAL_MAPVECTOR_DYEMAP:String = "CMS_SCENE_GENERAL_MAPVECTOR_DYEMAP"; //渲染地图

		public function MapVectorEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}