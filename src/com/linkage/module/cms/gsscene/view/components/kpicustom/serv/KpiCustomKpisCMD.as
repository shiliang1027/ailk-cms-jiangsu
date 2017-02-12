package com.linkage.module.cms.gsscene.view.components.kpicustom.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.kpicustom.dao.IKpiCustomDAO;
	import com.linkage.module.cms.gsscene.view.components.kpicustom.domain.KpiCustomDM;
	import com.linkage.module.cms.gsscene.view.components.kpicustom.event.KpiCustomEvent;

	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 * 查询指标列表服务类
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiCustomKpisCMD
	{
		private var log:ILogger=Log.getLoggerByClass(KpiCustomKpisCMD);

		[Inject("kpiCustomDAO")]
		public var dao:IKpiCustomDAO;

		[Inject("kpiCustomDM")]
		public var dm:KpiCustomDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:KpiCustomEvent):AsyncToken
		{
			log.debug("[查询指标列表]");
			log.debug(e.param);
			return dao.getSceneKpis(e.param);
		}

		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			dm.kpis.removeAll();
			dm.kpis = ArrayCollection(obj);
			dm.kpis.refresh();
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADKPISCOMPLETE));
		}

		public function error(f:Fault):void
		{
			log.error("[查询指标列表]失败：" + f.faultString + "::" +f.faultDetail);
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADKPISERROR));
		}
	}
}

