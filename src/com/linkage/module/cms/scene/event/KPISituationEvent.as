package com.linkage.module.cms.scene.event
{
	import com.linkage.module.cms.scene.domain.common.IUser;

	import flash.events.Event;

	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KPISituationEvent extends Event
	{
		//展示指标概况
		public static const SHOW_KPI_DATA:String = "SHOW_KPI_DATA";
		//展示TOPN下拉列表框
		public static const SHOW_TOPN_LIST:String = "SHOW_TOPN_LIST";
		//加载TOPN数据图表
		public static const LOAD_TOPN_DATA:String = "LOAD_TOPN_DATA";
		//展示TOPN数据图表
		public static const SHOW_TOPN_DATA:String = "SHOW_TOPN_DATA";
		//加载指标概况线性图表
		public static const LOAD_LINE_DATA:String = "LOAD_LINE_DATA";
		public static const LOAD_LINE_DATA1:String = "LOAD_LINE_DATA1";
		public static const LOAD_LINE_DATA2:String = "LOAD_LINE_DATA2";
		public static const LOAD_LINE_DATA3:String = "LOAD_LINE_DATA3";
		//展示指标概况线性图表
		public static const SHOW_LINE_DATA:String = "SHOW_LINE_DATA";
		//加载历史趋势图表
		public static const LOAD_HISTORY_LINE_DATA:String = "LOAD_HISTORY_LINE_DATA";
		//展示历史趋势图表
		public static const SHOW_HISTORY_LINE_DATA:String = "SHOW_HISTORY_LINE_DATA";
		//派发应急预案
		public static const LOAD_KPI_PLAN:String = "LOAD_KPI_PLAN";
		//展示应急预案
		public static const SHOW_KPI_PLAN:String = "SHOW_KPI_PLAN";

		//展示指标概况区域维度图表
		public static const SHOW_KPI_AREA_DATA:String = "SHOW_KPI_AREA_DATA";
		public static const SHOW_KPI_AREA_DATA1:String = "SHOW_KPI_AREA_DATA1";
		public static const LOAD_KPI_AREA_DATA:String = "LOAD_KPI_AREA_DATA";


//		//根据数据处理 应急预案按钮是否展示
//		public static const PREDEAL_KPI_PLAN:String = "PREDEAL_KPI_PLAN";

		public static const LOAD_BADTOPN_MATRIXDATA:String = "LOAD_BADTOPN_MATRIXDATA"; //获取劣化topn矩阵数据

		public static const DEAL_BADTOPN_SHOWGRID:String = "DEAL_BADTOPN_SHOWGRID"; //展示劣化topn矩阵数据
		//展示指标概况数据
		public static const CMS_SCENE_KPISITUATION_SHOW_DATA:String = "CMS_SCENE_KPISITUATION_SHOW_DATA";


		public static const LOAD_HISTORY_TOPN_LINE_DATA:String = "LOAD_HISTORY_TOPN_LINE_DATA";
		//展示历史趋势图tppn表
		public static const SHOW_HISTORY_TOPN_LINE_DATA:String = "SHOW_HISTORY_TOPN_LINE_DATA";
		public static const LOAD_COMPARE_LINE_DATA:String = "LOAD_COMPARE_LINE_DATA";
		public static const SHOW_COMPARE_LINE_DATA:String = "SHOW_COMPARE_LINE_DATA";

		//topnum 更新
		public static const CMS_SCENE_KPISITUATION_TOPNUMUPDATE:String = "CMS_SCENE_KPISITUATION_TOPNUMUPDATE";
		//topnum 获取
		public static const CMS_SCENE_KPISITUATION_TOPNUMGET:String = "CMS_SCENE_KPISITUATION_TOPNUMGET";
		//重点指标未选择指标列表
		public static const CMS_SCENE_KPISITUATION_NO_SELECT:String = "CMS_SCENE_KPISITUATION_NO_SELECT";
		//重点指标已选择指标列表
		public static const CMS_SCENE_KPISITUATION_IS_SELECT:String = "CMS_SCENE_KPISITUATION_IS_SELECT";
		//保存指标返回结果
		public static const CMS_SCENE_KPISITUATION_SAVE_KPICONFIG:String = "CMS_SCENE_KPISITUATION_SAVE_KPICONFIG";
		public static const CMS_SCENE_KPISITUATION_SAVE_RESULT:String = "CMS_SCENE_KPISITUATION_SAVE_RESULT";
		public static const CMS_SCENE_KPISITUATION_CONFIG_SAVE:String = "CMS_SCENE_KPISITUATION_CONFIG_SAVE";
		public static const CMS_SCENE_KPISITUATION_CONFIG_SAVE_RESULT:String = "CMS_SCENE_KPISITUATION_CONFIG_SAVE_RESULT";
		public static const CMS_SCENE_KPISITUATION_QUERY_THRESHOLD:String = "CMS_SCENE_KPISITUATION_QUERY_THRESHOLD";
		public static const CMS_SCENE_KPISITUATION_SHOW_THRESHOLD_INIT:String = "CMS_SCENE_KPISITUATION_SHOW_THRESHOLD_INIT";
		public static const CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_LIST:String = "CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_LIST";
		public static const CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_LIST1:String = "CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_LIST1";
		public static const CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_SAVE:String = "CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_SAVE";
		public static const CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_SAVE_RESULT:String = "CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_SAVE_RESULT";
		public static const CMS_SCENE_KPISITUATION_SHOW_AREA_SELECT_LIST:String = "CMS_SCENE_KPISITUATION_SHOW_AREA_SELECT_LIST";

		public var selectTopnId:String;
		public var kpiId:String;
		public var moTypeId:String;
		public var strKpiId:String;
		public var strMoTypeId:String;
		public var timeInterval:String;
		public var cityId:String;
		public var interval:String;
		public var startTime:String;
		public var endTime:String;
		public var param:Object = {};

		public var kpiDetailChartData:ArrayCollection = new ArrayCollection;

		public var areaKpiData:ArrayCollection = new ArrayCollection;

		public var kpiPlanData:ArrayCollection = new ArrayCollection;

		public function KPISituationEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}

