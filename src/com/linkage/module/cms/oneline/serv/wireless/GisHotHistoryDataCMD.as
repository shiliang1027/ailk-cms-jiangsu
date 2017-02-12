package com.linkage.module.cms.oneline.serv.wireless
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.oneline.dao.wireless.IGisHotDAO;
	import com.linkage.module.cms.oneline.domain.wireless.GisHotDM;
	import com.linkage.module.cms.oneline.domain.wireless.IUser;
	import com.linkage.module.cms.oneline.event.wireless.GisHotEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	/**
	 * GIS热图右侧历史热点列表数据服务
	 *
	 * @author wangwei (70263)
	 * @version 1.0
	 * @date 2013-8-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GisHotHistoryDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotHistoryDataCMD);
		
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
			log.debug("[查询GIS热图右侧历史热点列表数据]");
			if(!e.param){
				e.param = new Object();
			}
			e.param.areaId=user.areaId;
			log.debug(e.param);
			log.info("getHotHistoryCell");
			return dao.getHistoryHotSpot(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询GIS热图右侧历史热点列表数据结果--->]");
			if(obj){
				log.debug("结果集条数："+ArrayCollection(obj.datas).length);
//				var count:int = 0;
//				for (var name in obj) {
//					var objs:Object = obj[name];
//					++count;
//					log.info("第"+count+"条数据: key--->'"+name + "',value-->" + objs);
//					for (var i in objs) {
//						var objAttr = objs[i];
//						log.debug(i + ":" + objAttr);
//					}
//				}
				dm.hotspots3 = ArrayCollection(obj.datas);
				dm.hotspots3.refresh();
				log.debug("----->结果正常！");
			}else{
				log.debug("----->结果异常！");
			}
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询GIS热图右侧历史热点列表数据]失败：" + f.faultString + "::" +f.faultDetail);
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADHOTSPOTCELLDATAERROR));
		}
	}
}