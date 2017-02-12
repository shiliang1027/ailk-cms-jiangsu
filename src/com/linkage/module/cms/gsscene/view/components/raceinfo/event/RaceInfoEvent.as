package com.linkage.module.cms.gsscene.view.components.raceinfo.event
{
	import flash.events.Event;

	/**
	 * 赛事详情事件类
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-24
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RaceInfoEvent extends Event
	{


		/**
		 * 赛事信息获取之后初始化
		 * */
		public static const CMS_SCENE_RACEINFO_RACEINFOINIT:String = "CMS_SCENE_RACEINFO_RACEINFOINIT";

		public static const CMS_SCENE_RACEINFO_SAVERACEINFO:String = "CMS_SCENE_RACEINFO_SAVERACEINFO";

		public static const CMS_SCENE_RACEINFO_MODIFYRACEINFO:String = "CMS_SCENE_RACEINFO_MODIFYRACEINFO";

		public static const CMS_SCENE_RACEINFO_DELETERACEINFO:String = "CMS_SCENE_RACEINFO_DELETERACEINFO";

		public static const CMS_SCENE_RACEINFO_DELETETIP:String = "CMS_SCENE_RACEINFO_DELETETIP";

		public static const CMS_SCENE_RACEINFO_ADDTIP:String = "CMS_SCENE_RACEINFO_ADDTIP";

		public static const CMS_SCENE_RACEINFO_CLOSEPOPWIN:String = "CMS_SCENE_RACEINFO_CLOSEPOPWIN";

		public static const CMS_SCENE_RACEINFO_DELETEDATA:String = "CMS_SCENE_RACEINFO_DELETEDATA";

		private var _param:Object;

		public function RaceInfoEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
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