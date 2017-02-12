package com.linkage.module.cms.scenedaily.view.components.healthreport
{
	import com.linkage.module.cms.scenedaily.domain.healthreport.HealthReportSetDM;
	import com.linkage.module.cms.scenedaily.event.healthreport.HealthReportSetEvent;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HealthReportSetPM
	{
		[Inject("healthReportSetDM")]
		[Bindable]
		public var healthReportSetDM:HealthReportSetDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		/**
		 * 获取健康报告左侧树
		 */
		public function getHealthTree():void
		{
			var e:HealthReportSetEvent = new HealthReportSetEvent(HealthReportSetEvent.GET_HEALTH_REPORT_TREE);
			msgDispatcher(e);
		}

		/**
		 * 查询健康报告分类信息
		 */
		public function getHealthReportInfo(treeNodeId:String, kpiTypeId:String):void
		{
			var e:HealthReportSetEvent = new HealthReportSetEvent(HealthReportSetEvent.GET_HEALTH_REPORT_KPI_INFO);
			e.treeNodeId = treeNodeId;
			e.kpiTypeId = kpiTypeId;
			msgDispatcher(e);
		}

		/**
		 *保存健康分类指标信息
		 */
		public function saveHealthReport(healthObj:Object):void
		{
			var e:HealthReportSetEvent = new HealthReportSetEvent(HealthReportSetEvent.SAVE_HEALTH_REPORT_KPI_INFO);
			e.saveHealthObj = healthObj;
			msgDispatcher(e);
		}
	}
}