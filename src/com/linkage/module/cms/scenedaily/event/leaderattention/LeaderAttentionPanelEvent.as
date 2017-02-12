package com.linkage.module.cms.scenedaily.event.leaderattention
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-8-17
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LeaderAttentionPanelEvent extends Event
	{
		public var param:Object = {};

		public static const SHOW_LEADERATTENTION:String = "SHOW_LEADERATTENTION";

		public static const SHOW_LEADER_DETAIL_INFO:String = "SHOW_LEADER_DETAIL_INFO";

		//领导关注详情功能
		public static const CMS_SCENEDAILY_LEADERATTENTIONPANEL_LEADERATTENTIONDETAILCLICKHANDLER:String = "CMS_SCENEDAILY_LEADERATTENTIONPANEL_LEADERATTENTIONDETAILCLICKHANDLER";

		//分页功能回调
		public static const CMS_SCENEDAILY_LEADERATTENTIONPANEL_LEADERATTENTIONDETAILCMD:String = "CMS_SCENEDAILY_LEADERATTENTIONPANEL_LEADERATTENTIONDETAILCMD";

		public function LeaderAttentionPanelEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}

