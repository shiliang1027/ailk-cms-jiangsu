package com.linkage.module.cms.general.monitor.datamanager
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class ImageServImp implements ImageServ
	{
		
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.general.monitor.datamanager.ImageServImp");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_enginRoom_dataService";
		//
		protected var remoteSource:String = "com.linkage.module.cms.general.engineroom.data.provider.serv.EngineRoomDataServiceImpl";
		
		private var removeService:RemoteObject = null;
		
		
		public function ImageServImp(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}
		
		/**
		 * 查询所有图标信息
		 * @return
		 */
		public function getAllTopoIconInfo(success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getAllTopoIconInfo");
			
			remote.getAllTopoIconInfo();
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