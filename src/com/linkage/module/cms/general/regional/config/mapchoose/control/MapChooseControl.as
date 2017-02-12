package com.linkage.module.cms.general.regional.config.mapchoose.control
{
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.general.regional.config.mapchoose.data.MapChooseDataManager;
	import com.linkage.module.cms.general.regional.config.mapchoose.data.MapChooseDataManagerDS;
	import com.linkage.system.logging.targets.DeMonsterTarget;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.logging.ILogger;
	import mx.logging.ILoggingTarget;
	import mx.logging.Log;
	import mx.logging.LogEventLevel;
	
	/**
	 * 地图框选基站控制类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-6-30 下午02:34:45
	 * @category com.linkage.module.cms.general.regional.config.mapchoose.control
	 * @copyright 南京联创科技 网管开发部
	 */
	public class MapChooseControl extends EventDispatcher
	{
		// log
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.general.regional.config.mapchoose.control.MapChooseControl");
		private var app:Object;
		private var loadManager:LoadManager;
		private var dataManager:MapChooseDataManager;
		public function MapChooseControl(app:Object,target:IEventDispatcher=null)
		{
			super(target);
//			var logTarget:ILoggingTarget = new DeMonsterTarget();
//			logTarget.level = LogEventLevel.INFO;
//			logTarget.filters = ["com.linkage.*"];
//			Log.addTarget(logTarget);
			this.app = app;
			loadManager=new LoadManager(app, "blue");
			dataManager = new MapChooseDataManagerDS(String(app.parameters["context"]));
		}
		
		public function queryMapContainsMo(param:Object, index:Object):void
		{
			log.info("根据坐标集合，查询 网元信息。。。");
			loadManager.showLoading("正在查询，请稍后");
			dataManager.queryMapContainsMo(param, index, queryMapResHandler);
		}
		
		public function queryHasMapMo(monitorId:Object, index:Object):void
		{
			log.info("根据monitorId，查询 网元信息。。。");
			loadManager.showLoading("正在查询，请稍后");
			dataManager.queryHasMapMo(monitorId, index, queryMapResHandler, function():void
			{
				loadManager.hideLoading();
			});
		}
		
		public function queryMapResHandler(result:Object, index:Object):void
		{
			log.info("查询结束，回调处理方法。。。");
			loadManager.hideLoading();
			
			//处理查询结果   撒点 和添加到 已框选列表
			app.dealSelectedMos(result, index);
		}
		
		public function getAreaBorder(param:Object, index:Object):void
		{
			loadManager.showLoading("正在查询，请稍后");
			dataManager.getAreaBorder(param, index, dealAreas, function():void
			{
				loadManager.hideLoading();
			});
		}
		
		public function dealAreas(result:Object, index:Object):void
		{
			log.info("查询结束，回调处理方法。。。");
			loadManager.hideLoading();
			
			app.dealAreas(result, index);
		}
		
	}
}