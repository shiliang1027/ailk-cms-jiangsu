package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IKpiAndThresholdDao;
	import com.linkage.module.cms.scene.domain.KpiAndThresholdDM;
	import com.linkage.module.cms.scene.event.KpiAndThresholdEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class KpiAndThresholdCmd
	{
		private var log:ILogger=Log.getLoggerByClass(KpiAndThresholdCmd);

		[Inject("kpiAndThresholdDao")]
		public var dao:IKpiAndThresholdDao;

		[Inject("kpiAndThresholdDM")]
		[Bindable]
		public var kpiAndThresholdDM:KpiAndThresholdDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;
		public function execute(e:KpiAndThresholdEvent):AsyncToken
		{
			log.info("Kpi And Threshold load data!");
			return dao.queryThresholdByCon(e.param);
		}

		public function result(data:Object):void
		{
			log.info("Kpi And Threshold cmd load data success!");
			log.info(data);
			kpiAndThresholdDM.KpiAndThresholdList.removeAll();
			kpiAndThresholdDM.KpiAndThresholdList.addAll(data as IList);
			kpiAndThresholdDM.KpiAndThresholdList.refresh();
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("Kpi And Threshold cmd load data 错误：" + f.faultString + "\n" + f.faultDetail);
			kpiAndThresholdDM.KpiAndThresholdList.removeAll();
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}