package com.linkage.module.cms.general.regional.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 现场图片监控数据接口
	 * @author czm
	 *
	 */
	public class SpotPicServImp implements SpotPicServ
	{
		
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.general.regional.data.SpotPicServImp");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_regional_picMonitorService";
		//
		protected var remoteSource:String = "com.linkage.module.cms.general.regional.view.picmonitor.serv.SpotPicServ";
		
		public function SpotPicServImp(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}
		
		/**
		 * 获取现场图片信息
		 * @param monitorId 场景Id
		 * @return List<Map> 返回的List中Map的格式{"id":"1","img_name":"test","img_type":"movie或者是picture","img_url":"movie/1.flv","longitdue":"113.289518","latitude":"23.23172"}
		 */
		public function getSpotPicInfoList(monitorId:String,success:Function, complete:Function = null, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				success.call(null, result);
				result = null;
				doNoParamCallBack(complete);
			}, function(event:FaultEvent):void
			{
				error.call(null, event);
				doNoParamCallBack(complete);
			}, true, "getSpotPicInfoList");
			
			remote.getSpotPicInfoList(monitorId);
			remote = null;
		}
		
		private function doNoParamCallBack(complete:Function):void
		{
			if (complete != null)
			{
				complete.call(null);
			}
		}
	}
}