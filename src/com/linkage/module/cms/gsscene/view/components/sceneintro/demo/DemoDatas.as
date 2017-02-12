package com.linkage.module.cms.gsscene.view.components.sceneintro.demo
{
	import mx.collections.ArrayCollection;

	public class DemoDatas
	{
		public function DemoDatas()
		{
		}
		public static var _quitData:Object = {
			quitDatas:[
				{moTypeId:"32",moTypeName:"GSM基站",value:"96"},
				{moTypeId:"12",moTypeName:"TD基站",value:"22"},
				{moTypeId:"45",moTypeName:"LTE基站",value:"25"}
			]
		};
		public static var _quitDetailData:Object = {
			datas:[
				{moId:"324",moTypeId:"32",moTypeName:"GSM基站",moName:"dfsf基站",quitCause:"基站退服！",quitAlarms:"34"},
				{moId:"324",moTypeId:"32",moTypeName:"GSM基站",moName:"dfsf基站",quitCause:"基站退服！",quitAlarms:"34"},
				{moId:"324",moTypeId:"32",moTypeName:"GSM基站",moName:"dfsf基站",quitCause:"基站退服！",quitAlarms:"34"},
				{moId:"324",moTypeId:"32",moTypeName:"GSM基站",moName:"dfsf基站",quitCause:"基站退服！",quitAlarms:"34"}
			]
		};
		public static var _alarmStatsData:Object = {
			datas:[
				{nmsAlarmTypeName:"设备",alarmseverity1:"964",alarmseverity2:"296",alarmseverity3:"946",alarmseverity4:"596"},
				{nmsAlarmTypeName:"性能",alarmseverity1:"9",alarmseverity2:"6",alarmseverity3:"16",alarmseverity4:"91"}
			]
		};
		public static var _data:Object = {
			historyThreshold:[  
				{value:"92",color:"0Xff0000"},
				{value:"90",color:"0X00ff00"},
				{value:"87",color:"0X0000ff"},
				{value:"86",color:"0Xffff00"}
			],
			historyDatas:[  
				{time:"0",value:"96"},
				{time:"1",value:"92"},
				{time:"2",value:"90"},
				{time:"3",value:"87"},
				{time:"4",value:"86"},
				{time:"5",value:"85"},
				{time:"6",value:"87"},
				{time:"7",value:"90"},
				{time:"8",value:"93"},
				{time:"9",value:"91"},
				{time:"10",value:"92"},
				{time:"11",value:"93"},
				{time:"12",value:"94"},
				{time:"13",value:"96"},
				{time:"14",value:"97"},
				{time:"15",value:"99"},
				{time:"16",value:"97"},
				{time:"17",value:"93"},
				{time:"18",value:"92"},
				{time:"19",value:"90"},
				{time:"20",value:"88"},
				{time:"21",value:"84"},
				{time:"22",value:"83"},
				{time:"23",value:"80"}
			],
			cityThreshold:[  
				{value:"92",color:"0Xff0000"},
				{value:"90",color:"0X00ff00"},
				{value:"87",color:"0X0000ff"},
				{value:"86",color:"0Xffff00"}
			],
			cityDatas:[  	
				{city:"南京",value:"96"},
				{city:"苏州",value:"92"},
				{city:"扬州",value:"90"},
				{city:"常州",value:"87"},
				{city:"南通",value:"86"},
				{city:"连云港",value:"85"},
				{city:"淮安",value:"87"},
				{city:"盐城",value:"90"},
				{city:"徐州",value:"93"},
				{city:"无锡",value:"91"},
				{city:"泰州",value:"92"}
			]
		};

	}
}