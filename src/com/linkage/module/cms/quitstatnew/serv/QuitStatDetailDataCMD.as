package com.linkage.module.cms.quitstatnew.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.dao.IQuitStatDAO;
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;

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
	public class QuitStatDetailDataCMD
	{
		private var log:ILogger = Log.getLoggerByClass(QuitStatDetailDataCMD);

		[Inject("quitStatDAO")]
		public var dao:IQuitStatDAO;


		[Inject("quitStatDM")]
		public var dm:QuitStatDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;



		public function execute(e:QuitStatEvent):AsyncToken
		{
			log.debug("[获取指标详情]参数:{0}", e.param);
			if (e.param)
			{
				dm.cityId = e.param.cityName;
			}
			else
			{
				log.error("地市名称不存在！！！");
				dm.cityId = "";

			}
			return dao.getQuitStatDetail(e.param);
		}

		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[获取指标详情]调用接口获取数据结果 success! " + obj.result.length);
			log.debug(obj.result);
			dm.detailList = obj.result;
			dm.type = obj.type;
			dispatchMsg(new QuitStatEvent(QuitStatEvent.LOADQUIT_DETAILDATA_COMPLETE));
		}

		public function error(f:Fault):void
		{
			log.error("[获取指标详情]失败：" + f.faultString);
		}
	}
}