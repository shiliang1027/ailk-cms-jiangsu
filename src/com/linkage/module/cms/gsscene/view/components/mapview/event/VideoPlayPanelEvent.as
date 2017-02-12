package com.linkage.module.cms.gsscene.event
{
	import flash.events.Event;

	/**
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-8-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class VideoPlayPanelEvent extends Event
	{

		public static const CMS_SCENE_VIEWPLAYPANEL_ADDVIDEOPLAYHANDLER:String = "CMS_SCENE_VIEWPLAYPANEL_ADDVIDEOPLAYHANDLER";

		private var _param:Object = null;

		public function VideoPlayPanelEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function get param():Object
		{
			return _param;
		}

		public function set param(value:Object):void
		{
			_param = value;
		}

	}
}