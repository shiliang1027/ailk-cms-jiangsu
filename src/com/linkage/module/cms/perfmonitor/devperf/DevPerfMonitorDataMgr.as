package com.linkage.module.cms.perfmonitor.devperf
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class DevPerfMonitorDataMgr
	{
		private static const destination:String = "flexdestination_cms_performance_monitor_device_DevicePerformanceMonitorServImp";
		private static const src:String = "com.linkage.module.cms.performance.monitor.device.serv.DevicePerformanceMonitorServImp";
		private static var endpoint:String = "messagebroker/amf";
		
		//日志
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitor.devfperf.DevPerfMonitorDataMgr");
		
		public static function setContext(context:String):void
		{
			endpoint = context + endpoint;
			
			log.info("-----init DevPerfMonitorDataMgr----- destination : " + destination);
			log.info("-----init DevPerfMonitorDataMgr----- src : " + src);
			log.info("-----init DevPerfMonitorDataMgr----- endpoint : " + endpoint);
		}
		
		//加载 复合网元矩阵
		public static function getComplexDegraMoMatrix(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getComplexDegraMoMatrix :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getComplexDegraMoMatrix :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getComplexDegraMoMatrix");
			
			log.info("-----getComplexDegraMoMatrix  加载复合网元矩阵,参数： param:{0}", param);
			remote.getComplexDegraMoMatrix(param);
			remote = null;
		}
		
		//加载 复合网元矩阵 网元悬浮窗信息
		public static function getSuspendWindowData(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getSuspendWindowData :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getSuspendWindowData :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getSuspendWindowData");
			
			log.info("-----getSuspendWindowData  加载网元悬浮窗信息,参数： param:{0}", param);
			remote.getSuspendWindowData(param);
			remote = null;
		}
		
		//加载 复合网元矩阵 网元属性信息
		public static function getMoInfoWindowData(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getMoInfoWindowData :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getMoInfoWindowData :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getMoInfoWindowData");
			
			log.info("-----getMoInfoWindowData  加载网元属性信息,参数： param:{0}", param);
			remote.getMoInfoWindowData(param);
			remote = null;
		}
		
		//加载 网元类型对应的指标列表
		public static function getPerfsByMoType(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getPerfsByMoType :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getPerfsByMoType :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getPerfsByMoType");
			
			log.info("-----getPerfsByMoType  加载指标列表,参数：param:{0}", param);
			remote.getPerfsByMoType(param);
			remote = null;
		}
		
		//加载 图表数据      入参 :网元id、指标id
		public static function createSTP(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----createSTP :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----createSTP :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"createSTP");
			
			log.info("-----createSTP  加载图表数据 ,参数： param:{0}", param);
			remote.createSTP(param);
			remote = null;
		}
		
		//加载   某网元类型下的指标劣化列表
		public static function getAppointMTDegraMoMatrix(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getAppointMTDegraMoMatrix :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getAppointMTDegraMoMatrix :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getAppointMTDegraMoMatrix");
			
			log.info("-----getAppointMTDegraMoMatrix  加载指标劣化列表 ,参数： param:{0}", param);
			remote.getAppointMTDegraMoMatrix(param);
			remote = null;
		}
		
		//----------------------------------gis视图 矩阵数据---------------------------------
		//加载   BSC RNC的劣化矩阵
		public static function getBscDegraMoMatrix(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getBscDegraMoMatrix :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getBscDegraMoMatrix :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getBscDegraMoMatrix");
			
			log.info("-----getBscDegraMoMatrix  加载BSC/RNC GIS视图劣化矩阵 ,参数： param:{0}", param);
			remote.getBscDegraMoMatrix(param);
			remote = null;
		}
		
		//加载   CELL UCELL的劣化矩阵
		public static function getCellDegraMoMatrix(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getCellDegraMoMatrix :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getCellDegraMoMatrix :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getCellDegraMoMatrix");
			
			log.info("-----getCellDegraMoMatrix  加载CELL/UCELL GIS视图劣化矩阵 ,参数： param:{0}", param);
			remote.getCellDegraMoMatrix(param);
			remote = null;
		}
		
		//加载   BSC/RNC泰森多边形数据
		public static function getBtsDistributeArea(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getBtsDistributeArea :成功：" + (result == null? "0" : result['gis'].length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getBtsDistributeArea :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getBtsDistributeArea");
			
			log.info("-----getBtsDistributeArea  加载BSC/RNC泰森多边形 ,参数： param:{0}", param);
			remote.getBtsDistributeArea(param);
			remote = null;
		}
		
		//加载   CELL/UCELL定位、告警信息
		public static function getCellItude(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getCellItude :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getCellItude :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getCellItude");
			
			log.info("-----getCellItude  加载CELL/UCELL定位、告警信息 ,参数： param:{0}", param['perf_ids']);
			remote.getCellItude(param);
			remote = null;
		}
		
		//加载   CELL/UCELL 属地树信息
		public static function getCityTree(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getCityTree :成功：" + result);
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getCityTree :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getCityTree");
			
			log.info("-----getCityTree  加载CELL/UCELL属地树信息 ,参数： param:{0}", param);
			remote.getCityTree(param);
			remote = null;
		}
		
		//加载   CELL/UCELL信息窗数据
		public static function getCellAlarmPerformanceMonitor(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getCellAlarmPerformanceMonitor :成功：" + (result == null? "0" : result['pm']['lately_data'].length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getCellAlarmPerformanceMonitor :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getCellAlarmPerformanceMonitor");
			
			log.info("-----getCellAlarmPerformanceMonitor  加载CELL/UCELL信息窗数据 ,参数： param:{0}", param['mo_id']);
			remote.getCellAlarmPerformanceMonitor(param);
			remote = null;
		}
		
		//加载   GIS视图下 资源tab页的数据
		public static function getMosResources(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getMosResources :成功：" + (result == null? "0" : result['datas'].length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getMosResources :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getMosResources");
			
			log.info("-----getMosResources  加载 资源tab页数据 ,参数： mo_ids:{0}  mo_type_id:{1}", param['mo_ids'], param['mo_type_id']);
			remote.getMosResources(param);
			remote = null;
		}
		
		//加载   GIS视图下 性能tab页的数据
		public static function getMosPerformance(param:Object, success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getMosPerformance :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getMosPerformance :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getMosPerformance");
			
			log.info("-----getMosPerformance  加载 性能tab页数据 ,参数： mo_ids:{0}  mo_type_id:{1}", param['mo_ids'], param['mo_type_id']);
			remote.getMosPerformance(param);
			remote = null;
		}
		//----------------------------------gis视图 矩阵数据---------------------------------
		
	}
}