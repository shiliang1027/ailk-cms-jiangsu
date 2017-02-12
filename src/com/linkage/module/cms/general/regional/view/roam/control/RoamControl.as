package com.linkage.module.cms.general.regional.view.roam.control
{
	import com.linkage.module.cms.components.dummymap.MapLabel;
	import com.linkage.module.cms.components.dummymap.MapNode;
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.cms.general.regional.view.roam.RoamGroup;
	import com.linkage.module.cms.general.regional.view.roam.components.RoamColorConfigGroup;
	import com.linkage.module.cms.general.regional.view.roam.components.RoamColorGroup;
	import com.linkage.module.cms.general.regional.view.roam.data.RoamDataManager;
	import com.linkage.module.cms.general.regional.view.roam.data.RoamDataManagerDS;
	import com.linkage.module.cms.general.regional.view.roam.event.RoamEvent;
	import com.linkage.module.cms.general.regional.view.roam.renderer.RoamPeriodRenderer;
	import com.linkage.system.logging.targets.DeMonsterTarget;
	import com.linkage.system.utils.StringUtils;
	import com.linkage.tools.graphics.DrawArrowCurveLine;
	import com.linkage.tools.graphics.DrawColumnar;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.core.ClassFactory;
	import mx.core.UIComponent;
	import mx.effects.AnimateProperty;
	import mx.formatters.DateFormatter;
	import mx.logging.ILogger;
	import mx.logging.ILoggingTarget;
	import mx.logging.Log;
	import mx.logging.LogEventLevel;
	import mx.utils.ColorUtil;
	
	import spark.components.Group;
	
	/**
	 * 漫游视图控制类
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-7-2 下午09:21:24
	 * @category com.linkage.module.cms.general.regional.view.roam.control
	 * @copyright 南京联创科技 网管开发部
	 */
	public class RoamControl extends EventDispatcher
	{
		private var app:RoamGroup;
		private var dataManager:RoamDataManager;
		private var loadManager:LoadManager;
		private var parameters:Object;
		// log
		private static var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.view.roam.control.RoamControl");
		private var df:DateFormatter = new DateFormatter();
		private var queryParam:Object = new Object();
		private var colorLegends:Object;
		private var defColor:uint = 0xcccccc;
		private var _animate:AnimateProperty = null;
		private var _columnarGroup:Group;

		public function RoamControl(app:RoamGroup,target:IEventDispatcher=null)
		{
			super(target);
			parameters = app.parameters;
			var logTarget:ILoggingTarget=new DeMonsterTarget();
			logTarget.level=LogEventLevel.INFO;
			logTarget.filters=["com.linkage.module.cms.general.regional.view.roam.control.*"];
			Log.addTarget(logTarget);
			this.app = app;
			loadManager = new LoadManager(app);
			dataManager = new RoamDataManagerDS(String(parameters["context"]));
			this.addEventListener(RoamEvent.DATA_LOAD,onDataLoad);
			this.addEventListener(RoamEvent.DATA_QUERY,onDataQuery);
			this.addEventListener(RoamEvent.ROAM_TAB_CHANGE,onRoamTabChange);
			this.addEventListener(RoamEvent.ROAM_TYPE_CHANGE,onRoamTypeChange);
			this.addEventListener(RoamEvent.ROAM_PAGE_CHANGE,onRoamPageChange);
			this.addEventListener(RoamEvent.ROAM_LEGEND_QUERY_COMPLETE,onLegendQueryComplete);
			this.addEventListener(RoamEvent.ROAM_DATALOAD_COMPLETE,onDataLoadComplete);
			this.addEventListener(RoamEvent.ROAM_QUERY_NOPAGE_COMPLETE,onQueryNoPageComplete);
			this.addEventListener(RoamEvent.ROAM_STAT_QUERY_COMPLETE,onStatQueryComplete);
			_animate = new AnimateProperty();
			_animate.property = "scaleY";
			_animate.fromValue = 0;
			_animate.toValue = 1;
			_animate.duration=2000;
		}
		
		private function onDataLoad(event:RoamEvent):void{
			log.info("[漫游查询]type:"+queryParam.type+",defCity:"+queryParam.defCity+",roamType:"+queryParam.roamType+",startTime:"+queryParam.startTime+",endTime:"+queryParam.endTime);
			loadManager.showLoading("漫游数据加载中...");
			app.mapWork.refleshMap();
			dataManager.roamLegendQuery(queryParam,onRoamLegendQueryHandler);
		}
		
		private function onLegendQueryComplete(event:RoamEvent):void{
			dataManager.roamQueryNoPage(queryParam,onRoamQueryNoPageHandler);
		}
		private function onQueryNoPageComplete(event:RoamEvent):void{
			dataManager.roamQuery(queryParam,onDataLoadHandler);
		}
		private function onDataLoadComplete(event:RoamEvent):void{
			dataManager.roamStatQuery(queryParam,onRoamStatQueryHandler);
		}
		
		private function onStatQueryComplete(event:RoamEvent):void{
			loadManager.hideLoading();
		}
	
		private function onRoamQueryNoPageHandler(result:Object):void{
//			loadManager.hideLoading();
			var roamMap:Object = result.roamMap;
			var columnarMaxNum:Number = 0;
			var columnarDataArray:Array = new Array();
			for each(var roamObj:Object in roamMap.dataList){
				var color:uint = getRoamColor(Number(roamObj.roam_num));
//				if(color > 0){
					app.mapWork.fillMapById(String(roamObj.city_id),color);
//				}
				columnarMaxNum = (columnarMaxNum > Number(roamObj.roam_num)) ? columnarMaxNum : Number(roamObj.roam_num);
				columnarDataArray[String(roamObj.city_id)]=Number(roamObj.roam_num);
				log.info("city_id:"+roamObj.city_id+",color:"+color+",roamNum:"+roamObj.roam_num+",columnarMaxNum:"+columnarMaxNum);
				//				app.mapWork.fillMapById(String(roamObj.city_id),uint(roamObj.color));
			}
			var columnarHeight:Number=50;
			var targets:Array = new Array();
			var curveTargets:Array = new Array();
			app.mapWork.fillMapById(String(queryParam.defCity),defColor);
			if(_columnarGroup){
				try{
					app.mapWork.removeElement(_columnarGroup);
				}catch(e:Error){}
			}
			_columnarGroup = new Group();
			app.mapWork.addElement(_columnarGroup);
			var defMapNode:MapNode = app.mapWork.elementBox.getElementById(String(queryParam.defCity)+"_a") as MapNode;
			var defMapLabel:MapLabel = app.mapWork.elementBox.getElementById(String(queryParam.defCity)+"_label") as MapLabel;
			for(var cityId:String in columnarDataArray){
				var mapNode:MapNode = app.mapWork.elementBox.getElementById(cityId+"_a") as MapNode;
				var mapLabel:MapLabel = app.mapWork.elementBox.getElementById(cityId+"_label") as MapLabel;
				if(!mapNode){
					continue;
				}
				var columnarUI:UIComponent = new UIComponent();
				columnarUI.x = mapNode.x;
				columnarUI.y = mapNode.y;
				columnarUI.toolTip = mapLabel.text + "," + columnarDataArray[cityId];
				var sy:Number=0;
				if(columnarMaxNum>0){
					sy = Number(columnarDataArray[cityId])/columnarMaxNum;
				}
				log.info("drawColumnar heigh------->"+columnarHeight*sy);
				var drawColumnar:DrawColumnar = new DrawColumnar(columnarUI.graphics,12,columnarHeight*sy);
				drawColumnar.draw();
				_columnarGroup.addElement(columnarUI);
				targets.push(columnarUI);
				if(String(app.roamTabBar.selectedItem.id) == "2"){
					continue;
				}
				var xs:Number=0;
				var ys:Number=0;
				if(String(app.roamTabBar.selectedItem.id) == "3"){
					xs = 10;
					ys = 20;
				}else{
					xs = 30;
					ys = 10;
				}
				var yss:Number= 20;
				var curveUI:UIComponent = new UIComponent();
				var fromPoint:Point;
				var endPoint:Point;
				if(String(queryParam.roamType) == String(app.roamTypes.roam_in)){
					fromPoint = new Point(mapNode.x,mapNode.y+ys);
					endPoint = new Point(defMapNode.x+xs,defMapNode.y+yss);
					curveUI.toolTip=mapLabel.text+"漫入"+defMapLabel.text+"用户数："+columnarDataArray[cityId];
				}else{
					endPoint = new Point(mapNode.x,mapNode.y+ys);
					fromPoint = new Point(defMapNode.x+xs,defMapNode.y+yss);
					curveUI.toolTip=defMapLabel.text+"漫出"+mapLabel.text+"用户数："+columnarDataArray[cityId];
				}
				var sc:Number = mapNode.x>defMapNode.x?20:-20;
				var controlPoint:Point = new Point(fromPoint.x+sc,fromPoint.y+sc);
				var drawDoubleCurve:DrawArrowCurveLine = new DrawArrowCurveLine(curveUI.graphics,fromPoint,endPoint,controlPoint,0xffff00,3,0.8,10);
				drawDoubleCurve.draw();
				_columnarGroup.addElement(curveUI);
			}
			_animate.play(targets);
			this.dispatchEvent(new RoamEvent(RoamEvent.ROAM_QUERY_NOPAGE_COMPLETE));
		}
		
		private function onDataLoadHandler(result:Object):void{
			var roamMap:Object = result.roamMap;
			var columns:Array = buildColumns(roamMap);
			app.roamDG.columns = columns;
			app.roamBC.visible=true;
			app.roamData.removeAll();
			for each(var roamObj:Object in roamMap.dataList){
				app.roamData.addItem(roamObj);
			}
			app.pager.maxPage = roamMap.pager.maxPage;
			app.pager.totalRowCount = roamMap.pager.total;
			app.pager.currentPage = roamMap.pager.curPage;
			this.dispatchEvent(new RoamEvent(RoamEvent.ROAM_DATALOAD_COMPLETE));
		}
		
		private function getRoamColor(roamNum:Number):uint{
			if(!colorLegends){
				log.info("图例为空");
				return 0;
			}
			for each(var legend:Object in colorLegends){
				var leftOper:String = String(legend.left_oper);
				var leftValue:Number = Number(legend.left_value);
				var rightOper:String = String(legend.right_oper);
				var rightValue:Number = Number(legend.right_value);
				log.info("[fillcolor]leftOper:"+leftOper+",leftValue:"+leftValue+",rightOper:"+rightOper+",rightValue:"+rightValue);
//				if((leftOper == "<=" || leftOper == "<") && rightOper == ">"){
					if(roamNum >= leftValue && roamNum<rightValue){
						return uint("0x"+legend.color);
					}
//				}
			}
			return 0;
		}
		private function onRoamStatQueryHandler(result:Object):void{
			var roamStatMap:Object = result.roamStatMap;
			var roamStatColumns:Array = buildColumns(roamStatMap);
			app.roamStatDG.columns = roamStatColumns;
			app.roamStatBC.visible=true;
			app.roamStatData.removeAll();
			for each(var roamStatObj:Object in roamStatMap.dataList){
				app.roamStatData.addItem(roamStatObj);
			}
			this.dispatchEvent(new RoamEvent(RoamEvent.ROAM_STAT_QUERY_COMPLETE));
		}
		
		private function onRoamLegendQueryHandler(result:Object):void{
			var i:Number = 0;
			app.leftColorGroup.removeAllElements();
			app.rightColorGroup.removeAllElements();
			colorLegends = result.colorLegend.dataList;
			for each(var data:Object in colorLegends){
				var roamColorGP:RoamColorGroup = new RoamColorGroup();
				roamColorGP.color = Number("0x"+data.color);
				roamColorGP.legendLabel = String(data.legend_name);
				if(i%2==0){
					app.leftColorGroup.addElement(roamColorGP);
				}else{
					app.rightColorGroup.addElement(roamColorGP);
				}
				i++;
			}
			this.dispatchEvent(new RoamEvent(RoamEvent.ROAM_LEGEND_QUERY_COMPLETE));
		}
		
		private function buildColumns(result:Object):Array{
			var columns:Array = new Array();
			var i:Number=0;
			for each(var name:String in result.name){
				log.info("[buildColumns]name:"+name+",column:"+result.colum[i]);
				var dataGridColumn:AdvancedDataGridColumn = new AdvancedDataGridColumn();
				dataGridColumn.headerText = name;
				dataGridColumn.width=100;
				dataGridColumn.dataField = result.colum[i];
				if(result.colum[i] == "same_period" || result.colum[i] == "link_relative"){
					dataGridColumn.itemRenderer = new ClassFactory(RoamPeriodRenderer);
				}
				columns.push(dataGridColumn);
				i++;
			}
			return columns;
		}
		
		private function onDataQuery(event:RoamEvent):void{
			if(StringUtils.isEmpty(app.startTime.text)){
				Alert.show("请选择查询时间","提示");
				return ;
			}
			var date:Date = app.startTime.selectedDate;
			queryParam.curPage_splitPage=String(1);
			if(queryParam.roamType && queryParam.roamType == String(app.roamTypes.roam_in)){
				date.setHours(app.hourTime.selectedItem.hour,0,0,0);
				queryParam.startTime=date.getTime()/1000;
			}else{
				queryParam.startTime=date.getTime()/1000;
			}
			
			this.dispatchEvent(new RoamEvent(RoamEvent.DATA_LOAD));
		}
		
		private function onRoamTabChange(event:RoamEvent):void{
			queryParam.type=String(app.roamTabBar.selectedItem.id);
			queryParam.defCity=String(app.roamTabBar.selectedItem.defCityId);
			if(!queryParam.roamType){
				queryParam.roamType=String(app.roamTypes.roam_in);
			}
			var date:Date = app.startTime.selectedDate;
			queryParam.curPage_splitPage=String(1);
			if(queryParam.roamType && queryParam.roamType == String(app.roamTypes.roam_in)){
				date.setHours(app.hourTime.selectedItem.hour,0,0,0);
				queryParam.startTime=date.getTime()/1000;
			}else{
				queryParam.startTime=date.getTime()/1000;
			}
			queryParam.curPage_splitPage=String(1);
			queryParam.num_splitPage=String(app.pager.pageSize);
			isLegendConfigWindowInit=false;
			app.legendConfigWindow.visible=false;
			this.dispatchEvent(new RoamEvent(RoamEvent.DATA_LOAD));
		}
		
		private function onRoamTypeChange(event:RoamEvent):void{
			queryParam.roamType=String(event.attributes["roam_type"]);
			queryParam.curPage_splitPage=String(1);
			isLegendConfigWindowInit=false;
			app.legendConfigWindow.visible=false;
			this.dispatchEvent(new RoamEvent(RoamEvent.DATA_LOAD));
		}
		
		private function onRoamPageChange(event:RoamEvent):void{
			queryParam.curPage_splitPage=String(app.pager.currentPage);
			dataManager.roamQuery(queryParam,onDataLoadHandler);
		}
		
		public function loadDataByCity(city:String):void{
			queryParam.defCity=city;
			queryParam.curPage_splitPage=String(1);
			queryParam.num_splitPage=String(app.pager.pageSize);
			
			isLegendConfigWindowInit=false;
			app.legendConfigWindow.visible=false;
			this.dispatchEvent(new RoamEvent(RoamEvent.DATA_LOAD));
		}
		
		private var isLegendConfigWindowInit:Boolean=false;
		public function legendConfigWindowInit():void{
//			if(isLegendConfigWindowInit){
//				return;
//			}
			app.legendGroup.removeAllElements();
			if(!colorLegends || colorLegends.length<=0){
				var colorConfigGroup:RoamColorConfigGroup = new RoamColorConfigGroup();
				colorConfigGroup.defCity = String(queryParam.defCity);
				colorConfigGroup.colorPicker.selectedColor = 0x000000;
				app.legendGroup.addElement(colorConfigGroup);
			}else{
				for each(var data:Object in colorLegends){
					var colorConfigGroup:RoamColorConfigGroup = new RoamColorConfigGroup();
					colorConfigGroup.defCity = String(queryParam.defCity);
					colorConfigGroup.colorPicker.selectedColor = Number("0x"+data.color);
					colorConfigGroup.leftTextInput.text = String(data.left_value);
					colorConfigGroup.rightTextInput.text = String(data.right_value);
					app.legendGroup.addElement(colorConfigGroup);
				}
			}
			isLegendConfigWindowInit=true;
		}
		
		public function saveLegend():void
		{
			var param:Object = new Object();
			param.defCity = String(queryParam.defCity);
			param.roamType = String(queryParam.roamType);
			if(app.legendGroup.numElements>0){
				var dataList:ArrayList = new ArrayList();
				for(var i:Number=0;i<app.legendGroup.numElements;i++){
					var colorConfigGroup:RoamColorConfigGroup = app.legendGroup.getElementAt(i) as RoamColorConfigGroup;
					if(StringUtils.isEmpty(colorConfigGroup.leftTextInput.text)){
						continue;
					}else if(Number(colorConfigGroup.leftTextInput.text)>Number(colorConfigGroup.rightTextInput.text)){
						continue;
					}
					var data:Object = new Object();
					data.legend_name=String(colorConfigGroup.leftTextInput.text+"~"+colorConfigGroup.rightTextInput.text);
					data.left_oper="<=";
					data.left_value=Number(colorConfigGroup.leftTextInput.text);
					data.right_oper="<";
					data.right_value=Number(colorConfigGroup.rightTextInput.text);
					data.color = String(colorConfigGroup.colorPicker.selectedColor.toString(16));
					if(queryParam.roamType && queryParam.roamType == String(app.roamTypes.roam_in)){
						data.roam_in_city=String(param.defCity);
						data.roam_out_city="";
					}else{
						data.roam_out_city=String(param.defCity);
						data.roam_in_city="";
					}
					data.roam_type=Number(queryParam.type);
					log.info("[saveLegend]roam_in_city:"+data.roam_in_city+",roam_out_city:"+data.roam_out_city+",legend_name:"+data.legend_name+",left_oper:"+data.left_oper+",left_value:"+data.left_value+",right_oper:"+data.right_oper+",right_value:"+data.right_value+",color:"+data.color+",roam_type:"+data.roam_type);
					dataList.addItem(data);
				}
				param.dataList = dataList;
			}else{
				param.dataList = null;
			}
			dataManager.saveLegend(param,saveLegendsHandler);
		}
		
		private function saveLegendsHandler(result:Object):void{
			if(result){
				this.dispatchEvent(new RoamEvent(RoamEvent.DATA_LOAD));
			}
		}
	}
}