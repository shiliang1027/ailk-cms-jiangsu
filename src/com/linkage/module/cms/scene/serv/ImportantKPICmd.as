package com.linkage.module.cms.scene.serv
{

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.dao.ScenePanelDao;
	import com.linkage.module.cms.scene.domain.ImportantKPIDM;
	import com.linkage.module.cms.scene.event.ImportantKPIEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;
	
	import org.osmf.layout.AbsoluteLayoutFacet;

	public class ImportantKPICmd
	{
		private var log:ILogger = Log.getLoggerByClass(ImportantKPICmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("importantKPIDM")]
		public var importantKPIDM:ImportantKPIDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		public function execute(e:ImportantKPIEvent):AsyncToken
		{
			log.debug("重点指标:cmd命令捕获execute执行...");
			return scenePanelDao.getSceneCoreKpi(e.startTime, e.endTime);
		}

		public function result(data:Object):void
		{
			log.debug("重点指标:cmd命令result成功返回结果...");
			importantKPIDM.resultData.removeAll();
			importantKPIDM.resultData.addAll(data as ArrayCollection);

			importantKPIDM.kpiList.removeAll();
			importantKPIDM.kpiNameDataMap = new Object();

			for each (var obj:Object in importantKPIDM.resultData)
			{
				importantKPIDM.kpiList.addItem({'kpiName': obj.kpiName});
				importantKPIDM.kpiNameDataMap[obj.kpiName] = obj.datas;
			}

			log.debug("重点指标:事件分发，类型->SHOW_KPI_DATA...");
//			msgDispatcher(new ImportantKPIEvent(ImportantKPIEvent.SHOW_KPI_DATA));
			requestServerUtil.addRequest(new ImportantKPIEvent(ImportantKPIEvent.SHOW_KPI_DATA));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("重点指标:cmd命令error失败..." + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

