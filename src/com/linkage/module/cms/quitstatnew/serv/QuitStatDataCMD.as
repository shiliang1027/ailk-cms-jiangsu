package com.linkage.module.cms.quitstatnew.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.dao.IQuitStatDAO;
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.formatters.DateFormatter;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-10-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class QuitStatDataCMD
	{
		private var log:ILogger = Log.getLoggerByClass(QuitStatDataCMD);

		[Inject("quitStatDAO")]
		public var dao:IQuitStatDAO;

		public function QuitStatDataCMD()
		{
			df.formatString="YYYY-MM-DD JJ:NN:SS";
		}

		[Inject("quitStatDM")]
		public var dm:QuitStatDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		private var now:Number = 0;
		
		private var df:DateFormatter = new DateFormatter();

		public function execute(e:QuitStatEvent):AsyncToken
		{
			log.debug("[获取Kpi属地数据列表]");
			now = new Date().getMilliseconds();
			return dao.getKpiCityDataList(null);

		}

		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[获取Kpi属地数据列表]调用接口获取数据结果 success! 耗时：{0}ms", (new Date().getMilliseconds() - now));
			log.debug(obj);
			dm.kpisData = obj;
			dm.startTime = obj.startTime;
			dm.endTime = obj.endTime;
//			var now1:Date = new Date();
//			var min:Number = now1.getMinutes()-now1.getMinutes()%5;
//			now1.setMinutes(min);
//			now1.setSeconds(0);
//			dm.endTime = df.format(now1);
			dispatchMsg(new QuitStatEvent(QuitStatEvent.QUITSTAT_LOADDATA_COMPLETE));
		}

		public function error(f:Fault):void
		{
			log.error("[获取Kpi属地数据列表]失败：" + f.faultString);
		}
	}
}