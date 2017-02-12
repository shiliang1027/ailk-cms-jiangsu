package com.linkage.module.cms.groupmonitor.custscene.alarmSearch.event
{
	import flash.events.Event;

	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2013-2-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class AlarmSignEvent extends Event
	{
		public var param:Object;
		public static const CMS_ALARMSEARCH_QUERY_ALARM_LIST:String = "CMS_ALARMSEARCH_QUERY_ALARM_LIST";
		public static const CMS_ALARMSEARCH_SHOW_DATA:String = "CMS_ALARMSEARCH_SHOW_DATA";
		public static const CMS_ALARMSEARCH_ALARM_DELETE_MENU:String = "CMS_ALARMSEARCH_ALARM_DELETE_MENU";
		public static const CMS_ALARMSEARCH_ALARM_SIGN:String = "CMS_ALARMSEARCH_ALARM_SIGN";
		public static const CMS_ALARMSEARCH_ALARM_DELETE:String = "CMS_ALARMSEARCH_ALARM_DELETE";
		public static const CMS_ALARMSEARCH_ALARM_DELETE_REAUTL:String = "CMS_ALARMSEARCH_ALARM_DELETE_REAUTL";
		public static const CMS_ALARMSEARCH_ALARM_SIGN_RESULT:String = "CMS_ALARMSEARCH_ALARM_SIGN_RESULT";

		public function AlarmSignEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}