// ActionScript file
import com.linkage.module.cms.components.extend.NormalWindowExtEvent;
import com.linkage.module.cms.components.loadmanager.LoadManager;
import com.linkage.module.cms.groupclient.components.NormalWindow;
import com.linkage.module.cms.groupclient.control.GroupTotalModuleControl;
import com.linkage.module.cms.groupclient.event.AlarmListWindowEvent;
import com.linkage.module.cms.groupclient.event.CustAlarmWindowEvent;
import com.linkage.module.cms.groupclient.event.CustListWindowEvent;
import com.linkage.module.cms.groupclient.event.CustWindowEvent;
import com.linkage.module.cms.groupclient.event.DummyMapWorkEvent;
import com.linkage.module.cms.groupclient.event.GisMapWorkEvent;
import com.linkage.module.cms.groupclient.event.PerfStatWindowEvent;
import com.linkage.module.cms.groupclient.event.RunQuaWindowEvent;
import com.linkage.module.cms.groupclient.event.ServStatWindowEvent;
import com.linkage.module.cms.groupclient.event.ServWindowEvent;

import mx.controls.AdvancedDataGrid;
import mx.core.DragSource;
import mx.events.DragEvent;
import mx.events.EffectEvent;
import mx.events.FlexEvent;
import mx.managers.DragManager;
import mx.managers.PopUpManager;

import spark.components.Button;
import spark.components.Label;
import spark.components.RadioButton;

[Bindable]
[Embed(source="../../../../../assets/shiftBtn4_1.png")]
public var openImg:Class;
[Bindable]
[Embed(source="../../../../../assets/shiftBtn3_1.png")]
public var closeImg:Class;

public var parameters:Object;
public var loadManager:LoadManager;
private var control:GroupTotalModuleControl;

protected function module_creationCompleteHandler(event:FlexEvent):void
{
	// TODO Auto-generated method stub
	parameters=parentApplication.parameters;
	styleManager.loadStyleDeclarations2(parameters["styleUrl"]);
	loadManager = parentApplication.loadManager;
	loadManager.hideLoading();
	control=new GroupTotalModuleControl(this);
}

protected function rightBounceBtn_clickHandler(event:MouseEvent):void
{
	rightBounceGroup.right==0?rightBounceGroupCloseEffect.play():rightBounceGroupOpenEffect.play();
}

protected function fadeEffect_effectEndHandler(event:EffectEvent):void
{
	control.init();
}

protected function dummyMapWork_initHandler(event:DummyMapWorkEvent):void
{
	control.dummyMapWorkInit();
}

protected function custWindow_initHandler(event:CustWindowEvent):void
{
	control.custWindowInit();
}


protected function servWindow_initHandler(event:ServWindowEvent):void
{
	control.servWindowInit();
}


protected function runQuaWindow_initHandler(event:RunQuaWindowEvent):void
{
	control.runQuaWindowInit();
}


protected function servStatWindow_initHandler(event:ServStatWindowEvent):void
{
	control.servStatWindowInit();
}


protected function perfStatWindow_initHandler(event:PerfStatWindowEvent):void
{
	control.perfStatWindowInit();
}

protected function perfStatWindow_servTypeSelectChangeHandler(event:PerfStatWindowEvent):void
{
	control.servTypeSelectChange(event.param);
}


protected function perfStatWindow_dataQueryHandler(event:PerfStatWindowEvent):void
{
	control.perfDataQuery(event.param);
}

protected function dummyMapWork_cityLayerChangeHandler(event:DummyMapWorkEvent):void
{
	control.dummyMapWorkCityLayerChange(event.param);
}


protected function dummyMapWork_cityLayerNoSelectedHandler(event:DummyMapWorkEvent):void
{
	control.dummyMapWorkCityLayerNoSelected();
}


protected function dummyMapWork_mapCitySelectedHandler(event:DummyMapWorkEvent):void
{
	control.dummyMapWorkMapCitySelected(event.param);
}


protected function gisMapWork_initHandler(event:GisMapWorkEvent):void
{
	control.gisMapWorkInit();
}


protected function gisMapWork_viewBackHandler(event:GisMapWorkEvent):void
{
	control.gisMapWorkViewBack();
}


protected function gisMapWork_cityLocationSelectedHandler(event:GisMapWorkEvent):void
{
	control.gisMapWorkCityLocationSelected(event.param);
}


protected function custWindow_custAlarmShowHandler(event:CustWindowEvent):void
{
	control.custAlarmShow(event.param);
}


protected function custWindow_custShowHandler(event:CustWindowEvent):void
{
	control.custShow(event.param);
}


protected function custWindow_pageGoHandler(event:CustWindowEvent):void
{
	control.custWindowPageChange(event.param);
}


protected function servWindow_custAlarmShowHandler(event:ServWindowEvent):void
{
	control.alarmListShow(event.param);
}


protected function servWindow_custProvHandler(event:ServWindowEvent):void
{
	control.custProvShow();
	
}


protected function servWindow_custTransProvHandler(event:ServWindowEvent):void
{
	control.custTransProvShow();
}


protected function servWindow_custShowHandler(event:ServWindowEvent):void
{
	control.custShow(event.param);
}

protected function servWindow_pageGoHandler(event:ServWindowEvent):void
{
	control.custWindowPageChange(event.param);
}


protected function runQuaWindow_custAlarmShowHandler(event:RunQuaWindowEvent):void
{
	control.alarmListShow(event.param);
}


protected function runQuaWindow_custProvHandler(event:RunQuaWindowEvent):void
{
	control.custProvShow();
}


protected function runQuaWindow_custTransProvHandler(event:RunQuaWindowEvent):void
{
	control.custTransProvShow();
}


protected function runQuaWindow_pageGoHandler(event:RunQuaWindowEvent):void
{
	control.runQuaWindowPageChange(event.param);
}


protected function servStatWindow_pageGoHandler(event:ServStatWindowEvent):void
{
	control.servStatWindowPageChange(event.param);
}


protected function custAlarmListWindow_custShowHandler(event:CustAlarmWindowEvent):void
{
	control.custShow(event.param);
}



protected function alarmListWindow_custShowHandler(event:AlarmListWindowEvent):void
{
	control.custShow(event.param);
}


protected function custListWindow_custShowHandler(event:CustListWindowEvent):void
{
	control.custShow(event.param);
}

protected function runQuaWindow_sheetShowHandler(event:RunQuaWindowEvent):void
{
	control.sheetShow(event.param);
}


protected function servWindow_custAlarmAllShowHandler(event:ServWindowEvent):void
{
	control.servWindowAlarmAllShow();
}


protected function servWindow_custAlarmOnlyShowHandler(event:ServWindowEvent):void
{
	control.servWindowAlarmOnlyShow();
}


protected function runQuaWindow_custShowHandler(event:RunQuaWindowEvent):void
{
	control.custShow(event.param);
}


private function dragEnterHandler(event:DragEvent):void { 
	if (event.dragSource.hasFormat("window")) 
	{ 
		DragManager.acceptDragDrop(Module(event.currentTarget)); 
	} 
} 

private function dragDropHandler(event:DragEvent):void { 
	var window:NormalWindow = NormalWindow(event.dragInitiator);
	window.width=600;
	window.height=400;
	openWindow(window);
} 


private function mouseMoveHandler(event:MouseEvent):void 
{ 
	if(event.target is Button || event.target is Label || event.target is RadioButton || isDataGrid(event.target)){
		return;
	}
	var dragInitiator:NormalWindow=NormalWindow(event.currentTarget); 
	var ds:DragSource = new DragSource(); 
	ds.addData(dragInitiator, "window"); 
	DragManager.doDrag(dragInitiator, ds, event); 
}

private function isDataGrid(target:Object):Boolean{
	if(target is AdvancedDataGrid){
		return true;
	}
	if(target != null){
		target = target.parent;
		return isDataGrid(target);
	}
	return false;
}

private function openWindow(window:NormalWindow):void{
	window.restoreButton.visible=false;
	window.restoreButton.includeInLayout=false;
	window.closeButton.visible=true;
	window.closeButton.includeInLayout=true;
	window.maximizeButton.visible=true;
	window.maximizeButton.includeInLayout=true;
	PopUpManager.addPopUp(window,this);
	PopUpManager.centerPopUp(window);
}
protected function restoreHandler(event:NormalWindowExtEvent):void
{
	// TODO Auto-generated method stub
	var window:NormalWindow=NormalWindow(event.target); 
	window.width=600;
	window.height=400;
	openWindow(window);
	//				if(rightDivBox.contains(window)){
	//					rightDivBox.removeElement(window);
	//				}
}


protected function maximizeHandler(event:NormalWindowExtEvent):void
{
	// TODO Auto-generated method stub
	var window:NormalWindow = NormalWindow(event.target);
	PopUpManager.removePopUp(window);
	window.width=this.width;
	window.height=this.height;
	openWindow(window);
	window.restoreButton.visible=true;
	window.restoreButton.includeInLayout=true;
	window.maximizeButton.visible=false;
	window.maximizeButton.includeInLayout=false;
}


protected function closeHandler(event:NormalWindowExtEvent):void
{
	// TODO Auto-generated method stub
	var window:NormalWindow = NormalWindow(event.target);
	PopUpManager.removePopUp(window);
	window.percentHeight=100;
	window.percentWidth=100;
	window.restoreButton.visible=true;
	window.restoreButton.includeInLayout=true;
	window.maximizeButton.visible=true;
	window.maximizeButton.includeInLayout=true;
	window.closeButton.visible=false;
	window.closeButton.includeInLayout=false;
	rightDivBox.addElement(window);
}