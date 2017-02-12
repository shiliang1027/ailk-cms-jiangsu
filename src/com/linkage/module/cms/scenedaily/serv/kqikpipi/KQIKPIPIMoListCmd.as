package com.linkage.module.cms.scenedaily.serv.kqikpipi
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.kqikpipi.IKQIKPIPIDao;
	import com.linkage.module.cms.scenedaily.domain.kqikpipi.KQIKPIPIDM;
	import com.linkage.module.cms.scenedaily.event.kqikpipi.KQIKPIPIEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class KQIKPIPIMoListCmd
	{
		private var log:ILogger = Log.getLoggerByClass(KQIKPIPIMoListCmd);

		[Inject("kQIKPIPIDao")]
		public var dao:IKQIKPIPIDao;

		[Inject("kQIKPIPIDM")]
		[Bindable]
		public var dm:KQIKPIPIDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;


		public function execute(e:KQIKPIPIEvent):AsyncToken
		{
			log.info("KQIKPIPICmd execute:" + e.kpiId + "--" + e.moTypeId);
			return dao.getKpiMoList(e.kpiId, e.moTypeId);
		}

		public function result(data:Object):void
		{
			log.debug("KQIKPIPICmd 加载指标劣化网元列表成功：" + data.length);

			dm.moList.removeAll();
			if(data != null)
				dm.moList.addAll(data as IList);
			dm.moList.refresh();

			var e:KQIKPIPIEvent = new KQIKPIPIEvent(KQIKPIPIEvent.SHOW_MO_LIST);
			e.showWin = dm.moList.length > 0;
			msgDispatcher(e);
		}

		public function error(f:Fault):void
		{
			log.error("KQIKPIPICmd 加载指标劣化网元列表失败：" + f.faultString + "," + f.faultDetail);
		}
	}
}

