// ActionScript file
import com.linkage.system.logging.ILogger;
import com.linkage.system.logging.ILoggingTarget;
import com.linkage.system.logging.Log;
import com.linkage.system.logging.LogEventLevel;
import com.linkage.system.logging.targets.MonsterTarget2;

import com.linkage.module.cms.alarm.framework.common.event.MenuEvent;
import com.linkage.module.cms.components.extend.WindowExtEvent;
import com.linkage.module.cms.components.loadmanager.LoadManager;
import com.linkage.module.cms.components.pager.event.PagerEvent;
import com.linkage.module.cms.groupclient.control.GroupBusinessMonitorModuleControl;
import com.linkage.module.cms.groupclient.event.AlarmStatCompEvent;
import com.linkage.module.cms.groupclient.event.CustFlowAlarmWindowEvent;
import com.linkage.module.cms.groupclient.event.FilterFormEvent;
import com.linkage.module.cms.groupclient.event.HealthInfoCompEvent;
import com.linkage.module.cms.groupclient.event.MonitorAlarmListWindowEvent;
import com.linkage.module.cms.groupclient.event.PerfTopoTotalWindowEvent;
import com.linkage.module.cms.groupclient.event.PerfTopoWindowEvent;
import com.linkage.module.cms.groupclient.event.ProcessCompEvent;
import com.linkage.module.cms.groupclient.event.ProdTopoNavEvent;
import com.linkage.module.cms.groupclient.event.RealMonitorAlarmListWindowEvent;
import com.linkage.module.cms.groupclient.event.RealMonitorCustListGroupEvent;
import com.linkage.module.cms.groupclient.event.RealMonitorPerfCompEvent;
import com.linkage.module.cms.groupclient.event.ResourceCompEvent;
import com.linkage.module.cms.groupclient.event.SLACompEvent;
import com.linkage.system.component.panel.events.WindowEvent;

import flash.events.MouseEvent;

import mx.collections.ArrayCollection;
import mx.events.EffectEvent;
import mx.events.FlexEvent;
import mx.events.IndexChangedEvent;
import mx.events.ListEvent;
import mx.formatters.DateFormatter;

import spark.events.IndexChangeEvent;

public var parameters:Object;
public var loadManager:LoadManager;
[Bindable]
[Embed(source="assets/shiftBtn4_1.png")]
public var pic11:Class;
[Bindable]
[Embed(source="assets/shiftBtn3_1.png")]
public var pic21:Class;
[Embed(source="./assets/up_gray.png")]
[Bindable]
private static var _up_gray:Class;

[Embed(source="./assets/up_blue.png")]
[Bindable]
private static var _up_blue:Class;

[Embed(source="./assets/down_gray.png")]
[Bindable]
private static var _down_gray:Class;			
[Embed(source="./assets/down_blue.png")]
[Bindable]
private static var _down_blue:Class;
[Embed(source="com/linkage/module/cms/groupclient/assets/diamond.png")]
public var jewel:Class;
[Embed(source="com/linkage/module/cms/groupclient/assets/gold.png")]
public var gold:Class;
[Embed(source="com/linkage/module/cms/groupclient/assets/silver.png")]
public var silver:Class;
[Embed(source="com/linkage/module/cms/groupclient/assets/copper.png")]
public var copper:Class;
[Embed(source="com/linkage/module/cms/groupclient/assets/standard.png")]
public var standard:Class;
[Embed(source="com/linkage/module/cms/groupclient/assets/unknown.png")]
public var unknown:Class;

private var control:GroupBusinessMonitorModuleControl=null;
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

private var rightBottomNormarHeight:Number;

private var alarmWindowHeight:Number=0;
private var leftNormalWidth:Number;
private var isLeftShow:Boolean=true;
private var isRightShow:Boolean=true;
private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclient.control.GroupBusinessMonitor");

protected function groupMonitorModule_creationCompleteHandler(event:FlexEvent):void
{
	//初始化日志
	var target:ILoggingTarget = new MonsterTarget2();
	target.level = LogEventLevel.INFO;
	target.filters = ["com.linkage.module.cms.groupclient*"];
	Log.addTarget(target);
	log.info('日志初始化完成~');
	// TODO Auto-generated method stub
	System.useCodePage=true;
	parameters=parentApplication.parameters;
	styleManager.loadStyleDeclarations2(parameters["styleUrl"], true);
	styleManager.loadStyleDeclarations2(parameters["topoStyle"], true);
	loadManager=parentApplication.loadManager;
	Config.init();
	control=new GroupBusinessMonitorModuleControl(this);
	navTree.addEventListener(ListEvent.CHANGE, control.treeChang);
	params.mapInfo=parameters["user"];
	params.defaultDisplay="alarmstatus";
	control.initTreeData();
	runMonitorPerf.dispatchEvent(new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERQUERY));
}

protected function moveRight_effectStopHandler(event:EffectEvent):void
{
	control.initTreeData();
}

protected function moveLeft_effectStopHandler(event:EffectEvent):void
{
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
private function resizeTopWindow():void
{
	if(img.name == "down")
	{
		showCustList();
	}
	else if(img.name == "up")
	{
		hideCustList();
	}
}
private function hideCustList(dura:Number=400):void
{
	custListGroup.visible = false;
	custListGroup.includeInLayout = false; 
	
	resize.removeEventListener(EffectEvent.EFFECT_END,resize_effectEndHandler);
	resize.duration = dura;
	resize.heightTo = 5;
	resize.play();
	
	img.source = _down_gray;
	img.name = "down";
}
private function showCustList(dura:Number=400):void
{
	custListGroup.visible = false;
	custListGroup.includeInLayout = false; 
	custVgroup.percentWidth = 100;
	
	resize.addEventListener(EffectEvent.EFFECT_END,resize_effectEndHandler);
	resize.duration = dura;
	resize.heightTo = 147;
	resize.play();
	
	img.source = _up_gray;
	img.name = "up";
}	
private function resize_effectEndHandler(event:EffectEvent):void
{
	custListGroup.includeInLayout = true;
	custListGroup.visible = true; 
	custVgroup.percentWidth = 100;
}
private function changeImg(type:Object):void
{
	img.source = getImg(type);
}			
private function getImg(type:Object):Object
{
	if(img.name == "down")
	{
		if(type == 1)
			return _down_blue;
		else
			return _down_gray;
	}
	else if(img.name == "up")
	{
		if(type == 1)
			return _up_blue;
		else
			return _up_gray;
	}
	
	return _down_gray;
}

protected function fadeEffect_effectEndHandler(event:EffectEvent):void
{
	// TODO Auto-generated method stub

}


protected function filterForm_formInitHandler(event:FilterFormEvent):void
{
	control.initFilter();
}


protected function filterForm_queryHandler(event:FilterFormEvent):void
{
	control.queryCustByFilter(event.param);
}

protected function runMonitorPerf_perfQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.perfQuery(event.param);
}


protected function runMonitorPerf_serverQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.perfServerTypeQuery();
}

protected function runMonitorPerf_serverTargetQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.perfServerTargetQuery(event.param);
}

protected function runHistoryMonitorPerf_perfQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.hisPerfQuery(event.param);
}


protected function runHistoryMonitorPerf_serverQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.hisPerfServerTypeQuery();
}


protected function runHistoryMonitorPerf_serverTargetQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.hisPerfServerTargetQuery(event.param);
}

protected function custListGroup_queryAllCustHandler(event:RealMonitorCustListGroupEvent):void
{
	control.queryAllCust(event.param);
}

protected function custListGroup_custSelectedHandler(event:RealMonitorCustListGroupEvent):void
{
	control.custSelected(String(event.param));
}
protected function custListGroup_custNumQueryHandler(event:RealMonitorCustListGroupEvent):void
{
	control.custNumQuery();
}
