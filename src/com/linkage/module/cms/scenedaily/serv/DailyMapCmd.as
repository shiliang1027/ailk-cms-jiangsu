package com.linkage.module.cms.scenedaily.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.IDailyMapDAO;
	import com.linkage.module.cms.scenedaily.domain.DailyMapDM;
	import com.linkage.module.cms.scenedaily.event.DailyMapEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DailyMapCmd
	{
		private var log:ILogger = Log.getLoggerByClass(DailyMapCmd);


		[Inject("dailyMapDM")]
		public var dm:DailyMapDM;

		[Inject("dailyMapDAO")]
		public var dao:IDailyMapDAO;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:DailyMapEvent):AsyncToken
		{
			log.info("[地图渲染]调用接口getGisKpi获取数据结果!");
			return dao.getGisKpi(e.param);
		}

		public function result(obj:Object):void
		{
			log.info("调用[地图渲染]接口获取数据结果 success!");
			dm.gisKpis.removeAll();
			dm.gisKpis.addAll(obj as IList);
			dm.gisKpis.refresh();
			//查询数据结束，抛出事件，进行地图渲染
			var e:DailyMapEvent = new DailyMapEvent(DailyMapEvent.GISKPI_DYEHANDLER);
			msgDispatcher(e);
		}

		public function error(f:Fault):void
		{
			log.error("加载[日常地图]数据错误：" + f.faultString + "," + f.faultDetail);
		}
	}
}

