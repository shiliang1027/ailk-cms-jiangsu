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
	 * GIS热图网元信息数据服务
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
	public class GisHotMoInfoDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotMoInfoDataCMD);
		
		[Inject("user")]
		public var user:IUser;
		
		[Inject("gisHotDAO")]
		public var dao:IGisHotDAO;
		
		[Inject("gisHotDM")]
		public var dm:GisHotDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function execute(e:GisHotEvent):AsyncToken
		{
			log.debug("[查询网元详情数据]");
			if(!e.param){
				e.param = new Object();
			}
			e.param.areaId=user.areaId;
			log.debug(e.param);
			return dao.getKpiInfo(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询网元详情数据结果]");
			log.debug(obj);
			dm.moInfos = ArrayCollection(obj);
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADMOINFODATACOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询网元详情数据]失败：" + f.faultString + "::" +f.faultDetail);
//			dm.kpiList = new ArrayCollection([{mo_name:"网元1",lac:"53",ci:"23",num:"121"},{mo_name:"网元1",lac:"53",ci:"23",num:"121"},{mo_name:"网元1",lac:"53",ci:"23",num:"121"},{mo_name:"网元1",lac:"53",ci:"23",num:"121"},{mo_name:"网元1",lac:"53",ci:"23",num:"121"},{mo_name:"网元1",lac:"53",ci:"23",num:"121"},{mo_name:"网元1",lac:"53",ci:"23",num:"121"}]);
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADMOINFODATAERROR));
		}
	}
}