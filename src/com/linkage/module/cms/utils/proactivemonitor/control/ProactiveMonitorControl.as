package com.linkage.module.cms.proactivemonitor.control
{
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.proactivemonitor.ProactiveMonitorModule;
	import com.linkage.module.cms.proactivemonitor.data.ProactiveMonitorDataManager;
	import com.linkage.module.cms.proactivemonitor.data.ProactiveMonitorDataManagerDS;
	import com.linkage.module.cms.proactivemonitor.event.CommunityEvent;
	import com.linkage.module.cms.proactivemonitor.event.WlanRateEvent;
	import com.linkage.module.cms.proactivemonitor.event.ZoreTrafficEvent;
	import com.linkage.system.logging.targets.DeMonsterTarget;
	
	import mx.logging.ILogger;
	import mx.logging.ILoggingTarget;
	import mx.logging.Log;
	import mx.logging.LogEventLevel;

	/**
	 * 主动监控控制类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-10-18 下午12:00:43
	 * @category com.linkage.module.cms.proactivemonitor.control
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ProactiveMonitorControl
	{
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.proactivemonitor.control.ProactiveMonitorControl");
		private var app:ProactiveMonitorModule;
		private var dataManager:ProactiveMonitorDataManager;
		private var loadManager:LoadManager;
		public function ProactiveMonitorControl(app:ProactiveMonitorModule)
		{
			var logTarget:ILoggingTarget = new DeMonsterTarget();
			logTarget.level = LogEventLevel.INFO;
			logTarget.filters = ["com.linkage.*"];
			Log.addTarget(logTarget);
			this.app = app;
			loadManager=app.loadManager;
			dataManager = new ProactiveMonitorDataManagerDS(String(app.parameters["urlContext"]));
		}
		
		public function zoreTraffic2GCitysQuery():void{
			log.info("[2G 0话务量小区地市下拉框查询]citysQuery");
			dataManager.citysQuery(null,zoreTraffic2GCitysQueryHandler);
		}
		
		private function zoreTraffic2GCitysQueryHandler(result:Object):void{
			var evt:ZoreTrafficEvent = new ZoreTrafficEvent(ZoreTrafficEvent.CITYSCHANGE);
			evt.param = result;
			app.zoreTraffic2GComp.dispatchEvent(evt);
		}
		
		public function zoreTraffic2GDataQuery(param:Object):void{
			log.info("[2G 0话务量小区数据查询]param："+param);
			loadManager.showLoading();
			dataManager.zoreTraffic2GDataQuery(param,zoreTraffic2GDataQueryHandler);
		}
		
		private function zoreTraffic2GDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ZoreTrafficEvent = new ZoreTrafficEvent(ZoreTrafficEvent.DATACHANGE);
			evt.param = result;
			app.zoreTraffic2GComp.dispatchEvent(evt);
		}
		
		public function zoreTraffic2GGisDataQuery(param:Object):void{
			log.info("[2G 0话务量小区GIS数据查询]param："+param);
			loadManager.showLoading();
			dataManager.zoreTraffic2GGisDataQuery(param,zoreTraffic2GGisDataQueryHandler);
		}
		
		private function zoreTraffic2GGisDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ZoreTrafficEvent = new ZoreTrafficEvent(ZoreTrafficEvent.GISCHANGE);
			evt.param = result;
			app.zoreTraffic2GComp.dispatchEvent(evt);
		}
		
		public function zoreTrafficTDCitysQuery():void{
			log.info("[TD 0话务量小区地市下拉框查询]citysQuery");
			dataManager.citysQuery(null,zoreTrafficTDCitysQueryHandler);
		}
		
		private function zoreTrafficTDCitysQueryHandler(result:Object):void{
			var evt:ZoreTrafficEvent = new ZoreTrafficEvent(ZoreTrafficEvent.CITYSCHANGE);
			evt.param = result;
			app.zoreTrafficTDComp.dispatchEvent(evt);
		}
		
		public function zoreTrafficTDDataQuery(param:Object):void{
			log.info("[TD 0话务量小区数据查询]param："+param);
			loadManager.showLoading();
			dataManager.zoreTrafficTDDataQuery(param,zoreTrafficTDDataQueryHandler);
		}
		
		private function zoreTrafficTDDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ZoreTrafficEvent = new ZoreTrafficEvent(ZoreTrafficEvent.DATACHANGE);
			evt.param = result;
			app.zoreTrafficTDComp.dispatchEvent(evt);
		}
		
		public function zoreTrafficTDGisDataQuery(param:Object):void{
			log.info("[TD 0话务量小区GIS数据查询]param："+param);
			loadManager.showLoading();
			dataManager.zoreTrafficTDGisDataQuery(param,zoreTrafficTDGisDataQueryHandler);
		}
		
		private function zoreTrafficTDGisDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:ZoreTrafficEvent = new ZoreTrafficEvent(ZoreTrafficEvent.GISCHANGE);
			evt.param = result;
			app.zoreTrafficTDComp.dispatchEvent(evt);
		}
		
		
		public function wlanRateBusyCitysQuery():void{
			log.info("[忙时无线利用率地市下拉框查询]citysQuery");
			dataManager.citysQuery(null,wlanRateBusyCitysQueryHandler);
		}
		
		private function wlanRateBusyCitysQueryHandler(result:Object):void{
			var evt:WlanRateEvent = new WlanRateEvent(WlanRateEvent.CITYSCHANGE);
			evt.param = result;
			app.wlanRateBusyComp.dispatchEvent(evt);
		}
		
		public function wlanRateBusyChartDataQuery(param:Object):void{
			log.info("[忙时无线利用率统计图数据查询]param："+param);
			loadManager.showLoading();
			dataManager.wlanRateBusyChartDataQuery(param,wlanRateBusyChartDataQueryHandler);
		}
		
		private function wlanRateBusyChartDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:WlanRateEvent = new WlanRateEvent(WlanRateEvent.CHARTDATACHANGE);
			evt.param = result;
			app.wlanRateBusyComp.dispatchEvent(evt);
		}
		
		
		public function wlanRateBusyDataQuery(param:Object):void{
			log.info("[忙时无线利用率数据查询]param："+param);
			loadManager.showLoading();
			dataManager.wlanRateBusyDataQuery(param,wlanRateBusyDataQueryHandler);
		}
		
		private function wlanRateBusyDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:WlanRateEvent = new WlanRateEvent(WlanRateEvent.DATACHANGE);
			evt.param = result;
			app.wlanRateBusyComp.dispatchEvent(evt);
		}
		
		public function wlanRateBusyGisDataQuery(param:Object):void{
			log.info("[忙时无线利用率GIS数据查询]param："+param);
			loadManager.showLoading();
			dataManager.wlanRateBusyGisDataQuery(param,wlanRateBusyGisDataQueryHandler);
		}
		
		private function wlanRateBusyGisDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:WlanRateEvent = new WlanRateEvent(WlanRateEvent.GISCHANGE);
			evt.param = result;
			app.wlanRateBusyComp.dispatchEvent(evt);
		}
		
		
		public function wlanRate2GCitysQuery():void{
			log.info("[2G无线利用率地市下拉框查询]citysQuery");
			dataManager.citysQuery(null,wlanRate2GCitysQueryHandler);
		}
		
		private function wlanRate2GCitysQueryHandler(result:Object):void{
			var evt:WlanRateEvent = new WlanRateEvent(WlanRateEvent.CITYSCHANGE);
			evt.param = result;
			app.wlanRate2GComp.dispatchEvent(evt);
		}
		
		public function wlanRate2GChartDataQuery(param:Object):void{
			log.info("[2G无线利用率统计图数据查询]param："+param);
			loadManager.showLoading();
			dataManager.wlanRate2GChartDataQuery(param,wlanRate2GChartDataQueryHandler);
		}
		
		private function wlanRate2GChartDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:WlanRateEvent = new WlanRateEvent(WlanRateEvent.CHARTDATACHANGE);
			evt.param = result;
			app.wlanRate2GComp.dispatchEvent(evt);
		}
		
		public function wlanRate2GDataQuery(param:Object):void{
			log.info("[2G无线利用率数据查询]param："+param);
			loadManager.showLoading();
			dataManager.wlanRate2GDataQuery(param,wlanRate2GDataQueryHandler);
		}
		
		private function wlanRate2GDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:WlanRateEvent = new WlanRateEvent(WlanRateEvent.DATACHANGE);
			evt.param = result;
			app.wlanRate2GComp.dispatchEvent(evt);
		}
		
		public function wlanRate2GGisDataQuery(param:Object):void{
			log.info("[2G无线利用率GIS数据查询]param："+param);
			loadManager.showLoading();
			dataManager.wlanRate2GGisDataQuery(param,wlanRate2GGisDataQueryHandler);
		}
		
		private function wlanRate2GGisDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:WlanRateEvent = new WlanRateEvent(WlanRateEvent.GISCHANGE);
			evt.param = result;
			app.wlanRate2GComp.dispatchEvent(evt);
		}
		
		
		public function zhCommunityDataQuery(param:Object):void{
			log.info("[最坏小区数据查询]param："+param);
			loadManager.showLoading();
			dataManager.estCellStpData(param,zhCommunityDataQueryHandler);
		}
		
		private function zhCommunityDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:CommunityEvent = new CommunityEvent(CommunityEvent.DATACHANGE);
			evt.param = result;
			app.zhCommunityComp.dispatchEvent(evt);
		}
		
		public function zhCommunityPerfDataQuery(param:Object):void{
			log.info("[最坏小区指标数据查询]param："+param);
			loadManager.showLoading();
			dataManager.getKpis(param,zhCommunityPerfDataQueryHandler);
		}
		
		private function zhCommunityPerfDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:CommunityEvent = new CommunityEvent(CommunityEvent.PERFCHANGE);
			evt.param = result;
			app.zhCommunityComp.dispatchEvent(evt);
		}
		
		public function zhCommunityGisQuery(param:Object):void{
			log.info("[最坏小区cell数据查询]param："+param);
			loadManager.showLoading();
			dataManager.estCellData(param,zhCommunityGisQueryHandler);
		}
		
		private function zhCommunityGisQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:CommunityEvent = new CommunityEvent(CommunityEvent.GISCHANGE);
			evt.param = result;
			app.zhCommunityComp.dispatchEvent(evt);
		}
		
		
		public function zcCommunityDataQuery(param:Object):void{
			log.info("[最差小区数据查询]param："+param);
			loadManager.showLoading();
			dataManager.estCellStpData(param,zcCommunityDataQueryHandler);
		}
		
		private function zcCommunityDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:CommunityEvent = new CommunityEvent(CommunityEvent.DATACHANGE);
			evt.param = result;
			app.zcCommunityComp.dispatchEvent(evt);
		}
		
		
		public function zcCommunityPerfDataQuery(param:Object):void{
			log.info("[最差小区指标数据查询]param："+param);
			loadManager.showLoading();
			dataManager.getKpis(param,zcCommunityPerfDataQueryHandler);
		}
		
		private function zcCommunityPerfDataQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:CommunityEvent = new CommunityEvent(CommunityEvent.PERFCHANGE);
			evt.param = result;
			app.zcCommunityComp.dispatchEvent(evt);
		}
		
		public function zcCommunityGisQuery(param:Object):void{
			log.info("[最差小区cell数据查询]param："+param);
			loadManager.showLoading();
			dataManager.estCellData(param,zcCommunityGisQueryHandler);
		}
		
		private function zcCommunityGisQueryHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:CommunityEvent = new CommunityEvent(CommunityEvent.GISCHANGE);
			evt.param = result;
			app.zcCommunityComp.dispatchEvent(evt);
		}
		
	}
}