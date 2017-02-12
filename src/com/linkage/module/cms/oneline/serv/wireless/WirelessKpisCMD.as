package com.linkage.module.cms.oneline.serv.wireless
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.oneline.dao.wireless.IWirelessDAO;
	import com.linkage.module.cms.oneline.domain.wireless.IUser;
	import com.linkage.module.cms.oneline.domain.wireless.WirelessDM;
	import com.linkage.module.cms.oneline.event.wireless.WirelessEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-23
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WirelessKpisCMD
	{
		
		private var log:ILogger=Log.getLoggerByClass(WirelessKpisCMD);
		[Inject("user")]
		public var user:IUser;
		[Inject("wirelessDAO")]
		public var dao:IWirelessDAO;
		
		[Inject("wirelessDM")]
		public var dm:WirelessDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function execute(e:WirelessEvent):AsyncToken
		{
			log.debug("[查询指标列表]");
			e.param.areaId=user.areaId;
			log.debug(e.param);
			return dao.getKpiSet(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询指标列表结果]");
			log.debug(obj.kpi);
			log.debug(obj.moKpi);
			dm.kpis = ArrayCollection(obj.kpi);
			dm.moKpis = ArrayCollection(obj.moKpi);
			dispatchMsg(new WirelessEvent(WirelessEvent.LOADKPISCOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询指标列表]失败：" + f.faultString + "::" +f.faultDetail);
//			dm.kpis = new ArrayCollection([{id:"1",name:"kpi1"},{id:"2",name:"kpi2"},{id:"3",name:"kpi3"},{id:"4",name:"kpi4"},{id:"5",name:"kpi5"},{id:"6",name:"kpi6"},{id:"7",name:"kpi7"},{id:"8",name:"kpi8"},{id:"9",name:"kpi9"},{id:"10",name:"kpi10"}]);
//			dm.moKpis = new ArrayCollection([{id:"1",name:"kpi1"},{id:"2",name:"kpi2"},{id:"3",name:"kpi3"}]);
			dispatchMsg(new WirelessEvent(WirelessEvent.LOADKPISERROR));
		}
	}
}