package com.linkage.module.cms.general.monitor.base.core
{
	import com.linkage.module.cms.general.monitor.base.core.data.DataManager;
	import com.linkage.module.cms.general.monitor.base.core.data.IDataManager;
	import com.linkage.module.cms.general.monitor.common.map.MapWork;
	import com.linkage.module.cms.general.monitor.datamanager.RemoteDataManager;
	import com.linkage.module.cms.general.monitor.monitorView;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayList;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import spark.components.Group;

	/**
	 * 核心的展示舞台(供一二两级视图使用)
	 * @author duangr
	 *
	 */
	public class CoreStage extends Group
	{
		//日志
		public var log:ILogger = Log.getLogger("com.linkage.module.cms.general.monitor.base.core.CoreStage");
		//参数对象
		private var _parameters:Object = null;
		// 存放多个地图
		private var _viewMaps:Dictionary = null;
		//场景监控对象
		private var _sceneView:monitorView = null;
		// 当前视图id
		private var _curViewId:String = null;
		//地图容器
		private var _mapWork:MapWork = null;
		// 交互数据管理器
		private var _dataManager:IDataManager = null;
		//数据接口
		private var remoteData:RemoteDataManager = null;
		//专业
		private var specList:ArrayList = new ArrayList();
		//是否显示一级告警
		private var _showAlarmLevel1:Boolean = true;
		//是否显示二级告警
		private var _showAlarmLevel2:Boolean = false;

		public function CoreStage()
		{
			_mapWork = new MapWork();
			_mapWork.height = 500;
			_dataManager = new DataManager();
		}

		public function get showAlarmLevel2():Boolean
		{
			return _showAlarmLevel2;
		}

		public function set showAlarmLevel2(value:Boolean):void
		{
			_showAlarmLevel2 = value;
		}

		public function get showAlarmLevel1():Boolean
		{
			return _showAlarmLevel1;
		}

		public function set showAlarmLevel1(value:Boolean):void
		{
			_showAlarmLevel1 = value;
		}

		public function get sceneView():monitorView
		{
			return _sceneView;
		}

		public function set sceneView(value:monitorView):void
		{
			_sceneView = value;
		}

		public function get mapWork():MapWork
		{
			return _mapWork;
		}

		public function set mapWork(value:MapWork):void
		{
			_mapWork = value;
		}

		/**
		 *加载舞台视图
		 * @param mapUrl 地图url
		 * @param butUrl 按钮url
		 * @param viewUrl 视图url
		 * @param levelId 默认视图
		 *
		 */
		public function initStage(param:Object, _remoteData:RemoteDataManager):void
		{
			parameters = param;
			if (param.config != null)
			{
				var configXml:XML = (param.config as XML);
				//读取显示的专业
				var filterConfigs:XMLList = configXml.child("filter");
				if (filterConfigs != null && filterConfigs.length() > 0)
				{
					var specs:XMLList = filterConfigs.child("spec");
					for each (var spec:XML in specs)
					{
						var id:String = spec.@id;
						specList.addItem(id);
					}
				}
			}

			remoteData = _remoteData;
			//加载地图和视图
			initMap();
		}

		/**
		 *根据url加载地图
		 *
		 */
		private function initMap():void
		{
			log.info("根据url加载地图 mapUrl = " + parameters.mapConf);
			_dataManager.loadDataByUrl(parameters.mapConf, function(xml:XML):void
				{
					mapWork.xmlData = xml;
					mapWork.showMap();
					initView();
				}, function():void
				{
					throw new Error("初始化地图数据失败.");
				});
		}

		/**
		 *根据url加载xml文件
		 *
		 */
		private function initView():void
		{
			log.info("根据url加载xml文件 viewUrl = " + parameters.viewConf);
			_dataManager.loadDataByUrl(parameters.viewConf, function(xml:XML):void
				{
					//1.解析xml文件
					parseXML(xml);
					//2.初始化告警流水
					//sceneView.initStage();
					//3.展示默认视图
					showView(parameters.viewId);
				}, function():void
				{
					throw new Error("初始化标记数据失败.");
				});
		}

		/**
		 * 解析XML文件
		 * @param xml
		 * @param butUrl
		 *
		 */
		private function parseXML(xml:XML):void
		{
			// 先清空缓存
			_viewMaps = new Dictionary();
			var viewNodes:XMLList = xml.child("view");
			// 遍历解析多个视图
			for each (xml in viewNodes)
			{
				var view:ViewSlice = new ViewSlice(this, mapWork, xml);
				view.percentWidth = 100;
				view.percentHeight = 100;
				_viewMaps[view.viewId] = view;
			}
		}

		/**
		 *返回当前视图
		 * @param viewId
		 * @return
		 *
		 */
		public function getCurViewStage(viewId:String):ViewSlice
		{
			var view:ViewSlice = (_viewMaps[viewId] as ViewSlice);
			if (view != null)
			{
				return view;
			}
			return null;
		}

		/**
		 * 展示指定的视图
		 * @param viewId
		 *
		 */
		public function showView(viewId:String):Boolean
		{
			//显示展示的视图
			var view:ViewSlice = (_viewMaps[viewId] as ViewSlice);
			if (view != null)
			{
				this.removeAllElements();
				view.show();
				view.showMap();
				_curViewId = viewId;
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public function showViewSlice():void
		{
			//显示展示的视图
			var view:ViewSlice = (_viewMaps[_curViewId] as ViewSlice);
			view.showView();
		}
		
		public function hideViewSlice():void
		{
			//显示展示的视图
			var view:ViewSlice = (_viewMaps[_curViewId] as ViewSlice);
			view.hideView();
		}

		/**
		 * 调用界面数据
		 * @param city
		 *
		 */
		public function getViewData(city:String, _refreshData:Function, _errData:Function):void
		{
			//根据当前选中的一级告警 和二级告警选项加载数据
			var alarmLevel:String = "";
			if(showAlarmLevel1 && !showAlarmLevel2)
			{
				alarmLevel = "1";
			}
			else if(showAlarmLevel2 && !showAlarmLevel1)
			{
				alarmLevel = "2";
			}
			else if (showAlarmLevel1 && showAlarmLevel2)
			{
				alarmLevel = "1,2";
			}
			else
			{
				alarmLevel = "1,2";
			}
			
			//查询告警
			remoteData.getDataView(specList, alarmLevel, _refreshData, null, _errData);
		}

		/**
		 * 查询属地数据
		 * @param city
		 *
		 */
		public function getCityData(loadCityData:Function, loadCityErr:Function):void
		{
			remoteData.getCityInfo(loadCityData, null, loadCityErr);
		}

		public function get parameters():Object
		{
			return _parameters;
		}

		public function set parameters(value:Object):void
		{
			_parameters = value;
		}
	}
}