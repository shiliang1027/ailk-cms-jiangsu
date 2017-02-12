package com.linkage.module.cms.groupclient.data
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class AlarmDialSheetNoticeDataManagerBS implements AlarmDialSheetNoticeDataManager
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.AlarmDialSheetNoticeDataManagerBS");
		private static const remoteDestination:String="flexdestination_cms_groupcustom_phonesheet_PhoneSheetService";
		private static const remoteSource:String="com.linkage.module.cms.groupcustom.phonesheet.serv.PhoneSheetServImp";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		
		public function AlarmDialSheetNoticeDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
		}

		
		public function getCallRecord(param:Object, success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					success.call(null, result);
				}, function(event:FaultEvent):void
				{
					log.error("-----getCallRecord :失败：" + event.fault.faultString);
					error.call(null, event);
				},true,"getCallRecord");
				
				remoteService.getCallRecord(param);
				remoteService=null;
		}
		
		public function getDone(param:Object, success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					success.call(null, result);
				}, function(event:FaultEvent):void
				{
					log.error("-----getDone :失败：" + event.fault.faultString);
					error.call(null, event);
				},true,"getDone");
				
				remoteService.getDone(param);
				remoteService=null;
		}
		
		public function updateCallRecords(param:Object, success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					success.call(null, result);
				}, function(event:FaultEvent):void
				{
					log.error("-----updateCallRecords :失败：" + event.fault.faultString);
					error.call(null, event);
				},true,"updateCallRecords");
				
				remoteService.updateCallRecords(param);
				remoteService=null;
		}
		
		public function getDisplayColumns(param:Object, success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("-----getDisplayColumns :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getDisplayColumns :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"getDisplayColumns");
			
			remoteService.getDisplayColumns(param);
			remoteService=null;
		}
		public function delCallRecord(param:Object, success:Function, error:Function = null):void
		{
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
//				log.info("-----delCallRecord :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----delCallRecord :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"delCallRecord");
			
			remoteService.delCallRecord(param);
			remoteService=null;
		}
		
		public function getWarnDatas(param:Object, success:Function, error:Function = null):void
		{
//			log.info(param.sheetno+"-----"+param.sheettime);
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("-----getWarnDatas :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getWarnDatas :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"getWarnDatas");
			
			remoteService.getWarnDatas(param);
			remoteService=null;
		}
		public function exportUnDoneF(param:Object, success:Function, error:Function = null):void
		{
//			log.info(param.sheetno+"-----"+param.sheettime);
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("-----exportUnDoneF :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----exportUnDoneF :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"exportUnDoneF");
			
			remoteService.exportUnDoneF();
			remoteService=null;
		}
		public function exportDoneF(param:Object, success:Function, error:Function = null):void
		{
//			log.info(param.sheetno+"-----"+param.sheettime);
			var remoteService:RemoteObject = BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
			{
				log.info("-----exportDoneF :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----exportDoneF :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"exportDoneF");
			
			remoteService.exportDoneF();
			remoteService=null;
		}
		
	}
}