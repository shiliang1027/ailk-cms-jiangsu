package com.linkage.module.cms.general.regional.config.mapchoose.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.controls.Alert;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * Flex-java通信类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-6-30 下午02:37:49
	 * @category com.linkage.module.cms.general.regional.config.mapchoose.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public class MapChooseDataManagerDS implements MapChooseDataManager
	{
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.general.regional.config.mapchoose.data.MapChooseDataManagerDS");
		
		private static const DESTINATION:String="flexdestination_cms_general_regional_config_scene";
		private static const SOURCE:String="com.linkage.module.cms.general.regional.config.serv.SceneServImp";
		private static const ENDPOINT_SUFFIX:String="/messagebroker/amf";
		private var endpoint:String=null;
		
		public function MapChooseDataManagerDS(context:String)
		{
			log.info("初始化  数据服务类 ... context:"  +  context);
			endpoint = context + ENDPOINT_SUFFIX;
		}
		
		public function queryMapContainsMo(param:Object, index:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, 
				function(result:Object):void
				{
					log.info("查询成功， result：" + result);
					success.call(null, result, index);
				}, 
				function(event:FaultEvent):void
				{
					error.call(null);
					Alert.show(event.message.toString(),"Error");
				});
			
			log.info(" MapChooseDataManagerDS 查询网元数据 。。。 坐标数量：" + param.length);
			remoteService.queryMapContainsMo(param);
		}
		
		public function queryHasMapMo(monitorId:Object, index:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, 
				function(result:Object):void
				{
					log.info("查询成功， result：" + result);
					success.call(null, result, index);
				}, 
				function(event:FaultEvent):void
				{
					error.call(null);
					Alert.show(event.message.toString(),"Error");
				});
			
			log.info(" MapChooseDataManagerDS 查询网元数据 。。。 monitorId:" + monitorId);
			remoteService.queryHasMapMo(monitorId);
		}
		
		public function getAreaBorder(param:Object, index:Object, success:Function, complete:Function=null, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(DESTINATION, SOURCE, endpoint, 
				function(result:Object):void
				{
					log.info("查询成功， result：" + result);
					success.call(null, result, index);
				}, 
				function(event:FaultEvent):void
				{
					error.call(null);
					Alert.show(event.message.toString(),"Error");
				});
			
			log.info(" MapChooseDataManagerDS 查询框选区域数据 。。。 monitorId:" + param['monitor_id']);
			remoteService.getAreaBorder(param);
		}
		
	}
}