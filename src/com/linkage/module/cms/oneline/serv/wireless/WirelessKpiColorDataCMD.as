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
	public class WirelessKpiColorDataCMD
	{
		
		private var log:ILogger=Log.getLoggerByClass(WirelessKpiColorDataCMD);
		
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
			log.debug("[查询劣化指标颜色数据]");
			e.param.areaId=user.areaId;
			log.debug(e.param);
			return dao.getBadMatrix(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询劣化指标颜色数据结果]");
			log.debug(obj);
			dm.matrixDatas = ArrayCollection(obj);
			dispatchMsg(new WirelessEvent(WirelessEvent.LOADKPICOLORDATACOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询劣化指标颜色数据]失败：" + f.faultString + "::" +f.faultDetail);
//			dm.matrixDatas = new ArrayCollection([{id:"1",name:"南京",color:"FF0000",level:"1"},{id:"2",name:"南京",color:"FF0000",level:"1"},{id:"3",name:"南京",color:"FF0000",level:"1"},{id:"4",name:"南京",color:"FF0000",level:"2"},{id:"5",name:"南京",color:"FF0000",level:"3"},{id:"6",name:"南京",color:"FF0000",level:"4"}]);
			dispatchMsg(new WirelessEvent(WirelessEvent.LOADKPICOLORDATAERROR));
		}
	}
}