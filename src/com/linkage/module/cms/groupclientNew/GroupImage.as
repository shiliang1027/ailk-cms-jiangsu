// ActionScript file
import com.adobe.serialization.json.JSON;
import com.adobe.utils.StringUtil;
import com.ailk.common.ui.gis.core.GisFeature;
import com.ailk.common.ui.gis.core.GisFeatureLayer;
import com.ailk.common.ui.gis.core.GisLayer;
import com.ailk.common.ui.gis.core.metry.GisPoint;
import com.ailk.common.ui.gis.core.styles.GisMarkerPictureStyle;
import com.ailk.common.ui.gis.core.styles.GisMarkerPredefinedStyle;
import com.ailk.common.ui.gis.core.styles.GisMarkerStyle;
import com.ailk.common.ui.gis.core.task.GisIdentifyParameters;
import com.ailk.common.ui.gis.core.task.GisIdentifyTask;
import com.ailk.common.ui.gis.core.task.GisQuery;
import com.ailk.common.ui.gis.event.GisExtentEvent;
import com.ailk.common.ui.gis.event.GisIdentifyEvent;
import com.ailk.common.ui.gis.event.MapEvent;
import com.ailk.common.ui.gis.utils.IPUtil;
import com.linkage.module.cms.alarm.framework.common.event.MenuEvent;
import com.linkage.module.cms.components.extend.WindowExtEvent;
import com.linkage.module.cms.components.loadmanager.LoadManager;
import com.linkage.module.cms.components.pager.event.PagerEvent;
import com.linkage.module.cms.groupclientNew.components.AlarmStatComp;
import com.linkage.module.cms.groupclientNew.components.ResourceComp;
import com.linkage.module.cms.groupclientNew.control.GroupImageControl;
import com.linkage.module.cms.groupclientNew.event.AlarmStatCompEvent;
import com.linkage.module.cms.groupclientNew.event.ComplaintInfoEvent;
import com.linkage.module.cms.groupclientNew.event.CustFlowAlarmWindowEvent;
import com.linkage.module.cms.groupclientNew.event.FilterFormEvent;
import com.linkage.module.cms.groupclientNew.event.GroupImageMapEvent;
import com.linkage.module.cms.groupclientNew.event.HealthInfoCompEvent;
import com.linkage.module.cms.groupclientNew.event.MonitorAlarmListWindowEvent;
import com.linkage.module.cms.groupclientNew.event.PerfTopoTotalWindowEvent;
import com.linkage.module.cms.groupclientNew.event.PerfTopoWindowEvent;
import com.linkage.module.cms.groupclientNew.event.ProcessCompEvent;
import com.linkage.module.cms.groupclientNew.event.ProdTopoNavEvent;
import com.linkage.module.cms.groupclientNew.event.RealMonitorAlarmListWindowEvent;
import com.linkage.module.cms.groupclientNew.event.RealMonitorCustListGroupEvent;
import com.linkage.module.cms.groupclientNew.event.RealMonitorPerfCompEvent;
import com.linkage.module.cms.groupclientNew.event.ResourceCompEvent;
import com.linkage.module.cms.groupclientNew.event.SLACompEvent;
import com.linkage.module.cms.groupclientNew.event.SheetInfoEvent;
import com.linkage.system.component.panel.events.WindowEvent;
import com.linkage.system.logging.ILogger;
import com.linkage.system.logging.Log;

import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.net.URLRequest;
import flash.net.URLVariables;
import flash.net.navigateToURL;
import flash.utils.Timer;
import flash.utils.setTimeout;

import mx.collections.ArrayCollection;
import mx.collections.IList;
import mx.controls.Alert;
import mx.core.FlexGlobals;
import mx.events.EffectEvent;
import mx.events.FlexEvent;
import mx.events.IndexChangedEvent;
import mx.events.ListEvent;
import mx.formatters.DateFormatter;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.HTTPService;
import mx.utils.URLUtil;

import spark.events.IndexChangeEvent;

public var parameters:Object;
public var loadManager:LoadManager;
[Bindable]
[Embed(source="../../../../../assets/shiftBtn4_1.png")]
public var pic11:Class;
[Bindable]
[Embed(source="../../../../../assets/shiftBtn3_1.png")]
public var pic21:Class;

[Embed(source="./assets/diamond.png")]
public var jewel:Class;
[Embed(source="./assets/b_gold.png")]
public var gold:Class;
[Embed(source="./assets/b_silver.png")]
public var silver:Class;
[Embed(source="./assets/b_copper.png")]
public var copper:Class;
[Embed(source="./assets/b_standard.png")]
public var standard:Class;
[Embed(source="./assets/unknown.png")]
public var unknown:Class;
[Embed(source="./assets/perf_0_big.png")]
public var perf_0_big:Class;
[Embed(source="./assets/sperf_0.png")]
public var sperf_0:Class;
[Embed(source="./assets/sperf_1.png")]
public var sperf_1:Class;
[Embed(source="./assets/sperf_2.png")]
public var sperf_2:Class;
[Embed(source="./assets/sperf_3.png")]
public var sperf_3:Class;
[Embed(source="./assets/sperf_4.png")]
public var sperf_4:Class;

[Bindable]
public var moInfoData:Object = new Object();
public var custId:String = null;
public var urlSub:String = null;

private var control:GroupImageControl=null;

//导航树数据集
[Bindable]
public var treeData:XML;
//设备告警流水参数
[Bindable]
private var params:Object=new Object();
//运行统计-客户信息数据
[Bindable]
public var custInfoData:Object=new Object();
//运行统计-工程割接数据
[Bindable]
public var processInfoData:ArrayCollection=new ArrayCollection();
[Bindable]
public var processInfo:Object=new Object();

private var df:DateFormatter=new DateFormatter();
[Bindable]
private var salDefaultTime:String;

private var pubflowAlarmFilter:String;

[Bindable]
private var ruleContent:String; //集客告警规则

//告警信息URL
private var warnInfoUrl:String="/warn/rule/report/nonprofess/NonprofessWarnAction!queryWarnInfo.action";

private var runStatAccordionIndex:Number;
private var healthAccordionIndex:Number;

private var rightBottomNormarHeight:Number;

public var moLocationGisLayer:GisLayer= new GisLayer();

private var alarmWindowHeight:Number=0;
private var leftNormalWidth:Number;
private var isLeftShow:Boolean=true;
private var isRightShow:Boolean=true;
private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclientNew.control.GroupImage");
protected function groupImage_creationCompleteHandler():void
{
	
	// TODO Auto-generated method stub
	System.useCodePage=true;
	parameters=parentApplication.parameters;
	styleManager.loadStyleDeclarations2(parameters["styleUrl"], true);
	styleManager.loadStyleDeclarations2(parameters["topoStyle"], true);
	loadManager=parentApplication.loadManager;
	Config.init();
	control = new GroupImageControl(this);
	navTree.addEventListener(ListEvent.CHANGE, control.treeChang);
	this.currentState="city_state";
	params.mapInfo=parameters["user"];
	params.defaultDisplay="alarmstatus";
	control.initTreeData();
	control.addEventListener(GroupImageMapEvent.MAPPOINTSHOW,mapPointShowHandler);
	
	
	loadLayerCfg();
}

private function loadLayerCfg():void{
	var httpService:HTTPService = new HTTPService();
	httpService.method = "get";
	httpService.resultFormat = "e4x";
	httpService.addEventListener(ResultEvent.RESULT, catchLayerCfg);
	if (IPUtil.isInnerIP(URLUtil.getServerName(FlexGlobals.topLevelApplication.url))){
//		log.debug("mapview-----内网");
		httpService.url = "xml/CustGisLayersConfig.xml";
	}else{
//		log.debug("mapview-----外网");
		httpService.url = "xml/OutCustGisLayersConfig.xml";
	}
	httpService.send();
	log.info("[加载图层配置]{0}",httpService.url);
}

private function catchLayerCfg(event:ResultEvent):void
{
	var xml:XML = event.result as XML;
	var layerList:XMLList = xml.child('layer');
//	log.info(xml);
	for each (var layer:XML in layerList)
	{
		var cityId:String = String(layer.@cityId);
		var layerMap:* = JSON.decode(String(layer.@layerMap));
		if (!control.layerCache.hasOwnProperty(cityId)){
			control.layerCache[cityId] = {};
		}
		control.layerCache[cityId].layerUrl = String(layer.@layerUrl);
		control.layerCache[cityId].layerMap = layerMap;
	}
}

protected function moveRight_effectStopHandler(event:EffectEvent):void
{
	control.initTreeData();
}

protected function mapWork_creationCompleteHandler(event:MapEvent):void
{
	moLocationGisLayer.clear();
	log.info("mapWork_mapCreationCompleteHandler");
	mapWork.map.addGisLayer(moLocationGisLayer);
	log.info("地图加载完成！！");
	groupImage_creationCompleteHandler();
}


private function mapPointShowHandler(event:GroupImageMapEvent):void{
	
	log.info("mapPointShowHandler~~~~");
	var pic:GisMarkerPictureStyle = null;
	//var source:Object = new Object();
	var picFeature:GisFeature = null;
	
	moLocationGisLayer.clear();
	
	var moArray:ArrayCollection = new ArrayCollection();
	moArray.addAll(event.param as IList);
	log.info("moArray.length："+moArray.length);
	log.info(moArray);
	if(moArray.length == 0)
	{
		Alert.show("该客户没有网元部署");
	}else
	{
		for each (var source:* in moArray)
		{
//			log.info("CUST_NO:"+source.CUST_NO+"LONGITUDE:"+source.LONGITUDE+"---------LATITUDE:"+source.LATITUDE);
			if(source.COMM_NAME == "金牌服务")
				pic = new GisMarkerPictureStyle(sperf_1);
			else if(source.COMM_NAME == "银牌服务")
				pic = new GisMarkerPictureStyle(sperf_2);
			else if(source.COMM_NAME == "铜牌服务")
				pic = new GisMarkerPictureStyle(sperf_0);
			else if(source.COMM_NAME == "标准服务")
				pic = new GisMarkerPictureStyle(sperf_4);
			picFeature = new GisFeature(new GisPoint(Number(source.LONGITUDE), Number(source.LATITUDE)), pic);
			picFeature.attributes = source;
			picFeature.onClick = featureClickHandler;
			moLocationGisLayer.addGisFeature(picFeature);
		}
		
//		mapWork.map.viewRefresh();
	}
	
}


private function featureClickHandler(param1:GisFeature, param2:MouseEvent) : void
{
	log.info("featureClickHandler");
	
	var gisFeature:GisFeature = param1;
//	var event:* = param2;
	var data:Object = gisFeature.attributes;
	log.info(data);
	moInfoData = data;
	log.info(moInfoData);
	custId = moInfoData["CUST_NO"];
	urlSub = moInfoData["url"];
	
	moInfoPanel.visible = true;
	moInfoPanel.includeInLayout = true;
	
	if((this.mouseX + moInfoPanel.width) >= this.width)
	{
		moInfoPanel.x = this.mouseX - moInfoPanel.width-5;
		moInfoPanel.y = this.mouseY;
	}else{
		moInfoPanel.x = this.mouseX + 5;
		moInfoPanel.y = this.mouseY;
	}
	
	setTimeout(function () : void
	{
		log.info("setTimeout");
		moInfoPanel.visible = false;
		moInfoPanel.includeInLayout = false;
	}, 20 * 1000);
}

protected function moreInfoLabel_clickHandler(event:MouseEvent) : void
{
	var url:String = parameters["urlContext"] + "/cms/groupsupport/report/custreport/custReportForm.jsp?custno=" + custId;
	navigateToURL(new URLRequest(url), "_blank");
}// end function

protected function moreCustInfoLable_clickHandle(event:MouseEvent) : void
{
	
	var month:Number = new Date().getMonth() + 1;
	var year:Number = new Date().getFullYear();
	var monthly:String = String(year) + String(month);
//	var urlSub:String = "http://10.40.94.97:8888/JSNW/customerReport.do?fn=toCustomerReport&customerCode="+custId+"&monthly="+monthly+"&descr=集客画像";
//	urlSub = encodeURIComponent(urlSub+"&descr=") +"集客画像";
	urlSub = encodeURIComponent(encodeURIComponent(urlSub+"&descr="))+"集客画像";
	log.info("urlSub:"+urlSub);
	var url:String = parameters["urlContext"] +"groupsupport/outersys/sso/groupSupportSSOAction.action?url="+urlSub;
	//	var url:String = parameters["urlContext"] +"groupsupport/outersys/sso/groupSupportSSOAction.action?url=http://10.40.94.97:8888/JSNW/customerReport.do?fn=toCustomerReport%26customerCode="+custId+"%26monthly="+monthly+"%26descr=集客画像";
	navigateToURL(new URLRequest(url), "_blank");
}// end functions

protected function moreLabel_clickHandler(event:MouseEvent) : void
{
	if (moreLabel.text == "更多>>")
	{
		moreInfoGroup.visible = true;
		moreInfoGroup.includeInLayout = true;
		moInfoPanel.width = 200;
		moInfoPanel.height = 170;
		moreLabel.text = "收起<<";
	}
	else if (moreLabel.text == "收起<<")
	{
		moreInfoGroup.visible = false;
		moreInfoGroup.includeInLayout = false;
		moInfoPanel.width = 200;
		moInfoPanel.height = 100;
		moreLabel.text = "更多>>";
	}
}

protected function moInfoPanel_closeHandler(event:WindowEvent):void
{
	moInfoPanel.visible = false;
	moInfoPanel.includeInLayout = false;
}

protected function moveLeft_effectStopHandler(event:EffectEvent):void
{
	
//	http://10.40.9.185:54321/cms/cms/groupcustom/GroupImage.jsp
	// TODO Auto-generated method stub
}

private function resizeWindow(id:Number):void
{
	if (!leftNormalWidth || leftNormalWidth == 0)
	{
		leftNormalWidth=leftGroup.width;
	}
	switch (id)
	{
		case 3:
			if (isLeftShow && isRightShow)
			{
				leftGroup.visible=false;
				leftGroup.includeInLayout=false;
				isLeftShow=false;
			}
			else
			{
				leftGroup.width=leftNormalWidth;
				rightGruop.visible=true;
				rightGruop.includeInLayout=true;
				isRightShow=true;
			}

			break;
		case 4:
			if (!isLeftShow && isRightShow)
			{
				leftGroup.visible=true;
				leftGroup.includeInLayout=true;
				isLeftShow=true;
			}
			else
			{
				rightGruop.visible=false;
				rightGruop.includeInLayout=false;
				leftGroup.percentWidth=100;
				isRightShow=false;
			}
			break;
	}
}



protected function fadeEffect_effectEndHandler(event:EffectEvent):void
{
	// TODO Auto-generated method stub

}

protected function alarmListWindow_alarmInfoShowHandler(event:MonitorAlarmListWindowEvent):void
{
	var data:Object=event.param;
	var variables:URLVariables=new URLVariables();
	variables.alarmNo=data.alarmNo;
	if (data.daltime)
	{
		variables.dalTime=String(data.daltime);
	}
	else
	{
		variables.dalTime=0;
	}
	var request:URLRequest=new URLRequest(parameters["urlContext"] + warnInfoUrl);
	request.data=variables;
	navigateToURL(request);
}

protected function custListGroup_custSelectedHandler(event:RealMonitorCustListGroupEvent):void
{
	control.custSelected(String(event.param));
}

protected function alarmWindow_custInfoShowHandler(event:CustFlowAlarmWindowEvent):void
{
	control.isRunStatOpen=true;
	var custId:String=String(event.param.custId);
	runStatAccordionIndex=Number(event.param.index);
	control.custSelected(custId);
}

protected function custAlarmWindow_custInfoShowHandler(event:RealMonitorAlarmListWindowEvent):void
{
	control.isRunStatOpen=true;
	var custId:String=String(event.param.custId);
	runStatAccordionIndex=Number(event.param.index);
	control.custSelected(custId);
}

protected function filterForm_formInitHandler(event:FilterFormEvent):void
{
	control.initFilter();
}

protected function filterForm_queryHandler(event:FilterFormEvent):void
{
	control.queryCustByFilter(event.param);
}

private var timer:Timer;
protected function mapWork_extent_changeHandler(event:GisExtentEvent):void
{
	// TODO Auto-generated method stub
	if(mapWork.map.scale>8000){
//		hideFeatureLayer();
		moLocationGisLayer.clear();
		return;
	}
	if(!timer){
		timer=new Timer(500);
		timer.addEventListener(TimerEvent.TIMER,onTimerHander);
	}
	timer.start();
}

private function onTimerHander(event:TimerEvent=null):void{
	timer.stop();
	timer.reset();
//	showFeatureLayer();
	control.queryCustByExtends();
}

//private var gisFeatureLayer:GisLayer;
//private function hideFeatureLayer():void{
//	if(gisFeatureLayer && mapWork.map.getGisLayer(gisFeatureLayer.id)){
//		mapWork.map.removeGisLayer(gisFeatureLayer);
//		gisFeatureLayer=null;
//	}
//}
//
//public function showFeatureLayer():void{
//	if(!gisFeatureLayer || !mapWork.map.getGisLayer(gisFeatureLayer.id)){
//		var layerData:Object = control.layerCache[control.curParam.cityId];
//		if(layerData){
//			var pic:GisMarkerPictureStyle = null;
////			if(control.curParam.servLevel == "2")
////				pic = new GisMarkerPictureStyle(sperf_1);
////			else if(control.curParam.servLevel == "3")
////				pic = new GisMarkerPictureStyle(sperf_2);
////			else if(control.curParam.servLevel == "4")
////				pic = new GisMarkerPictureStyle(sperf_0);
////			else if(control.curParam.servLevel == "5")
//				pic = new GisMarkerPictureStyle(sperf_4);
//			var layerUrl:String=layerData.layerUrl;
//			var showIds:String = layerData.layerMap[control.curParam.servLevel]["showIds"];
//			gisFeatureLayer = new GisFeatureLayer(layerUrl+"/"+(Number(showIds.split(',')[0])+1),GisFeatureLayer.MODE_SELECTION,["*"]);
//			gisFeatureLayer.gisStyle = new GisMarkerPredefinedStyle(GisMarkerStyle.STYLE_CIRCLE, 20, 0xFF0000);
//			mapWork.map.addGisLayer(gisFeatureLayer);
////			gisFeatureLayer.gisStyle = new GisMarkerPredefinedStyle(GisMarkerStyle.STYLE_CIRCLE, 20, 0xFF0000);
////			log.info("showFeatureLayer----------------{0}",gisFeatureLayer.url);
////			query.gisMetry = pic;
////			query=new GisQuery();
////			gisFeatureLayer.query=query;
////			gisFeatureLayer.query.gisMetry = mapWork.map.gisExtent;
////			gisFeatureLayer.query.addEventListener(GisFeatureLayerEvent.QUERY_FEATURES_COMPLETE,onQueryFeaturesHandler);
////			gisFeatureLayer.queryFeatures();
////			mapWork.map.selectFeaturesByLayerId(gisFeatureLayer.id);
//			
////			gisLayer=new GisLayer();
//////			gisLayer.gisStyle=pic;
////			gisQueryParam=new GisIdentifyParameters();
////			gisQueryParam.width=mapWork.width;
////			gisQueryParam.height=mapWork.height;
////			gisQueryParam.mapExtent=mapWork.map.gisExtent;
////			gisQueryParam.tolerance=3;
////			gisQueryParam.returnGisMetry=true;
////			
////			gisQueryTask=new GisIdentifyTask();
////			gisQueryTask.identifyParameters=gisQueryParam;
////			gisQueryTask.showBusyCursor=true;
////			gisQueryTask.url=StringUtil.trim(layerUrl+"/"+(Number(showIds.split(',')[0])+1));
////			gisQueryTask.addEventListener(GisIdentifyEvent.EXECUTE_COMPLETE, onExecuteCompleteHandler);
////			gisLayer.queryTask=gisQueryTask;
////			mapWork.map.addGisLayer(gisLayer);
////			mapWork.map.selectFeaturesByLayerId(gisLayer.id);
////			log.info("showFeatureLayer----------------{0}",gisQueryTask.url);
//		}
//	}else{
////		mapWork.map.selectFeaturesByLayerId(gisLayer.id);
////		mapWork.map.selectFeaturesByLayerId(gisFeatureLayer.id);
////		gisFeatureLayer.query.gisMetry = mapWork.map.gisExtent;
////		gisFeatureLayer.queryFeatures();
//	}
////	log.info(gisFeatureLayer.url);
//}

//private function onQueryFeaturesHandler(event:GisFeatureLayerEvent):void{
//	log.info("onQueryFeaturesHandler================>{0}", event.gisFeatures.length);
//	if(gisFeatureLayer){
//		gisFeatureLayer.clear();
//		var gisFeature:GisFeature;
//		var pic:GisMarkerPictureStyle = new GisMarkerPictureStyle(sperf_1);
//		for (var id:* in event.gisFeatures)
//		{
//			gisFeature=GisFeature(event.gisFeatures[id]);
//			gisFeature.gisStyle = pic;
//			gisFeatureLayer.addGisFeature(gisFeature);
//		}
//	}
//}
//private function onExecuteCompleteHandler(event:GisIdentifyEvent):void
//{
//	var gisFeature:GisFeature;
//	log.info("onExecuteCompleteHandler================>{0}", event.gisFeatures.length);
//	for (var id:*in event.gisFeatures)
//	{
//		gisFeature=GisFeature(event.gisFeatures[id]);
////		gisFeature.gisStyle=new GisMarkerPredefinedStyle(GisMarkerStyle.STYLE_SQUARE, 25, 0x0000ff);
//		var pic:GisMarkerPictureStyle = null;
//		if(control.curParam.servLevel == "2")
//			pic = new GisMarkerPictureStyle(sperf_1);
//		else if(control.curParam.servLevel == "3")
//			pic = new GisMarkerPictureStyle(sperf_2);
//		else if(control.curParam.servLevel == "4")
//			pic = new GisMarkerPictureStyle(sperf_0);
//		else if(control.curParam.servLevel == "5")
//			pic = new GisMarkerPictureStyle(sperf_4);
//		gisFeature.gisStyle = pic;
//		gisLayer.updateFeature(gisFeature);
//		log.info("onExecuteCompleteHandler================>{0}", gisFeature);
//		//					for (var key:*in gisFeature.attributes)
//		//					{
//		//						log.debug("onExecuteCompleteHandler================>{0}={1}", key, gisFeature.attributes[key]);
//		//					}
//	}
//}