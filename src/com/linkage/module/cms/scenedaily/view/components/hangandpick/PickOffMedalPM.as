package com.linkage.module.cms.scenedaily.view.components.hangandpick
{
	import com.linkage.module.cms.scenedaily.domain.hangandpick.MedalDetailDM;
	import com.linkage.module.cms.scenedaily.event.hangandpick.GedalDetailEvent;


	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class PickOffMedalPM
	{
		[Inject("medalDetailDM")]
		[Bindable]
		public var medalDetailDM:MedalDetailDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		/**
		 * 根据开始时间，结束时间查询摘牌信息
		 */
		public function getPickOffInfo(startTime:String, endTime:String):void
		{
			var e:GedalDetailEvent = new GedalDetailEvent(GedalDetailEvent.GET_PICK_OFF_MEDAL_INFO);
			e.startTime = startTime;
			e.endTime = endTime;
			msgDispatcher(e);
		}

	}
}