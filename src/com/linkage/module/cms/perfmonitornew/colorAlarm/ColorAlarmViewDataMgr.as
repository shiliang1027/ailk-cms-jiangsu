package com.linkage.module.cms.perfmonitornew.colorAlarm
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class ColorAlarmViewDataMgr
	{
		private static const destination:String = "flexdestination_cms_performance_royb_EmergencySysServImpl";
		private static const src:String = "com.linkage.module.cms.performance.royb.serv.EmergencySysServImpl";
		private static var endpoint:String = "messagebroker/amf";
		
		//日志
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitornew.colorAlarm.ColorAlarmViewDataMgr");
		
		public static function setContext(context:String):void
		{
			endpoint = context + endpoint;
			log.info("-----init ColorAlarmViewDataMgr----- destination : " + destination);
			log.info("-----init ColorAlarmViewDataMgr----- src : " + src);
			log.info("-----init ColorAlarmViewDataMgr----- endpoint : " + endpoint);
		}
		
		//加载 红橙黄蓝告警网元矩阵
		public static function getColorMatrixInfo(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getColorMatrixInfo :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getColorMatrixInfo :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getColorMatrixInfo");
			log.info("-----getColorMatrixInfo  加载 红橙黄蓝告警网元矩阵,参数： param:{0}", param);
			remote.getColorMatrixInfo(param);
			remote = null;
		}
		
		//加载 红橙黄蓝告警指示灯
		public static function getGuidingLightsColor(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getGuidingLightsColor :加载 红橙黄蓝告警指示灯成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getGuidingLightsColor :加载 红橙黄蓝告警指示灯失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getGuidingLightsColor");
			log.info("-----getGuidingLightsColor  加载 加载 红橙黄蓝告警指示灯,参数： param:{0}", param);
			remote.getGuidingLightsColor(param);
			remote = null;
		}
		//加载 红橙黄蓝告警应急预案
		public static function getSolvePlans(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getSolvePlans :加载 红橙黄蓝告警应急预案成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getSolvePlans :加载 红橙黄蓝告警应急预案失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getSolvePlans");
			log.info("-----getSolvePlans  加载 红橙黄蓝告警应急预案,参数： param:{0}", param);
			remote.getSolvePlans(param);
			remote = null;
		}
		//加载 红橙黄蓝告警应急预案
		public static function saveSolvePlans(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----saveSolvePlans :保存 红橙黄蓝告警应急预案成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----saveSolvePlans :保存 红橙黄蓝告警应急预案失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"saveSolvePlans");
			log.info("-----saveSolvePlans 保存 红橙黄蓝告警应急预案,参数： param:{0}", param);
			remote.saveSolvePlans(param);
			remote = null;
		}
	}
}