package com.linkage.module.cms.groupclientalarm.control
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.groupclientalarm.Config;
	import com.linkage.module.cms.groupclientalarm.GroupTotalModule_JS;
	import com.linkage.module.cms.groupclientalarm.components.GisMapWork;
	import com.linkage.module.cms.groupclientalarm.data.GroupDataManager;
	import com.linkage.module.cms.groupclientalarm.data.GroupDataManagerBS;
	import com.linkage.module.cms.groupclientalarm.event.AlarmListWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.CustAlarmWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.CustListWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.CustWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.DummyMapWorkEvent;
	import com.linkage.module.cms.groupclientalarm.event.GisMapWorkEvent;
	import com.linkage.module.cms.groupclientalarm.event.PerfStatWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.RunQuaWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.ServStatWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.ServWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.SheetListWindowEvent;
	import com.linkage.module.cms.groupclientalarm.event.SheetWindowEvent;
	import com.linkage.module.cms.utils.IServerPauseResume;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	import flash.utils.Timer;
	
	import mx.rpc.events.FaultEvent;
	
	import org.osmf.layout.AbsoluteLayoutFacet;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-9-23 下午09:14:30
	 * @category com.linkage.module.cms.groupclient.control
	 * @copyright 南京联创科技 网管开发部
	 */
	public class GroupTotalModuleControl extends EventDispatcher implements IServerPauseResume
	{
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.control.GroupTotalModuleControl");
		private var app:Object;
		private var dataManager:GroupDataManager;
		private var loadManager:LoadManager;
		private var user:Object;
		private var currentQueryParam:Object;
		private var loaderTime:Number;
		
		public static const CITY_LAYER1:Number = 1;
		public static const CITY_LAYER2:Number = 2;
		public static const CITY_LAYER3:Number = 3;
		public static const VIEW_LAYER1:Number = 1;
		public static const VIEW_LAYER2:Number = 2;
		public static const VIEW_LAYER3:Number = 3;
		
		public static const STATEPREF:String = "viewLayer_";
		private var currentCityId:String;
		private var currentView:Number;
		
		private var dataRefreshTimer:Timer = null;
		
		public function GroupTotalModuleControl(app:Object,target:IEventDispatcher=null)
		{
			super(target);
			this.app = app;
			loadManager=app.loadManager;
			dataManager = new GroupDataManagerBS(String(app.parameters["urlContext"]));
			user = JSON.decode(String(app.parameters["user"]).replace(/\'/g, "\""));//解析用户信息
			log.info("user");
			log.info(user);
			for(var key:String in user){
				log.info("[基本信息]"+key+":"+user[key]);
			}
			
		}
		
		
		public function init():void{
			var param:Object = new Object();
			param.area_id = user.areaId;
			log.info("[初始化]");
			log.info(param);
			//初始化配置(如告警颜色配置)
			Config.init();
			
			dataManager.getCityLayer(param,getCityLayerHandler);//获取用户权限属地层次
			
			dataRefreshTimer = new Timer(60000);
			dataRefreshTimer.addEventListener(TimerEvent.TIMER, refreshView);
			dataRefreshTimer.start();
		}
		
		private function refreshView():void
		{
			var param:Object = new Object();
			param.area_id = user.areaId;
			log.info("[每一分钟重新刷新页面]");
			log.info(param);
			dataManager.getCityLayer(param,getCityLayerHandler);
		}
		private function getCityLayerHandler(result:Object):void{
			for(var key:String in result){
				log.info("[用户权限信息]"+key+":"+result[key]);
			}
			user.city_layer=result.city_layer;
			user.is_szx=result.is_szx;
			user.layer_num=result.layer_num;
			user.view_layer=result.view_layer;
			user.city_info=result.city_info;
			log.info("[当前状态]:"+app.currentState);
			app.currentState = STATEPREF+String(user.view_layer);
			app.currentState = STATEPREF+String(user.view_layer);
			if(Number(user.view_layer)!=VIEW_LAYER1){
				dummyMapWorkMapCitySelected(String(user.city_info[0]["city_id"]));
			}else{
				app.dummyMapWork.addEventListener(DummyMapWorkEvent.ALARMINFOLOAD,onMapAlarmInfoLoad);
				app.dummyMapWork.addEventListener(DummyMapWorkEvent.ALARMNUMLOAD,onMapAlarmNumLoad);
				
			}
			app.custWindow.addEventListener(DummyMapWorkEvent.CITYLAYERCHANGE,onCustWindowReFresh);
			app.servWindow.addEventListener(DummyMapWorkEvent.CITYLAYERCHANGE,onServWindowReFresh);
//			app.runQuaWindow.addEventListener(DummyMapWorkEvent.CITYLAYERCHANGE,onRunQuaWindowReFresh);
			app.servStatWindow.addEventListener(DummyMapWorkEvent.CITYLAYERCHANGE,onServStatWindowReFresh);
			app.sheetWindow.addEventListener(DummyMapWorkEvent.CITYLAYERCHANGE,onSheetWindowReFresh);
			app.perfStatWindow.dispatchEvent(new PerfStatWindowEvent(PerfStatWindowEvent.INIT));
		}

		public function dummyMapWorkInit():void{
			log.info("一级视图地图初始化");
			var dummyMapWorkEvent:DummyMapWorkEvent = new DummyMapWorkEvent(DummyMapWorkEvent.VIEWINIT);
			dummyMapWorkEvent.param = user;
			app.dummyMapWork.dispatchEvent(dummyMapWorkEvent);
		}
	
		private var timer:Timer = new Timer(time);
		private var timerCallback:Function;
		public function dummyMapWorkCityLayerChange(param:Object):void{
			currentQueryParam = param;
			log.info("dummyMapWorkCityLayerChange");
//			log.info(currentQueryParam);
			log.info("user.city_layer="+user.city_layer+"    user.is_szx="+user.is_szx+"  user.layer_num="+user.layer_num+" user.view_layer="+user.view_layer);
			currentQueryParam.area_id=user.areaId;
			log.info("[加载数据]");
			app.custWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			app.servWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
//			app.runQuaWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			app.sheetWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			app.servStatWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			if(timerCallback is Function){
				timer.removeEventListener(TimerEvent.TIMER,timerCallback);
			}
			timerCallback = function(event:TimerEvent):void{
				app.custWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.servWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
//				app.runQuaWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.sheetWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.servStatWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				var alarmInfoLoadEvent:DummyMapWorkEvent = new DummyMapWorkEvent(DummyMapWorkEvent.ALARMINFOLOAD);
				alarmInfoLoadEvent.param=currentQueryParam;
				var alarmNumLoadEvent:DummyMapWorkEvent = new DummyMapWorkEvent(DummyMapWorkEvent.ALARMNUMLOAD);
				alarmNumLoadEvent.param=currentQueryParam;
				app.dummyMapWork.dispatchEvent(alarmInfoLoadEvent);
				app.dummyMapWork.dispatchEvent(alarmNumLoadEvent);
			};
			timer.addEventListener(TimerEvent.TIMER,timerCallback);
			if(timer.running){
				timer.stop();
				this.app.parentApplication.remove(timer);
				
			}
			if(!timer.running){
				timer.start();
				this.app.parentApplication.add(timer);
			}
		}
		private function onCustWindowReFresh(event:DummyMapWorkEvent):void{
			app.custWindow.dispatchEvent(new CustWindowEvent(CustWindowEvent.INIT));
		}
		
		private function onServWindowReFresh(event:DummyMapWorkEvent):void{
			app.servWindow.dispatchEvent(new ServWindowEvent(ServWindowEvent.INIT));
		}
		
		private function onRunQuaWindowReFresh(event:DummyMapWorkEvent):void{
//			app.runQuaWindow.dispatchEvent(new RunQuaWindowEvent(RunQuaWindowEvent.INIT));
		}
		
		private function onServStatWindowReFresh(event:DummyMapWorkEvent):void{
			app.servStatWindow.dispatchEvent(new ServStatWindowEvent(ServStatWindowEvent.INIT));
		}
		private function onSheetWindowReFresh(event:DummyMapWorkEvent):void{
			log.info("2222 onSheetWindowReFresh");
			app.sheetWindow.dispatchEvent(new SheetWindowEvent(SheetWindowEvent.INIT));
		}
		
		
		private function onMapAlarmInfoLoad(event:DummyMapWorkEvent):void{
			getSuspInfo(event.param);
		}
		/**
		 * 取告警提示信息（地图展示）
		 * @param param
		 * 
		 */		
		private function getSuspInfo(param:Object):void{
			loadManager.showLoading();
			log.info("[告警提示信息] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getSuspInfo(param,getSuspInfoHandler,onComplete,onError);
		}
		private function getSuspInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var event:DummyMapWorkEvent = new DummyMapWorkEvent(DummyMapWorkEvent.ALARMINFODATACHANGE);
			event.param = result;
			app.dummyMapWork.dispatchEvent(event);
		}
		
		private function onMapAlarmNumLoad(event:DummyMapWorkEvent):void{
			getCityAlarmStat(event.param);
		}
		
		/**
		 *取地市告警数据(地图上展示) 
		 * @param param
		 * 
		 */		
		private function getCityAlarmStat(param:Object):void{
			loadManager.showLoading();
			log.info("[地图告警数据] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getCityAlarmStat(param,getCityAlarmStatHandler,onComplete,onError);
		}
		
		private function getCityAlarmStatHandler(result:Object):void{
			loadManager.hideLoading();
			var event:DummyMapWorkEvent = new DummyMapWorkEvent(DummyMapWorkEvent.ALARMNUMDATACHANGE);
			event.param = result;
			app.dummyMapWork.dispatchEvent(event);
		}
		
		private function onGisMapAlarmInfoLoad(event:GisMapWorkEvent):void{
			log.info("[onGisMapAlarmInfoLoad]:area_id:"+event.param.area_id);
			getGisSuspInfo(event.param);
		}
		
		private function onGisMapAlarmNumLoad(event:GisMapWorkEvent):void{
			log.info("[onGisMapAlarmNumLoad]:area_id:"+event.param.area_id);
			getGisCityAlarmStat(event.param);
		}
		
		private function getGisSuspInfo(param:Object):void{
			loadManager.showLoading();
			log.info("[告警提示信息] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getSuspInfo(param,getGisSuspInfoHandler,onComplete,onError);
		}
		private function getGisSuspInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var event:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMINFODATACHANGE);
			event.param = result;
			app.gisMapWork.dispatchEvent(event);
		}
		private function getGisCityAlarmStat(param:Object):void{
			loadManager.showLoading();
			log.info("[地图告警数据] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getCityAlarmStat(param,getGisCityAlarmStatHandler,onComplete,onError);
		}
		
		private function getGisCityAlarmStatHandler(result:Object):void{
			loadManager.hideLoading();
			var event:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMNUMDATACHANGE);
			event.param = result;
			app.gisMapWork.dispatchEvent(event);
		}
		
		public function dummyMapWorkCityLayerNoSelected():void{
			app.custWindow.dispatchEvent(new CustWindowEvent(CustWindowEvent.CLEAR));
			app.servWindow.dispatchEvent(new ServWindowEvent(ServWindowEvent.CLEAR));
			app.sheetWindow.dispatchEvent(new SheetWindowEvent(SheetWindowEvent.CLEAR));
//			app.runQuaWindow.dispatchEvent(new RunQuaWindowEvent(RunQuaWindowEvent.CLEAR));
			app.servStatWindow.dispatchEvent(new ServStatWindowEvent(ServStatWindowEvent.CLEAR));
			if(timerCallback is Function){
				timer.removeEventListener(TimerEvent.TIMER,timerCallback);
			}
			if(timer.running){
				timer.stop();
				this.app.parentApplication.remove(timer);
			}
		}
		
		public function dummyMapWorkMapCitySelected(param:Object):void{
			currentQueryParam = new Object;
			currentQueryParam.city_id=String(param);
			currentQueryParam.city_layer = String(CITY_LAYER2);
			currentQueryParam.view_layer=String(VIEW_LAYER2);
			currentQueryParam.area_id=user.areaId;
			currentView = VIEW_LAYER2;
			app.currentState = STATEPREF+String(currentView);
			app.gisMapWork.gisMapDefaultId=String(param);
			log.info("[当前状态]:"+app.currentState);
			if(currentView>Number(user.view_layer)){
				app.gisMapWork.currentState = "backEnable";
			}else{
				app.gisMapWork.currentState = "backDisable";
			}
			if(currentCityId != app.gisMapWork.gisMapDefaultId){
				currentCityId = app.gisMapWork.gisMapDefaultId;
				var evt:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.CITYCHANGE);
				evt.param = currentCityId;
				app.gisMapWork.dispatchEvent(evt);
			}else{
				var alarmInfoLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMINFOLOAD);
				alarmInfoLoadEvent.param=currentQueryParam;
				var alarmNumLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMNUMLOAD);
				alarmNumLoadEvent.param=currentQueryParam;
				app.gisMapWork.dispatchEvent(alarmInfoLoadEvent);
				app.gisMapWork.dispatchEvent(alarmNumLoadEvent);
				app.custWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.servWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.sheetWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
//				app.runQuaWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.servStatWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			}
		}
		
//		private var gisMapWindowTimer:Timer;
		
		/**
		 *GIS地图初始化 
		 * 
		 */		
		public function gisMapWorkInit():void{
			log.info("[GIS地图初始化]");
			app.gisMapWork.removeEventListener(GisMapWorkEvent.ALARMINFOLOAD,onGisMapAlarmInfoLoad);
			app.gisMapWork.removeEventListener(GisMapWorkEvent.ALARMNUMLOAD,onGisMapAlarmNumLoad);
			app.gisMapWork.addEventListener(GisMapWorkEvent.ALARMINFOLOAD,onGisMapAlarmInfoLoad);
			app.gisMapWork.addEventListener(GisMapWorkEvent.ALARMNUMLOAD,onGisMapAlarmNumLoad);
			getCityArea(String(currentQueryParam.city_id));
			var alarmInfoLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMINFOLOAD);
			alarmInfoLoadEvent.param=currentQueryParam;
			var alarmNumLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMNUMLOAD);
			alarmNumLoadEvent.param=currentQueryParam;
			app.gisMapWork.dispatchEvent(alarmInfoLoadEvent);
			app.gisMapWork.dispatchEvent(alarmNumLoadEvent);
			
			app.custWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			app.servWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			app.sheetWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
//			app.runQuaWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			app.servStatWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			
//			if(!gisMapWindowTimer){
//				gisMapWindowTimer = new Timer(time);
//				gisMapWindowTimer.addEventListener(TimerEvent.TIMER,onGisMapWindowTimerHandler);
//				gisMapWindowTimer.start();
//			}
			
			if(timerCallback is Function){
				timer.removeEventListener(TimerEvent.TIMER,timerCallback);
			}
			timerCallback = function(event:TimerEvent):void{
				var alarmInfoLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMINFOLOAD);
				alarmInfoLoadEvent.param=currentQueryParam;
				var alarmNumLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMNUMLOAD);
				alarmNumLoadEvent.param=currentQueryParam;
				app.gisMapWork.dispatchEvent(alarmInfoLoadEvent);
				app.gisMapWork.dispatchEvent(alarmNumLoadEvent);
				
				app.custWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.servWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE)); 
				app.sheetWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE)); 
//				app.runQuaWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.servStatWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			};
			timer.addEventListener(TimerEvent.TIMER,timerCallback);
			if(timer.running){
				timer.stop();
				this.app.parentApplication.remove(timer);
			}
			if(!timer.running){
				timer.start();
				this.app.parentApplication.add(timer);
			}
			
		}
		
//		private function onGisMapWindowTimerHandler(event:TimerEvent):void{
//			if(app.gisMapWork){
//				var alarmInfoLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMINFOLOAD);
//				alarmInfoLoadEvent.param=currentQueryParam;
//				app.gisMapWork.dispatchEvent(alarmInfoLoadEvent);
//				var alarmNumLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMNUMLOAD);
//				alarmNumLoadEvent.param=currentQueryParam;
//				app.gisMapWork.dispatchEvent(alarmNumLoadEvent);
//			}
//		}
		/**
		 *取地市边界数据 
		 * 
		 */		
		private function getCityArea(cityId:String):void{
			var param:Object = new Object();
			param.city_id = cityId;
			log.info("[地市边界数据 ]cityId:"+cityId);
			dataManager.getCityLocation(param,getCityLocationHandler);
		}
		private function getCityLocationHandler(result:Object):void{
			var event:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.CITYLOCATIONCHANGE);
			event.param = result;
			app.gisMapWork.dispatchEvent(event);
		}
		
		public function gisMapWorkViewBack():void{
			if(currentView>Number(user.view_layer)){
				currentView--;
				app.gisMapWork.currentState = "backEnable";
			}else{
				app.gisMapWork.currentState = "backDisable";
			}
			app.currentState = STATEPREF+String(currentView);
			if(currentView==VIEW_LAYER2){
				dummyMapWorkMapCitySelected(currentCityId);
			}else{
				app.dummyMapWork.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.REFRESH));
			}
		}
		
		public function gisMapWorkCityLocationSelected(param:Object):void{
			currentQueryParam = param;
			currentQueryParam.area_id=user.areaId;
			currentView = VIEW_LAYER3;
			app.currentState = STATEPREF+String(currentView);
			log.info("[当前状态]:"+app.currentState+",area_id:"+currentQueryParam.area_id+",city_layer:"+currentQueryParam.city_layer);
			app.custWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			app.servWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			app.sheetWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
//			app.runQuaWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			app.servStatWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
			var alarmInfoLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMINFOLOAD);
			alarmInfoLoadEvent.param=currentQueryParam;
			var alarmNumLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMNUMLOAD);
			alarmNumLoadEvent.param=currentQueryParam;
			app.gisMapWork.dispatchEvent(alarmInfoLoadEvent);
			app.gisMapWork.dispatchEvent(alarmNumLoadEvent);
			
			if(timerCallback is Function){
				timer.removeEventListener(TimerEvent.TIMER,timerCallback);
			}
			timerCallback = function(event:TimerEvent):void{
				app.custWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.servWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.sheetWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
//				app.runQuaWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				app.servStatWindow.dispatchEvent(new DummyMapWorkEvent(DummyMapWorkEvent.CITYLAYERCHANGE));
				var alarmInfoLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMINFOLOAD);
				alarmInfoLoadEvent.param=currentQueryParam;
				var alarmNumLoadEvent:GisMapWorkEvent = new GisMapWorkEvent(GisMapWorkEvent.ALARMNUMLOAD);
				alarmNumLoadEvent.param=currentQueryParam;
				app.gisMapWork.dispatchEvent(alarmInfoLoadEvent);
				app.gisMapWork.dispatchEvent(alarmNumLoadEvent);
			};
			timer.addEventListener(TimerEvent.TIMER,timerCallback);
			if(timer.running){
				timer.stop();
				this.app.parentApplication.remove(timer);
			}
			if(!timer.running){
				timer.start();
				this.app.parentApplication.add(timer);
			}
		}
		
		private var time:Number=10*60*1000;
//		private var custWindowTimer:Timer;
		
		/**
		 *客户概况组件初始化 
		 * 
		 */		
		public function custWindowInit():void{
			log.info("[客户概况初始化数据]");
			log.info(currentQueryParam);
			if(currentView!=VIEW_LAYER3){
				getCustGeneral(currentQueryParam);
			
			}else{
				getDistrictCustCount(currentQueryParam);
				if(app.servWindow.alarmRB && app.servWindow.alarmRB.selected){
					servWindowAlarmOnlyShow();
				}else{
					currentQueryParam.curPage_splitPage=String(1);
					currentQueryParam.num_splitPage=String(pageSize);
					getDistrictCust(currentQueryParam);
				}
			}
//			if(!custWindowTimer){
//				custWindowTimer = new Timer(time);
//				custWindowTimer.addEventListener(TimerEvent.TIMER,onCustWindowTimerHandler);
//				custWindowTimer.start();
//			}
		}
		
//		private function onCustWindowTimerHandler(event:TimerEvent):void{
//			custWindowInit();
//		}
		
		/**
		 *获取客户概况 
		 * @param param
		 * 
		 */		
		private function getCustGeneral(param:Object):void{
			loadManager.showLoading();
			log.info("[客户概况 ] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getCustGeneral(param,getCustGeneralHandler,onComplete,onError);
			loaderTime = new Date().getTime();
			log.info("[客户概况 ]开始取数据："+loaderTime);
		}
		
		
		private function getCustGeneralHandler(result:Object):void{
			var time:Number = new Date().getTime();
			log.info("[客户概况 ]结束取数据："+time);
			log.info("[客户概况 ]取数据耗时："+(time-loaderTime));
			log.info("[客户概况 ]"+result+","+result.name+","+result.colum);
			log.info(result);
			loadManager.hideLoading();
			var event:CustWindowEvent = new CustWindowEvent(CustWindowEvent.DATACHANGE);
			event.param = result;
			app.custWindow.dispatchEvent(event);
		}
		private var pageSize:Number=20;
		private function getDistrictCustCount(param:Object):void{
			param.num_splitPage = String(pageSize);
			dataManager.getDistrictCustCount(param,getDistrictCustCountHandler);
		}
		
		private function getDistrictCustCountHandler(result:Object):void{
			var custWindowEvent:CustWindowEvent = new CustWindowEvent(CustWindowEvent.PAGECHANGE);
			custWindowEvent.param = result;
			app.custWindow.dispatchEvent(custWindowEvent);
			
			var servWindowEvent:ServWindowEvent = new ServWindowEvent(ServWindowEvent.PAGECHANGE);
			servWindowEvent.param = result;
			app.servWindow.dispatchEvent(servWindowEvent);
			
		/*	var runQuaWindowEvent:RunQuaWindowEvent = new RunQuaWindowEvent(RunQuaWindowEvent.PAGECHANGE);
			runQuaWindowEvent.param = result;
			app.runQuaWindow.dispatchEvent(runQuaWindowEvent);*/
			
			var servStatWindowEvent:ServStatWindowEvent = new ServStatWindowEvent(ServStatWindowEvent.PAGECHANGE);
			servStatWindowEvent.param = result;
			app.servStatWindow.dispatchEvent(servStatWindowEvent);
		}
		private function getDistrictCust(param:Object):void{
			loadManager.showLoading();
			log.info("[客户、业务概况]------->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]"+"[currentQueryParam.curPage_splitPage:"+currentQueryParam.curPage_splitPage+"][currentQueryParam.num_splitPage:"+currentQueryParam.num_splitPage+"]");
			dataManager.getDistrictCust(param,getDistrictCustHandler,onComplete,onError);
		}
		private function getDistrictCustHandler(result:Object):void{
			loadManager.hideLoading();
			var servWindowEvent:ServWindowEvent = new ServWindowEvent(ServWindowEvent.CUSTDATACHANGE);
			servWindowEvent.param = result;
			app.servWindow.dispatchEvent(servWindowEvent);
		}
		
		public function custWindowPageChange(param:Object):void{
			currentQueryParam.curPage_splitPage=String(param.curPage_splitPage);
			currentQueryParam.num_splitPage=String(param.num_splitPage);
			getDistrictCust(currentQueryParam);
		}
		
		public function servWindowAlarmAllShow():void{
			currentQueryParam.curPage_splitPage=String(1);
			currentQueryParam.num_splitPage=String(pageSize);
			getDistrictCust(currentQueryParam);
		}
		
		public function servWindowAlarmOnlyShow():void{
			getCustListByCityId(currentQueryParam);
		}
		
		private function getCustListByCityId(param:Object):void{
			log.info("[告警集客]------->city_id:"+param.city_id);
			loadManager.showLoading();
			dataManager.getCustListByCityId(param,getCustListByCityIdHandler,onComplete,onError);
		}
		
		private function getCustListByCityIdHandler(result:Object):void{
			loadManager.hideLoading();
			var servWindowEvent:ServWindowEvent = new ServWindowEvent(ServWindowEvent.CUSTDATACHANGE);
			servWindowEvent.param = result;
			app.servWindow.dispatchEvent(servWindowEvent);
		}
		
//		private var servWindowTimer:Timer;
		/**
		 *业务概况组件初始化 
		 * 
		 */	
		public function servWindowInit():void{
//			if(!servWindowTimer){
//				servWindowTimer = new Timer(time);
//				servWindowTimer.addEventListener(TimerEvent.TIMER,onServWindowTimerHandler);
//			}
			if(currentView != VIEW_LAYER3){
				getAlarmData(currentQueryParam);
//				if(!servWindowTimer.running){
//					servWindowTimer.start();
//				}
			}
//			else{
//				if(servWindowTimer.running){
//					servWindowTimer.stop();
//				}
//			}
			
		}
		
		private function onServWindowTimerHandler(event:TimerEvent):void{
			servWindowInit();
		}
		/**
		 * 获取业务概况告警客户数矩阵数据
		 * @param param
		 * 
		 */		
		private function getAlarmData(param:Object):void{
			loadManager.showLoading();
			log.info("[业务概况] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getCustAlarmMatrix(param,getAlarmDataHandler,onComplete,onError);
			loaderTime = new Date().getTime();
			log.info("[业务概况]开始取数据："+loaderTime);
		}
		private function getAlarmDataHandler(result:Object):void{
			var time:Number = new Date().getTime();
			log.info("[业务概况]结束取数据："+time);
			log.info("[业务概况]取数据耗时："+(time-loaderTime));
			loadManager.hideLoading();
			var event:ServWindowEvent = new ServWindowEvent(ServWindowEvent.DATACHANGE);
			event.param = result;
			app.servWindow.dispatchEvent(event);
//			log.info("[告警概况]渲染数据耗时："+(new Date().getTime()-time));
		}
		
//		private var runQuaTimer:Timer;
		/**
		 *运行质量组件初始化 
		 * 
		 */	
		public function runQuaWindowInit():void{
			if(currentView != VIEW_LAYER3){
				getAlarmCompData(currentQueryParam);
			}else{
				currentQueryParam.curPage_splitPage=String(1);
				currentQueryParam.num_splitPage=String(pageSize);
				getGroupAlarmCompMatrix(currentQueryParam);
			}
//			if(!runQuaTimer){
//				runQuaTimer = new Timer(time);
//				runQuaTimer.addEventListener(TimerEvent.TIMER,onRunQuaWindowTimerHandler);
//				runQuaTimer.start();
//			}
		}
		
		private function onRunQuaWindowTimerHandler(event:TimerEvent):void{
			runQuaWindowInit();
		}
		
		/**
		 * 获取运行质量告警和投诉数矩阵
		 * @param param
		 * 
		 */		
		private function getAlarmCompData(param:Object):void{
			loadManager.showLoading();
			log.info("[运行质量] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getAlarmCompMatrix(param,getAlarmCompDataHandler,onComplete,onError);
			loaderTime = new Date().getTime();
			log.info("[运行质量]开始取数据："+loaderTime);
		}
		private function getAlarmCompDataHandler(result:Object):void{
			var time:Number = new Date().getTime();
			log.info("[运行质量]结束取数据："+time);
			log.info("[运行质量]取数据耗时："+(time-loaderTime));
			loadManager.hideLoading();
			var event:RunQuaWindowEvent = new RunQuaWindowEvent(RunQuaWindowEvent.DATACHANGE);
			event.param = result;
//			app.runQuaWindow.dispatchEvent(event);
		}
		
		private function onRunQuaTimerHandler(event:TimerEvent):void{
			getGroupAlarmCompMatrix(currentQueryParam);
		}
		private function getGroupAlarmCompMatrix(param:Object):void{
			loadManager.showLoading();
			log.info("[运行质量三级] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getGroupAlarmCompMatrix(param,getGroupAlarmCompMatrixHandler,onComplete,onError);
			loaderTime = new Date().getTime();
			log.info("[运行质量三级]开始取数据："+loaderTime);
//			if(!runQuaTimer){
//				runQuaTimer = new Timer(1*60*1000);
//				runQuaTimer.addEventListener(TimerEvent.TIMER,onRunQuaTimerHandler);
//			}
//			if(runQuaTimer.running){
//				runQuaTimer.stop();
//			}
		}
		/**
		 * 
		 * @param result
		 * 
		 */		
		private function getGroupAlarmCompMatrixHandler(result:Object):void{
			loadManager.hideLoading();
			var time:Number = new Date().getTime();
			log.info("[运行质量三级]结束取数据："+time);
			log.info("[运行质量三级]取数据耗时："+(time-loaderTime));
			var event:RunQuaWindowEvent = new RunQuaWindowEvent(RunQuaWindowEvent.CUSTDATACHANGE);
			event.param = result;
//			app.runQuaWindow.dispatchEvent(event);
//			if(!runQuaTimer.running){
//				runQuaTimer.start();
//			}
		}
		
		
		public function runQuaWindowPageChange(param:Object):void{
			currentQueryParam.curPage_splitPage=String(param.curPage_splitPage);
			currentQueryParam.num_splitPage=String(param.num_splitPage);
			getGroupAlarmCompMatrix(currentQueryParam);
		}
		
//		private var servStatWindowTimer:Timer;
		/**
		 *业务统计组件初始化 
		 * 
		 */	
		public function servStatWindowInit():void{
			if(currentView!=VIEW_LAYER3){
				getCustNumByServ(currentQueryParam);//业务类型
			}else{
				currentQueryParam.curPage_splitPage=String(1);
				currentQueryParam.num_splitPage=String(pageSize);
				getSpecNumByServ(currentQueryParam);//三级业务类型
			}
			getCustNumBySafe(currentQueryParam);//业务保障等级
			
//			if(!servStatWindowTimer){
//				servStatWindowTimer = new Timer(time);
//				servStatWindowTimer.addEventListener(TimerEvent.TIMER,onServStatWindowTimerHandler);
//				servStatWindowTimer.start();
//			}
		}
		
		
//		private function onServStatWindowTimerHandler(event:TimerEvent):void{
//			servStatWindowInit();
//		}
		
		/**
		 * 
		 * @param param
		 * 
		 */		
		private function getSpecNumByServ(param:Object):void{
			loadManager.showLoading();
			log.info("[业务统计-类型] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getSpecNumByServ(param,getSpecNumByServHandler,onComplete,onError);
			loaderTime = new Date().getTime();
			log.info("[业务统计-类型]开始取数据："+loaderTime);
		}
		/**
		 * 
		 * @param result
		 * 
		 */		
		private function getSpecNumByServHandler(result:Object):void{
			var time:Number = new Date().getTime();
			log.info("[业务统计-类型]结束取数据："+time);
			log.info("[业务统计-类型]取数据耗时："+(time-loaderTime));
			log.info("[业务统计-类型]result:"+result.dataList.length);
			loadManager.hideLoading();
			var event:ServStatWindowEvent = new ServStatWindowEvent(ServStatWindowEvent.CUSTDATACHANGE);
			event.param = result;
			app.servStatWindow.dispatchEvent(event);
		}
		
		private function getCustNumByServ(param:Object):void{
			log.info("[业务统计-类型] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getCustNumByServ(param,getCustNumByServHandler);
		}
		
		private function getCustNumByServHandler(result:Object):void{
			var event:ServStatWindowEvent = new ServStatWindowEvent(ServStatWindowEvent.SERVTYPEDATACHANGE);
			event.param = result;
			app.servStatWindow.dispatchEvent(event);
		}
		
		
		
		/**
		 * 取业务统计-保障等级统计数据
		 * @param param
		 * 
		 */		
		private function getCustNumBySafe(param:Object):void{
			loadManager.showLoading();
			log.info("[业务统计-保障等级] ---->[city_layer:"+param.city_layer+"][city_id:"+param.city_id+"]"+"[area_id:"+param.area_id+"]"+"[view_layer:"+param.view_layer+"]"+"[is_szx:"+param.is_szx+"]");
			dataManager.getCustNumBySafe(param,getCustNumBySafeHandler,onComplete,onError);
			loaderTime = new Date().getTime();
			log.info("[业务统计-保障等级]开始取数据："+loaderTime);
		}
		private function getCustNumBySafeHandler(result:Object):void{
			var time:Number = new Date().getTime();
			log.info("[业务统计-保障等级]结束取数据："+time);
			log.info("[业务统计-保障等级]取数据耗时："+(time-loaderTime));
			log.info("[业务统计-保障等级]result:"+result.dataList.length);
			loadManager.hideLoading();
			var event:ServStatWindowEvent = new ServStatWindowEvent(ServStatWindowEvent.SERVSAFEDATACHANGE);
			event.param = result;
			app.servStatWindow.dispatchEvent(event);
		}
		
		public function servStatWindowPageChange(param:Object):void{
			currentQueryParam.curPage_splitPage=String(param.curPage_splitPage);
			currentQueryParam.num_splitPage=String(param.num_splitPage);
			getSpecNumByServ(currentQueryParam);
		}
		/**
		 *性能统计组件初始化 
		 * 
		 */	
		public function perfStatWindowInit():void{
			getServType();
		}
		/**
		 *取业务类型数据（选择下拉框数据） 
		 * 
		 */		
		private function getServType():void{
			var param:Object = new Object();
			dataManager.getServType(param,getServTypeHandler);
		}
		private function getServTypeHandler(result:Object):void{
			var event:PerfStatWindowEvent = new PerfStatWindowEvent(PerfStatWindowEvent.SERVTYPEDATACHANGE);
			event.param = result;
			app.perfStatWindow.dispatchEvent(event);
		}
		
		public function servTypeSelectChange(param:Object):void{
			dataManager.getGroupPerf(param,getGroupPerfHandler);
		}
		
		private function getGroupPerfHandler(result:Object):void{
			var event:PerfStatWindowEvent = new PerfStatWindowEvent(PerfStatWindowEvent.GROUPPERFDATACHANGE);
			event.param = result;
			app.perfStatWindow.dispatchEvent(event);
		}
		/**
		 *性能统计查询 
		 * @param param
		 * 
		 */		
		public function perfDataQuery(param:Object):void{
			param.city_layer = currentQueryParam.city_layer;
			param.is_szx=currentQueryParam.is_szx;
			param.area_id=currentQueryParam.area_id;
			param.view_layer=String(currentQueryParam.view_layer);
			if(currentQueryParam.city_id){
				param.city_id=String(currentQueryParam.city_id);
			}
			loadManager.showLoading();
			log.info("[性能统计-查询] ->city_layer:"+param.city_layer+",city_id:"+param.city_id+",view_layer:"+param.view_layer+",is_szx:"+param.is_szx+",area_id:"+param.area_id+",serv_type:"+param.serv_type+",perf_type_id:"+param.perf_type_id+",start_time:"+param.start_time+",end_time:"+param.end_time);
			dataManager.getPerfStat(param,getPerfStatHandler,onComplete,onError);
		}
		
		private function getPerfStatHandler(result:Object):void{
			loadManager.hideLoading();
			var event:PerfStatWindowEvent = new PerfStatWindowEvent(PerfStatWindowEvent.DATACHANGE);
			event.param = result;
			app.perfStatWindow.dispatchEvent(event);
		}
		
		[Bindable]
		var serv_levelCustAlarmShow:String = ""; 
		[Bindable]
		var city_idCustAlarmShow:String = "";
		public function custAlarmShow(param:Object):void{
			param.area_id=currentQueryParam.area_id;
			param.city_layer=currentQueryParam.city_layer;
			param.is_szx=currentQueryParam.is_szx;
			serv_levelCustAlarmShow= param.serv_level;
			city_idCustAlarmShow = param.city_id;
			log.info("[集客告警列表] ->city_id:"+param.city_id+",serv_level:"+param.serv_level+",area_id:"+param.area_id+"city_layer:"+param.city_layer+"is_szx:"+param.is_szx);
			loadManager.showLoading();
//			log.info(param);
			dataManager.getCustAlarm(param,getCustAlarmHandler,onComplete,onError);
		}
		
		private function getCustAlarmHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:CustAlarmWindowEvent = new CustAlarmWindowEvent(CustAlarmWindowEvent.DATACHANGE);
			evt.param = result;
			app.custAlarmListWindow.dispatchEvent(evt);
		}
		
		private var custInfoUrl:String = "/cms/groupcustom/monitor/monitorMonitor.action";
		public function custShow(param:Object):void{
			var variables:URLVariables = new URLVariables();
			variables.custId=param.custId;
			var request:URLRequest = new URLRequest(app.parameters["urlContext"]+custInfoUrl);
			request.data=variables;
			navigateToURL(request, "_blank");
		}
		private var  custAlarmExprotUrl:String = "/cms/groupsupport/alarm/general/totalMonitor!exportCustAlarm.action";
		public function custAlarmExport():void{
			
			var variables:URLVariables = new URLVariables();
			variables.area_id=currentQueryParam.area_id;
			variables.city_layer=currentQueryParam.city_layer;
			variables.is_szx=currentQueryParam.is_szx;
			variables.city_id=city_idCustAlarmShow;
			variables.view_layer=String(user.view_layer);
			variables.serv_level=serv_levelCustAlarmShow;
			
			var param:Object = new Object();
			param.area_id=currentQueryParam.area_id;
			param.city_layer=currentQueryParam.city_layer;
			param.is_szx=currentQueryParam.is_szx;
			param.city_id=city_idCustAlarmShow;
			param.view_layer=String(user.view_layer);
			param.serv_level=serv_levelCustAlarmShow;
			variables.param = param;
			var request:URLRequest = new URLRequest(app.parameters["urlContext"]+custAlarmExprotUrl);
			request.data=variables;
			
			log.info("custAlarmExport");
			log.info(variables.param);
			//			navigateToURL(request, "_blank");
			navigateToURL(request);
		}
		private var  alarmExportsUrl:String = "/cms/groupsupport/alarm/general/totalMonitor!exportAlarmList.action";
		public function alarmExport():void{
			var variables:URLVariables = new URLVariables();
			variables.area_id=currentQueryParam.area_id;
			variables.city_layer=currentQueryParam.city_layer;
			variables.is_szx=currentQueryParam.is_szx;
			variables.city_id=city_idAlarmListShow;
			variables.view_layer=String(user.view_layer);
			variables.serv_level=serv_levelAlarmListShow;
			variables.param=cityIdBindable;
			variables.type=typeBindable;
			
			log.info("alarmExport");
			log.info(variables.param);
			var request:URLRequest = new URLRequest(app.parameters["urlContext"]+alarmExportsUrl);
			request.data=variables;
			//			navigateToURL(request, "_blank");
			navigateToURL(request);
		}
		
		public function custProvShow():void{
			loadManager.showLoading();
			var param:Object = new Object();
			dataManager.getProvincialCust(param,getProvincialCustHandler,onComplete,onError);
		}
		
		private function getProvincialCustHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:CustListWindowEvent = new CustListWindowEvent(CustListWindowEvent.DATACHANGE);
			evt.param = result;
			app.custListWindow.dispatchEvent(evt);
		}
		
		public function custTransProvShow():void{
			loadManager.showLoading();
			var param:Object = new Object();
			dataManager.getTransProvincialCust(param,getTransProvincialCustHandler,onComplete,onError);
		}
		
		private function getTransProvincialCustHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:CustListWindowEvent = new CustListWindowEvent(CustListWindowEvent.DATACHANGE);
			evt.param = result;
			app.custListWindow.dispatchEvent(evt);
		}
		
		public function sheetShow(param:Object):void{
			loadManager.showLoading();
			param.area_id=currentQueryParam.area_id;
			log.info("[集客投诉工单] ->city_id:"+param.city_id+",serv_level:"+param.serv_level+",area_id:"+param.area_id);
			log.info("[集客投诉工单]"+String(param));
			dataManager.getSheetList(param,getSheetListHandler,onComplete,onError);
		}
		private function getSheetListHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:SheetListWindowEvent = new SheetListWindowEvent(SheetListWindowEvent.DATACHANGE);
			evt.param = result;
			app.sheetListWindow.dispatchEvent(evt);
		}
		public function sheetWindowInit():void{
			loadManager.showLoading();
			var param:Object = new Object();
			param = currentQueryParam;
			
			param.area_id=currentQueryParam.area_id;
			log.info("[工单概况] ->city_id:"+param.city_id+",serv_level:"+param.serv_level+",area_id:"+param.area_id);
			log.info(currentQueryParam);
			dataManager.getSheetInfo(param,getSheetInfoHandler,onComplete,onError);
		}
		private function getSheetInfoHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:SheetWindowEvent = new SheetWindowEvent(SheetWindowEvent.DATACHANGE);
			evt.param = result;
			app.sheetWindow.dispatchEvent(evt);
		}
		public function sheetDetailWindow(param:Object):void{ 
			loadManager.showLoading();
			param.area_id=currentQueryParam.area_id;
			log.info("[工单详情概况] ->city_id:"+param.city_id+",serv_level:"+param.serv_level+",area_id:"+param.area_id);
			log.info("[工单详情概况]"+String(param));
			log.info(param);
			dataManager.getSheetDetail(param,getSheetDetailHandler,onComplete,onError);
		}
		private function getSheetDetailHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:SheetWindowEvent = new SheetWindowEvent(SheetWindowEvent.SHEETDETAILSHOWDATA);
			log.info("getSheetDetailHandler");
			log.info(result);
			evt.param = result;
			app.sheetListDetailWindow.dispatchEvent(evt);
		}
		public function sheetDetailSendWindow(param:Object):void{
			loadManager.showLoading();
			param.area_id=currentQueryParam.area_id;
			log.info("[工单详情短信概况] ->city_id:"+param.city_id+",serv_level:"+param.serv_level+",area_id:"+param.area_id);
			log.info("[工单详情短信概况]"+String(param));
			dataManager.sendMsg(param,getSheetDetailSendHandler,onComplete,onError);
		}
		private function getSheetDetailSendHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:SheetWindowEvent = new SheetWindowEvent(SheetWindowEvent.SHEETDETAILSHOWSENDDATA);
			evt.param = result;
			app.sheetListDetailWindow.dispatchEvent(evt);
		}
		public function sheetWindowPageChange(param:Object):void{
			loadManager.showLoading();
			param.area_id=currentQueryParam.area_id;
			log.info("[工单page概况] ->city_id:"+param.city_id+",serv_level:"+param.serv_level+",area_id:"+param.area_id);
			log.info("[工单page概况]"+String(param));
			dataManager.getSheetPageData(param,getSheetPageHandler,onComplete,onError);
		}
		private function getSheetPageHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:SheetWindowEvent = new SheetWindowEvent(SheetWindowEvent.PAGECHANGE);
			evt.param = result;
			app.sheetWindow.dispatchEvent(evt);
		}
		
		
		[Bindable]
		var city_idAlarmListShow:String = "";
		[Bindable]
		var serv_levelAlarmListShow:String = "";
		[Bindable]
		private static var cityIdBindable:String="";
		[Bindable]
		private static var typeBindable:String="";
		public function alarmListShow(param:Object):void{
			loadManager.showLoading();
			param.area_id=currentQueryParam.area_id;
			param.city_layer=currentQueryParam.city_layer;
			param.is_szx=currentQueryParam.is_szx;
			city_idAlarmListShow = param.city_id;
			serv_levelAlarmListShow = param.serv_level;
			cityIdBindable = param.param;
			typeBindable = param.type;
			log.info("[告警列表]] ->city_id:"+param.city_id+",serv_level:"+param.serv_level+",area_id:"+param.area_id+"city_layer:"+param.city_layer+"is_szx:"+param.is_szx);
			log.info(param);
			dataManager.getAlarmList(param,getAlarmListHandler,onComplete,onError);
		}
		private function getAlarmListHandler(result:Object):void{
			loadManager.hideLoading();
			var evt:AlarmListWindowEvent = new AlarmListWindowEvent(AlarmListWindowEvent.DATACHANGE);
			evt.param = result;
			app.alarmListWindow.dispatchEvent(evt);
		}
		
		var custExprotInfoUrl:String = "/cms/groupsupport/alarm/general/totalMonitor!exportCustAlarmMatrix.action";
		public function exportAlarmListShow(param:Object):void{
			var variables:URLVariables = new URLVariables();
			var param1:Object = new Object();
			log.info("currentQueryParam");
			log.info(currentQueryParam);
			param1.area_id=currentQueryParam.area_id;
			param1.city_layer=currentQueryParam.city_layer;
			param1.city_id=currentQueryParam.city_id;
			param1.is_szx=currentQueryParam.is_szx;
			param1.view_layer=String(user.view_layer);
			param1.param = param.cityIdBindable;
			param.type = param1.type;
			variables.param = param1;
			
			variables.area_id=currentQueryParam.area_id;
			variables.city_layer=currentQueryParam.city_layer;
			
			variables.city_id=currentQueryParam.city_id;
			variables.view_layer=String(user.view_layer);
			variables.is_szx=currentQueryParam.is_szx;
			
			log.info("variables.is_szx"+variables.is_szx);
			log.info(currentQueryParam);
			if(variables.city_id == null || variables.city_id =="" || variables.is_szx =="000" || variables.city_id =="0000")
			{
				log.info("到处全省");
			}else{
				log.info("dishi");
				variables.is_szx="0";
				param1.is_szx="0";
			}
			
			log.info("exportAlarmListShow=--variables.city_id="+variables.city_id+"---variables.is_szx"+variables.is_szx);
			var request:URLRequest = new URLRequest(app.parameters["urlContext"]+custExprotInfoUrl);
			request.data=variables;
			
			navigateToURL(request);
		}
		
		private function onComplete():void{
			
		}
		private function onError(event:FaultEvent):void{
			loadManager.hideLoading();
		}
		
		private var _running:Boolean=false;
		public function start():void{
			
			_running=true;
		}
		
		public function stop():void{
			_running=false;
		}
		
		public function get running():Boolean{
			return _running;
		}
	}
}