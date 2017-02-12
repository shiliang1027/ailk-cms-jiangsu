package com.linkage.module.cms.gsscene.viewnew
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.common.util.GsSceneConts;
	import com.linkage.module.cms.gsscene.view.components.emgyresource.EmgyResourceDM;
	import com.linkage.module.cms.gsscene.view.components.kpisituation.KPISituationDM;
	import com.linkage.module.cms.gsscene.view.components.mapvector.MapVectorDM;
	import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
	import com.linkage.module.cms.gsscene.view.components.neroom.NeRoomDM;
	import com.linkage.module.cms.gsscene.view.components.resmatrix.ResMatrixCompPM;
	import com.linkage.module.cms.gsscene.view.components.resmatrix.ResMatrixDM;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.SceneIntroDM;
	import com.linkage.module.cms.gsscene.view.components.scenethumbnail.SceneThumbnailDM;
	import com.linkage.module.cms.gsscene.view.components.scenetree.SceneTreeDM;
	import com.linkage.module.cms.gsscene.view.components.sceneview.SceneConfigDM;
	import com.linkage.module.cms.gsscene.view.components.sheetstat.SheetStatDM;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.controls.Alert;

	/**
	 * 该as的描述信息
	 * @author shiliang(66614) Tel:18661205639
	 * @version 1.0
	 * @since 2014-11-4 下午7:17:30
	 * @category com.linkage.module.cms.gsscene.viewnew
	 * @copyright 南京联创科技 网管开发部
	 */
	public class ScenePM
	{
		private var log:ILogger = Log.getLoggerByClass(ScenePM);
		[Bindable]
		public var parameters:Object;
		[MessageDispatcher]
		public var dispatcher:Function;
		public var compsIndex:int=0;
		public var compsMax:int=0;
		[Inject("user")]
		[Bindable]
		public var user:IUser;
		[Inject("sceneConfigDM")]
		[Bindable]
		public var scfdm:SceneConfigDM;
		
		[Inject("sceneTreeDM")]
		[Bindable]
		public var stdm:SceneTreeDM;
		
		[Inject("sceneIntroDM")]
		[Bindable]
		public var sceneIntroDM:SceneIntroDM;
		[Inject("emgyResourceDM")]
		[Bindable]
		public var emgyResourceDM:EmgyResourceDM;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		[Inject("resMatrixDM")]
		[Bindable]
		public var resMatrixDM:ResMatrixDM;
		
		[Bindable]
		public var resMatrixCompPM:ResMatrixCompPM;
		
		[Inject("mapVectorDM")]
		[Bindable]
		public var mapVectorDM:MapVectorDM;
		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;
		
		[Inject("sceneThumbnailDM")]
		[Bindable]
		public var sceneThumbnailDM:SceneThumbnailDM;
		
		[Inject("sheetStatDM")]
		[Bindable]
		public var sheetStatDM:SheetStatDM;
		
		/**汪炜，增加**********************************************************************************************************/
		[Inject("kPISituationDM")]
		[Bindable]
		public var kpiSituationDM:KPISituationDM;
		
		/**汪炜，增加**********************************************************************************************************/

		[Inject("neRoomDM")]
		[Bindable]
		public var neRoomDM:NeRoomDM;
		
		[Bindable]
		public var refreshTime:Number = 5 * 60;
		[Bindable]
		public var refreshCount:Number=refreshTime;
		private var refreshCountTimer:Timer = new Timer(1000);
		
		public function ScenePM()
		{
			refreshCountTimer.addEventListener(TimerEvent.TIMER,function(event:TimerEvent):void{
				refreshCount--;
				log.error("刷新倒计时：{0}",refreshCount);
				if(refreshCount==0){
					dispatcher(new SceneEvent("SCENENEW_REFRESH"));
				}
			});
			refreshCountTimer.start();
		}
		
		[MessageHandler(selector="STOPTIMER")]
		public function stoptimer(e:SceneEvent):void
		{
			log.info("停止刷新！");
			if(refreshCountTimer.running){
				refreshCountTimer.stop();
			}
		}
		[MessageHandler(selector="STARTTIMER")]
		public function starttimer(e:SceneEvent):void
		{
			log.info("启动刷新！");
			refreshCount=refreshTime;
			if(!refreshCountTimer.running){
				refreshCountTimer.start();
			}
		}
		
		[MessageHandler(selector="CHANGE_REFRESHTIME")]
		public function change_refreshtime(evt:SceneEvent=null):void
		{
			log.info("change改变时间事件！");
			if(null!=evt){
				log.info(evt.param);
				refreshTime = Number(evt.param.refreshTime) * 60;
				refreshCount=refreshTime;
			}
		}
		[MessageHandler(selector="SCENENEW_REFRESH")]
		public function refreshDatas(e:SceneEvent):void
		{
			refreshCount=refreshTime;
			dispatcher(new Event("REQUEST_CLEAR"));
			log.info("刷新面板数据！");
			var refreshEvt:SceneEvent = new SceneEvent(SceneEvent.COMPONENT_REFRESH_DATA);
			refreshEvt.param = e.param;
			dispatcher(refreshEvt);
		}
		
		
		//点击节点触发事件获取节点信息并且抛出事件
		[MessageHandler(selector = "DEAL_SCENE_CHANGE")]
		public function doChangeSceneInfo(e:SceneEvent):void
		{
			log.info("getSceneInfo--------2");
			var obj:Object = e.param;
			switch(user.logicalType)
			{
				case "1":
				{
					this.doProvinceChangeMapView(obj);
					break;
				}
				case "2":
				{
					this.doProvinceChangeMapView(obj);
					//					this.doProvinceLTEChangeMapView(obj);//LTE和全网的暂时逻辑一致，后期不一样，可单独写doProvinceLTEChangeMapView方法。
					break;
				}
				default:
				{
					this.doGeneralChangeMapView(obj);
					break;
				}
			}
			
		}
		/**
		 * 
		 * 全省日常节假日地图事件。
		 * 1.场景，即全省网元的统计，矢量图
		 * 2.区域，暂时没用，之后再说。
		 * 3.地市，即地市网元的统计，矢量图，这个要抛给MapVectorShow.mxml，让矢量图类处理，是否存在该地市统计，再做判断。
		 * 4.区县，即区县网元的统计，gis地图，目前暂无统计到区县级别的后台模块，后面需开发，具体的逻辑抛给MapVectorShow处理。
		 * 
		 * */
		private function doProvinceChangeMapView(obj:Object):void{
			var evt:SceneEvent = null;
			//level 1:场景   2：区域    3：地市
			var param:Object = {};
			if ("1" == obj.level)
			{
				param.level = "1";
				param.areaId = "";
				param.cityId = GsSceneConts.Province_KEY;
				param.cityName = "";
				param.currentMapType = user.mapType;
				param.layerId = user.initLayerId;
				param.layerurl = user.initLayerUrl;
			}
			else if ("2" == obj.level)
			{
				//				user.areaId = String(obj.id);
				//				user.level = obj.level;
				//				user.cityId = obj.cityId;
				//				user.currentMapType = "0";
				param.areaId = String(obj.id);
				param.level = obj.level;
				param.cityId = obj.cityId;
				param.cityName = "";
				param.currentMapType = "0";
				param.centerlongitude = String(obj.centerlongitude);
				param.centerlatitude = String(obj.centerlatitude);
			}
			else if ("3" == obj.level)
			{
				//				evt = new SceneEvent(SceneEvent.CHANGE_VECTOR_MAPVIEW);
				log.info("进入地市");
				param.level = String(obj.level);
				param.cityId = String(obj.id);
				param.cityName = String(obj.name);
				param.currentMapType = user.mapType;
				param.areaId = "";
				if(null!=obj.centerlongitude&&null!=obj.centerlatitude){
					param.centerlongitude = String(obj.centerlongitude);
					param.centerlatitude = String(obj.centerlatitude);
				}
			}
			else if ("4" == obj.level)
			{
				//				evt = new SceneEvent(SceneEvent.CHANGE_VECTOR_MAPVIEW);
				log.info("进入区县");
				param.level = String(obj.level);
				param.areaId = "";
				param.cityId = String(obj.id);
				param.cityName = String(obj.name);
				//				param.currentMapType = user.mapType;
				param.currentMapType = '0';
				if(null!=obj.centerlongitude&&null!=obj.centerlatitude){
					param.centerlongitude = String(obj.centerlongitude);
					param.centerlatitude = String(obj.centerlatitude);
				}
			}
			else
			{
				log.error("level 设置错误，当前选择节点:[{0}]。", obj);
				return;
			}
			/**触发事件类型
			 * 同级别，则直接刷新数据即可，触发CHANGE_MAPVIEW。
			 * 不同级别，触发CHANGE_VIEW。
			 * */
			//				if(obj.level == user.level){
			//					//同级别，则直接刷新数据即可，触发CHANGE_MAPVIEW。
			//					evt = new SceneEvent(SceneEvent.CHANGE_MAPVIEW);
			//				}else{
			//					//不同级别，触发CHANGE_VIEW。
			//					//				evt = new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_BACKTOPFLOOR);
			//					evt = new SceneEvent(SceneEvent.CHANGE_VIEW);
			//				}
			//				evt.param = param;
			//				user.refreshPolygon = false;
			//				log.info("~~~~~点击tree节点，抛出事件:");
			//				log.info(evt.param);
			//				log.info(user);
			//				dispatchMsg(evt);
			log.info(param);
			user.level = param.level;
			user.layerId = param.layerId;
			user.layerurl = param.layerurl;
			if(param.cityId && param.cityId!=""){
				user.cityId = param.cityId;
				user.cityName = param.cityName;
			}
			user.currentMapType = param.currentMapType;
			if(param.areaId){
				user.areaId = param.areaId;
			}
			var e:SceneEvent = new SceneEvent("VIEW_CHANGE");
			e.param = new Object();
			if(param.currentMapType=="0"){
				e.param.currentState="gisMap";
				e.param.iscounty=true;
			}else{
				e.param.currentState="vectorMap";
				e.param.iscounty=false;
			}
			//				e.param.currentState = user.mapType=="0"?"gisMap":"vectorMap";
			e.param.city_id=param.cityId;
			//				e.param.logicalType=user.logicalType;
			e.param.level=param.level;
			e.param.city_name=param.cityName;
			e.param.centerlongitude = param.centerlongitude;
			e.param.centerlatitude = param.centerlatitude;
			dispatcher(e);
		}
		
		/**
		 * 
		 * 普通场景地图事件。
		 * 
		 * */
		private function doGeneralChangeMapView(obj:Object):void{
			var evt:SceneEvent = null;
			log.info(obj);
			if (obj.name == "高速")
			{
				obj = dealParams(stdm.treeData);
				log.info('高速');
				log.info(obj);
			}
			else if (obj.name == "国道" || obj.name == "省道" || obj.name == "城市道路")
			{
				Alert.show("尚未配置……", "提示");
				return;
			}
			log.info("getSceneInfo--------3");
			var param:Object = {};
			//level 1:场景   2：区域    3：地市
			if ("1" == obj.level)
			{
				param.level = "1";
				param.areaId = "";
				param.cityId = GsSceneConts.Province_KEY;
				param.cityName = "";
				param.currentMapType = user.mapType;
				param.layerId = user.initLayerId;
				param.layerurl = user.initLayerUrl;
			}
			else if ("2" == obj.level)
			{
				param.areaId = String(obj.id);
				param.level = obj.level;
				param.cityId = obj.cityId;
				param.currentMapType = "0";
				param.centerlongitude = String(obj.centerlongitude);
				param.centerlatitude = String(obj.centerlatitude);
			}
			else if ("3" == obj.level)
			{
				param.level = String(obj.level);
				param.cityId = String(obj.id);
				param.cityName = String(obj.name);
				param.currentMapType = "0";
				param.areaId = "";
				if(null!=obj.centerlongitude&&null!=obj.centerlatitude){
					param.centerlongitude = String(obj.centerlongitude);
					param.centerlatitude = String(obj.centerlatitude);
				}
			}
			else
			{
				log.error("level 设置错误，当前选择节点:[{0}]。", obj);
			}
			
			/**触发事件类型
			 * 同级别，则直接刷新数据即可，触发CHANGE_MAPVIEW。
			 * 不同级别，触发CHANGE_VIEW。
			 * */
			log.info(param);
			user.layerId = param.layerId;
			user.layerurl = param.layerurl;
			user.level = param.level;
			user.cityId = param.cityId;
			user.cityName = param.cityName;
			user.currentMapType = param.currentMapType;
			user.areaId = param.areaId;
			var e:SceneEvent = new SceneEvent("VIEW_CHANGE");
			e.param = new Object();
			if(param.currentMapType=="0"){
				e.param.currentState="gisMap";
				e.param.iscounty=true;
			}else{
				e.param.currentState="vectorMap";
				e.param.iscounty=false;
			}
			//				e.param.currentState = user.mapType=="0"?"gisMap":"vectorMap";
			e.param.city_id=param.cityId;
			//				e.param.logicalType=user.logicalType;
			e.param.level=param.level;
			e.param.city_name=param.cityName;
			e.param.centerlongitude = param.centerlongitude;
			e.param.centerlatitude = param.centerlatitude;
			dispatcher(e);
		}
		
		public function dealParams(xml:XML):Object
		{
			var params:Object = {};
			params.id = String(xml.attribute("id"));
			params.name = String(xml.attribute("name"));
			params.level = String(xml.attribute("level"));
			params.cityId = String(xml.attribute("cityId"));
			params.centerlongitude = String(xml.attribute("centerlongitude"));
			params.centerlatitude = String(xml.attribute("centerlatitude"));
			return params;
		}
	}
}