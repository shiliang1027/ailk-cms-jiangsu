package com.linkage.module.cms.alarm.specialrule.data
{
	import com.linkage.module.cms.alarm.framework.AlarmContainer;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class CustomRuleDataImp implements CustomRuleData
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.specialrule.data.CustomRuleDataImp");
		/**
		 * 发送数据的web目的地
		 */
		private var remoteDestination:String="flexdestination_cms_warn_view_config_WarnViewConfServImp";
		/**
		 * 发送数据的source
		 */
		private var remoteSource:String="com.linkage.module.cms.warn.view.config.serv.WarnViewConfServImp";
		/**
		 *用户的会话信息(sessionId,areaId,roleId,account,context)
		 */
		protected var mapInfo:Object=null;
		/**
		 *endpoint
		 */
		protected var endpoint:String=null;
		/**
		 *上下文
		 */
		protected var context:String=null;
		/**
		 *suffix
		 */
		public static const endpoint_SUFFIX:String="/messagebroker/amf";

		public function CustomRuleDataImp(mf:Object)
		{
			mapInfo=mf;
			context=mf[AlarmContainer.PARAMKEY_CONTEXT];
			context=context.replace(/\//g, "");
			endpoint="/" + context + endpoint_SUFFIX;
		}

		public function saveWindowXY(params:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:String):void
				{
					log.info("【保存窗口坐标】成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【保存窗口坐标】失败" + event);
					error.call(null, event);
				});
			log.info("【保存窗口坐标】开始");
			remoteService.updateWinCoordinate(params);
		}
	}
}