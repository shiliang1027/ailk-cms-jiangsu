package com.linkage.module.cms.gsscene.view.components.scenetree
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.common.util.GsSceneConts;
	import com.linkage.module.cms.gsscene.view.components.scenetree.SceneTreeDM;
	import com.linkage.module.cms.gsscene.view.components.scenetree.event.SceneTreeEvent;
	
	import mx.controls.Alert;
	import mx.controls.Tree;
	import mx.events.ListEvent;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneTreeCompPM
	{
		private var log:ILogger = Log.getLoggerByClass(SceneTreeCompPM);

		[Inject("user")]
		public var user:IUser;

		[Inject("sceneTreeDM")]
		[Bindable]
		public var stdm:SceneTreeDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		//获取导航tree
		public function getSceneAreaList():void
		{
			log.info("----------------------");
			var evt:SceneTreeEvent = new SceneTreeEvent(SceneTreeEvent.SCENE_AREA_XML);
//			dispatchMsg(evt);
			requestServerUtil.addRequest(evt);
		}
		//获取导航tree(新场景导航树)
		public function getSceneTreeList():void
		{
			var evt:SceneTreeEvent = new SceneTreeEvent(SceneTreeEvent.SCENE_TREE_XML);
//			dispatchMsg(evt);
			requestServerUtil.addRequest(evt);
		}
		//点击节点触发事件获取节点信息并且抛出事件
		public function getSceneInfo(event:ListEvent):void
		{
			var obj:XML = Tree(event.currentTarget).selectedItem as XML;
			var params:Object = dealParams(obj);
			log.info(params);
			log.info("getSceneInfo--------1");
			var evt:SceneEvent = new SceneEvent("DEAL_SCENE_CHANGE");
			evt.param = params;
			dispatchMsg(evt);
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
			if(obj.level == user.level){
				//同级别，则直接刷新数据即可，触发CHANGE_MAPVIEW。
				evt = new SceneEvent(SceneEvent.CHANGE_MAPVIEW);
			}else{
				//不同级别，触发CHANGE_VIEW。
//				evt = new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_BACKTOPFLOOR);
				evt = new SceneEvent(SceneEvent.CHANGE_VIEW);
			}
			evt.param = param;
			user.refreshPolygon = false;
			log.info("~~~~~点击tree节点，抛出事件:");
			log.info(evt.param);
			log.info(user);
			dispatchMsg(evt);
		}
		
		/**
		 * 
		 * 普通场景地图事件。
		 * 
		 * */
		private function doGeneralChangeMapView(obj:Object):void{
			var evt:SceneEvent = null;
			if (obj.name == "高速")
			{
				obj = dealParams(stdm.treeData);
				log.info('高速');
				log.info(obj);
			}
			else if (obj.name == "国道" || obj.attribute("name") == "省道" || obj.attribute("name") == "城市道路")
			{
				Alert.show("尚未配置……", "提示");
				return;
			}
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
//				user.areaId = "";
//				user.level = obj.level;
//				user.cityId = "00";
//				user.currentMapType = user.mapType;
			}
			else if ("2" == obj.level)
			{
				param.areaId = String(obj.id);
				param.level = obj.level;
				param.cityId = obj.cityId;
				param.currentMapType = "0";
				param.centerlongitude = String(obj.centerlongitude);
				param.centerlatitude = String(obj.centerlatitude);
				
//				user.areaId = String(obj.id);
//				user.level = obj.level;
//				user.cityId = obj.cityId;
//				user.currentMapType = "0";
//				evt.param = new Object();
//				evt.param.centerlongitude = String(obj.centerlongitude);
//				evt.param.centerlatitude = String(obj.centerlatitude);
			}
			else if ("3" == obj.level)
			{
				log.info("tree 如果进入地市，那么父节点为{0}", obj.parent());
				param.level = String(obj.level);
				param.cityId = String(obj.id);
				param.cityName = String(obj.name);
				param.currentMapType = user.mapType;
				param.areaId = "";
				if(null!=obj.centerlongitude&&null!=obj.centerlatitude){
					param.centerlongitude = String(obj.centerlongitude);
					param.centerlatitude = String(obj.centerlatitude);
				}
//				user.areaId = '';
//				user.level = obj.attribute("level");
//				user.cityId = obj.attribute("id");
//				user.currentMapType = "0";
//				evt.param = new Object();
//				evt.param.centerlongitude = String(obj.centerlongitude);
//				evt.param.centerlatitude = String(obj.centerlatitude);
			}
			else
			{
				log.error("level 设置错误，当前选择节点:[{0}]。", obj);
			}
			
			/**触发事件类型
			 * 同级别，则直接刷新数据即可，触发CHANGE_MAPVIEW。
			 * 不同级别，触发CHANGE_VIEW。
			 * */
			if(obj.level == user.level){
				//同级别，则直接刷新数据即可，触发CHANGE_MAPVIEW。
				evt = new SceneEvent(SceneEvent.CHANGE_MAPVIEW);
			}else{
				//不同级别，触发CHANGE_VIEW。
				evt = new SceneEvent(SceneEvent.CHANGE_VIEW);
			}
			evt.param = param;
			user.refreshPolygon = false;
			log.info("~~~~~点击tree节点，抛出事件:");
			log.info(evt.param);
			log.info(user);
			dispatchMsg(evt);
		}
		
	}
}

