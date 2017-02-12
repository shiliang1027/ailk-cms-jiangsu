package com.linkage.module.cms.general.regional.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class MajorFailureServImp implements MajorFailureServ
	{
		
		//日志
		public static var log:ILogger = Log.getLogger("com.linkage.module.cms.general.regional.data.MajorFailureServImp");
		
		//endpoint后缀
		public static const endpoint_SUFFIX:String = "messagebroker/amf";
		
		// 上下文
		protected var context:String = null;
		// endpoint
		protected var endpoint:String = null;
		//
		protected var remoteDestination:String = "flexdestination_cms_general_regional_majorservice";
		//
		protected var remoteSource:String = "com.linkage.module.cms.general.regional.view.majorfailure.serv.MajorFailureServ";
		
		
		public function MajorFailureServImp(context:String)
		{
			endpoint = context + endpoint_SUFFIX;
		}
		
		/**
		 * 获取业务影响范围
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID"}
		 * 
		 * @return 
		 *         {"vip_num":"VIP基站数量","not_vip_num":"非VIP基站数量","supper_vip_num":"超级基站数量"
		 *         }
		 */
		public function getServScopeData(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getServScopeData");
			
			remote.getServScopeData(paramMap);
			remote = null;
		}
		
		/**
		 * 获取影响通讯能力数据
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID","rate":"系数比","avg_tel_num":"平均通话数"}
		 * @return {"ability_num":"影响的通讯能力","user_num":"影响的用户数"}
		 */
		public function getAbilityData(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void
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
			}, true, "getAbilityData");
			
			remote.getAbilityData(paramMap);
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