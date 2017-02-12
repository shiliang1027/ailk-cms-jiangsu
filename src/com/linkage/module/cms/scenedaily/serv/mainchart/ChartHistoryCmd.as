package com.linkage.module.cms.scenedaily.serv.mainchart
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.mainchart.ChartDao;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.domain.mainchart.ChartDM;
	import com.linkage.module.cms.scenedaily.event.mainchart.ChartCompEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class ChartHistoryCmd
	{
		private var log:ILogger = Log.getLoggerByClass(ChartHistoryCmd);

		[Inject("chartDao")]
		public var dao:ChartDao;

		[Inject("user")]
		public var user:IUser;

		[Inject("chartDM")]
		public var dm:ChartDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		private var loadType:String;

		public function execute(e:ChartCompEvent):AsyncToken
		{
			log.info("历史趋势 加载数据！" + e.param.loadType);

			loadType = e.param.loadType;
			log.debug(e.param);

			return dao.loadTrendData(e.param);
		}

		public function result(data:Object):void
		{

			log.info("历史趋势 cmd 加载数据成功！");
			log.debug(data);


			//历史趋势图 弹出窗口
			if (loadType == "popup")
			{
				log.info("popup");
				dm.kpiHistoryList.removeAll();
				dm.kpiHistoryList.addAll(data as IList);
				dispatchMsg(new ChartCompEvent(ChartCompEvent.SHOW_INDEXTREND_DATA_POPUP));
			}
			else
			{
				log.info("no popup");
				dm.kpiTrendList.removeAll();
				dm.kpiTrendList.addAll(data as IList);
				dispatchMsg(new ChartCompEvent(ChartCompEvent.SHOW_INDEXTREND_DATA));
			}
		}

		public function error(f:Fault):void
		{
			log.error("历史趋势 cmd 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

