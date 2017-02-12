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
	 * 查询区域列表服务类
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiCustomAreasCMD
	{
		private var log:ILogger=Log.getLoggerByClass(KpiCustomAreasCMD);

		[Inject("kpiCustomDAO")]
		public var dao:IKpiCustomDAO;

		[Inject("kpiCustomDM")]
		public var dm:KpiCustomDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function KpiCustomAreasCMD()
		{
		}

		public function execute(e:KpiCustomEvent):AsyncToken
		{
			log.debug("[查询区域列表]");
			log.debug(e.param);
			return dao.getSceneAreas(e.param);

		}

		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug(obj);
			dm.moOrAreas = ArrayCollection(obj);
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADAREASCOMPLETE));
		}

		public function error(f:Fault):void
		{
			log.error("[查询区域列表]失败：" + f.faultString);
//			dm.moOrAreas = new ArrayCollection([{id:"1",name:"区域1"},{id:"2",name:"区域2"}]);
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADAREASERROR));
		}
	}
}