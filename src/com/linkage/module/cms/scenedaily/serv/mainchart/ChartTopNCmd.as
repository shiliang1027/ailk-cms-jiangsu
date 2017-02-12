package com.linkage.module.cms.scenedaily.serv.mainchart
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.mainchart.ChartDao;
	import com.linkage.module.cms.scenedaily.domain.mainchart.ChartDM;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.event.mainchart.ChartCompEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	public class ChartTopNCmd
	{
		private var log:ILogger = Log.getLoggerByClass(ChartTopNCmd);

		[Inject("chartDao")]
		public var dao:ChartDao;

		[Inject("user")]
		public var user:IUser;

		[Inject("chartDM")]
		public var dm:ChartDM;

		private var loadType:String;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:ChartCompEvent):AsyncToken
		{
			log.info("劣化排名 cmd 加载数据！" + e.param.loadType);

			loadType = e.param.loadType;
			
			log.debug(e.param);

			return dao.loadTopNData(e.param);
		}

		public function result(data:Object):void
		{
			log.info("劣化排名 cmd 加载数据成功！" + (data ? data.length : 'null') + " _ " + loadType);
			log.debug(data);

			if (loadType == "popup")
			{
				dm.popupTopNList.removeAll();
				dm.popupTopNList.addAll(data as IList);
				dispatchMsg(new ChartCompEvent(ChartCompEvent.SHOW_DRGRADATIONRANKING_DATA_POPUP));
			}
			else
			{
				dm.topNList.removeAll();
				dm.topNList.addAll(data as IList);
				dispatchMsg(new ChartCompEvent(ChartCompEvent.SHOW_DRGRADATIONRANKING_DATA));
			}
		}

		public function error(f:Fault):void
		{
			log.error("劣化排名 cmd 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

