// ActionScript file
import com.linkage.module.cms.alarm.framework.common.event.MenuEvent;
import com.linkage.module.cms.components.extend.WindowExtEvent;
import com.linkage.module.cms.components.loadmanager.LoadManager;
import com.linkage.module.cms.components.pager.event.PagerEvent;
import com.linkage.module.cms.groupclientNew.components.AlarmStatComp;
import com.linkage.module.cms.groupclientNew.components.ResourceComp;
import com.linkage.module.cms.groupclientNew.control.GroupMonitorModuleControl_TREE;
import com.linkage.module.cms.groupclientNew.event.AlarmStatCompEvent;
import com.linkage.module.cms.groupclientNew.event.ComplaintInfoEvent;
import com.linkage.module.cms.groupclientNew.event.CustFlowAlarmWindowEvent;
import com.linkage.module.cms.groupclientNew.event.FilterFormEvent;
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
import flash.net.URLRequest;
import flash.net.URLVariables;
import flash.net.navigateToURL;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.events.EffectEvent;
import mx.events.FlexEvent;
import mx.events.IndexChangedEvent;
import mx.events.ListEvent;
import mx.formatters.DateFormatter;

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
[Embed(source="./assets/gold.png")]
public var gold:Class;
[Embed(source="./assets/silver.png")]
public var silver:Class;
[Embed(source="./assets/copper.png")]
public var copper:Class;
[Embed(source="./assets/standard.png")]
public var standard:Class;
[Embed(source="./assets/unknown.png")]
public var unknown:Class;

private var control:GroupMonitorModuleControl_TREE=null;

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

private var alarmWindowHeight:Number=0;
private var leftNormalWidth:Number;
private var isLeftShow:Boolean=true;
private var isRightShow:Boolean=true; 
private static var log:ILogger = Log.getLogger("com.linkage.module.cms.groupclientNew.control.GroupMonitor");
protected function groupMonitorModule_creationCompleteHandler(event:FlexEvent):void
{
	
	// TODO Auto-generated method stub
	System.useCodePage=true;
	parameters=parentApplication.parameters;
	styleManager.loadStyleDeclarations2(parameters["styleUrl"], true);
	styleManager.loadStyleDeclarations2(parameters["topoStyle"], true);
	loadManager=parentApplication.loadManager;
	Config.init();
	control=new GroupMonitorModuleControl_TREE(this);
	navTree.addEventListener(ListEvent.CHANGE, control.treeChang);
	this.currentState="city_state";
	params.mapInfo=parameters["user"];
	params.defaultDisplay="alarmstatus";
	control.initTreeData();
}

protected function alarmWindow_maximizeHandler(event:WindowExtEvent):void
{
	if (alarmWindowHeight == 0)
	{
		alarmWindowHeight=alarmWindow.height;
	}
	rightTopGroup.visible=false;
	rightTopGroup.includeInLayout=false;
	alarmWindow.restoreButton.visible=true;
	alarmWindow.restoreButton.includeInLayout=true;
	alarmWindow.maximizeButton.visible=false;
	alarmWindow.maximizeButton.includeInLayout=false;
	alarmWindow.minimizeButton.visible=true;
	alarmWindow.minimizeButton.includeInLayout=true;
	alarmWindow.percentHeight=100;
	alarmWindow.contentGroup.visible=true;
	alarmWindow.contentGroup.includeInLayout=true;
}

protected function alarmWindow_minimizeHandler(event:WindowExtEvent):void
{
	if (alarmWindowHeight == 0)
	{
		alarmWindowHeight=alarmWindow.height;
	}
	alarmWindow.height=alarmWindow.minHeight;
	alarmWindow.contentGroup.visible=false;
	alarmWindow.contentGroup.includeInLayout=false;
	alarmWindow.restoreButton.visible=true;
	alarmWindow.restoreButton.includeInLayout=true;
	alarmWindow.maximizeButton.visible=true;
	alarmWindow.maximizeButton.includeInLayout=true;
	alarmWindow.minimizeButton.visible=false;
	alarmWindow.minimizeButton.includeInLayout=false;
	rightTopGroup.visible=true;
	rightTopGroup.includeInLayout=true;

}

protected function alarmWindow_restoreHandler(event:WindowExtEvent):void
{
	if (alarmWindowHeight == 0)
	{
		return;
	}
	alarmWindow.height=alarmWindowHeight;
	alarmWindow.contentGroup.visible=true;
	alarmWindow.contentGroup.includeInLayout=true;
	rightTopGroup.visible=true;
	rightTopGroup.includeInLayout=true;
	alarmWindow.restoreButton.visible=false;
	alarmWindow.restoreButton.includeInLayout=false;
	alarmWindow.minimizeButton.visible=true;
	alarmWindow.minimizeButton.includeInLayout=true;
	alarmWindow.maximizeButton.visible=true;
	alarmWindow.maximizeButton.includeInLayout=true;
}

protected function rightTabBar_changeHandler(event:IndexChangeEvent):void
{
//	log.info("event.newIndex"+event.newIndex);
	var indexChangedEvent:IndexChangeEvent;
	if (event.newIndex == 0)
	{
		if (this.currentState == "cust_state")
		{
			//						control.dispatchEvent(new Event(GroupMonitorModuleControl_TREE.LOAD_SERVBYCUST));
			if (realCustMonitorTabBar)
			{
				indexChangedEvent=new IndexChangeEvent(IndexChangeEvent.CHANGE);
				indexChangedEvent.newIndex=0;
				realCustMonitorTabBar.selectedIndex=0;
				realCustMonitorTabBar.dispatchEvent(indexChangedEvent);
			}
		}
	}
	else
	{
		if (this.currentState != "cust_state")
		{
			Alert.show("请选择集团客户", "提示");
			return;
		}
		if (alarmWindow)
		{
			alarmWindow.visible=false;
			alarmWindow.includeInLayout=false;
		}
		indexChangedEvent=new IndexChangeEvent(IndexChangeEvent.CHANGE);
		indexChangedEvent.newIndex=runStatAccordionIndex;
	}
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


protected function topo_creationCompleteHandler(event:FlexEvent):void
{
	control.topoInit();
}

protected function fadeEffect_effectEndHandler(event:EffectEvent):void
{
	// TODO Auto-generated method stub

}

protected function perfTopoWindow_initHandler(event:PerfTopoWindowEvent):void
{
	control.perfTopoWindowInit(event.param);
}


protected function perfTopoTotalWindow_initHandler(event:PerfTopoTotalWindowEvent):void
{
	control.perfTopoTotalWindowInit();
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

protected function filterForm_formInitHandler(event:FilterFormEvent):void
{
	control.initFilter();
}


protected function filterForm_queryHandler(event:FilterFormEvent):void
{
	control.queryCustByFilter(event.param);
}


protected function custListGroup_queryAlarmCustHandler(event:RealMonitorCustListGroupEvent):void
{
	control.queryAlarmCust(event.param);
}


protected function custListGroup_queryAllCustHandler(event:RealMonitorCustListGroupEvent):void
{
	control.queryAllCust(event.param);
}


protected function custListGroup_custSelectedHandler(event:RealMonitorCustListGroupEvent):void
{
	control.custSelected(String(event.param));
}


protected function custAlarmWindow_dataQueryHandler(event:RealMonitorAlarmListWindowEvent):void
{
	log.info("第二次");
	control.realCustAlarmQuery();  
}

protected function custAlarmWindow_alarmFilterHandler(event:RealMonitorAlarmListWindowEvent):void
{
	control.filterAlarm(String(event.param));
}

protected function custListGroup_custNumQueryHandler(event:RealMonitorCustListGroupEvent):void
{
	control.custNumQuery();
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


protected function realCustMonitorTabBar_changeHandler(event:IndexChangeEvent):void
{
	log.info("~~ event.newIndex"+event.newIndex);
	if (event.newIndex == 0)
	{
		if (alarmWindow)
		{
			alarmWindow.visible=true;
			alarmWindow.includeInLayout=true;
			alarmWindow.restoreButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
	}
	else
	{
		if (alarmWindow)
		{
			alarmWindow.visible=false;
			alarmWindow.includeInLayout=false;
		}
	}
	
	switch(event.newIndex)
	{
		case 0: 
			if (custAlarmWindow)
			{
				log.info("第三次");
				custAlarmWindow.dispatchEvent(new RealMonitorAlarmListWindowEvent(RealMonitorAlarmListWindowEvent.DATAQUERY));
			}
			break;
		case 1: 
			if (SLAComp)
			{
				SLAComp.dispatchEvent(new SLACompEvent(SLACompEvent.REFRESH));
			}
			break;
		case 2: 
			if (sheetInfoComp)
			{
				sheetInfoComp.dispatchEvent(new SheetInfoEvent(SheetInfoEvent.DATAQUERY));
			}
			break;
		case 3: 
			if (resourceComp)
			{
				resourceComp.dispatchEvent(new ResourceCompEvent(ResourceCompEvent.RESINFODATAQUERY));
				resourceComp.dispatchEvent(new ResourceCompEvent(ResourceCompEvent.RESSERVDATAQUERY));
			}
			break;
		case 4: 
			if (topoGroup)
			{
				control.topoInit();
			}
			break;
		case 5: 
			if (processComp)
			{
				processComp.dispatchEvent(new ProcessCompEvent(ProcessCompEvent.DATAQUERY));
			}
			break;
		case 6: 
			if (alarmStatComp)
			{
				alarmStatComp.dispatchEvent(new AlarmStatCompEvent(AlarmStatCompEvent.REFRESH));
			}
			break;
		case 7: 
			if (custRealPerfComp)
			{
				custRealPerfComp.dispatchEvent(new RealMonitorPerfCompEvent(RealMonitorPerfCompEvent.SERVERQUERY));
			}
			break;
		/*case 8: 
			if (complaintInfoComp)
			{
				complaintInfoComp.dispatchEvent(new ComplaintInfoEvent(ComplaintInfoEvent.DATAQUERY));
			}
			break;*/
		default:
			if (custAlarmWindow)
			{
				log.info("第四次");
				custAlarmWindow.dispatchEvent(new RealMonitorAlarmListWindowEvent(RealMonitorAlarmListWindowEvent.DATAQUERY));
			}
			break;
	}
}


protected function custRealPerfComp_perfQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.realPerfQuery(event.param);
}


protected function custRealPerfComp_serverQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.realPerfServerTypeQuery();
}


protected function custRealPerfComp_serverTargetQueryHandler(event:RealMonitorPerfCompEvent):void
{
	control.realPerfServerTargetQuery(event.param);
}

protected function SLAComp_dataQueryHandler(event:SLACompEvent):void
{
	control.SLAQuery(event.param);
}


protected function SLAComp_alarmQueryHandler(event:SLACompEvent):void
{
	control.queryAlarmByProduct(event.param.productId, String(event.param.startTime), String(event.param.endTime), "1");
}


protected function resourceComp_resInfodataQueryHandler(event:ResourceCompEvent):void
{
	control.resourceInfoQuery();

}

protected function resourceComp_resServdataQueryHandler(event:ResourceCompEvent):void
{
	control.resourceServQuery();
}

protected function alarmStatComp_dataQueryHandler(event:AlarmStatCompEvent):void
{
	control.alarmStatQuery(event.param);
}

protected function alarmStatComp_alarmQueryHandler(event:AlarmStatCompEvent):void
{
	this.control.queryAlarmByProduct(event.param.productId, String(event.param.startTime), String(event.param.endTime));
}


protected function processComp_dataQueryHandler(event:ProcessCompEvent):void
{
	control.processQuery(event.param);
}


protected function processComp_infoQueryHandler(event:ProcessCompEvent):void
{
	control.processInfoQuery(event.param);
}

protected function prodTopoNav_queryHandler(event:ProdTopoNavEvent):void
{
	control.prodQuery(event.param);
}

protected function prodTopoNav_prodChangeHandler(event:ProdTopoNavEvent):void
{
	control.prodTopoChange(event.param);
}

protected function SheetInfoComp_dataQueryHandler(event:SheetInfoEvent):void
{
	control.sheetInfoQuery(event.param);
}

protected function sheetInfoComp_sheetDetailShowHandler(event:SheetInfoEvent):void
{
	control.sheetDetailShow(event.param);
}

protected function complaintInfoComp_dataQueryHandler(event:ComplaintInfoEvent):void
{
	control.complaintInfoQuery(event.param);
}

protected function complaintInfoComp_complaintDetailQueryHandler(event:ComplaintInfoEvent):void
{
	control.complaintDetailQuery(event.param);
}