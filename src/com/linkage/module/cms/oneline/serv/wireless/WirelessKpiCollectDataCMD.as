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
	public class WirelessKpiCollectDataCMD
	{
		
		private var log:ILogger=Log.getLoggerByClass(WirelessKpiCollectDataCMD);
		
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
			log.debug("[查询指标汇总趋势数据]");
			if(!e.param){
				e.param = new Object();
			}
			e.param.areaId=user.areaId;
			log.debug(e.param);
			return dao.getHourPerfData(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询指标汇总趋势数据结果]");
			log.debug(obj);
			dm.kpiCollectData = ArrayCollection(obj);
			dispatchMsg(new WirelessEvent(WirelessEvent.LOADKPICOLLECTDATACOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询指标汇总趋势数据]失败：" + f.faultString + "::" +f.faultDetail);
//			dm.kpiCollectData = new ArrayCollection([{time:"11-15 00:00",value:"20.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 01:00",value:"25.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 02:00",value:"23.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 03:00",value:"23.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 04:00",value:"23.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 05:00",value:"28.2",up_threshold:"53",down_threshold:"23"},{time:"11-15 06:00",value:"23.2",up_threshold:"53",down_threshold:"23"}]);
			dispatchMsg(new WirelessEvent(WirelessEvent.LOADKPICOLLECTDATAERROR));
		}
	}
}