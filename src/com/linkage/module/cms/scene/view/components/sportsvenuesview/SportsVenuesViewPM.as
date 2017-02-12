package com.linkage.module.cms.scene.view.components.sportsvenuesview
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.domain.sportsvenuesview.SportsVenuesDM;
	import com.linkage.module.cms.scene.event.sportsvenuesview.SportsVenuesEvent;
	import com.linkage.module.cms.scene.view.components.sportsvenuesview.renderer.PicColumnRenderer;
	
	import mx.controls.Alert;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumnGroup;
	import mx.core.ClassFactory;

	public class SportsVenuesViewPM
	{
		private var log:ILogger=Log.getLoggerByClass(SportsVenuesViewPM);

		[Inject("sportsVenuesDM")]
		[Bindable]
		public var dm:SportsVenuesDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		public function loadDataMap():void
		{
			log.debug("begin loadDataMap");
			var evt:SportsVenuesEvent=new SportsVenuesEvent(SportsVenuesEvent.LOAD_DATA);
//			dispatchMsg(evt);
			log.debug("end loadDataMap");
			requestServerUtil.addRequest(evt);
		}

		[MessageHandler(selector="creatSportColumn")]
		public function creatColumn(event:SportsVenuesEvent):void
		{
			log.debug("begin creatColumn");
			setColumns();
			log.debug("end creatColumn");
		}

		//设置列
		public function setColumns():void
		{
			//先把列清空在重新创建
			dm.groColumns=new Array();
			var dataMap:Object=dm.dataMap;
			dm.dataList.removeAll();
			if (dataMap)
			{
				if (dataMap.header)
				{
					var colGroup1:AdvancedDataGridColumnGroup=new AdvancedDataGridColumnGroup();
					colGroup1.draggable=false;
					colGroup1.headerText="场馆信息";
					var colGroup2:AdvancedDataGridColumnGroup=new AdvancedDataGridColumnGroup();
					colGroup2.draggable=false;
					colGroup2.headerText="业务性能指标";
					var colGroup3:AdvancedDataGridColumnGroup=new AdvancedDataGridColumnGroup();
					colGroup3.draggable=false;
					colGroup3.headerText="设备性能指标";
					var colGroup4:AdvancedDataGridColumnGroup=new AdvancedDataGridColumnGroup();
					colGroup4.draggable=false;
					colGroup4.headerText="客户感知指标";
					var col:AdvancedDataGridColumn=null;

					var groupArray:Array = new Array();
					if (dataMap.header['场馆信息'])
					{
						for each (var obj1:Object in dataMap.header['场馆信息'])
						{
							col=new AdvancedDataGridColumn();
							col.headerText=obj1.heatText;

							if ("imgUrl" == obj1.dataField)
							{
								col.itemRenderer=new ClassFactory(PicColumnRenderer);
							}
							else
							{
								col.dataField=obj1.dataField;
							}
							colGroup1.children=colGroup1.children.concat(col);
						}
						groupArray.push(colGroup1);
					}
					if (dataMap.header['业务性能指标'])
					{
						for each (var obj2:Object in dataMap.header['业务性能指标'])
						{
							col=new AdvancedDataGridColumn();
							col.dataField=obj2.dataField;
							col.headerText=obj2.heatText;
							colGroup2.children=colGroup2.children.concat(col);
						}
						groupArray.push(colGroup2);
					}
					if (dataMap.header['设备性能指标'])
					{
						for each (var obj3:Object in dataMap.header['设备性能指标'])
						{
							col=new AdvancedDataGridColumn();
							col.dataField=obj3.dataField;
							col.headerText=obj3.heatText;
							colGroup3.children=colGroup3.children.concat(col);
						}
						groupArray.push(colGroup3);
					}
					if (dataMap.header['客户感知指标'])
					{
						for each (var obj4:Object in dataMap.header['客户感知指标'])
						{
							col=new AdvancedDataGridColumn();
							col.dataField=obj4.dataField;
							col.headerText=obj4.heatText;
							colGroup4.children=colGroup4.children.concat(col);
						}
						groupArray.push(colGroup4);
					}
					
					dm.groColumns = groupArray;
				}
				else
				{
					log.info("【创建表格】没有表头信息");
					return;
				}
				//dm.dataList.removeAll();
				if (dm.dataMap['datas'])
				{
					//设置数据集

					dm.dataList.addAll(dm.dataMap['datas']);
					dm.dataList.refresh();
				}
				else
				{
					Alert.show("没有数据");
					return;
				}

			}
			else
			{
				Alert("没有数据");
				return;
			}

		}

	}
}