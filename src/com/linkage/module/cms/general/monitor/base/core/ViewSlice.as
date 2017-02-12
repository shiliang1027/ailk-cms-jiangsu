package com.linkage.module.cms.general.monitor.base.core
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.common.Constants;
	import com.linkage.module.cms.common.columnar.ColumnarLabel;
	import com.linkage.module.cms.common.columnar.ColumnarNode;
	import com.linkage.module.cms.common.columnar.ColumnarWork;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.general.monitor.AlarmConstants;
	import com.linkage.module.cms.general.monitor.Params;
	import com.linkage.module.cms.general.monitor.base.core.container.component.LegendNavbar;
	import com.linkage.module.cms.general.monitor.base.core.data.DataManager;
	import com.linkage.module.cms.general.monitor.base.core.data.IDataManager;
	import com.linkage.module.cms.general.monitor.base.core.element.ElementFactory;
	import com.linkage.module.cms.general.monitor.base.core.element.IAreaMark;
	import com.linkage.module.cms.general.monitor.base.core.element.ILegend;
	import com.linkage.module.cms.general.monitor.base.core.element.IMark;
	import com.linkage.module.cms.general.monitor.base.core.element.Legend;
	import com.linkage.module.cms.general.monitor.base.core.element.Mark;
	import com.linkage.module.cms.general.monitor.common.map.MapNode;
	import com.linkage.module.cms.general.monitor.common.map.MapWork;
	import com.linkage.module.cms.general.monitor.util.ViewUtil;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log; 

	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;

	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.controls.CheckBox;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	import spark.components.Group;

	/**
	 * 视图切片
	 * @author duangr
	 *
	 */
	public class ViewSlice extends Group
	{
		//日志
		//添加地图和标记容器
		public var log:ILogger = Log.getLogger("com.linkage.module.cms.general.monitor.base.core.ViewSlice");
		private var _mapMarkCanvas:Canvas = null;
		// 舞台容器
		private var _coreStage:CoreStage = null;
		// 视图的Id
		private var _viewId:String = null;
		//是否编辑
		private var _isEdit:Boolean = false;
		//地图容器
		private var _mapWork:MapWork = null;
		// 事件监听
		private var _listener:UIListener = null;
		// 模板标记对象Map
		private var _markMap:Dictionary = null;
		//图例标记对象Map
		private var _legendMap:Dictionary = null;
		// 区域标记对象Map
		private var _areaMarkMap:Dictionary = null;
		//是否展示柱状图
		private var _isShowColumnar:Boolean = false;
		// 交互数据管理器
		private var _dataManager:IDataManager = null;
		//图例
		private var legendNavbar:LegendNavbar = null;
		//缓存数据
		private var dataObj:Object = null;
		//缓存性能数据
		private var perfDataObj:Object = null;
		//缓存属地名称和编号的对应关系
		private var cityMap:Dictionary = new Dictionary();
		//标签是否显示
		private var markShowMap:Dictionary = new Dictionary();
		//
		private var viewDataRemote:RemoteObject = null;
		//定时任务
		private var alarmTimer:Timer = new Timer(5000);
		private var perfTimer:Timer = new Timer(900000);
		//等待信息
		private var load:LoadManager = null;

		public function ViewSlice(coreStage:CoreStage, mapWork:MapWork, data:XML)
		{
			_mapWork = mapWork;
			_coreStage = coreStage;
			_markMap = new Dictionary();
			_mapMarkCanvas = new Canvas();
			_mapMarkCanvas.verticalCenter = 0;
			addElement(_mapMarkCanvas);
			_legendMap = new Dictionary();
			_areaMarkMap = new Dictionary();
			_dataManager = new DataManager();
			_listener = new UIListener(this);

			//显示等待信息
			load = new LoadManager(_coreStage.sceneView.baseViewGroup);
			load.showLoading("正在加载数据，请稍候");

			//初始化数据
			initData();

			//设置定时任务
			alarmTimer.addEventListener(TimerEvent.TIMER, getViewData);
			alarmTimer.start();
			//-------------------------------------历史回退修改------------------------------------
//			parentApplication.add(alarmTimer);
			//-------------------------------------历史回退修改------------------------------------

			//解析地图文件
			parseXML(data);
		}

		public function showView():void
		{
			if(alarmTimer != null && !alarmTimer.running)
			{
				alarmTimer.start();
				//-------------------------------------历史回退修改------------------------------------
				parentApplication.add(alarmTimer);
					//-------------------------------------历史回退修改------------------------------------
			}
			if(perfTimer != null && !perfTimer.running)
			{
				perfTimer.start();
				//-------------------------------------历史回退修改------------------------------------
				parentApplication.add(perfTimer);
					//-------------------------------------历史回退修改------------------------------------

			}
		}

		public function hideView():void
		{
			if(alarmTimer != null && alarmTimer.running)
			{
				alarmTimer.stop();
				//-------------------------------------历史回退修改------------------------------------
				parentApplication.remove(alarmTimer);
					//-------------------------------------历史回退修改------------------------------------
			}
			if(perfTimer != null && perfTimer.running)
			{
				perfTimer.stop();
				//-------------------------------------历史回退修改------------------------------------
				parentApplication.remove(perfTimer);
					//-------------------------------------历史回退修改------------------------------------
			}
		}

		/**
		 * 初始化基础数据
		 *
		 */
		private function initData():void
		{
			_coreStage.getCityData(loadCityData, loadCityErr);
		}

		public function loadCityData(obj:Object):void
		{
			if(obj != null)
			{
				log.info("查询到属地数据：" + obj);
				for each(var city:Object in obj)
				{
					cityMap[city.city_id] = city.city_name;
				}
				obj = null;
			}
			else
			{
				log.error("没有查询到属地数据");
			}
		}

		public function loadCityErr(obj:Object):void
		{
			log.error("获取属地数据异常");
			obj = null;
		}

		/**
		 * 时间已到,触发刷新数据事件
		 * @param event
		 *
		 */
		private function getViewData(event:TimerEvent = null):void
		{
			//创建属地id数组和标记id数组
			//var areaIdArr:String = getAreaIdArrStr();

			//取数据
			_coreStage.getViewData("", refreshData, errData);
		}

		public function refreshData(obj:Object):void
		{
			if(obj != null)
			{
				log.info("查询主界面告警数据：" + obj);
				for each(var warnData:Object in obj)
				{
					for each(var areaMark:IAreaMark in _areaMarkMap)
					{
						if(areaMark.areaId == warnData.city)
						{
							if(areaMark.name == '工单')
							{
								log.info("工单数据：{0},city:{1}", warnData[areaMark.name], warnData.city);
							}

							if(!_coreStage.showAlarmLevel1 && !_coreStage.showAlarmLevel2)
							{
								if(areaMark.name == '告警' || areaMark.name == '性能')
								{
									refreshAlarm(areaMark, '0', 2, true);
								}
								else
								{

									refreshAlarm(areaMark, warnData[areaMark.name], 2, true);
								}
							}
							else
								refreshAlarm(areaMark, warnData[areaMark.name], 2, true);
						}
					}
				}

				dataObj = obj;
				obj = null;
			}
			else
			{
				log.error("没有获取到主界面数据");
					//Alert.show("获取主界面数据为空！");
			}

			load.hideLoading();
		}

		public function errData(obj:Object):void
		{
			log.error("获取主界面数据异常");
			//Alert.show("获取主界面数据异常！");
			obj = null;
			load.hideLoading();
		}

		/**
		 *显示或隐藏柱状图
		 * @param flag
		 *
		 */
		public function showHideColumnar(flag:Boolean):void
		{
			_isShowColumnar = flag;
		}

		/**
		 * 属地id数组和标记id数组
		 * @return
		 *
		 */
		private function getAreaIdArrStr():String
		{
			var flag:Boolean = false;
			var areaIdArr:String = "";
			var areaMark:IAreaMark = null;
			for each(areaMark in _areaMarkMap)
			{
				if(flag)
				{
					areaIdArr += ",";
				}
				areaIdArr += areaMark.areaId;
				flag = true;
			}
			return areaIdArr;
		}

		/**
		 *刷新告警信息
		 *
		 */
		private function refreshAlarm(areaMark:IAreaMark, value:String, statue:int, isRefresh:Boolean):void
		{
			if(areaMark != null)
			{
				areaMark.text = value;
				areaMark.shineStatu = statue;
				if(isRefresh)
				{
					areaMark.refresh();
//					if (value != "0" && statue == 2)
//					{
//						setTimeout(areaMark.startShine,3000);
//					}
//					else
//					{
//						areaMark.stopShine();
//					}
				}
			}
		}

		/**
		 *刷新改变颜色
		 * @param type 类型
		 * @param areaId 属地ID
		 * @param value 改变颜色
		 *
		 */
		public function refresh(type:String, areaId:String, value:String, statue:int, isRefresh:Boolean):void
		{
			var markId:String = buildAreaMarkId(areaId, type);
			var areaMark:IAreaMark = _areaMarkMap[markId] as IAreaMark;
			if(areaMark != null)
			{
				areaMark.changeValue = value;
				areaMark.shineStatu = statue;
				if(isRefresh)
				{
					areaMark.refresh();
					if(statue == 2)
					{
						areaMark.startShine();
					}
					else
					{
						areaMark.stopShine();
					}
				}
			}
		}

		/**
		 * 获取视图的ID
		 * @return
		 *
		 */
		public function get viewId():String
		{
			return _viewId;
		}

		/**
		 * 显示此视图
		 *
		 */
		public function show():void
		{
			_coreStage.addElement(this);
			startShineByTime();
			getViewData();
		}

		/**
		 *最高等级一直发光
		 *
		 */
		public function startShineByTime():void
		{
			var areaMark:IAreaMark = null;
			for each(areaMark in _areaMarkMap)
			{
				areaMark.refresh();
				if(areaMark.shineStatu == 2)
				{
					areaMark.startShine();
				}
				else if(areaMark.shineStatu == 1)
				{
					areaMark.startShineByTime();
				}
				else
				{
					areaMark.stopShine();
				}
			}
		}

		/**
		 *最高等级一直发光
		 *
		 */
		public function startShine():void
		{
			var areaMark:IAreaMark = null;
			for each(areaMark in _areaMarkMap)
			{
				areaMark.refresh();
				if(areaMark.shineStatu == 2)
				{
					areaMark.startShine();
				}
				else if(areaMark.shineStatu == 1)
				{
					areaMark.stopShineByStaute();
				}
				else
				{
					areaMark.stopShine();
				}
			}
		}

		/**
		 * 显示此地图
		 *
		 */
		public function showMap():void
		{
			_mapWork.refleshMap();
			_mapMarkCanvas.addElementAt(_mapWork, 0);
		}

		/**
		 * 解析具体视图的XML
		 * @param xml
		 *
		 */
		private function parseXML(data:XML):void
		{
			//初始化图例
			legendNavbar = _coreStage.sceneView.legendBar;

			//初始化视图参数
			_viewId = data.@id;
			//读取配置文件
			loadConfigXml();
			// 解析 marks
			parseMarkXML(data);
			// 解析 legends
			parseLegendXML(data);
			//解析 filter
			parseFilterXML(data);
			// 解析 areas
			parseAreaMarkXML(data);
		}

		/**
		 * 解析 marks
		 * @param data
		 *
		 */
		private function parseMarkXML(data:XML):void
		{
			var param:Object = getWebParam();
			var specArray:Object = new Object();
			if(param[AlarmConstants.PARAMKEY_SPECJSON] != null)
			{
				specArray = jsonDecode(param[AlarmConstants.PARAMKEY_SPECJSON]);
			}
			var xml:XML = null;
			// 解析 marks
			var markList:XMLList = data.child("marks")[0].child("mark");
			for each(xml in markList)
			{
				var mark:IMark = createMark(xml);
				if(ViewUtil.isHaveSpecRole(mark.spec, specArray))
				{
					_markMap[mark.type] = mark;
				}
			}
		}

		/**
		 * 解析 areas
		 * @param data
		 *
		 */
		private function parseAreaMarkXML(data:XML):void
		{
			var xml:XML = null;
			var areaList:XMLList = data.child("areas")[0].child("area");
			for each(xml in areaList)
			{
				var areaId:String = xml.@id;
				//if (ViewUtil.isHaveCityRole(areaId, cityMap))
				if(true)
				{
					var areaName:String = xml.@name;
					var areaMarkList:XMLList = xml.child("mark");
					var areaMarkXml:XML = null;
					for each(areaMarkXml in areaMarkList)
					{
						var areaMark:IAreaMark = createAreaMark(areaId, areaMarkXml);
						if(areaMark != null)
						{
							_areaMarkMap[areaMark.id] = areaMark;
						}
					}
				}
			}
		}

		/**
		 *解析 legends
		 * @param data
		 *
		 */
		private function parseLegendXML(data:XML):void
		{
			var legends:XML = data.child("legends")[0];
			var legendList:XMLList = legends.child("legend");
			var lgMark:XML = null;
			var legend:XML = null;
			var lgMap:Dictionary = null;
			var outIndex:int = 0;
			for each(legend in legendList)
			{
				lgMap = new Dictionary();
				var lgMarkList:XMLList = legend.child("mark");
				var inIndex:int = 0;
				for each(lgMark in lgMarkList)
				{
					var legendMark:ILegend = createLegend(lgMark);
					lgMap[inIndex++] = legendMark;
				}
				_legendMap[outIndex++] = lgMap;
			}

			//创建图例
			createLegendNavbar(legends, _legendMap);
		}

		/**
		 *解析 filter
		 * @param data
		 *
		 */
		private function parseFilterXML(data:XML):void
		{
			var filters:XML = data.child("filters")[0];
			var filterList:XMLList = filters.child("filter");

			//设置过滤框样式
			var left:int = 0;
			var top:int = int(filters.@top);
			if(filters.@location == "left")
			{
				left = _coreStage.width - 21;
			}
			legendNavbar.setFilterNavbarStyle(top, left, filters.@location);

			//设置过滤框内容
			var filter:XML = null;
			for each(filter in filterList)
			{
				legendNavbar.addFilterBox(filter.@grade, filter.@name, filterListener);
			}
		}

		//过滤告警等级
		public function filterListener(selected:Boolean, grade:String):void
		{
			log.info("selected=" + selected + " grade=" + grade);
			if(grade == "1")
			{
				_coreStage.showAlarmLevel1 = selected;
			}
			if(grade == "2")
			{
				_coreStage.showAlarmLevel2 = selected;
			}

			//刷新数据
			getViewData();
		}

		/**
		 *创建图例
		 * @param data
		 *
		 */
		private function createLegendNavbar(data:XML, legendMap:Dictionary):void
		{
			var left:int = 0;
			var top:int = int(data.@top);
			if(data.@location == "left")
			{
				left = _coreStage.width - 21;
			}
			legendNavbar.setNavbarStyle(top, left, data.@location);

			legendNavbar.createLegendMarks(_markMap, legendMap, switchLegend);
		}

		/**
		 *加载地图变色
		 * @param kpiId
		 * @param column
		 *
		 */
		private function getMapQuotaColorData(kpiId:String, column:String):void
		{
			//关闭柱状图
			var param:String = kpiId + "," + column;
			var url:String = "../level2/view/view!getMapQuotaColorData.action";
			_dataManager.loadDataByParamAndUrl(param, url, function(xml:XML):void
				{
					_mapWork.fillMap(xml);
				}, function():void
				{
					throw new Error("初始化数据失败.");
				});
		}

		/**
		 * 创建模板图例对象
		 * @param data
		 * @return
		 *
		 */
		private function createLegend(data:XML):ILegend
		{
			var legend:ILegend = new Legend();
			legend.type = data.@type;
			legend.color = data.@color;
			legend.level = data.@level;
			return legend;
		}

		/**
		 * 创建模板标记对象
		 * @param data
		 * @return
		 *
		 */
		private function createMark(data:XML):IMark
		{
			var mark:IMark = new Mark();
			mark.type = data.@type;
			mark.spec = data.@spce;
			mark.name = data.@name;
			mark.text = data.@text;
			mark.width = data.@width;
			mark.height = data.@height;
			mark.color1 = (data.@color1 == null) ? 0 : uint(data.@color1);
			mark.color2 = (data.@color2 == null) ? 0 : uint(data.@color2);
			mark.lineColor = (data.@lineColor == null) ? 0 : uint(data.@lineColor);
			mark.visible = ("true" == data.@visible) ? true : false;
			mark.show = data.@show;

			//确定当前标签是否显示
			if(markShowMap[mark.type] != null && markShowMap[mark.type] == "none")
			{
				mark.visible = false;
			}

			return mark;
		}

		/**
		 * 读取配置文件
		 *
		 */
		private function loadConfigXml():void
		{
			//读取视图配置文件
			if(_coreStage.parameters.config != null)
			{
				var configXml:XML = (_coreStage.parameters.config as XML);
				var baseViewConfigs:XMLList = configXml.child("base_view");

				if(baseViewConfigs != null && baseViewConfigs.length() > 0)
				{
					var markConfigs:XMLList = baseViewConfigs.child("marks")[0].child("mark");

					if(markConfigs != null && markConfigs.length() > 0)
					{
						for each(var markConfig:XML in markConfigs)
						{
							var key:String = markConfig.@type;
							var display:String = markConfig.@display;
							markShowMap[key] = display;
						}
					}
				}
			}
		}

		/**
		 * 创建区域标记对象
		 * @param areaId
		 * @param data
		 * @return
		 *
		 */
		private function createAreaMark(areaId:String, data:XML):IAreaMark
		{
			var areaMark:IAreaMark = null;
			// 先获取模板mark
			var markType:String = data.@type;
			var mark:IMark = _markMap[markType];
			if(mark != null)
			{
				//计算标记相对于地图的偏移坐标
				var offsetX:int = int(data.@x);
				var offsetY:int = int(data.@y);
				var mapNode:MapNode = _mapWork.elementBox.getElementById(areaId + "_a") as MapNode;
				if(mapNode != null)
				{
					offsetX += mapNode.x;
					offsetY += mapNode.y;
				}
				// 根据模板mark生成areaMark对象
				areaMark = ElementFactory.buildAreaMark(offsetX, offsetY, mark);
				areaMark.id = buildAreaMarkId(areaId, markType);
				areaMark.areaId = areaId;
				areaMark.stage = _mapMarkCanvas;
				if(data.@text != null && data.@text != '')
				{
					areaMark.text = data.@text;
				}
				//默认是否可见
				if(mark.show == "false")
				{
					areaMark.visible = false;
				}
				else
				{
					areaMark.visible = true;
				}
				areaMark.show();
			}
			return areaMark;
		}

		/**
		 *获取标记提示信息
		 * @param type 类型
		 * <li>1：设备告警
		 * <li>2：性能告警
		 * <li>3：故障工单
		 * <li>4：重大新闻
		 * <li>...
		 * @param areaId 属地ID
		 * @return
		 */
		public function getAreaMarkTipInfo(type:String, areaId:String):Object
		{
			var result:Object = new Object();

			if(type == "1")
			{
				result.title = "告警统计信息";
				if(dataObj != null)
				{
					for each(var warnData:Object in dataObj)
					{
						if(warnData.city == areaId)
						{
							result.dataList = warnData["AlarmMatrix"];
						}
					}
				}
			}
			if(type == "7")
			{
				result.title = "性能统计信息";
				if(dataObj != null)
				{
					for each(var warnData1:Object in dataObj)
					{
						if(warnData1.city == areaId)
						{
							result.dataList = warnData1["perfMatrix"];
						}
					}
				}
			}

			return result;
		}

		/**
		 *当前区域的标记位移
		 * @param areaId
		 *
		 */
		public function curAreaMarkOver(areaId:String):void
		{
			var areaMark:IAreaMark = null;
			for each(areaMark in _areaMarkMap)
			{
				if(areaMark.areaId == areaId)
				{
					if(!areaMark.isMove)
					{
						areaMark.isMove = true;
						areaMark.y -= Constants.MOUSEOVER_REMOTE_NUM;
						areaMark.renderer.y -= Constants.MOUSEOVER_REMOTE_NUM;
					}
				}
			}
		}

		/**
		 *当前区域的标记复原
		 * @param areaId
		 *
		 */
		public function curAreaMarkOut(areaId:String):void
		{
			var areaMark:IAreaMark = null;
			for each(areaMark in _areaMarkMap)
			{
				if(areaMark.areaId == areaId)
				{
					if(areaMark.isMove)
					{
						areaMark.isMove = false;
						areaMark.y += Constants.MOUSEOVER_REMOTE_NUM;
						areaMark.renderer.y += Constants.MOUSEOVER_REMOTE_NUM;
					}
				}
			}
		}

		/**
		 *获取web传过来的参数对象
		 * @return
		 *
		 */
		public function getWebParam():Object
		{
			return _coreStage.parameters;
		}

		/**
		 *切换视图
		 * @param viewId
		 *
		 */
		public function switchView(viewId:String):void
		{
			//查找属地
			var cityName:String = "";
			for each(var map:XML in _mapWork.xmlData.map)
			{
				if(map.@k == viewId)
				{
					cityName = map.@n;
				}
			}
			//截取属地编号
			var arr:Array = viewId.split("_");
			var city:String = "";
			if(arr != null && arr.length >= 2)
			{
				city = arr[0];
			}

			_coreStage.sceneView.switchView(city, cityName);
		}

		/**
		 * 点击图例切换界面显示用
		 * @param viewId
		 *
		 */
		public function switchLegend(selected:Boolean, type:String):void
		{
			if(selected)
			{
				for each(var mark1:IAreaMark in _areaMarkMap)
				{
					if(mark1.type == type)
					{
						mark1.visible = true;
						mark1.refresh();
					}
				}
			}
			else
			{
				for each(var mark2:IAreaMark in _areaMarkMap)
				{
					if(mark2.type == type)
					{
						mark2.visible = false;
						mark2.refresh();
					}
				}
			}

		}

		/**
		 * 查找目标对象(或其父对象)是那一种元素对象,找不到返回空
		 * @param target
		 * @return
		 *
		 */
		private static function findTargetCheckBox(target:Object):CheckBox
		{
			if(target == null)
			{
				return null;
			}

			while(!(target is CheckBox))
			{
				target = target.parent;

				if(target == null || target == target.parent)
				{
					return null;
				}
			}
			return target as CheckBox;
		}

		/**
		 * 构造唯一id
		 * @param areaId
		 * @param type
		 * @return
		 *
		 */
		private function buildAreaMarkId(areaId:String, type:String):String
		{
			return areaId + "_" + type;
		}

		public static function jsonDecode(str:String):Object
		{
			return JSON.decode(str.replace(/\'/g, "\""));
		}

		override public function toString():String
		{
			return "viewId:" + _viewId;
		}

		public function get isEdit():Boolean
		{
			return _isEdit;
		}

		public function set isEdit(value:Boolean):void
		{
			_isEdit = value;
		}

		public function get mapWork():MapWork
		{
			return _mapWork;
		}
	}
}