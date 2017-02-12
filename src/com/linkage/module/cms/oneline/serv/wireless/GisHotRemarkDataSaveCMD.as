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
	public class GisHotRemarkDataSaveCMD
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotRemarkDataSaveCMD);
		
		[Inject("gisHotDAO")]
		public var dao:IGisHotDAO;
		
		[Inject("gisHotDM")]
		public var dm:GisHotDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var remark:String;
		
		public function execute(e:GisHotEvent):AsyncToken
		{
			log.debug("[保存标注数据]");
			log.debug(e.param);
			remark = e.param.remark;
			return dao.saveRemark(e.param);
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[保存标注数据结果]");
			log.debug("===>{0},{1}",obj,Number(obj) == 0);
			if(Number(obj) == 0){
				dispatchMsg(new GisHotEvent(GisHotEvent.SAVEREMARKDATAERROR));
			}else{
				var evt:GisHotEvent = new GisHotEvent(GisHotEvent.SAVEREMARKDATACOMPLETE);
				evt.param = remark;
				dispatchMsg(evt);
			}
		}
		
		public function error(f:Fault):void
		{
			log.error("[保存标注数据]失败：" + f.faultString + "::" +f.faultDetail);
			dispatchMsg(new GisHotEvent(GisHotEvent.SAVEREMARKDATAERROR));
		}
	}
}