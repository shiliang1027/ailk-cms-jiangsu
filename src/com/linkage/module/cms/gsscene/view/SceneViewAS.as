import com.ailk.common.system.logging.ILogger;
import com.ailk.common.system.logging.Log;
import com.ailk.common.ui.chart.core.ChartParam;
import com.ailk.common.ui.chart.core.PrettyChartType;
import com.ailk.common.ui.chart.core.SerialParam;
import com.ailk.common.ui.chart.event.PrettyChartEvent;
import com.ailk.common.ui.components.mask.SimpleMask;
import com.ailk.common.ui.components.requestserver.RequestServerUtil;
import com.ailk.common.ui.components.window.standardwindow.Window;
import com.ailk.common.ui.components.window.standardwindow.event.WindowEvent;
import com.linkage.module.cms.gsscene.view.SceneViewPM;
import com.linkage.module.cms.gsscene.view.components.DegradationTOPN;
import com.linkage.module.cms.gsscene.view.components.EmgyResource;
import com.linkage.module.cms.gsscene.view.components.ImportantKPI;
import com.linkage.module.cms.gsscene.view.components.KPISituation;
import com.linkage.module.cms.gsscene.view.components.MapVectorShow;
import com.linkage.module.cms.gsscene.view.components.MapView;
import com.linkage.module.cms.gsscene.view.components.PerformanceIndex;
import com.linkage.module.cms.gsscene.view.components.QuitService;
import com.linkage.module.cms.gsscene.view.components.RaceInfoComp;
import com.linkage.module.cms.gsscene.view.components.ResMatrixComp;
import com.linkage.module.cms.gsscene.view.components.Roam;
import com.linkage.module.cms.gsscene.view.components.SceneAlarmFlow;
import com.linkage.module.cms.gsscene.view.components.SceneIntro;
import com.linkage.module.cms.gsscene.view.components.SceneTreeWin;
import com.linkage.module.cms.gsscene.view.components.SheetStat;
import com.linkage.module.cms.gsscene.view.components.TrainTimeTable;
import com.linkage.module.cms.gsscene.view.components.WeatherSituation;
import com.linkage.module.cms.gsscene.view.components.WorstCellPanel;
import com.linkage.module.cms.gsscene.view.components.common.components.CheckBoxComp;
import com.linkage.module.cms.gsscene.view.components.common.components.CompareDateVGroup;
import com.linkage.module.cms.gsscene.view.components.common.components.MaskInstructionTip;
import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
import com.linkage.module.cms.gsscene.view.components.common.util.GsSceneConts;
import com.linkage.module.cms.gsscene.view.components.kpicustom.event.KpiCustomEvent;
import com.linkage.module.cms.gsscene.view.components.kpisituation.KPISituationDM;
import com.linkage.module.cms.gsscene.view.components.kpisituation.event.KPISituationEvent;
import com.linkage.module.cms.gsscene.view.components.mapvector.MapVectorDM;
import com.linkage.module.cms.gsscene.view.components.mapvector.components.MapShowCfgWin;
import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
import com.linkage.module.cms.gsscene.view.components.mapview.MapViewPM;
import com.linkage.module.cms.gsscene.view.components.mapview.components.CameraListShowWin;
import com.linkage.module.cms.gsscene.view.components.quitservice.event.QuitServiceEvent;
import com.linkage.module.cms.gsscene.view.components.resmatrix.event.ResMatrixEvent;
import com.linkage.module.cms.gsscene.view.components.sceneintro.event.SceneIntroEvent;
import com.linkage.module.cms.gsscene.view.components.sceneview.SceneConfigDM;
import com.linkage.module.cms.gsscene.view.util.DateUtils;
import com.supermap.web.core.Unit;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.net.URLRequest;
import flash.net.navigateToURL;
import flash.utils.setTimeout;

import mx.charts.HitData;
import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.controls.DateField;
import mx.controls.Image;
import mx.core.UIComponent;
import mx.events.EffectEvent;
import mx.events.FlexEvent;
import mx.events.IndexChangedEvent;
import mx.events.ListEvent;
import mx.events.ResizeEvent;
import mx.managers.PopUpManager;
import mx.utils.StringUtil;

import spark.components.CheckBox;
import spark.components.Group;
import spark.components.Panel;
import spark.components.ToggleButton;
import spark.components.VGroup;
import spark.core.NavigationUnit;

private var log:ILogger = Log.getLoggerByClass(SceneView);

[Embed(source = "../img/up_gray.png")]
[Bindable]
private static var _up_gray:Class;

[Embed(source = "../img/up_blue.png")]
[Bindable]
private static var _up_blue:Class;

[Embed(source = "../img/down_gray.png")]
[Bindable]
private static var _down_gray:Class;

[Embed(source = "../img/down_blue.png")]
[Bindable]
private static var _down_blue:Class;

[Embed(source = "../img/left_gray.png")]
[Bindable]
private static var _left_gray:Class;

[Embed(source = "../img/left_blue.png")]
[Bindable]
private static var _left_blue:Class;

[Embed(source = "../img/right_gray.png")]
[Bindable]
private static var _right_gray:Class;

[Embed(source = "../img/right_blue.png")]
[Bindable]
private static var _right_blue:Class;

[Bindable]
[Embed(source = "../img/down.png")]
private var down:Class;

[Bindable]
[Embed(source = "../img/up.png")]
private var up:Class;

[Bindable]
[Embed(source = "../img/refresh.png")]
private var refresh:Class;

[Embed(source = "../img/u2.png")]
private var config:Class;

[Embed(source = "../img/gislayer.png")]
private var gislayer:Class;
[Embed(source = "../img/sceneTree.png")]
private var sceneTreePng:Class;
[Embed(source = "../img/openTip.png")]
private var openTip:Class;

[Embed(source = "../img/closeTip.png")]
private var closeTip:Class;


[Bindable]
[Embed(source = "../img/no_refresh.png")]
private var no_refresh:Class;

[Bindable]
[Embed(source = "../img/la.png")]
private var la:Class;
[Bindable]
[Embed(source = "../img/ra.png")]
private var ra:Class;
[Bindable]
private var showFlag:Object = {"1": false, "2": false};

[Inject("sceneViewPM")]
public var sceneViewPM:SceneViewPM;

[Inject("mapShowCfgWin")]
public var mapShowCfgWin:MapShowCfgWin;

[Inject("sceneTreeWin")]
public var sceneTreeWin:SceneTreeWin;

[Inject("mapViewPM")]
[Bindable]
public var mapViewPM:MapViewPM;

[MessageDispatcher]
public var msgDispatcher:Function;

[Inject("user")]
public var user:IUser;

[Inject("mapVectorDM")]
[Bindable]
public var mapVectorDM:MapVectorDM;

[Inject("sceneConfigDM")]
public var sceneConfigDM:SceneConfigDM;

[Inject("kPISituationDM")]
public var kpiSituationDM:KPISituationDM;

[Inject("cameraListShowWin")]
public var cameraListShowWin:CameraListShowWin;

[Inject("requestServerUtil")]
public var requestServerUtil:RequestServerUtil;

//private var dataRefreshTimer:Timer = null;
//private var topnDataRefreshTimer:Timer = null;

private var param:Object = {};

private var popWin:Window;

public var count:int = 0;

public var countSign:int = 0;
[Bindable]
public var intervalS:String;

[Bindable]
private var compareDateData:String;

private var arrayListD:ArrayCollection = new ArrayCollection();

private var arrayListM:ArrayCollection = new ArrayCollection();

private var arrayListY:ArrayCollection = new ArrayCollection();
//查询指标是否比较时间。
private var compareDateFlag:String = "0"; //入口标识  1：有比较时间  0：没有比较时间
//视图模式  1：默认模式     2：问题处理模式
[Bindable]
public var viewMode:String = "1";

[Bindable]
private var LTESceneFlag:Boolean=false;//是否为LTE小区

[Bindable]
private var jingquPanelSceneFlag:Boolean=false;//是否为景区场景（这个逻辑不好用，后期要改）

[Bindable]
private var panelShowGroupPaddingTop:Number=0;//默认不是lte场景，当为LTE场景时，为25

[Bindable]
public var mapVectorFlag:Boolean = false;

[Bindable]
public var gisLayerMapType:Boolean = false;

[Inject("alarmComp")]
public var alarmComp:SceneAlarmFlow;

[Inject("gisComp")]
public var gisComp:MapView;

[Inject("mapVectorComp")]
public var mapVectorComp:MapVectorShow;

[MessageHandler(selector = "MODULE_COMPLETE")]
public function initView(e:Event):void
{
	log.info("[判断矢量图还是gis地图] :" + user.currentMapType);
	
	if ("2" == user.logicalType)
	{//LTE
		LTESceneFlag=true;
		panelShowGroupPaddingTop = 25;
	}else{
		LTESceneFlag=false;
		panelShowGroupPaddingTop = 0;
	}
	
	if(user.initSceneId == '1452'){
		jingquPanelSceneFlag = true;
	}else{
		jingquPanelSceneFlag = false;
	}
	
	initSubComp();
	
	//场景介绍初始化。
//	sceneIntro.Init();
	
//	//地图初始化
//	gisComp.Init();
//	
//	//告警流水初始化
//	alarmComp.Init();
	
	//判断当前场景是使用矢量图还是gis地图 注：0：GIS地图  1：使用矢量图
	if ("0" == user.currentMapType)
	{
		showGisMap();
	}
	else
	{
		showMapVector();
	}
	//配置
//	sceneViewPM.initViewPanel();
	
	if (user.sceneId == "1004")
		setTimeout(function():void
		{
			resizeWindow(3);
			setTimeout(function():void
			{
				resizeWindow(2);
			}, 2000);
			
		}, 2000);
	msgDispatcher(new Event("MODULE_INIT_COMPLETE"));
}

[MessageHandler(selector = "MAPVECTORCOMP_COMPLETE")]
public function MAPVECTORCOMP_COMPLETE(e:SceneEvent):void
{
	sceneViewPM.initViewPanel();
}

private function initSubComp():void
{
	alarmFlowGroup.addElementAt(alarmComp, 0);
	gisGroup.addElement(mapVectorComp);
	gisGroup.addElement(gisComp);
	
}

private var refreshNewAddedTimes:Boolean = true;
private var topnRefreshNewAddedTimes:Boolean = true;
//刷新数据
private function refreshDatas():void
{
	msgDispatcher(new SceneEvent("REFRESH"));
}

/*private function topnRefreshDatas(e:TimerEvent):void
{
	if (topnRefreshNewAddedTimes && !refreshNewAddedTimes)
	{
		log.debug("topn数据刷新！！！！");
		msgDispatcher(new SceneEvent(SceneEvent.CMS_SCENE_DEGRADATIONTOPN_REFRESHTOPN));
		
	}
	
}*/

[MessageHandler(selector = "CMS_SCENE_TOPNDATA_TOPNDATALENGTH")]
public function topnDataLengthThantoTwo(e:SceneEvent):void
{
	topnRefreshNewAddedTimes = false;
	
//	if (topnDataRefreshTimer)
//	{
//		topnDataRefreshTimer.stop();
//	}
}


[MessageHandler(selector = "SHOW_PERFORMANCEINDEX")]
public function showPerformanceIndex(e:SceneEvent):void
{
	performanceIndex.visible = true;
	performanceIndex.includeInLayout = true;
	
	performanceIndex.title = e.param.toolTip.toString();
	
	performanceIndex.init();
	
	if (e.param.hasOwnProperty("flag") && e.param["flag"] == "1")
	{
		
		performanceIndex.type = "1";
		//					performanceIndex.initAccordin("1");
	}
	else
	{
		performanceIndex.type = "0";
		//					performanceIndex.initAccordin("0");
	}
}

[MessageHandler(selector = "HIDE_PERFORMANCEINDEX")]
public function hidePerformanceIndex(e:SceneEvent):void
{
	performanceIndex.visible = false;
	performanceIndex.includeInLayout = false;
}

[MessageHandler(selector = "PANEL_CLOSE")]
public function closePanel(e:SceneEvent):void
{
	var ckbx:CheckBoxComp;
	
	//普通模式的关闭则 联动处理窗口配置面板
	if (e.param['pid'].toString().indexOf('panelShowGroup_') >= 0)
	{
		for (var index:int = 0; index < panelCfgGroup.numElements; index++)
		{
			ckbx = panelCfgGroup.getElementAt(index) as CheckBoxComp;
			
			if (e.panelName == ckbx.label)
			{
				ckbx.selected = false;
				break;
			}
		}
	}
	else //否则将问题处理模式的窗口 恢复。
	{
		for (var idx:int = 0; idx < pbh.numElements; idx++)
		{
			var tb:ToggleButton = pbh.getElementAt(idx) as ToggleButton;
			
			if (e.panelName == tb.label)
			{
				var panelName:String = tb.label;
				var order:String = e.param['index'];
				var location:String = tb.name;
				//从GIS布局中删除
				gisViewGroup.removeElement(sceneConfigDM.panelIdUIMap[panelName]);
				//添加到左右布局容器中
				this['panelShowGroup_' + location].addElementAt(sceneConfigDM.panelIdUIMap[panelName], (this['panelShowGroup_' + location] as VGroup).numChildren > (int(order) - 1) ? (int(order) - 1) : (this['panelShowGroup_' + location] as VGroup).numChildren);
				(sceneConfigDM.panelIdUIMap[panelName] as Window).dragable = false;
				//							(sceneConfigDM.panelIdUIMap[panelName] as Window).percentHeight = 100;
				//							(sceneConfigDM.panelIdUIMap[panelName] as Window).percentWidth = 100;
				log.info("问题处理模式的窗口 恢复:panelName:" + tb.label + "  order:" + order + "  location:" + tb.name);
				tb.selected = false;
				break;
			}
		}
	}
}

private var idMsgCache:Object = {};

private function compareCfgPanel():void
{
	if (user.level != "2"){//"场景重点关注网元": resMatrixComp,
		sceneConfigDM.panelIdUIMap = {"场景介绍": sceneIntro, "场景资源矩阵": emgyResource,  "场景指标概况": kPISituation, "场景指标TOPN": degradationTOPN, "场景基站退服": quitService};
	}else{ //"区域重点关注网元": resMatrixComp,
		sceneConfigDM.panelIdUIMap = {"区域介绍": sceneIntro, "区域资源矩阵": emgyResource, "区域指标概况": kPISituation, "区域指标TOPN": degradationTOPN, "区域基站退服": quitService};
	}
	idMsgCache['sceneIntro'] = "场景介绍，提供场景介绍、场景概况汇总的功能；左上角显示监控区域的缩略图；窗口支持 最大化、还原、关闭；";
	idMsgCache['raceInfoComp'] = "场景赛事，提供重大活动场景中的赛事列表等数据";
	idMsgCache['emgyResource'] = "资源矩阵包括设备资源、应急资源、应急预案；窗口支持最大化、还原、关闭；";
	idMsgCache['resMatrixComp'] = "重点关注网元矩阵方式按网元类型呈现全省所有节假日保障区域上存在告警的网元，单元格渲染网元上最高级别告警颜色；";
	idMsgCache['trainTimeTable'] = "火车时刻表；";
	idMsgCache['weatherSituation'] = "场景天气预报，呈现了全省所有存在监控区域的地市天气预报；显示各地市的天气状况图标、温度；";
	idMsgCache['kPISituation'] = "场景指标概况包括客户感知指标、业务性能指标、设备性能指标，统计呈现该场景全省所有节假日保障区域中的指标值；窗口支持最大化、还原、关闭；(注：新建场景需要等5分钟才有数据)";
	idMsgCache['degradationTOPN'] = "场景指标TOP N窗口主要呈现全省所有节假日保障区域性能指标质降的Top20网元，包括TopN柱状图、TopN矩阵两种方式呈现；窗口支持最大化、还原、关闭；";
	idMsgCache['quitService'] = "场景基站退服，包括退服统计和地市查询；窗口支持最大化、还原、关闭；";
	idMsgCache['roam'] = "场景漫游数据，呈现省际、省内、国际漫游数据（漫入、漫出）；";
	idMsgCache['sheetStat'] = "场景工单统计数据，分为地市维度和网元类型维度";
	idMsgCache['worstCell'] = "场景最差小区的指标信息";
	
	for (var panelName:String in sceneConfigDM.panelIdUIMap)
	{
		var isCfg:Boolean = false;
		
		for each (var p:Object in sceneConfigDM.panelList)
		{
			if (p['panelName'] == panelName)
			{
				isCfg = true;
				break;
			}
		}
		
		if (!isCfg)
		{
			try
			{
				((sceneConfigDM.panelIdUIMap[panelName] as UIComponent).parent as Group).removeElement(sceneConfigDM.panelIdUIMap[panelName]);
			}
			catch (e:Error)
			{
			}
		}
	}
	
	//设置面板在当前的顺序
	var nums:int = panelShowGroup_1.numElements;
	
	for (var i:int = 0; i < nums; i++)
		panelShowGroup_1.getElementAt(i)['index'] = i + 1;
	
	nums = panelShowGroup_2.numElements;
	
	for (var j:int = 0; j < nums; j++)
		panelShowGroup_2.getElementAt(j)['index'] = j + 1;
}

[MessageHandler(selector = "DEAL_SCENE_CFG")]
public function dealPanelCfg(e:SceneEvent):void
{
	log.info("处理场景面板！");
	
	panelCfgGroup.removeAllElements();
	pbh.removeAllElements();
	gisViewGroup.removeAllElements();
	gisViewGroup.visible = true;
	gisViewGroup.percentWidth = 100;
	gisViewGroup.includeInLayout = true;
	
	compareCfgPanel();
	
	//根据面板配置信息 生成面板组件。
	doDealPanelList();
	//刷新数据
	refreshDatas();
	
	//TODO 显示组件说明的方法
	if (user.isNew == "true")
		showCompInstruction();
}

private function doDealPanelList():void{
	log.info(sceneConfigDM.panelList);
	for each (var panel:Object in sceneConfigDM.panelList)
	{
		/**新规范去除重点关注网元模块，2014-10-30 ，mod by 汪炜*/
		if(String(panel['panelName']).indexOf('重点关注网元')>-1){
			continue;//去除重点关注网元模块
		}
		
		var cb:CheckBoxComp = new CheckBoxComp();
		cb.param = panel;
		cb.label = panel['panelName'];
		cb.id = panel['showindex'];
		
		if (panel["isShow"] == "1")
			cb.selected = true;
		else
			cb.selected = false;
		cb.name = panel['location'];
		cb.addEventListener(MouseEvent.CLICK, showHideComp);
		
		panelCfgGroup.addElement(cb);
		
		//生成问题处理模式工具栏
		if (cb.selected)
		{
			var tb:ToggleButton = new ToggleButton();
			tb.label = panel['panelName'];
			tb.name = panel['location'];
			tb.addEventListener(MouseEvent.CLICK, togglebutton1_clickHandler);
			pbh.addElement(tb);
		}
		
		var comp:UIComponent;
		
		if (sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
			comp = sceneConfigDM.panelIdUIMap[panel['panelName']];
		
		var h:Number = 200;
		
		switch (panel['panelName'])
		{
			case "场景介绍":
			case "区域介绍":
				h = 250;
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new SceneIntro();
				(comp as SceneIntro).location = panel['location'];
				//							(comp as SceneIntro).index = panel['showindex'];
				break;
			case "场景赛事":
			case "区域赛事":
				h = 250;
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new RaceInfoComp();
				(comp as RaceInfoComp).location = panel['location'];
				break;
			
			case "场景重点关注网元":
			case "区域重点关注网元":
//				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
//					comp = new ResMatrixComp();
//				(comp as ResMatrixComp).location = panel['location'];
//							(comp as ResMatrixComp).index = panel['showindex'];
				break;
			
			case "场景资源矩阵":
			case "区域资源矩阵":
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new EmgyResource();
				(comp as EmgyResource).location = panel['location'];
				//							(comp as EmgyResource).index = panel['showindex'];
				break;
			
			case "场景基站退服":
			case "区域基站退服":
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new QuitService();
				(comp as QuitService).location = panel['location'];
				//							(comp as QuitService).index = panel['showindex'];
				break;
			
			case "场景工单统计":
			case "区域工单统计":
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new SheetStat();
				(comp as SheetStat).location = panel['location'];
				break;
			
			case "场景最差小区统计":
			case "区域最差小区统计":
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new WorstCellPanel();
				(comp as WorstCellPanel).location = panel['location'];
				break;
			
			case "场景指标概况":
			case "区域指标概况":
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new KPISituation();
				(comp as KPISituation).location = panel['location'];
				//							(comp as KPISituation).index = panel['showindex'];
				h = 300
				break;
			
			case "场景指标TOPN":
			case "区域指标TOPN":
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new DegradationTOPN();
				(comp as DegradationTOPN).location = panel['location'];
				//							(comp as DegradationTOPN).index = panel['showindex'];
				break;
			
			case "场景漫游数据":
			case "区域漫游数据":
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new Roam();
				(comp as Roam).location = panel['location'];
				//							(comp as Roam).index = panel['showindex'];
				break;
			
			case "场景天气预报":
			case "区域天气预报":
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new WeatherSituation();
				(comp as WeatherSituation).location = panel['location'];
				//							(comp as WeatherSituation).index = panel['showindex'];
				break;
			
			//						case "场景性能趋势图":
			//						case "区域性能趋势图":
			//							comp = new ImportantKPI();
			//							(comp as ImportantKPI).location = panel['location'];
			//							(comp as ImportantKPI).index = panel['showindex'];
			//							break;
			
			case "场景火车时刻表":
			case "区域火车时刻表":
				if (!sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
					comp = new TrainTimeTable();
				(comp as TrainTimeTable).location = panel['location'];
				//							(comp as TrainTimeTable).index = panel['showindex'];
				break;
		}
		
		if (comp)
		{
			if (panel["isShow"] == "0")
			{
				comp.visible = false;
				comp.includeInLayout = false;
			}
			
			comp.name = panel['panelName'];
		}
		
		
		if (sceneConfigDM.panelIdUIMap.hasOwnProperty(panel['panelName']))
			continue;
		
		if (comp)
		{
			comp.width = this['panelShowGroup_' + panel['location']].width;
			comp.minHeight = h;
			comp.percentHeight = 100;
			
			this['panelShowGroup_' + panel['location']].addElement(comp);
		}
		
		log.info("添加面板到视图：" + panel['panelName'] + "_" + panel['showindex'] + "_" + h);
	}
}
//			private var _mask:SimpleMask;
private var maskIntroTip:MaskInstructionTip;

private var maskIndex:int = 0;


private var maskInfoType:String = "left"; //left right  gis  alarm;

private var countPerScreen:int = 0;

[MessageHandler(selector = "CMS_SCENE_MASK_HIDE")]
public function hiddenMaskInfo(evt:SceneEvent):void
{
	//				if (_mask != null)
	//					removeElement(_mask);
	if (maskIntroTip != null)
		this.removeElement(maskIntroTip);
	
	showAllWindow();
}

private function showCompInstruction():void
{
	var win:Window = panelShowGroup_1.getElementAt(maskIndex++) as Window;
	maskIntroTip = new MaskInstructionTip();
	this.addElement(maskIntroTip);
	
	maskIntroTip.x = win.x + maskIntroTip.width + 20;
	maskIntroTip.y = win.y + 40;
	maskIntroTip.direction("left");
	maskIntroTip.showTitle("场景简介");
	maskIntroTip.showMsg(idMsgCache[win.id]);
}


[MessageHandler(selector = "CMS_SCENE_MASK_NEXT")]
public function continueNextMaskInfo1(evt:SceneEvent):void
{
	switch (maskInfoType)
	{
		case "left":
			leftMaskInfo();
			break;
		case "right":
			rightMaskInfo();
			break;
		case "gis":
			step5();
			break;
		case "alarm":
			step6();
			break;
		default:
			hiddenMaskInfo(null);
			break;
	}
}

private function leftMaskInfo():void
{
	log.info("left");
	
	if (countPerScreen <= maskIndex)
	{
		if (countPerScreen != 0)
		{
			//隐藏窗口
			hiddenWindow(panelShowGroup_1, countPerScreen);
		}
		countPerScreen = countScreen(panelShowGroup_1, countPerScreen);
	}
	
	
	setTimeout(function():void
	{
		var win:Window = panelShowGroup_1.getElementAt(maskIndex++) as Window;
		//						_mask.unMaskObj = win;
		
		log.info("countPerScreen:{0};win:{1};maskIndex:{2}", countPerScreen, win.title, maskIndex);
		
		maskIntroTip.x = win.x + maskIntroTip.width - 100;
		maskIntroTip.y = win.y + 40;
		maskIntroTip.direction("left");
		maskIntroTip.showTitle(win.title);
		maskIntroTip.showMsg(idMsgCache[win.id]);
		
		if (maskIndex == panelShowGroup_1.numElements)
		{
			maskInfoType = "right";
			countPerScreen = 0;
		}
	}, 1000);
	
}

private function rightMaskInfo():void
{
	log.info("right");
	
	if (countPerScreen <= maskIndex - panelShowGroup_1.numElements)
	{
		if (countPerScreen != 0)
		{
			//隐藏窗口
			hiddenWindow(panelShowGroup_2, countPerScreen);
		}
		countPerScreen = countScreen(panelShowGroup_2, countPerScreen);
	}
	
	var tw:Number = this.width;
	
	setTimeout(function():void
	{
		var win:Window = panelShowGroup_2.getElementAt(maskIndex - panelShowGroup_1.numElements) as Window;
		//						_mask.unMaskObj = win;
		
		log.info("countPerScreen:{0};win:{1};maskIndex:{2}", countPerScreen, win.title, maskIndex);
		log.info("this.width:{0}; win.width:{1}; maskIntroTip.width:{2}", tw, win.width, maskIntroTip.width);
		
		maskIntroTip.x = tw - win.width - maskIntroTip.width - 200;
		maskIntroTip.y = win.y + 20;
		maskIntroTip.direction("right");
		maskIntroTip.showTitle(win.title);
		maskIntroTip.showMsg(idMsgCache[win.id]);
		maskIndex++;
		
		if (maskIndex == panelShowGroup_1.numElements + panelShowGroup_2.numElements)
			maskInfoType = "gis";
		
	}, 1000);
}

private function hiddenWindow(psg:VGroup, hiddenCount:int):void
{
	log.info("隐藏窗口psg：{0}，hiddenCount:{1};", psg.id, hiddenCount);
	
	for (var i:int = 0; i < hiddenCount; i++)
	{
		Window(psg.getElementAt(i)).visible = false;
		Window(psg.getElementAt(i)).includeInLayout = false;
	}
}

private function showAllWindow():void
{
	for (var i:int = 0; i < panelShowGroup_1.numElements; i++)
	{
		Window(panelShowGroup_1.getElementAt(i)).visible = true;
		Window(panelShowGroup_1.getElementAt(i)).includeInLayout = true;
	}
	
	for (i = 0; i < panelShowGroup_2.numElements; i++)
	{
		Window(panelShowGroup_2.getElementAt(i)).visible = true;
		Window(panelShowGroup_2.getElementAt(i)).includeInLayout = true;
	}
}

//计算一屏幕完全显示到第几个窗口
private function countScreen(psg:VGroup, index:int = 0):int
{
	var screenHeight:Number = this.height;
	var win:Window;
	
	for (index; index < psg.numElements; index++)
	{
		win = psg.getElementAt(index) as Window;
		
		if (win.visible == true)
		{
			if (screenHeight < win.height)
			{
				return index;
			}
			else
			{
				screenHeight = screenHeight - win.height - psg.gap;
			}
		}
	}
	return index;
}

private function step5():void
{
	var win:Window = this.gisWindow;
	
	//				_mask.unMaskObj = win;
	
	maskIntroTip.x = 20;
	maskIntroTip.y = 150;
	maskIntroTip.direction("right");
	maskIntroTip.showTitle("GIS窗口");
	maskIntroTip.showMsg("GIS窗口分成矢量图监控和GIS地图监控两种模式,矢量图可以根据性能劣化级别渲染,GIS地图可以呈现区域缩略图、网元劣化分布；");
	maskInfoType = "alarm";
}

private function step6():void
{
	resizeWindow();
	setTimeout(function():void
	{
		var win:VGroup = this.alarmVgroup;
		
		//						_mask.unMaskObj = win;
		
		maskIntroTip.x = (this.width - maskIntroTip.width) / 2;
		maskIntroTip.y = this.height - maskIntroTip.height - 150;
		maskIntroTip.direction("down");
		maskIntroTip.showTitle("告警流水窗口");
		maskIntroTip.showMsg("告警流水窗口展示当前场景、区域的告警情况，支持和上面的劣化网元,GIS定位的网元联动以方便查看单个网元的告警。");
		
		maskInfoType = "end";
	}, 2000);
	
}

[MessageHandler(selector = "PANEL_MAXIMIZE")]
public function maximizePanel(e:SceneEvent):void
{
	log.info("面板：" + e.panelName + "最大化、恢复处理！" + e.panelMaxFlag);
	log.debug(e);
	
	if (!e.panelMaxFlag)
	{
		showHideComp(null, e, false);
		
		PopUpManager.addPopUp(sceneConfigDM.panelIdUIMap[e.panelName], topGroup);
		(sceneConfigDM.panelIdUIMap[e.panelName] as UIComponent).width = this.parentApplication.width;
		(sceneConfigDM.panelIdUIMap[e.panelName] as UIComponent).height = this.parentApplication.height;
		PopUpManager.centerPopUp(sceneConfigDM.panelIdUIMap[e.panelName]);
	}
	else
	{
		showHideComp(null, e, true);
	}
}
/***************************************************************以下CHANGE_MAPVIEW 和 CHANGE_VIEW 处理********************************************************************************************************************/
[MessageHandler(selector = "CHANGE_MAPVIEW")]
public function change_mapview_handler(e:SceneEvent):void
{
	var param:Object = e.param;
	//1 矢量地图  0 gis地图
	if (param.currentMapType == "1"&&user.cityId != param.cityId)
	{
		log.info('CHANGE_MAPVIEW——矢量图改变');
		log.info(param);
		//改变矢量图的显示
		var evt:SceneEvent = new SceneEvent(SceneEvent.CHANGE_VECTOR_MAPVIEW);
		evt.param = param;
		msgDispatcher(evt);
	}
	//设置user信息
	user.cityId = param.cityId;
	user.cityName = param.cityName;
	user.areaId = param.areaId;
	//刷新数据
	refreshDatas();
}
[MessageHandler(selector = "CHANGE_VIEW")]
public function changeMapViewHandler(e:SceneEvent):void
{
	
	var param:Object = e.param;
	//切换视图  则需要重新加载数据，不认为是刷新数据。
	user.isDrillDown = true;
	this.back2vectMapBT.visible = false;
	
	/**当level之间改变时，其中有一个为区域level=2时，则需要加载配置，设置changeFlag=true*/
	if('2'==user.level||'2'==param.level){
		param.changeFlag = true;
	}else{
		param.changeFlag = false;
	}
	//设置user信息
	user.level = param.level;
	user.cityId = param.cityId;
	user.cityName = param.cityName;
	user.currentMapType = param.currentMapType;
	user.areaId = param.areaId;
	log.error("看看执行多少次");
	
	//1 矢量地图  0 gis地图	
	if (param.currentMapType == "1")
	{
//		//刷新数据
		showMapVector();
		//改变矢量图的显示
		var evt:SceneEvent = new SceneEvent(SceneEvent.CHANGE_VECTOR_MAPVIEW);
		evt.param = param;
		msgDispatcher(evt);
	}
	else if (param.currentMapType == "0")
	{
		showGisMap();
		gisComp.hideAllFeatures();
//		var evt:SceneEvent = new SceneEvent("CHANGE_MAP_LAYER");
//		msgDispatcher(evt);
	}
	log.info("切换视图 ----------->" +user.logicalType + "_" + user.sceneId + "_" + user.areaId + "_" + user.level);
	if(gisViewGroup.visible){
		gisViewGroup.visible = false;
	}
	if(100!=gisViewGroup.percentWidth){
		gisViewGroup.percentWidth = 100;
	}
	if(param.changeFlag){
		//刷新数据。
		refreshDatas();
	}else{
		//加载面板配置信息等。
		sceneViewPM.initViewPanel();
	}
}
/*****************************************************************以上CHANGE_MAPVIEW 和 CHANGE_VIEW 处理*****************************************************************************************/
private function showHideComp(me:MouseEvent = null, se:SceneEvent = null, flag:Boolean = false):void
{
	var panelName:String;
	var location:String;
	var index:String;
	
	if (me)
	{
		var ckbox:CheckBox = (me.currentTarget as CheckBox);
		panelName = ckbox.label;
		location = ckbox.name;
		index = ckbox.id;
		flag = ckbox.selected;
	}
	else if (se)
	{
		panelName = se.panelName;
		location = se.panellocation;
		index = se.panelIndex;
	}
	else
	{
		return;
	}
	
	if (me)
	{
		(sceneConfigDM.panelIdUIMap[panelName] as UIComponent).visible = flag;
		(sceneConfigDM.panelIdUIMap[panelName] as UIComponent).includeInLayout = flag;
	}
	else
	{
		if (this.viewMode == "1")
		{
			if (flag)
				this['panelShowGroup_' + location].addElementAt(sceneConfigDM.panelIdUIMap[panelName], (this['panelShowGroup_' + location] as VGroup).numChildren > (int(index) - 1) ? (int(index) - 1) : (this['panelShowGroup_' + location] as VGroup).numChildren);
			else
			{
				if (sceneConfigDM.panelIdUIMap[panelName].hasOwnProperty('closeWindow'))
					sceneConfigDM.panelIdUIMap[panelName].closeWindow();
				else
					this['panelShowGroup_' + location].removeElement(sceneConfigDM.panelIdUIMap[panelName]);
			}
		}
		else if (this.viewMode == "2")
		{
			if (flag)
				addWin2GisGroup(gisViewGroup, sceneConfigDM.panelIdUIMap[panelName] as Window);
				//							gisViewGroup.addElement(sceneConfigDM.panelIdUIMap[panelName]);
				//							gisViewGroup.addElementAt(sceneConfigDM.panelIdUIMap[panelName],
				//								gisViewGroup.numChildren > (int(index) - 1) ?
				//								(int(index) - 1) :
				//								gisViewGroup.numChildren);
			else
			{
				if (sceneConfigDM.panelIdUIMap[panelName].hasOwnProperty('closeWindow'))
					sceneConfigDM.panelIdUIMap[panelName].closeWindow();
				else
					gisViewGroup.removeElement(sceneConfigDM.panelIdUIMap[panelName]);
			}
		}
	}
}

private function resizeWindow(type:int = 0):void
{
	if (type == 2)
	{
		if (picImg.name == "left")
		{
			showPicGroup(type);
		}
		else if (picImg.name == "right")
		{
			hidePicGroup(type);
		}
	}
	else if (type == 3)
	{
		if (chartImg.name == "right")
		{
			showPicGroup(type);
		}
		else if (chartImg.name == "left")
		{
			hidePicGroup(type);
		}
	}
	else
	{
		if (img.name == "down")
		{
			hideAlarm();
		}
		else if (img.name == "up")
		{
			showAlarm();
		}
	}
}

private var picGroupWidth:Number;
private var chartGroupWidth:Number;

private function hidePicGroup(type:int, dura:Number = 100):void
{
	if (type == 2)
	{
		stc.showEle(false);
		chartGroup.visible = false;
		chartGroup.includeInLayout = false;
		picGroupWidth = picGroup.width;
		resize.target = picGroup;
	}
	else if (type == 3)
	{
		resize.target = chartOuterGroup;
		chartGroupWidth = chartOuterGroup.width;
		resize.target = chartOuterGroup;
	}
	
	resize.duration = dura;
	resize.widthTo = 15;
	resize.heightTo = Number.NaN;
	resize.play();
}

private function showPicGroup(type:int, dura:Number = 100):void
{
	if (type == 2)
	{
		stc.visible = true;
		stc.includeInLayout = true;
		resize.target = picGroup;
	}
	else if (type == 3)
	{
		resize.target = chartOuterGroup;
	}
	
	resize.widthTo = gisGroup.width;
	resize.duration = dura;
	resize.heightTo = Number.NaN;
	resize.play();
}

protected function resize_effectEndHandler(event:EffectEvent):void
{
	if (resize.target == picGroup)
	{
		if (picGroup.width > 30)
		{
			chartOuterGroup.visible = false;
			chartOuterGroup.includeInLayout = false;
			
			stc.showEle(true);
			picImg.name = "right";
			picImg.source = _right_gray;
		}
		else
		{
			chartOuterGroup.visible = true;
			chartOuterGroup.includeInLayout = true;
			
			stc.visible = false;
			stc.includeInLayout = false;
			picImg.name = "left";
			picImg.source = _left_gray;
		}
	}
	else
		(resize.target == chartOuterGroup)
	{
		if (chartOuterGroup.width > 30)
		{
			picGroup.visible = false;
			picGroup.includeInLayout = false;
			
			chartGroup.visible = true;
			chartGroup.includeInLayout = true;
			chartImg.name = "left";
			chartImg.source = _left_gray;
			
//			quitChart.percentWidth = 100;
//			kpiChart.percentWidth = 100;
		}
		else
		{
			picGroup.visible = true;
			picGroup.includeInLayout = true;
			
			chartGroup.visible = false;
			chartGroup.includeInLayout = false;
			chartImg.name = "right";
			chartImg.source = _right_gray;
		}
	}
}

private function hideAlarm(dura:Number = 100):void
{
	this.msgDispatcher(new SceneEvent(SceneEvent.RESUME_NEWS));
	//关闭流水
	msgDispatcher(new SceneEvent("STOP_SCENE_ALARM"));
	
	resize.target = alarmVgroup;
	resize.duration = dura;
	resize.heightTo = 25;
	resize.widthTo = Number.NaN;
	resize.play();
	
	img.source = _up_gray;
	img.name = "up";
}

private function showAlarm(dura:Number = 100):void
{
	this.msgDispatcher(new SceneEvent(SceneEvent.PAUSE_NEWS));
	//打开流水
	msgDispatcher(new SceneEvent("LOAD_SCENE_ALARM"));
	
	resize.target = alarmVgroup;
	
//	alarmComp.reloadAlarm();
	
	resize.duration = dura;
	resize.heightTo = 247;
	resize.widthTo = Number.NaN;
	resize.play();
	
	img.source = _down_gray;
	img.name = "down";
}

protected function changeImg(type:Object):void
{
	img.source = getImg(type);
}

private function getImg(type:Object):Object
{
	if (img.name == "down")
	{
		if (type == 1)
			return _down_blue;
		else
			return _down_gray;
	}
	else if (img.name == "up")
	{
		if (type == 1)
			return _up_blue;
		else
			return _up_gray;
	}
	
	return _down_gray;
}

private function alarmWindow_resizeHandler(event:ResizeEvent):void
{
	if (alarmVgroup.height >= 137)
	{
		img.source = _down_gray;
		img.name = "down";
	}
	else if (alarmVgroup.height <= 35)
	{
		img.source = _up_gray;
		img.name = "up";
	}
}

protected function leftDown_clickHandler(event:MouseEvent = null):void
{
	if (scroller_1.viewport.getVerticalScrollPositionDelta(NavigationUnit.END) > scroller_1.viewport.verticalScrollPosition)
	{
		scroller_1.viewport.verticalScrollPosition = scroller_1.viewport.getVerticalScrollPositionDelta(NavigationUnit.END);
		leftImg.source = up;
	}
	else
	{
		scroller_1.viewport.verticalScrollPosition = scroller_1.viewport.getVerticalScrollPositionDelta(NavigationUnit.HOME);
		leftImg.source = down;
	}
}

protected function rightDown_clickHandler(event:MouseEvent = null):void
{
	if (scroller_2.viewport.getVerticalScrollPositionDelta(NavigationUnit.END) > scroller_2.viewport.verticalScrollPosition)
	{
		scroller_2.viewport.verticalScrollPosition = scroller_2.viewport.getVerticalScrollPositionDelta(NavigationUnit.END);
		rightImg.source = up;
	}
	else
	{
		scroller_2.viewport.verticalScrollPosition = scroller_2.viewport.getVerticalScrollPositionDelta(NavigationUnit.HOME);
		rightImg.source = down;
	}
}

[MessageHandler(selector = "EQU_ALARMINFO")]
[MessageHandler(selector = "BADMO_CLICK")]
public function showAlarmFlow(e:ResMatrixEvent):void
{
	log.info("劣化网元 点击处理：处理流水窗口！");
	log.info("劣化网元 点击处理：过滤流水！");
	var param:Object = {};
	if (e.data.moTypeName == "机房")
	{
		param.ruleContent = 'neroom="' + e.data.neroom + '"';
	}
	else if (e.data.moTypeName == "电路")
	{
		param.ruleContent = 'circ_name="' + e.data.circ_name + '"';
	}
	else
	{
		param.ruleContent = 'alarmneid="' + e.data.moId + '"';
	}
	var evt:SceneEvent = new SceneEvent("CHANGE_SCENE_ALARM_BYFILTER");
	evt.param = param;
	msgDispatcher(evt);
	doInitOrOpenAlarmsView();
}

[MessageHandler(selector = "LOAD_REFRESH_ALARM_FLOW")]
public function showAlarmFlowByFilter(e:SceneIntroEvent):void
{
	log.info("劣化一级告警详情或者退服基站后的详情 点击处理：处理流水窗口！");
	log.info("alarmComp-->"+alarmComp);
	var evt:SceneEvent = new SceneEvent("CHANGE_SCENE_ALARM_BYFILTER");
	evt.param = e.params;
	msgDispatcher(evt);
	//打开流水
	doInitOrOpenAlarmsView();
}

private function doInitOrOpenAlarmsView():void{
	if (alarmVgroup.height <= 35)
	{
		log.info("初始化、展开流水窗口！");
		showAlarm();
	}
}

private var kpiEvent:KPISituationEvent;

[MessageHandler(selector = "SHOW_KPI_AREA_DATA")]
public function showQuitChartByAreaKpi(e:KPISituationEvent = null):void
{
	
	chartViewStack.selectedIndex = 0;
	
	thresholdCB.visible = true;
	
	log.info("### 处理指标区域维度图表！");
	
	if (e == null && kpiEvent != null)
		e = kpiEvent;
	
	var colorArray:Array = new Array;
	var rendingColorArray:Array = new Array;
	var twoKpi:ArrayCollection = e.areaKpiData;
	
	var count2:int = twoKpi.getItemAt(0).len;
	var i:int;
	
	for each (var obj:Object in e.areaKpiData)
	{
		colorArray.push(obj.color);
	}
	
	for each (var obj1:Object in e.areaKpiData)
	{
		rendingColorArray.push(obj1.rendingColor);
	}
	
	for (var n:int = 1; n <= count2; n++)
	{
		for each (obj1 in e.areaKpiData)
		{
			rendingColorArray.push(obj1["color" + n]);
		}
	}
	log.debug("rendingColor info...");
	
	quitChart.visible = true;
	navtab1.label = "二级指标";
	
//	quitChart.width = kpiChartWin.width - 30;
//	quitChart.height = kpiChartWin.height - 50;
	
	var p1:SerialParam = new SerialParam('kpiValue', e.areaKpiData.getItemAt(0)['kpiName']);
	p1.chartType = PrettyChartType.CHART_TYPE_COLUMN;
	p1.yAxis = 'left';
	p1.fillColorArray = colorArray;
	
	var serArr:ArrayCollection = new ArrayCollection;
	serArr.addItem(p1);
	
	if (thresholdCB.selected)
		for (i = 0; i < count2; i++)
		{
			var count1:int = i + 1;
			var aa:String = "thresholdValue" + count1;
			var p:SerialParam = new SerialParam(aa, '门限');
			p.chartType = PrettyChartType.CHART_TYPE_LINE;
			p.yAxis = 'left';
			p.lineStrokeColor = uint(e.areaKpiData.getItemAt(0)["color" + count1]);
			p.showDataDot = false;
			serArr.addItem(p);
		}
	
	log.info("serarra=:");
	var chartParam:ChartParam = new ChartParam();
	chartParam.xAxisProperty = "areaName";
	chartParam.showLegend = false;
	chartParam.use3DColumn = true;
	chartParam.useShowDataEffect = false;
	chartParam.padding = 5;
	
	quitChart.chartParam = chartParam;
	
//	quitChart.percentHeight = 100;
	
	quitChart.chartParam.itemClickEnable = true;
	quitChart.addEventListener(PrettyChartEvent._DATA_CLICK, dealClickLowerLevel);
	quitChart.series = serArr;
	quitChart.chartData(e.areaKpiData, true);
	
	kpiEvent = e;
	log.info("二级指标处理完成 end");
}

[MessageHandler(selector = "SHOW_QUIT_CHART")]
public function showQuitChart(e:QuitServiceEvent):void
{
	log.info("处理退服统计图表！" + e.quitData.length);
	
	chartViewStack.selectedIndex = 0;
	navtab1.label = "退服统计";
	quitChart.visible = true;
	
	//				quitChart.width = e.quitData.length * 90;
	//				if (quitChart.width < kpiChartWin.width)
//	quitChart.width = kpiChartWin.width - 30;
//	quitChart.height = kpiChartWin.height - 50;
	
	var p1:SerialParam = new SerialParam('2G退服基站数', '2G退服');
	p1.chartType = PrettyChartType.CHART_TYPE_COLUMN;
	p1.yAxis = PrettyChartType.YAXIS_LEFT;
	var p2:SerialParam = new SerialParam('TD退服基站数', 'TD退服');
	p2.chartType = PrettyChartType.CHART_TYPE_COLUMN;
	p2.yAxis = PrettyChartType.YAXIS_LEFT;
	var p3:SerialParam = new SerialParam('eNodeB退服基站数', 'eNodeB退服基站数');
	p3.chartType = PrettyChartType.CHART_TYPE_COLUMN;
	p3.yAxis = PrettyChartType.YAXIS_LEFT;
	
	var chartParam:ChartParam = new ChartParam();
	chartParam.xAxisProperty = "属地";
	chartParam.showLegend = false;
	chartParam.useShowDataEffect = false;
	if(e.quitData.length>1){
		chartParam.use3DColumn = false;
	}
	
	chartParam.padding = 5;
	
	quitChart.chartParam = chartParam;
	
	quitChart.series = new ArrayCollection([p1, p2]);
	
//	quitChart.percentHeight = 100;
	
	if (LTESceneFlag)
		quitChart.series = new ArrayCollection([p3]);
	
	log.info("开始渲染退服统计图表！");
	quitChart.chartData(e.quitData, true);
}

//GIS窗口最大化和恢复
protected function gisWindow_resize(type:int):void
{
	//最大化
	if (type == 1)
	{
		this.scroller_2.visible = false;
		this.scroller_2.includeInLayout = false;
		
		this.scroller_1.visible = false;
		this.scroller_1.includeInLayout = false;
		
		leftImg.visible = false;
		rightImg.visible = false;
		gisWindow.percentWidth = 100;
		gisWindow.percentHeight = 100;
		
		topobutton.visible = false;
		topobutton.includeInLayout = false;
		
		//进入问题处理模式。
		viewMode = "2";
		//                    jinquLineGroup.visible = true;
		//                    jinquLineGroup.includeInLayout = true;
		
		//                    drawPicLines();
	}
	else if (type == 2)
	{
		gisWindow.percentWidth = 55;
		gisWindow.percentHeight = 100;
		stc.percentWidth = 100;
		
		this.scroller_1.visible = true;
		this.scroller_1.includeInLayout = true;
		
		this.scroller_2.visible = true;
		this.scroller_2.includeInLayout = true;
		
		leftImg.visible = true;
		rightImg.visible = true;
		
		if (LTESceneFlag)
		{
			topobutton.visible = true;
			topobutton.includeInLayout = true;
		}
		
		//返回默认模式。
		viewMode = "1";
		//返回问题处理模式中打开的面板到默认模式
		resumePanels();
		//
		//                    jinquLineGroup.visible = false;
		//                    jinquLineGroup.includeInLayout = false;
	}
	
	if (picGroup.width > 50)
		resizeWindow(2);
	
	if (chartOuterGroup.width > 50)
		resizeWindow(3);
	
	if (user.initSceneId == "1452" && user.level == "1")
	{
		setTimeout(function():void
		{
			gisComp.viewRefresh();
		}, 500);
	}
}

private function resumePanels():void
{
	for (var i:int = 0; i < pbh.numElements; i++)
	{
		var tb:ToggleButton = pbh.getElementAt(i) as ToggleButton;
		
		if (tb.selected)
		{
			var panelName:String = tb.label;
			var index:String = sceneConfigDM.panelIdUIMap[panelName]['index'];
			var location:String = tb.name;
			//从GIS布局中删除
			gisViewGroup.removeElement(sceneConfigDM.panelIdUIMap[panelName]);
			//添加到左右布局容器中
			this['panelShowGroup_' + location].addElementAt(sceneConfigDM.panelIdUIMap[panelName], (this['panelShowGroup_' + location] as VGroup).numChildren > (int(index) - 1) ? (int(index) - 1) : (this['panelShowGroup_' + location] as VGroup).numChildren);
			tb.selected = false;
			(sceneConfigDM.panelIdUIMap[panelName] as Window).dragable = false;
			//						(sceneConfigDM.panelIdUIMap[panelName] as Window).percentHeight = 100;
			//						(sceneConfigDM.panelIdUIMap[panelName] as Window).percentWidth = 100;
		}
	}
}

protected function button1_clickHandler(event:MouseEvent):void
{
	if (refreshImg.name == "norefresh")
	{
		refreshImg.source = refresh;
		refreshImg.name = "refresh";
		refreshImg.toolTip = "自动刷新已启动";
		msgDispatcher(new SceneEvent("STARTTIMER"));
//		this.parentApplication.add(dataRefreshTimer);
	}
	else
	{
//		this.dataRefreshTimer.stop();
		refreshImg.source = no_refresh;
		refreshImg.name = "norefresh";
		refreshImg.toolTip = "自动刷新已停止";
		msgDispatcher(new SceneEvent("STOPTIMER"));
//		this.parentApplication.remove(dataRefreshTimer);
	}
}

[MessageHandler(selector = "CMS_SCENE_SCENEVIEW_NOEFRESH")]
[MessageHandler(selector = "CMS_SCENE_SCENEVIEW_EFRESH")]
public function checkRefresh(e:SceneEvent):void
{
	if (e.type == "CMS_SCENE_SCENEVIEW_EFRESH")
	{
//		this.dataRefreshTimer.start();
		refreshImg.source = refresh;
		refreshImg.name = "refresh";
		refreshImg.toolTip = "自动刷新已启动";
		msgDispatcher(new SceneEvent("STARTTIMER"));
//		this.parentApplication.add(dataRefreshTimer);
	}
	else if (e.type == "CMS_SCENE_SCENEVIEW_NOEFRESH")
	{
		refreshImg.source = no_refresh;
		refreshImg.name = "norefresh";
		refreshImg.toolTip = "自动刷新已停止";
		msgDispatcher(new SceneEvent("STOPTIMER"));
//		this.dataRefreshTimer.stop();
//		this.parentApplication.remove(dataRefreshTimer);
	}
}


private var kpiChartEvent:KPISituationEvent = null;

[MessageHandler(selector = "SHOW_LINE_DATA")]
public function showKpiChart(event:KPISituationEvent = null):void
{
	if (event == null && kpiChartEvent != null)
	{
		event = kpiChartEvent;
	}
	
	//获取门限数量
	var lenth:int = event.kpiDetailChartData.getItemAt(0).len;
	
	log.info("show kpi chart data! :: " + user.kpiName + "  --  " + event.kpiDetailChartData.length);
	
	kpiLabel.text = user.kpiName;
	
	//				if(user.dateFlag == "1")
	//				{
	if (user.hisFlag == "1")
	{
		var p1:SerialParam = new SerialParam('kpiValue', event.kpiDetailChartData.getItemAt(0)['kpiDate']);
		p1.chartType = PrettyChartType.CHART_TYPE_LINE;
		p1.yAxis = "left";
		
		//					kpiChart.width = event.kpiDetailChartData.length * 60;
		//					if (kpiChart.width < kpiChartWin.width)
//		kpiChart.width = kpiChartWin.width - 30;
//		kpiChart.height = kpiChartWin.height - 50;
		
		var charParam:ChartParam = new ChartParam();
		
		if (user.dateFlag == "1")
		{
			charParam.xAxisProperty = "time";
		}
		//charParam.xAxisProperty = "time"; 
		charParam.use3DColumn = false;
		charParam.showLegend = false;
		
		charParam.labelStep = 60 / Number(event.kpiDetailChartData.getItemAt(0)['timeInterval']) - 1;
		
		this.kpiChart.chartParam = charParam;
		this.kpiChart.series = new ArrayCollection([p1]);
		user.hisFlag = "0";
	}
	else
	{
		var p1:SerialParam = new SerialParam('kpiValue', event.kpiDetailChartData.getItemAt(0)['kpiDate']);
		p1.chartType = PrettyChartType.CHART_TYPE_LINE;
		p1.yAxis = "left";
		
		//					kpiChart.width = event.kpiDetailChartData.length * 30;
		//					if (kpiChart.width < kpiChartWin.width)
//		kpiChart.width = kpiChartWin.width - 30;
//		kpiChart.height = kpiChartWin.height - 50;
		
		var charParam:ChartParam = new ChartParam();
		
		if (user.dateFlag == "1")
		{
			charParam.xAxisProperty = "time";
		}
		charParam.use3DColumn = false;
		charParam.showLegend = true;
		
		charParam.padding = 5;
		
		charParam.labelStep = 60 / Number(event.kpiDetailChartData.getItemAt(0)['timeInterval']) - 1;
		
		this.kpiChart.chartParam = charParam;
		this.kpiChart.series = new ArrayCollection([p1]);
		
		//						if(user.level == "1")
		//						{
		
		if (event.kpiDetailChartData.getItemAt(0)['kpiDate1'])
		{
			var p2:SerialParam = new SerialParam('kpiValue1', event.kpiDetailChartData.getItemAt(0)['kpiDate1']);
			p2.chartType = PrettyChartType.CHART_TYPE_LINE;
			p2.yAxis = "left";
			kpiChart.series.addItem(p2);
			log.info("ooooooooooo");
		}
		
		
		if (event.kpiDetailChartData.getItemAt(0)['kpiDate2'])
		{
			var p3:SerialParam = new SerialParam('kpiValue2', event.kpiDetailChartData.getItemAt(0)['kpiDate2']);
			p3.chartType = PrettyChartType.CHART_TYPE_LINE;
			p3.yAxis = "left";
			kpiChart.series.addItem(p3);
			log.info("[[[[[[[[[[[[[[[[[[[[[[");
		}
		
		if (event.kpiDetailChartData.getItemAt(0)['kpiDate3'])
		{
			var p4:SerialParam = new SerialParam('kpiValue3', event.kpiDetailChartData.getItemAt(0)['kpiDate3']);
			p4.chartType = PrettyChartType.CHART_TYPE_LINE;
			p4.yAxis = "left";
			kpiChart.series.addItem(p4);
		}
		//						}
	}
	
	//				}
	//				else
	//				{
	//					var p3:SerialParam = new SerialParam('kpiValue', '');
	//					p3.chartType = PrettyChartType.CHART_TYPE_LINE;
	//					p3.yAxis = "left";
	//
	//					kpiChart.width = event.kpiDetailChartData.length * 60;
	//					if(kpiChart.width < kpiChartWin.width)
	//						kpiChart.width = kpiChartWin.width - 8;
	//
	//					var charParam1:ChartParam = new ChartParam();
	//					charParam1.xAxisProperty = "time";
	//					charParam1.use3DColumn = false;
	//					charParam1.showLegend = false;
	//
	//					charParam1.labelStep = 60 / Number(event.kpiDetailChartData.getItemAt(0)['timeInterval']) - 1;
	//
	//					this.kpiChart.chartParam = charParam1;
	//					this.kpiChart.series = new ArrayCollection([p3]);
	//
	//				}
	//画门限
	if (thresholdKpi.selected)
		for (var i:int = 1; i <= lenth; i++)
		{
			var count1:int = i + 1;
			var aa:String = "thresholdValue" + i;
			var p:SerialParam = new SerialParam(aa, '门限');
			p.chartType = PrettyChartType.CHART_TYPE_LINE;
			p.yAxis = 'left';
			//p.fillColorArray=rendingColorArray;
			p.lineStrokeColor = uint(event.kpiDetailChartData.getItemAt(0)["color" + i]);
			p.showDataDot = false;
			kpiChart.series.addItem(p);
		}
	
//	kpiChart.percentHeight = 100;
	
	kpiChart.chartData(event.kpiDetailChartData, true);
	//				chartViewStack.selectedIndex = 1;
	kpiChartEvent = event;
}

[MessageHandler(selector = "SHOW_HISTORY_TOPN_LINE_DATA")]
[MessageHandler(selector = "SHOW_HISTORY_LINE_DATA")]
public function showHistoryKpiChart(event:KPISituationEvent):void
{
	PopUpManager.addPopUp(hisPopupWin, this.parent as DisplayObject);
	
	hisPopupWin.x = (this.stage.width - hisPopupWin.width) / 2 - 150;
	hisPopupWin.y = (this.stage.height - hisPopupWin.height) / 2 - 50;
	hisPopupWin.visible = true;
	
	var p1:SerialParam = new SerialParam('kpiValue', '');
	p1.chartType = PrettyChartType.CHART_TYPE_LINE;
	p1.yAxis = "left";
	
	hisPopChart.width = kpiSituationDM.kpiCharData.length * 30;
	
	if (hisPopChart.width < hisPopupWin.width)
		hisPopChart.width = hisPopupWin.width - 8;
	
	var charParam:ChartParam = new ChartParam();
	charParam.xAxisProperty = "time";
	charParam.use3DColumn = false;
	charParam.showLegend = true;
	charParam.useShowDataEffect = false;
	
	charParam.labelStep = 60 / Number(kpiSituationDM.kpiCharData.getItemAt(0)['timeInterval']) - 1;
	
	this.hisPopChart.chartParam = charParam;
	this.hisPopChart.series = new ArrayCollection([p1]);
	
	hisPopChart.chartData(kpiSituationDM.kpiCharData, true);
	
	hisPopChart.percentHeight = 100;
}

protected function kpiChartWin_maximizeHandler(event:WindowEvent):void
{
	//最大化方法
	kpiChartBox.visible = false;
	kpiChartBox.includeInLayout = false;
	
	PopUpManager.addPopUp(kpiChartWin, topGroup);
	popWin = kpiChartWin;
	kpiChartWin.width = this.parentApplication.width;
	kpiChartWin.height = this.parentApplication.height;
	PopUpManager.centerPopUp(kpiChartWin);
	
//	quitChart.percentWidth = 100;
//	kpiChart.percentWidth = 100;
}


protected function kpiChartWin_minimizeHandler(event:WindowEvent):void
{
	PopUpManager.removePopUp(kpiChartWin);
	kpiChartBox.visible = true;
	kpiChartBox.includeInLayout = true;
	kpiChartWin.x = gisWindow.x;
	kpiChartWin.y = gisWindow.height - 5;
	kpiChartWin.height = 5;
	kpiChartWin.width = 240;
	
}

protected function kpiChartWin_restoreHandler(event:WindowEvent):void
{
	PopUpManager.removePopUp(kpiChartWin);
	kpiChartBox.visible = true;
	kpiChartBox.includeInLayout = true;
	kpiChartBox.addElement(popWin);
	
}

protected function dayLevel_clickHandler():void
{
	hisImg.visible = true;
	hisImg.includeInLayout = true;
	
	addImg.visible = true;
	addImg.includeInLayout = true;
	var evt:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA1);
	evt.param.interval = "1";
	intervalS = "1";
	msgDispatcher(evt);
	log.info("根据kpiId获取历史数据图表展示数据DAY：");
	log.info(evt);
	//是否比较时间。
	compareDateFlag = "0";
}

protected function weekLevel_clickHandler():void
{
	hisImg.visible = false;
	hisImg.includeInLayout = false;
	addImg.visible = true;
	addImg.includeInLayout = true;
	var evt:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA1);
	evt.param = new Object();
	evt.param.interval = "2";
	intervalS = "2";
	msgDispatcher(evt);
	log.info("根据kpiId获取历史数据图表展示数据WEEK：");
	log.info(evt);
	//是否比较时间。
	compareDateFlag = "0";
}

protected function monthLevel_clickHandler():void
{
	hisImg.visible = false;
	hisImg.includeInLayout = false;
	addImg.visible = true;
	addImg.includeInLayout = true;
	var evt:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA1);
	evt.param = new Object();
	evt.param.interval = "3";
	intervalS = "3";
	msgDispatcher(evt);
	log.info("根据kpiId获取历史数据图表展示数据MONTH：");
	log.info(evt);
	//是否比较时间。
	compareDateFlag = "0";
}

private function dealClickLowerLevel(e:PrettyChartEvent):void
{
	menuWinLowerLevel.visible = true;
	menuWinLowerLevel.includeInLayout = true;
	
	log.info("---dealClickLowerLevel要开始");
	log.info(e.data);
	
	param = new Object();
	param = e.data;
	
	nextLevelBT.visible = e.data.isNext == "1"; //若有isNext，则判断可以下一级钻取
	nextLevelBT.includeInLayout = e.data.isNext == "1";
	
	//如果是网元，那么出现gis定位按钮
	gisPositionLab.visible = e.data.isNext != "1";
	gisPositionLab.includeInLayout = e.data.isNext != "1";
	
	menuWinLowerLevel.x = this.mouseX - 40;
	menuWinLowerLevel.y = this.mouseY - 10;
}

protected function lowerLevelDrillingTopo():void
{
//	log.debug("[下一级钻取：网元]: 开始！");
//	
//	var evt:KPISituationEvent;
//	
//	//				if(param.isNext == "1")
//	//					evt = new KPISituationEvent(KPISituationEvent.LOAD_KPI_AREA_DATA);
//	
//	log.info("[下一级钻取：网元]: 开始！test");
//	log.info(param);
//	
////	user.sceneId = param.areaId;
//	user.areaId = param.areaId;
//	user.level = "2";
//	user.currentMapType = "0";
//	//				msgDispatcher(evt);
//	
//	log.info("下一级钻取start");
//	var e:SceneEvent = new SceneEvent(SceneEvent.CHANGE_MAPVIEW);
//	e.param = new Object();
//	e.param.centerlongitude = param.centerlongitude;
//	e.param.centerlatitude = param.centerlatitude;
//	msgDispatcher(e);
}

private function gisPositionHandler():void
{
	var evt:SceneEvent = new SceneEvent(SceneEvent.SHOWMO2GIS);
	evt.param = new Object();
	evt.param.moId = param.areaId; //TODO
	evt.param.moTypeId = param.moTypeId;
	evt.param.alarmLevel = param["alarmLevel"];
	log.info("抛出事件gis定位SHOWMO2GIS,参数如下[{0}][{1}]", evt.param.moId, evt.param.moTypeId);
	msgDispatcher(evt);
}
[MessageHandler(selector = "AREAORMO_DATACHANGE")]
public function areaOrMoChangeHandler(e:SceneEvent):void
{
	var evt:SceneEvent;
	
	if (mapVectorComp.visible)
	{
		evt = new SceneEvent(SceneEvent.AREAORMO_MAPVECTOR_DATACHANGE);
	}
	else
	{
		evt = new SceneEvent(SceneEvent.AREAORMO_GISMAP_DATACHANGE);
	}
	msgDispatcher(evt);
}

//历史趋势图菜单处理 
protected function showHistoryTrend():void
{
	log.debug("[xx：]: 开始！");
	log.info(param);
	user.areaId = param.areaId;
	user.moId = param.areaId;
	
	//网元的历史趋势图 跳转到指标定制页面
	if (param.hasOwnProperty("moTypeId"))
	{
		var e:KpiCustomEvent = new KpiCustomEvent(KpiCustomEvent.QUERYKPI);
		var p:Object = new Object();
		p.moTypeId = param.moTypeId;
		p.kpiIDs = [param.kpiId];
		p.moOrAreaFlag = "0";
		p.moOrAreaId = param.areaId;
		
		e.param = p;
		
		log.info("图表 网元-历史趋势 处理：");
		log.info(e.param);
		
		msgDispatcher(e);
	}
	else
	{
		if (param.isNext == "1")
		{
			var evt:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_HISTORY_LINE_DATA);
			log.info("[历史趋势图：]:区域 开始！test");
			user.level = "1";
			
			if (user.level == "1" || user.level == "2")
			{
				user.cityId = GsSceneConts.Province_KEY;
			}
			else
			{
				user.cityId = param.cityId;
			}
//			msgDispatcher(evt);
			requestServerUtil.addRequest(evt);
			log.debug("历史趋势区域 菜单处理！");
			log.info("addPopUp:hisPopupWin");
		}
		else
		{
			var evt1:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_HISTORY_TOPN_LINE_DATA);
			log.info("[历史趋势图topn：]:区域 开始！test");
			user.level = "2";
			
			if (user.level == "1" || user.level == "2")
			{
				user.cityId = GsSceneConts.Province_KEY;
			}
			else
			{
				user.cityId = param.cityId;
			}
//			msgDispatcher(evt1);
			requestServerUtil.addRequest(evt1);
			log.debug("历史趋势区域tpon 菜单处理！");
			log.info("addPopUp:hisPopupWin topn");
		}
	}
}

private function openWin():void
{
	log.debug("[配置：指标窗口]: 开始！");
	PopUpManager.addPopUp(configurationWin, this.parent as DisplayObject);
	configurationWin.x = (this.stage.width - configurationWin.width) / 2 - 150;
	configurationWin.y = (this.stage.height - configurationWin.height) / 2 - 50;
	configurationWin.visible = true;
}

private function openWin1():void
{
	log.debug("[配置：指标窗口]: 开始！");
	PopUpManager.addPopUp(configurationWin1, this);
	configurationWin1.x = (this.stage.width - configurationWin1.width) / 2 - 150;
	configurationWin1.y = (this.stage.height - configurationWin1.height) / 2 - 50;
	configurationWin1.visible = true;
}

protected function ok_clickHandler():void
{
	log.info("startTime = " + startTime.text + "endTime=" + endTime.text);
	var evt:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA1);
	evt.param = new Object();
	evt.param.interval = "1";
	user.startTime = startTime.text;
	user.endTime = endTime.text;
	user.hisFlag = "1";
	msgDispatcher(evt);
	log.info("时间：");
	log.info(evt);
	//是否比较时间。
	compareDateFlag = "0";
}

//返回上一层
[MessageHandler(selector = "CMS_SCENE_SCENEVIEW_BACKTOPFLOOR")]
public function backlastfloor(e:SceneEvent = null):void
{
	if(mapViewDM.gisLayerMapType){
		mapGisLayer_clickHandler();//图层返还。
	}else{
		var evt:SceneEvent = new SceneEvent("DEAL_SCENE_CHANGE");
		evt.param = new Object();
		evt.param.level = "1";
		msgDispatcher(evt);
	}
}

[Inject("mapViewDM")]
public var mapViewDM:MapViewDM;

private function dyeMapByAllHandler():void
{
	log.info("触发根据所有指标渲染地图！！");
	user.kpiId = null;
	user.kpiName = null;
	user.moTypeId = null;
	user.kpiIdList = "";
	user.moTypeIdList = "";
	
	for each (var kpi:Object in mapViewDM.impKpiList)
	{
		if (user.kpiIdList == "")
		{
			user.kpiIdList += kpi['kpiId'];
			user.moTypeIdList += kpi['moTypeId'];
		}
		else
		{
			user.kpiIdList += "," + kpi['kpiId'];
			user.moTypeIdList += "," + kpi['moTypeId'];
		}
	}
	
	if (user.currentMapType == "1" && user.level == "1")
	{
		log.info("刷新 矢量图 渲染数据！");
		var evt:SceneEvent = new SceneEvent(SceneEvent.RENDER_VECTOR_MAP);
		msgDispatcher(evt);
	}
	
	log.info("GIS地图开始判断，是否需要处理：" + (user.currentMapType == "0" && user.level == "2" && !user.isDrillDown));
	user.refreshPolygon = true;
	
	if (user.currentMapType == "0" && user.level == "2" && !user.isDrillDown)
	{
		log.info("刷新GIS泰森多边形数据！");
//		msgDispatcher(new SceneEvent(SceneEvent.LOAD_SCENE_POLYGON));
		requestServerUtil.addRequest(new SceneEvent(SceneEvent.LOAD_SCENE_POLYGON));
	}
}

protected function hisPopupWin_maximizeHandler(event:WindowEvent):void
{
	hisPopupWin.width = this.parentApplication.width;
	hisPopupWin.height = this.parentApplication.height;
	
}

protected function ok_clickHandler1():void
{
	log.info("vgroup.numElements:" + vgroup.numElements);
	//TODO 	
	var compareDate:String = "";
	
	for (var i:int = 0; i < vgroup.numElements; i++)
	{
		if (vgroup.getElementAt(i) is CompareDateVGroup)
		{
			var cdg:CompareDateVGroup = vgroup.getElementAt(i) as CompareDateVGroup;
			log.info("cdg.compareDate---" + cdg.compareDate);
			
			if (cdg.compareDate != null && cdg.compareDate != "")
			{
				compareDate += "," + cdg.compareDate;
				log.info("llllllllll+compareDate" + compareDate);
			}
		}
	}
	
	//log.info(param);
	if (compareDate.length > 0)
	{
		log.info("kkkkkkkkkkk+compareDate.length" + compareDate.length);
		user.compareDate = compareDate.substr(1);
		log.info("ggggggggg+compareDate.substr(1)" + compareDate.substr(1));
	}
	else
	{
		Alert.show("请选择比较日期！！", "提示");
		return;
	}
	
	log.info(user);
	var evt:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_COMPARE_LINE_DATA);
	evt.param.interval = intervalS;
	log.info(evt.param);
	msgDispatcher(evt);
	//比较时间标识。
	compareDateFlag = "1";
}

public function compareDateAdd():void
{
	var compareDG:CompareDateVGroup = new CompareDateVGroup();
	compareDG.dispatchMsg = this.msgDispatcher;
	
	log.info("count:" + count);
	
	if (count < 3)
	{
		vgroup.addElement(compareDG);
	}
	
	if (count <= 2)
	{
		count++;
	}
	else
	{
		count = 3
	}
}

[MessageHandler(selector = "DELETE_COMPARE_DATE")]
public function deleteCompareDate(e:SceneEvent):void
{
	count--;
	
	if (count == 0)
	{
		vgroup.removeAllElements();
	}
	
	log.info("count:" + count + "deleteCompareDate");
}

/**
 * 校验当前新增对象在已有集合中是否重复
 * returnFlag：true：不重复；false：重复
 */
private function voliade(destArr:ArrayCollection, currentObj:Object):Boolean
{
	var returnFlag:Boolean = true;
	
	for each (var obj:Object in destArr)
	{
		if (obj == currentObj)
		{
			returnFlag = false;
			break;
		}
	}
	return returnFlag;
}

[MessageHandler(selector = "COMPARE_DATE")]
public function compareDate(e:SceneEvent):void
{
	//判断当前输入时间值是否小于初始设定时间值
	log.info("粒度为:" + intervalS);
	
	//				if(statisticsLevelg == "1")
	//				{
	
	
	if (intervalS == "1")
	{
		var currentDate:Date = new Date();
		currentDate.setDate(currentDate.getDate() - 1);
		log.info("currentDate:" + currentDate);
		var cd:String = DateUtils.parseDate(currentDate, "YYYY-MM-DD");
		log.info("cd:" + cd);
		log.info("(e.param['date'] as DateField).text:" + (e.param['date'] as DateField).text);
		
		if ((e.param['date'] as DateField).text < cd)
		{
			log.info("日粒度--比较时间符合要求:" + compareDate);
			var uu:String = (e.param['date'] as DateField).text;
			log.info("uu:" + uu);
			
			if (!voliade(arrayListD, uu)) // 判断当前输入时间值是否在已有对象中存在
			{
				(e.param['date'] as DateField).errorString = "时间值输入重复";
				log.info("Day？:" + compareDate);
			}
			else
			{
				(e.param['date'] as DateField).errorString = null;
				compareDateData = (e.param['date'] as DateField).text;
				arrayListD.addItem(uu);
				log.info("Day结束:" + compareDate);
			}
		}
		else
		{
			log.info("日粒度--比较时间与当前时间比较:" + compareDate);
			(e.param['date'] as DateField).errorString = "比较日期不能早于当前日期";
		}
	}
	else if (intervalS == "2")
	{
		var currentDate:Date = new Date();
		currentDate.setDate(currentDate.getDate() - 7);
		log.info("currentDate:" + currentDate);
		var cd:String = DateUtils.parseDate(currentDate, "YYYY-MM-DD");
		log.info("cd:" + cd);
		log.info("(e.param['date'] as DateField).text:" + (e.param['date'] as DateField).text);
		
		if ((e.param['date'] as DateField).text < cd)
		{
			log.info("月粒度--比较时间符合要求:" + compareDate);
			var uu:String = (e.param['date'] as DateField).text;
			log.info("uu:" + uu);
			
			if (!voliade(arrayListD, uu)) // 判断当前输入时间值是否在已有对象中存在
			{
				(e.param['date'] as DateField).errorString = "时间值输入重复";
				log.info("Day？:" + compareDate);
			}
			else
			{
				(e.param['date'] as DateField).errorString = null;
				compareDateData = (e.param['date'] as DateField).text;
				arrayListD.addItem(uu);
				log.info("Day结束:" + compareDate);
			}
		}
		else
		{
			log.info("日粒度--比较时间与当前时间比较:" + compareDate);
			(e.param['date'] as DateField).errorString = "比较日期不能早于当前日期";
		}
	}
	else if (intervalS == "3")
	{
		var currentDate:Date = new Date();
		currentDate.setDate(currentDate.getMonth() - 1);
		log.info("currentDate:" + currentDate);
		var cd:String = DateUtils.parseDate(currentDate, "YYYY-MM-DD");
		log.info("cd:" + cd);
		log.info("(e.param['date'] as DateField).text:" + (e.param['date'] as DateField).text);
		
		if ((e.param['date'] as DateField).text < cd)
		{
			log.info("月粒度--比较时间符合要求:" + compareDate);
			var uu:String = (e.param['date'] as DateField).text;
			log.info("uu:" + uu);
			
			if (!voliade(arrayListD, uu)) // 判断当前输入时间值是否在已有对象中存在
			{
				(e.param['date'] as DateField).errorString = "时间值输入重复";
				log.info("Day？:" + compareDate);
			}
			else
			{
				(e.param['date'] as DateField).errorString = null;
				compareDateData = (e.param['date'] as DateField).text;
				arrayListD.addItem(uu);
				log.info("Day结束:" + compareDate);
			}
		}
		else
		{
			log.info("日粒度--比较时间与当前时间比较:" + compareDate);
			(e.param['date'] as DateField).errorString = "比较日期不能早于当前日期";
		}
	}
	
}

protected function button2_clickHandler(event:MouseEvent):void
{
	msgDispatcher(new KpiCustomEvent(KpiCustomEvent.VIEWSHOW));
}

protected function roam_clickHandler(event:MouseEvent):void
{
	var url:String = "http://10.39.248.230/monitor/RoamIndex.html";
	navigateToURL(new URLRequest(url));
}

private function dataTipFormate(hd:HitData):String
{
	var dd:String;
	//data对应设置的数据集中的一个数据对象
	var data:Object = hd.item;
	var ci:String = hd.chartItem.element['yField'];
	
	var unit:String = data['unit'];
	
	if (unit == null)
		unit = "";
	
	if (user.dateFlag == "1")
	{
		if (ci == "kpiValue")
		{
			dd = data['kpiName'] + "\n" + data['gatherTime'] + "\n" + data['kpiValue'] + unit;
		}
		else if (ci == "kpiValue1")
		{
			dd = data['kpiName'] + "\n" + data['gatherTime1'] + "\n" + data['kpiValue1'] + unit;
		}
		else if (ci == "kpiValue2")
		{
			dd = data['kpiName'] + "\n" + data['gatherTime2'] + "\n" + data['kpiValue2'] + unit;
		}
		else if (ci == "kpiValue3")
		{
			dd = data['kpiName'] + "\n" + data['gatherTime3'] + "\n" + data['kpiValue3'] + unit;
		}
		
	}
	else
	{
		//展示的字段和形式执行控制，支持html语法。
		if (ci == "kpiValue")
		{
			dd = data['kpiName'] + "\n" + data['gatherTime'] + "\n" + data['kpiValue'] + unit;
		}
		else if (ci == "kpiValue1")
		{
			dd = data['kpiName'] + "\n" + data['gatherTime1'] + "\n" + data['kpiValue1'] + unit;
		}
		else if (ci == "kpiValue2")
		{
			dd = data['kpiName'] + "\n" + data['gatherTime2'] + "\n" + data['kpiValue2'] + unit;
		}
		else if (ci == "kpiValue3")
		{
			dd = data['kpiName'] + "\n" + data['gatherTime3'] + "\n" + data['kpiValue3'] + unit;
		}
		//					if (ci == "kpiValue")
		//					{
		//						dd = data['time'] + "\n" + data['kpiValue'];
		//					}
		//					else if (ci == "kpiValue1")
		//					{
		//						dd = data['time1'] + "\n" + data['kpiValue1'];
		//					}
		//					else if (ci == "kpiValue2")
		//					{
		//						dd = data['time2'] + "\n" + data['kpiValue2'];
		//					}
		//					else if (ci == "kpiValue3")
		//					{
		//						dd = data['time3'] + "\n" + data['kpiValue3'];
		//					}
	}
	
	return dd;
}

[MessageHandler(selector = "SHOW_KPI_PLAN")]
[MessageHandler(selector = "SHOW_MULT_MOGIS_LAYER")]
[MessageHandler(selector = "CMS_SCENE_SCENEVIEW_CAMERAFIXPOSITIONHANDLER")]
public function prepare2GisLocation(e:SceneEvent):void
{
	log.info("切换地图为gis地图：{0}", gisComp.visible);
	
	showGisMap();
}
/*显示矢量图*/
private function showMapVector():void{
	if (gisComp.visible){
		mapVectorFlag = true;
		mapVectorComp.visible = true;
		gisComp.visible = false;
	}
}
/*显示GIS地图*/
private function showGisMap():void{
	if (!gisComp.visible)
	{
		mapVectorFlag = false;
		mapVectorComp.visible = false;
		gisComp.visible = true;
	}
}
private function back2vectMap():void
{
	showMapVector();
	this.back2vectMapBT.visible = false;
}

[MessageHandler(selector = "SHOW_MULT_MOGIS_LAYER")]
[MessageHandler(selector = "CMS_SCENE_SCENEVIEW_CAMERAFIXPOSITIONHANDLER")]
//			[MessageHandler(selector="SHOW_MOGIS_LAYER")]
public function closeBackHandler(e:SceneEvent):void
{
	if (user.currentMapType == "1")
	{
		this.back2vectMapBT.visible = true;
	}
}

[MessageHandler(selector = "SAMPLE_MAP_CHANGE")]
public function panelShowOrHidden(e:SceneEvent):void
{
	//1 矢量地图  0 gis地图
	if (user.currentMapType == "1")
	{
		showMapVector();
	}
	else
	{
		showGisMap();
		gisComp.hideAllFeatures();
	}
}
protected function config_clickHandler():void
{
	
	log.info("保存配置信息！！！");
	var panels:ArrayCollection = new ArrayCollection();
	var sevt:SceneEvent = new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_CONFIGSAVE);
	sevt.param = new Object;
	sevt.param.sceneTypeId = user.sceneTypeId;
	sevt.param.accName = user.account;
	sevt.param.level = user.level;
	
	var ckbx:CheckBoxComp;
	
	for (var i:int = 0; i < panelCfgGroup.numElements; i++)
	{
		ckbx = panelCfgGroup.getElementAt(i) as CheckBoxComp;
		
		if (ckbx.selected)
			panels.addItem(ckbx.param);
	}
	sevt.param.panels = panels;
	log.info(sevt.param);
//	msgDispatcher(sevt);
	requestServerUtil.addRequest(sevt);
}

[MessageHandler(selector = "CMS_SCENE_SCENEVIEW_CONFIGENABLE")]
public function configEnableHandler(e:SceneEvent):void
{
	return;
	var ckbx:CheckBoxComp;
	var temp:Object;
	
	for (var i:int = 0; i < panelCfgGroup.numElements; i++)
	{
		ckbx = panelCfgGroup.getElementAt(i) as CheckBoxComp;
		temp = ckbx.param;
		
		if (ckbx.selected)
		{
			this['panelShowGroup_' + temp["location"]].addElementAt(sceneConfigDM.panelIdUIMap[temp["panelName"]], (this['panelShowGroup_' + temp["location"]] as VGroup).numChildren > (int(temp["showindex"]) - 1) ? (int(temp["showindex"]) - 1) : (this['panelShowGroup_' + temp["location"]] as VGroup).numChildren);
		}
		else
		{
			if (sceneConfigDM.panelIdUIMap[temp["panelName"]].hasOwnProperty('closeWindow'))
				sceneConfigDM.panelIdUIMap[temp["panelName"]].closeWindow();
			else
				this['panelShowGroup_' + temp["location"]].removeElement(sceneConfigDM.panelIdUIMap[temp["panelName"]]);
		}
	}
}

protected function togglebutton1_clickHandler(event:MouseEvent):void
{
	var tb:ToggleButton = event.currentTarget as ToggleButton;
	var panelName:String = tb.label;
	var index:String = sceneConfigDM.panelIdUIMap[panelName]['index'];
	var location:String = tb.name;
	var w:Number = sceneConfigDM.panelIdUIMap[panelName]['width'];
	var h:Number = sceneConfigDM.panelIdUIMap[panelName]['height'];
	log.info("面板移动操作：name：" + panelName + " w:" + w + " h:" + h);
	
	if (tb.selected)
	{
		log.info("面板移动操作：" + tb.selected);
		//从左右布局容器中移除
		if (sceneConfigDM.panelIdUIMap[panelName].hasOwnProperty('closeWindow'))
			sceneConfigDM.panelIdUIMap[panelName].closeWindow();
		else
			this['panelShowGroup_' + location].removeElement(sceneConfigDM.panelIdUIMap[panelName]);
		//添加到GIS布局中
		addWin2GisGroup(gisViewGroup, sceneConfigDM.panelIdUIMap[panelName] as Window);
	}
	else
	{
		log.info("面板移动操作：" + tb.selected);
		//从GIS布局中删除
		gisViewGroup.removeElement(sceneConfigDM.panelIdUIMap[panelName]);
		//添加到左右布局容器中
		this['panelShowGroup_' + location].addElementAt(sceneConfigDM.panelIdUIMap[panelName], (this['panelShowGroup_' + location] as VGroup).numChildren > (int(index) - 1) ? (int(index) - 1) : (this['panelShowGroup_' + location] as VGroup).numChildren);
	}
	(sceneConfigDM.panelIdUIMap[panelName] as Window).dragable = tb.selected;
}

private function addWin2GisGroup(g:Group, win:Window):void
{
	var xx:Number = 50;
	var yy:Number = 40;
	
	if (g.numChildren > 0)
	{
		xx = g.getElementAt(g.numChildren - 1).x + 80;
		yy = g.getElementAt(g.numChildren - 1).y + 30;
		
		if (xx > g.width - win.width)
			xx = 50;
		
		if (yy > g.height - win.height)
			yy = 40;
	}
	win.x = xx;
	win.y = yy;
	
	log.info("面板移动操作：add");
	log.info("xx:"+xx);
	log.info("yy:"+yy);
	gisViewGroup.addElement(win);
	win.width = win.width;
	win.height = win.height;
	log.info("win w:"+win.width);
	log.info("win h:"+win.height);
}

private var flag410:Boolean = false;

private function loadTip():void
{
	countSign++;
	
	if (countSign % 2 == 0)
	{
		user.isNew = "0";
		
		madePrompt.source = openTip;
		madePrompt.toolTip = "定制提示";
//		madePrompt.label == "定制提示";
	}
	else if (user.isNew == "1")
	{
		user.isNew = "1";
		madePrompt.source = closeTip;
		madePrompt.toolTip = "取消提示";
//		madePrompt.label == "取消提示";
	}
}



protected function madePrompt_clickHandler():void
{
	countSign++;
	log.info("countSign" + countSign);
	log.info(countSign % 2);
	
	if (countSign % 2 == 0)
	{
		log.info("sceneview定制提示");
		user.isNew = "0";
		madePrompt.source = openTip;
		madePrompt.toolTip = "定制提示";
	}
	else
	{
		log.info("sceneview取消提示");
		user.isNew = "1";
		madePrompt.source = closeTip;
		madePrompt.toolTip = "取消提示";
	}
}

protected function mapconfig_clickHandler(event:MouseEvent):void
{
	var btn:Image = event.currentTarget as Image;
	mapShowCfgWin.x = btn.x - 100;
	mapShowCfgWin.y = btn.y + 40;
	PopUpManager.addPopUp(mapShowCfgWin, this.parent as DisplayObject);
}

protected function mapGisLayer_clickHandler():void
{
//	var btn:Image = event.currentTarget as Image;
	log.info("mapGisLayer_clickHandler");
	if("0"==user.currentMapType){//当前为gis地图页面（图层，或者gis定位，LTE区域）
		user.currentMapType = "1";
		gisWindow_resize(2);
		mapViewDM.gisLayerMapType = false;
		gisLayerMapType=false;//不是图层，与mapViewDM.gisLayerMapType一致。
		gisWindow.maximizeButton.visible = true;
	}else{
		user.currentMapType = "0";
		gisWindow_resize(1);
		mapViewDM.gisLayerMapType = true;
		gisLayerMapType=true;//不是图层，与mapViewDM.gisLayerMapType一致。
		gisWindow.maximizeButton.visible = false;
	}
	//显示图层
	var evt:SceneEvent = new SceneEvent(SceneEvent.SAMPLE_MAP_CHANGE);
	msgDispatcher(evt);
	evt = new SceneEvent(SceneEvent.GISLAYER_CHANGE);
	msgDispatcher(evt);
}

protected function scenetree_clickHandler(event:MouseEvent):void
{
	var btn:Image = event.currentTarget as Image;
	sceneTreeWin.x = btn.x + 130;
	sceneTreeWin.y = btn.y + 40;
	PopUpManager.addPopUp(sceneTreeWin, this.parent as DisplayObject);
//	sceneTreeWin.loadData();
}
protected function mapshowcfg_refreshFun(refreshT:String,loadMapInfoType:String,loadMapShowKey:Object):void
{
	mapVectorDM.loadMapInfoType = loadMapInfoType;
	mapVectorDM.loadMapShowKey = loadMapShowKey;
	//通知查询。
	var evt:SceneEvent = new SceneEvent(SceneEvent.AREAORMO_MAPVECTOR_DATACHANGE);;
	msgDispatcher(evt);
}
protected function navigatorcontent1_mouseOverHandler(event:MouseEvent):void
{
	flag410 = true;
	setTimeout(function():void
	{
		log.info("flag=" + flag410 + "isNew=" + user.isNew);
		if (flag410 && user.isNew == "1")
		{
			user.labelTypeId = "410";
			var obj:Object = new Object;
			obj.sceneId = user.sceneId;
			obj.level = user.level;
			//							if (chartTabBar.selectedIndex == 0)
			//							{
			//								obj.labelId=409;
			//							}
			//							else
			//							{
			obj.labelId = 410;
			//							}
			log.info("labelId=" + obj.labelId + "selectedIndex=" + chartTabBar.selectedIndex);
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINTROINFO_DATA);
			e.obj = obj;
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}
		flag410 = false;
	}, 3000);
}

protected function navigatorcontent1_mouseOutHandler(event:MouseEvent):void
{
	flag410 = false;
}

protected function winListResize_effectEndHandler(event:EffectEvent):void
{
	if (winListImg.name == "la")
	{
		winListImg.name = "ra"
		winListImg.source = ra;
		winListImg.toolTip = '显示窗口列表栏';
		pbh.visible = false;
	}
	else
	{
		winListImg.name = "la"
		winListImg.source = la;
		winListImg.toolTip = '隐藏窗口列表栏';
	}
}

protected function winListImg_clickHandler(event:MouseEvent):void
{
	if (winListImg.name == "la")
	{
		winListResize.alphaTo = 0;
	}
	else
	{
		pbh.visible = true;
		winListResize.alphaTo = 1;
	}
	winListResize.play();
}

protected function cfgBar_mouseOverHandler(event:MouseEvent):void
{
	log.debug("GIS配置按钮提示信息...");
	
	if (user.isNew == "1")
	{
		user.labelTypeId = "402";
		setTimeout(function():void
		{
			var obj:Object = new Object;
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINTROINFO_DATA);
			obj.labelId = "402";
			e.obj = obj;
			log.debug("参数信息...");
			log.info(e.obj);
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}, 3000);
	}
}

protected function indexDingzhiButton_mouseOverHandler(event:MouseEvent):void
{
	log.debug("GIS指标定制按钮提示信息...");
	
	if (user.isNew == "1")
	{
		user.labelTypeId = "403";
		setTimeout(function():void
		{
			var obj:Object = new Object;
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINTROINFO_DATA);
			obj.labelId = "403";
			e.obj = obj;
			log.debug("参数信息...");
			log.info(e.obj);
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}, 3000);
	}
	
}

protected function dyeMapByAllButton_mouseOverHandler(event:MouseEvent):void
{
	log.debug("GIS渲染所有按钮提示信息...");
	
	if (user.isNew == "1")
	{
		user.labelTypeId = "404";
		setTimeout(function():void
		{
			var obj:Object = new Object;
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINTROINFO_DATA);
			obj.labelId = "404";
			e.obj = obj;
			log.debug("参数信息...");
			log.info(e.obj);
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}, 3000);
	}
	
}

protected function roamButton_mouseOverHandler(event:MouseEvent):void
{
	log.debug("GIS漫游数据按钮提示信息...");
	
	if (user.isNew == "1")
	{
		user.labelTypeId = "405";
		setTimeout(function():void
		{
			var obj:Object = new Object;
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINTROINFO_DATA);
			obj.labelId = "405";
			e.obj = obj;
			log.debug("参数信息...");
			log.info(e.obj);
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}, 3000);
	}
	
}

protected function backButton_mouseOverHandler(event:MouseEvent):void
{
	log.debug("GIS返回按钮提示信息...");
	
	if (user.isNew == "1")
	{
		user.labelTypeId = "406";
		setTimeout(function():void
		{
			var obj:Object = new Object;
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINTROINFO_DATA);
			obj.labelId = "406";
			e.obj = obj;
			log.debug("参数信息...");
			log.info(e.obj);
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}, 3000);
	}
	
}

protected function navtab1_mouseOverHandler(event:MouseEvent):void
{
	//				log.debug("GIS退服统计提示信息...");
	if (user.isNew == "1")
	{
		user.labelTypeId = "409";
		setTimeout(function():void
		{
			var obj:Object = new Object;
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINTROINFO_DATA);
			obj.labelId = "409";
			e.obj = obj;
			log.debug("参数信息...");
			log.info(e.obj);
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}, 3000);
	}
	
}

/**
 * 快速检索查询方法
 *
 */
protected function queryButton_clickHandler(event:MouseEvent):void
{
	var evt:SceneEvent = new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_SOURCEBYMO);
	var param:Object = new Object;
	param.name = mx.utils.StringUtil.trim(moQueryText.text);
	
	if (mx.utils.StringUtil.trim(moQueryText.text) == "")
	{
		Alert.show("请输入网元名称!", "提示");
		return;
	}
	param.cityId = user.cityId;
	param.level = user.level;
	param.sceneId = user.sceneId;
	evt.param = param;
	log.debug("快速检索查询参数...");
	log.debug(evt.param);
//	msgDispatcher(evt);
	requestServerUtil.addRequest(evt);
}

protected function cameraQuery_clickHandler(event:MouseEvent):void
{
	if (StringUtil.trim(cameraName.text).length > 0)
	{
		var evt:SceneEvent = new SceneEvent(SceneEvent.CMS_SCENE_MAPVIEW_CAMERAINFOGETHANDLER);
		evt.param = new Object();
		evt.param.sceneId = user.sceneId;
		evt.param.initSceneId = user.initSceneId;
		evt.param.moName = StringUtil.trim(cameraName.text);
		cameraName.text = StringUtil.trim(cameraName.text);
//		msgDispatcher(evt);
		requestServerUtil.addRequest(evt);
	}
	else
	{
		Alert.show("请输入终端名称", "提示");
		return;
	}
}

[MessageHandler(selector = "DEAL_SCENE_JINGQUKPI")]
public function jingquTitle(e:SceneEvent):void
{
	jingquPanel.title = mapViewPM.mapViewDM.userNumList.getItemAt(0).time;
	
	for (var index:int = 0; index < mapViewPM.mapViewDM.userNumList.length; index++)
	{
		mapViewPM.mapViewDM.userNumLevel[mapViewPM.mapViewDM.userNumList.getItemAt(index)['areaname']] = index + 1;
	}
	
	//加载场景下所有景区缩略图
	var sevt:SceneEvent = new SceneEvent(SceneEvent.LOAD_SCENE_SNAPSHOTS_ALL);
	sevt.param = new Object;
	sevt.param.sceneId = user.sceneId;
	sevt.param.level = user.level;
//	msgDispatcher(sevt);
	requestServerUtil.addRequest(sevt);
}

[MessageHandler(selector = "CMS_SCENE_SCENEVIEW_SHOW_MOLIST")]
public function showDataGrid(e:SceneEvent):void
{
	log.debug("展示网元信息...");
	
	if (mapViewPM.mapViewDM.selectMoList.length > 0)
	{
		PopUpManager.addPopUp(gisSearchWindow, this.parent as DisplayObject);
		gisSearchWindow.x = this.width / 2 + 80;
		gisSearchWindow.y = this.height / 2 - 120;
		gisSearchWindow.visible = true;
	}
	else
	{
		Alert.show("没有查询到匹配信息！", "提示");
	}
	//				var evt:SceneEvent = new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_SEARCH_OPEN);
	//				msgDispatcher(evt);
}

protected function advanceddatagrid1_itemClickHandler(event:ListEvent):void
{
	log.debug("列表定位网元信息....");
	//				sourceLayer.clear();
	log.debug("选择行：" + event.rowIndex);
	var data:Object = mapViewPM.mapViewDM.selectMoList[event.rowIndex];
	log.debug(data);
	var e:SceneEvent = new SceneEvent(SceneEvent.SHOWMO2GIS);
	e.param = new Object();
	e.param.moId = data.moId;
	e.param.moTypeId = data.moTypeId;
	e.param.sceneId = user.initSceneId;
	log.debug("参数信息：...");
	log.debug(e.param);
//	msgDispatcher(e);
	requestServerUtil.addRequest(e);
}

protected function gisSearchWindow_closeHandler(event:WindowEvent):void
{
	PopUpManager.removePopUp(this.gisSearchWindow);
}

protected function chartViewStack_changeHandler(event:IndexChangedEvent):void
{
	if (chartViewStack.selectedIndex == 1)
	{
//		msgDispatcher(new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA));
		requestServerUtil.addRequest(new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA));
	}
}

[MessageHandler(selector = "CMS_SCENE_CAMERALISTSHOWWIN_CAMERALISTSHOWHANDLER")]
public function showCameraListWin(e:SceneEvent):void
{
	if (!cameraListShowWin.isShow)
	{
		cameraListShowWin.isShow = true;
		cameraListShowWin.width = 280;
		cameraListShowWin.height = 300;
		PopUpManager.addPopUp(cameraListShowWin, this.parent as DisplayObject);
		PopUpManager.centerPopUp(cameraListShowWin);
	}
	cameraListShowWin.cameraListShowHandler(e);
}

//备用，该处的导出会导致当前页面重定向，暂时不用该方法。汪炜，2013-9-24
/* 			private function exportKPI():void
{
if(kpiSituationDM.kpiCharData.length<=0){
Alert.show("没有指标数据！");
return;
}
log.info("begin to export：--->");
var fileRefer:FileReference = new FileReference();
var fileType:FileFilter=new FileFilter("Excel", "*.xls");
var fileTypes:Array=new Array(fileType);
var fileUpDownLoad:FileUpDownLoad=new FileUpDownLoad();
var downLoadUrl:URLRequest=new URLRequest("/cms/scene/panels/exportSceneKpiTrendAction!exportKpiTrend.action");
log.debug("[历史指标导出]:参数..user.kpiId=" + user.kpiId + ",user.timeInterval=" + user.timeInterval+",user.moTypeId="+user.moTypeId+",user.dateFlag="+ user.dateFlag);
//参数。
var downLoadData:URLVariables = new URLVariables();
downLoadData.sceneId = user.sceneId;
downLoadData.cityId = user.cityId;
downLoadData.kpiId = user.kpiId;
downLoadData.moTypeId = user.moTypeId;
downLoadData.isStaticres = user.isStaticres;
downLoadData.dateFlag = user.dateFlag;
downLoadData.startTime = user.startTime;
downLoadData.endTime = user.endTime;
downLoadData.initSceneId = user.initSceneId;
downLoadUrl.data=downLoadData;
fileUpDownLoad.downLoadURLRequest=downLoadUrl;
fileUpDownLoad.fileFilters=fileTypes;
fileUpDownLoad.downLoad();
} */
private function exportKPI():void
{
	if (kpiSituationDM.kpiCharData.length <= 0)
	{
		Alert.show("没有指标数据！");
		return;
	}
	//'account':'ailk','roleId':'1','areaId':'1','context':'/cms/'},
	var sceneName:String;
	var cityName:String = "";
	
	if (null != naviTree.sceneTree.selectedItem)
	{
		var data:XML = XML(naviTree.sceneTree.selectedItem);
		sceneName = String(data.@name);
		//level 1:场景   2：区域    3：地市
		log.info("data.parent()---->" + data.parent());
		
		if ("2" == data.attribute("level") && undefined != data.parent() && null != data.parent())
		{
			cityName = data.parent().@name;
		}
	}
	else
	{
		var allData:XML = XML(naviTree.sceneTree.dataProvider);
		sceneName = String(allData.@name);
		
	}
	log.info("begin to export：--->sceneName:" + sceneName + ",cityName:" + cityName);
	var url:String = user.context + "/scene/panels/exportSceneKpiTrendAction!exportKpiTrend.action?"
		+ "sceneId=" + user.sceneId + "&sceneName=" + sceneName + "&cityName=" + cityName + "&cityId=" + user.cityId
		+ "&kpiId=" + user.kpiId + "&moTypeId=" + user.moTypeId + "&isStaticres=" + user.isStaticres
		+ "&dateFlag=" + user.dateFlag + "&startTime=" + user.startTime + "&endTime=" + user.endTime
		+ "&floatLevel=" + user.floatLevel + "&showBadMoPoints=" + user.showBadMoPoints + "&mapType=" + user.mapType
		+ "&labelTypeId=" + user.labelTypeId + "&isGisFlag=" + user.isGisFlag + "&pointlongitude=" + user.pointlongitude
		+ "&timeInterval=" + user.timeInterval + "&isNew=" + user.isNew + "&configPerfClass=" + user.configPerfClass
		+ "&kpiIdList=" + user.kpiIdList + "&floatTime=" + user.floatTime + "&layerId=" + user.layerId
		+ "&refreshPolygon=" + user.refreshPolygon + "&floatId=" + user.floatId + "&pointlatitude=" + user.pointlatitude
		+ "&rendeType=" + user.rendeType + "&context=" + user.context + "&initLayerId=" + user.initLayerId
		+ "&newAdded=" + user.newAdded + "&usinglayer=" + user.usinglayer + "&showMoLayer=" + user.showMoLayer
		+ "&level=" + user.level + "&initSceneId=" + user.initSceneId + "&compareDateFlag=" + compareDateFlag;
	
	if (compareDateFlag == "1")
	{
		url = url + "&compareDate=" + user.compareDate;
	}
	navigateToURL(new URLRequest(url));
}

protected function navigate2LteTopo(event:MouseEvent):void
{
	var url:String = user.context + "cms/webtopo/topo/topo.action?id=1/lte&topoName=default-topo";
	navigateToURL(new URLRequest(url));
}