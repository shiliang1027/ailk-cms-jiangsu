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
	 * GIS热图一键快速定制
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
	public class GisHotFastCustomSaveDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotFastCustomSaveDataCMD);
		
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
			log.debug("[一键快速定制]");
			if(!e.param){
				e.param = new Object();
			}
			e.param.areaId=user.areaId;
			e.param.account = user.account;
			log.debug(e.param);
			return dao.saveScene(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[一键快速定制结果]");
			log.debug(obj);
			var i:int = 0;
			for each(var o:* in obj){
				log.info("i="+i);
				log.info(o);
				if(i == 1)
				{
					dm.saveSceneResultURl = o;
				}
				i++;
				
			}
			dm.saveSceneResult = obj.result;
			
			dispatchMsg(new GisHotEvent(GisHotEvent.SAVEFASTCUSTOMDATACOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[查询GIS热图右侧区域列表详情数据]失败：" + f.faultString + "::" +f.faultDetail);
			dispatchMsg(new GisHotEvent(GisHotEvent.LOADKPILISTDATAERROR));
		}
	}
}