package com.linkage.module.cms.oneline.serv.wireless
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.oneline.dao.wireless.IGisHotDAO;
	import com.linkage.module.cms.oneline.domain.wireless.GisHotDM;
	import com.linkage.module.cms.oneline.domain.wireless.IUser;
	import com.linkage.module.cms.oneline.event.wireless.GisHotEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * 获取小区辐射范围数据服务
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-12-10
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GisHotCellRadiusDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotCellRadiusDataCMD);
		
		[Inject("gisHotDAO")]
		public var dao:IGisHotDAO;
		
		[Inject("gisHotDM")]
		public var dm:GisHotDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function execute(e:GisHotEvent):AsyncToken
		{
			log.debug("[查询小区辐射范围数据]");
			if(!e.param){
				e.param = new Object();
			}
			log.debug(e.param);
			return dao.getRadius(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询小区辐射范围数据结果]");
			log.debug(obj);
			if(!isNaN(Number(obj.radius))){
				dm.cellRadius = Number(obj.radius);
			}
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADCELLRADIUSDATACOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询小区辐射范围数据]失败：" + f.faultString + "::" +f.faultDetail);
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADCELLRADIUSDATAERROR));
		}
	}
}