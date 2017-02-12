package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustSceneDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class LoadExportDataCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadExportDataCmd);
		
		[Inject]
		public var dm:CustSceneDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		[Inject]
		public var dao:CustSceneDao;
		
		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("LoadExportDataCmd === ");
			log.info(e.param);
			return dao.LoadExportData(e.param);
		}
		
		public function result(data:Object):void
		{
			log.info("LoadExportDataCmd result");
			log.info(data);
//				var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.CUST_PANEL_INIT_DATA);
//				dispatchMsg(evt);
			
		}
		
		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
			
		}
	}
}