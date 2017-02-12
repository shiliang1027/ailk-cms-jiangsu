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
	 * 查询网元列表服务类
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiCustomMosCMD
	{
		private var log:ILogger=Log.getLoggerByClass(KpiCustomMosCMD);
		
		[Inject("kpiCustomDAO")]
		public var dao:IKpiCustomDAO;
		
		[Inject("kpiCustomDM")]
		public var dm:KpiCustomDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		public function KpiCustomMosCMD()
		{
		}
		
		public function execute(e:KpiCustomEvent):AsyncToken
		{
			log.debug("[查询网元列表]");
			log.debug(e.param);
			return dao.getSceneMos(e.param);
			
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug(obj);
			dm.moOrAreas.removeAll();
			dm.moOrAreas = ArrayCollection(obj);
			dm.moOrAreas.refresh();
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADMOSCOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询网元列表]失败：" + f.faultString);
//			dm.moOrAreas = new ArrayCollection([{id:"1",name:"网元1"},{id:"2",name:"网元2"}]);
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADMOSERROR));
		}
	}
}