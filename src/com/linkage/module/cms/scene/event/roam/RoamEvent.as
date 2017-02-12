package com.linkage.module.cms.scene.event.roam
{
	import flash.events.Event;

	public class RoamEvent extends Event
	{
		public var param:Object=null;
		//初始化地图页面
		public static const INIT:String="initSceneRoam";
		//加载色板数据
		public static const LOAD_LEGEND_DATA:String="loadSceneLegendData";

		//加载色板数据完成
		public static const LOAD_LEGEND_DATA_COMPLETE:String="loadSceneLegendDataComplete";

		//家在地图数据
		public static const LOAD_ROAM_DATA:String="loadSceneRoamData";

		//给地图画柱状图
		public static const CREAT_MAP_RECL:String="creatSceneRoamMapRecl";

		//根据地区加载趋势图数据
		public static const LOAD_RAOM_CHART_DATA:String="loadSceneRoamChartData";

		//画趋势图
		public static const DROW_RAAM_CHART:String="drowSceneRoamChart";

		//保存图例信息
		public static const SAVE_ROAM_LEGEND_DATA:String="saveScenceRoamLegendData";

		//保存图例信息结果
		public static const SAVE_ROAM_LEGEND_DATA_COMPLETE:String="saveScenceRoamLegendDataComplete";

		public function RoamEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}