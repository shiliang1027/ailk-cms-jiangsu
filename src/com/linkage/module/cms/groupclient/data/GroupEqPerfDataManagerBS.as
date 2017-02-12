package com.linkage.module.cms.groupclient.data
{
//	import com.ailk.common.system.logging.ILogger;
//	import com.ailk.common.system.logging.Log;
	
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.controls.Alert;
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
	public class GroupEqPerfDataManagerBS implements GroupEqPerfDataManager
	{
		private static const DESTINATION:String="flexdestination_cms_groupsupport_performance_eqptperfor_EquipmentService";
		private static const SOURCE:String="com.linkage.module.cms.groupsupport.performance.eqptperfor.serv.EquipmentServImpl";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.data.GroupEqPerfDataManagerBS");
		
		public function GroupEqPerfDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
			log.info("-----init GroupEqPerfDataManagerBS----- endpoint : " + endpoint);
		}
		/**
		 * 加载设备树图
		 **/ 
		public function loadEqTrees(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadEqTrees :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadEqTrees :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"queryEqTrees");
			
			log.info("-----loadEqTrees,参数： param:{0}", param);
			remoteService.getEquipmentTree(param);
			remoteService=null;
		}
		/**
		 * 加载设备指标列表
		 **/ 
		public function loadEqKPIList(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadEqKPIList :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadEqKPIList :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadEqKPIList");
			
			log.info("-----loadEqKPIList ,参数： param:{0}", param);
			remoteService.loadEqKPIList(param);
			remoteService=null;
		}
		/**
		 * 加载设备指标列表
		 **/ 
		public function loadEqKPIDetail(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadEqKPIDetail :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadEqKPIDetail :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadEqKPIDetail");
			
			log.info("-----loadEqKPIDetail ,参数： param:{0}", param);
			remoteService.loadEqKPIDetail(param);
			remoteService=null;
		}
		/**
		 * 加载集客业务报表信息
		 **/ 
		public function loadEqBusinessReports(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadEqBusinessReports :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadEqBusinessReports :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadEqBusinessReports");
			
			log.info("-----loadEqBusinessReports ,参数： param:{0}", param);
			remoteService.loadEqBusinessReports(param);
			remoteService=null;
		}
		
		/**
		 * 加载集客设备（局端）告告警对应的集客业务等详情
		 **/ 
		public function loadEqRelatedGroupServDetail(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadEqRelatedGroupServDetail :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadEqRelatedGroupServDetail :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadEqRelatedGroupServDetail");
			
			log.info("-----loadEqRelatedGroupServDetail ,参数： param:{0}", param);
			remoteService.loadEqRelatedGroupServDetail(param);
			remoteService=null;
		}
		
		
		/**
		 * 加载集客设备（重大）告警对应的集客业务等详情
		 **/ 
		public function loadEqCatastrophicServDetail(param:Object,success:Function,complete:Function=null,error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadEqCatastrophicServDetail :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadEqCatastrophicServDetail :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadEqCatastrophicServDetail");
			
			log.info("-----loadEqCatastrophicServDetail ,参数： param:{0}", param);
			remoteService.loadEqCatastrophicServDetail(param);
			remoteService=null;
		}
		
		public function qureyHistoryAlarmData(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----queryHisInfo :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----queryHisInfo :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"queryHisInfo");
			
			log.info("-----queryHisInfo ,参数： param:{0}", param);
			remoteService.queryHisInfo(param);
			remoteService=null;
		}
	}
}