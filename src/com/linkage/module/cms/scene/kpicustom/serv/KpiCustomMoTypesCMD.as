package com.linkage.module.cms.scene.kpicustom.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.kpicustom.dao.IKpiCustomDAO;
	import com.linkage.module.cms.scene.kpicustom.domain.KpiCustomDM;
	import com.linkage.module.cms.scene.kpicustom.event.KpiCustomEvent;

	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 * 查询网元类型列表服务类
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiCustomMoTypesCMD
	{
		private var log:ILogger=Log.getLoggerByClass(KpiCustomMoTypesCMD);

		[Inject("kpiCustomDAO")]
		public var dao:IKpiCustomDAO;

		[Inject("kpiCustomDM")]
		public var dm:KpiCustomDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:KpiCustomEvent):AsyncToken
		{
			log.debug("[查询网元类型列表]");
			log.debug(e.param);
			return dao.getSceneMoTypes(e.param);

		}

		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			dm.moTypes = ArrayCollection(obj);
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADMOTYPESCOMPLETE));
		}

		public function error(f:Fault):void
		{
			log.error("[查询网元类型列表]失败：" + f.faultString);
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADMOTYPESERROR));
		}
	}
}

