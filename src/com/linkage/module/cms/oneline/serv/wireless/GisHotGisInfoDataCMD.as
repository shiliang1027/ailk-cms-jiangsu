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
	public class GisHotGisInfoDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotGisInfoDataCMD);
		
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
			log.debug("[查询GIS点信息数据]");
			if(!e.param){
				e.param = new Object();
			}
			e.param.areaId=user.areaId;
			log.debug(e.param);
			return dao.getGisInfo(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询GIS点信息数据结果]");
			log.debug(obj);
			dm.gisInfos.removeAll();
			dm.gisInfos.addAll(ArrayCollection(obj));
			log.info("dm.gisInfos--------------"+ dm.gisInfos.length);
			log.info(dm.gisInfos);
			dm.queryGisInfoFlag=true;//设置查询实时热点标志为true,2013-9-3,汪炜;
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADGISINFODATACOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询GIS点信息数据]失败：" + f.faultString + "::" +f.faultDetail);
			dm.gisInfos = new ArrayCollection([{mo_id:"1",mo_name:"网元1",longitude:"121.3232",latitude:"32.2323",level:"1"},{mo_id:"2",mo_name:"网元2",longitude:"121.4232",latitude:"32.2323",level:"2"},{mo_id:"3",mo_name:"网元3",longitude:"121.5232",latitude:"32.2323",level:"3"},{mo_id:"4",mo_name:"网元4",longitude:"121.6232",latitude:"32.2323",level:"4"},{mo_id:"5",mo_name:"网元5",longitude:"121.7232",latitude:"32.2323",level:"0"}]);
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADGISINFODATAERROR));
		}
	}
}