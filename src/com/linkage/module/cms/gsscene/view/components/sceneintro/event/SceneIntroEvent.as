package com.linkage.module.cms.gsscene.view.components.sceneintro.event
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import flash.events.Event;

	public class SceneIntroEvent extends Event
	{
		public static const LOAD_SCENEINFO_DATA:String = "LOAD_SCENEINFO_DATA";
		public static const LOAD_SCENEINTROINFO_DATA:String = "LOAD_SCENEINTROINFO_DATA";
		public static const LOAD_JUMP_DATA:String = "LOAD_JUMP_DATA";
		//
		public static const SHOW_SCENE_GAME_TODAY_DETAIL:String = "SHOW_SCENE_GAME_TODAY_DETAIL";

		public static const SHOW_SCENE_GAME_ACTIVE:String = "SHOW_SCENE_GAME_ACTIVE";
		public static const CMS_SCENE_SCENEINTRO_SCENEINTROSTRING:String = "CMS_SCENE_SCENEINTRO_SCENEINTROSTRING";
		//获取网元级指标信息
		public static const SHOW_UNIT_KPI_INFO:String = "SHOW_UNIT_KPI_INFO";
		//展示网元信息
		public static const SHOW_MO_KPI_INFO:String = "SHOW_MO_KPI_INFO";

		//保存修改过的场景名称和详情
		public static const SAVE_SCENEINFO:String = "SAVE_SCENEINFO";
		public static const SAVE_SCENEINTROINFO:String = "SAVE_SCENEINTROINFO";
		public static const SHOW_SCENE_GAME_ACTIVE_SUC:String = "SHOW_SCENE_GAME_ACTIVE_SUC";
		public static const SCENEINFO_IMPROTANTSCENE:String = "SCENEINFO_IMPROTANTSCENE";
		public static const SCENEINFO_GROUP:String = "SCENEINFO_GROUP";

		public static const CMS_SCENE_SCENEINTRO_MOGETBADTREND:String = "CMS_SCENE_SCENEINTRO_AREAGETBADTREND"; //获取网元劣化趋势
		public static const CMS_SCENE_SCENEINTRO_AREAGETBADTREND:String = "CMS_SCENE_SCENEINTRO_AREAGETBADTREND"; //获取区域劣化趋势
		public static const CMS_SCENE_SCENEINTRO_SHOWAREAORMOBADTRENDGRID:String = "CMS_SCENE_SCENEINTRO_SHOWAREAORMOBADTRENDGRID"; //显示区域、网元劣化趋势
		
		public static const LOAD_SCENE_PERSONS_DATA:String = "LOAD_SCENE_PERSONS_DATA";//加载 场景用户数统计
		public static const LOAD_SCENE_PERSONS_DATA_SUCC:String = "LOAD_SCENE_PERSONS_DATA_SUCC";//加载 场景用户数统计成功
		
		public static const LOAD_SCENE_TRAFFIC_DATA:String = "LOAD_SCENE_TRAFFIC_DATA";//加载 场景话务量统计
		public static const LOAD_SCENE_TRAFFIC_DATA_SUCC:String = "LOAD_SCENE_TRAFFIC_DATA_SUCC";//加载 场景话务量统计成功
		
		public static const LOAD_SCENE_QUIT_DATA:String = "LOAD_SCENE_QUIT_DATA";//加载 场景退服总统计（"GSM基站","TD基站","LTE基站"）
		public static const LOAD_SCENE_QUIT_DATA_SUCC:String = "LOAD_SCENE_QUIT_DATA_SUCC";//加载 场景退服总统计（"GSM基站","TD基站","LTE基站"）成功！
		public static const LOAD_SCENE_QUIT_DETAIL_DATA:String = "LOAD_SCENE_QUIT_DETAIL_DATA";//加载 场景退服(一类基站)的详细基站列表
		public static const LOAD_REFRESH_ALARM_FLOW:String = "LOAD_REFRESH_ALARM_FLOW";//刷新告警流水事件
		
		
		public static const LOAD_SCENE_ALARMSTATS_DATA:String = "LOAD_SCENE_ALARMSTATS_DATA";//加载 场景一级告警网元的统计（按性能和设备统计）
		
		public var params:Object = {};
		public var obj:Object = {};
		public var sceneIntroString:String = "";

		public function SceneIntroEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}