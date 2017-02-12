package com.linkage.module.cms.groupmonitor.custscene.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;

	import spark.events.IndexChangeEvent;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-15
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RunMonitorPerfCompPM
	{
		private var log:ILogger=Log.getLoggerByClass(RunMonitorPerfCompPM);

		[Inject]
		[Bindable]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function realServTypeBar_changeHandler(event:IndexChangeEvent):void
		{
			var param:Object=new Object;
			param.servTypeId=String(dm.realServTypeBar[event.newIndex].serv_type_id);
			log.info("tar change serv_type_id" + param.servTypeId);
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_KPI_GROUP_BY_CUST_ID);
			evt.param=param;
			msgDispatcher(evt);
		}
	}
}