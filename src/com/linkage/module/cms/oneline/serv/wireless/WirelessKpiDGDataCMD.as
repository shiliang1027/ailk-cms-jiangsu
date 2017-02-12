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
	public class WirelessKpiDGDataCMD
	{
		
		private var log:ILogger=Log.getLoggerByClass(WirelessKpiDGDataCMD);
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
			log.debug("[查询指标表格数据 ]");
			e.param.areaId=user.areaId;
			log.debug(e.param);
			return dao.getPerfData(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询指标表格数据结果]");
//			log.debug(obj.title);
//			log.debug(obj.column);
			log.debug(obj.dataList);
			dm.kpiGDData = obj;
			dispatchMsg(new WirelessEvent(WirelessEvent.LOADKPIDGDATACOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询指标表格数据 ]失败：" + f.faultString + "::" +f.faultDetail);
//			dm.kpiGDData = {title:["名称","采集时间","TCH掉话率(%)","TCH拥塞率(%)"],column:["name","time","tch","tch1"],dataList:[{name:"名称1",time:"11-23 12:00",tch:"20",tch1:"23"},{name:"名称2",time:"11-23 12:00",tch:"30",tch1:"23"}]};
			dispatchMsg(new WirelessEvent(WirelessEvent.LOADKPIDGDATAERROR));
		}
	}
}