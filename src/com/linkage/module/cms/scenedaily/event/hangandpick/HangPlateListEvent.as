package com.linkage.module.cms.scenedaily.event.hangandpick
{
	import flash.events.Event;

	/**
	 * 挂牌列表事件
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-11-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangPlateListEvent extends Event
	{

		//挂牌列表数据查询
		public static const CMS_SCENEDAILY_HANGPLATELIST_INITHANGPLATELIST:String = "CMS_SCENEDAILY_HANGPLATELIST_INITHANGPLATELIST";

		public var param:Object;

		public function HangPlateListEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}