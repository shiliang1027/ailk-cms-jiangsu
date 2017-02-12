package com.linkage.module.cms.baseline.static.data
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 该as的描述信息
	 * @author 汪炜
	 * @version 1.0
	 * @category com.linkage.module.cms.baseline.static.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public class BaseLineDataManagerBS implements BaseLineDataManager
	{
		private static const DESTINATION:String="flexdestination_cms_performance_baseline_BaseLineServImpl";
		private static const SOURCE:String="com.linkage.module.cms.performance.baseline.serv.BaseLineServImpl";
		private static const endpoint_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.baseline.static.data.BaseLineDataManagerBS");
		
		public function BaseLineDataManagerBS(context:String)
		{
			endpoint=context + endpoint_SUFFIX;
			log.info("-----init BaseLineDataManagerBS----- destination : " + DESTINATION);
			log.info("-----init BaseLineDataManagerBS----- source : " + SOURCE);
			log.info("-----init BaseLineDataManagerBS----- endpoint : " + endpoint);
		}
		/**
		 * 加载设备树图
		 **/ 
		public function getFullTreeInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----getFullTreeInfo :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getFullTreeInfo :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"getFullTreeInfo");
			
			log.info("-----getFullTreeInfo,参数： param:{0}", param);
			remoteService.getFullTreeInfo(param);
			remoteService=null;
		}
		/**
		 * 加载设备树图
		 **/ 
		public function getDefaultMoTreeInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----getDefaultMoTreeInfo :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getDefaultMoTreeInfo :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"getDefaultMoTreeInfo");
			
			log.info("-----getDefaultMoTreeInfo,参数： param:{0}", param);
			remoteService.getDefaultMoTreeInfo(param);
			remoteService=null;
		}
		/**
		 * 加载树的下一页请求
		 **/ 
		public function getTreeInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----getTreeInfo :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getTreeInfo :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"getTreeInfo");
			
			log.info("-----getTreeInfo ,参数： param:{0}", param);
			remoteService.getTreeInfo(param);
			remoteService=null;
		}
		/**
		 * 加载网元指标数据
		 **/ 
		public function getBaseLineInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----getBaseLineInfo :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getBaseLineInfo :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"getBaseLineInfo");
			
			log.info("-----getBaseLineInfo ,参数： param:{0}", param);
			remoteService.getBaseLineInfo(param);
			remoteService=null;
		}
		
		
		/**
		 * 保存修改的指标信息
		 **/ 
		public function saveManualBaseLineInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----saveManualBaseLineInfo :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----saveManualBaseLineInfo :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"saveManualBaseLineInfo");
			
			log.info("-----saveManualBaseLineInfo ,参数： param:{0}", param);
			remoteService.saveManualBaseLineInfo(param);
			remoteService=null;
		}
		/**
		 * 加载网元指标的样本数据
		 **/ 
		public function getBaseLineSwatchInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----getBaseLineSwatchInfo :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getBaseLineSwatchInfo :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"getBaseLineSwatchInfo");
			
			log.info("-----getBaseLineSwatchInfo ,参数： param:{0}", param);
			remoteService.getBaseLineSwatchInfo(param);
			remoteService=null;
		}
		/**
		 * 加载指标数据
		 **/ 
		public function loadKPIList(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadKPIList :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadKPIList :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadKPIList");
			
			log.info("-----loadKPIList ,参数： param:{0}", param);
			remoteService.loadKPIList(param);
			remoteService=null;
		}
		/**
		 * 加载设备类型数据
		 **/ 
		public function loadMoTypeList(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadMoTypeList :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadMoTypeList :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadMoTypeList");
			
			log.info("-----loadMoTypeList ,参数： param:{0}", param);
			remoteService.loadMoTypeList(param);
			remoteService=null;
		}
		/**
		 * 加载网元数据
		 **/ 
		public function getBaseLineMos(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----getBaseLineMos :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----getBaseLineMos :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"getBaseLineMos");
			
			log.info("-----getBaseLineMos ,参数： param:{0}", param);
			remoteService.getBaseLineMos(param);
			remoteService=null;
		}
		/**
		 * 生成基线
		 **/ 
		public function createBaseLines(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----createBaseLines :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----createBaseLines :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"createBaseLines");
			
			log.info("-----createBaseLines ,参数： param:{0}", param);
			remoteService.createBaseLines(param);
			remoteService=null;
		}
		
		/**
		 * 修改指标基线状态
		 **/
		public function doChangeKPIBaseLineStatus(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----doChangeKPIBaseLineStatus :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----doChangeKPIBaseLineStatus :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"doChangeKPIBaseLineStatus");
			
			log.info("-----doChangeKPIBaseLineStatus ,参数： param:{0}", param);
			remoteService.doChangeKPIBaseLineStatus(param);
			remoteService=null;
		}
		/**
		 * 异常值设置查询
		 **/ 
		public function loadOutliers(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadOutliers :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadOutliers :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadOutliers");
			log.info("-----loadOutliers ,参数： param:{0}", param);
			remoteService.loadOutliers(param);
			remoteService=null;
		}
		
		/**
		 * 异常值设置
		 **/ 
		public function saveOutliers(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----saveOutliers :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----saveOutliers :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"saveOutliers");
			log.info("-----saveOutliers ,参数： param:{0}", param);
			remoteService.saveOutliers(param);
			remoteService=null;
		}
		/**
		 * 查询指标基线容忍度
		 **/ 
		public function loadTolerance(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadTolerance :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadTolerance :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadTolerance");
			log.info("-----loadTolerance ,参数： param:{0}", param);
			remoteService.loadTolerance(param);
			remoteService=null;
		}
		/**
		 * 保存基线容忍度
		 **/ 
		public function saveTolerance(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----saveTolerance :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----saveTolerance :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"saveTolerance");
			log.info("-----saveTolerance ,参数： param:{0}", param);
			remoteService.saveTolerance(param);
			remoteService=null;
		}
		/**
		 * 查询指标静态基线配置
		 **/ 
		public function loadStaticBSConfig(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----loadStaticBSConfig :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----loadStaticBSConfig :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"loadStaticBSConfig");
			log.info("-----loadStaticBSConfig ,参数： param:{0}", param);
			remoteService.loadStaticBSConfig(param);
			remoteService=null;
		}
		
		/**
		 * 保存指标静态基线配置
		 **/ 
		public function saveStaticBSConfig(param:Object,success:Function,complete:Function=null,error:Function=null):void{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, function(result:Object):void
			{
				log.info("-----saveStaticBSConfig :成功：" + (result == null? "0" : result.length));
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				log.error("-----saveStaticBSConfig :失败：" + event.fault.faultString);
				error.call(null, event);
			},true,"saveStaticBSConfig");
			log.info("-----saveStaticBSConfig ,参数： param:{0}", param);
			remoteService.saveStaticBSConfig(param);
			remoteService=null;
		}
		
	}
}