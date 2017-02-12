package com.linkage.module.cms.scenedaily.view.components.kqikpipi
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.kqikpipi.KQIKPIPIDM;
	import com.linkage.module.cms.scenedaily.event.kqikpipi.KQIKPIPIEvent;

	public class KQIKPIPIPM
	{
		private var log:ILogger = Log.getLoggerByClass(KQIKPIPIPM);

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("kQIKPIPIDM")]
		public var dm:KQIKPIPIDM;

		public function loadData(kpiId:String):void
		{
			log.info("KQIKPIPIPM 派发加载数据事件:LOAD_KQIKPIPI_DATA");
			var e:KQIKPIPIEvent = new KQIKPIPIEvent(KQIKPIPIEvent.LOAD_KQIKPIPI_DATA);
			e.kpiId = kpiId;
			this.msgDispatcher(e);
		}

		public function loadKpiMoList(kpiId:String, moTypeId:String):void
		{
			log.info("KQIKPIPIPM 派发加载moList数据事件:LOAD_MO_LIST");
			var e:KQIKPIPIEvent = new KQIKPIPIEvent(KQIKPIPIEvent.LOAD_MO_LIST);
			e.kpiId = kpiId;
			e.moTypeId = moTypeId;
			this.msgDispatcher(e);
		}
	}
}

