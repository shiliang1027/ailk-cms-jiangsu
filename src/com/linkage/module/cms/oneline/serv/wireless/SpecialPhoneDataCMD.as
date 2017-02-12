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
	 * 刷新小区拨打号码top10数据详情服务
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
	public class SpecialPhoneDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(SpecialPhoneDataCMD);
		
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
			log.debug("[查询小区拨打号码top10数据]");
			if(!e.param){
				e.param = new Object();
			}
			e.param.areaId=user.areaId;
			log.debug(e.param);
			log.info("getSpecialPhoneInfo");
			return dao.getSpecialPhoneInfo(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[查询小区拨打号码top10数据结果--->]");
			if(obj){
				log.debug("结果集条数："+ArrayCollection(obj.datas).length);
				log.info(obj);
				var specialPhoneType:String = String(obj.specialPhoneType);
				/*if(specialPhoneType=="2G110"){
					dm.phone2G110data = ArrayCollection(obj.datas);
				}else if(specialPhoneType=="2G119"){
					dm.phone2G119data = ArrayCollection(obj.datas);
				}else if(specialPhoneType=="2G120"){
					dm.phone2G120data = ArrayCollection(obj.datas);
				}else if(specialPhoneType=="3G110"){
					dm.phone3G110data = ArrayCollection(obj.datas);
				}else if(specialPhoneType=="3G119"){
					dm.phone3G119data = ArrayCollection(obj.datas);
				}else if(specialPhoneType=="3G120"){
					dm.phone3G120data = ArrayCollection(obj.datas);
				}*/
				if(specialPhoneType.indexOf("2G")>-1){
					dm.phone2Gdata = ArrayCollection(obj.datas);
				}else if(specialPhoneType.indexOf("3G")>-1){
					dm.phone3Gdata = ArrayCollection(obj.datas);
				}
				log.debug("----->结果正常！");
			}else{
				log.debug("----->结果异常！");
			}
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询小区拨打号码top10数据]失败：" + f.faultString + "::" +f.faultDetail);
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADHOTSPOTCELLDATAERROR));
		}
	}
}