package com.linkage.module.cms.scenedaily.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.IDailySheetFlowDAO;
	import com.linkage.module.cms.scenedaily.domain.DailySheetFlowDM;
	import com.linkage.module.cms.scenedaily.event.SceneDailyEvent;

	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DailySheetFlowCmd
	{
		private var log:ILogger = Log.getLoggerByClass(DailySheetFlowCmd);


		[Inject("dailySheetFlowDM")]
		public var dm:DailySheetFlowDM;

		[Inject("dailySheetFlowDAO")]
		public var dao:IDailySheetFlowDAO;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneDailyEvent):AsyncToken
		{
			log.info("[查询工单流水数据]getSheetFlowData!");
			return dao.getSheetFlowData();
		}

		public function result(obj:Object):void
		{
			log.info("[查询工单流水数据]成功~!");

			dm.sheetFlowData = obj;
			var e:SceneDailyEvent = new SceneDailyEvent(SceneDailyEvent.DEAL_SHEET_FLOW);
			msgDispatcher(e);
		}

		public function error(f:Fault):void
		{
			log.error("查询工单流水数据错误：" + f.faultString + "," + f.faultDetail);
		}
	}
}

