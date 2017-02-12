package com.linkage.module.cms.scenedaily.event
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-6
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ConfigPanelEvent extends Event
	{

		public static const VIEW_CHANGE:String = "VIEW_CHANGE"; //视图变动，是领导视图，一级视图 还是管理视图

		private var _param:Object;


		public function ConfigPanelEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
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

