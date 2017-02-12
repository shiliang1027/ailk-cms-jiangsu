package com.linkage.module.cms.groupclient.data
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 该as的描述信息
	 * @author shiliang(66614) Tel:13770527121
	 * @version 1.0
	 * @since 2012-1-5 上午11:53:31
	 * @category com.linkage.module.cms.groupclient.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public class GroupBusinessReportDataManagerBS implements GroupBusinessReportDataManager
	{
		private static const DESTINATION:String="flexdestination_cms_report_business_BusinessService";
		private static const SOURCE:String="com.linkage.module.cms.report.business.serv.BusinessServImp";
		
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.GroupBusinessReportDataManagerBS");
		
		public function GroupBusinessReportDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
			log.info("-----init GroupBusinessReportDataManagerBS----- endpoint : " + endpoint);
		}
		/**
		 * 加载集客业务全省/地市报表信息
		 **/ 
		public function loadEqBusProvinceAndCityReports(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadEqBusProvinceAndCityReports :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadEqBusProvinceAndCityReports :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadEqBusProvinceAndCityReports");
			
			log.info("-----loadEqBusProvinceAndCityReports ,参数： param:{0}", param);
			remoteService.loadEqBusProvinceAndCityReports(param);
			remoteService=null;
		}
	}
}