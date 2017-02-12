package com.linkage.module.cms.groupclient.data
{
	import mx.collections.ArrayCollection;

	public class DemoDatas
	{
		public function DemoDatas()
		{
		}
		
		public static var warnInfoDatas:Object = {
			datas:[
				{sheetno:"1000001",city:"南京",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000002",city:"南京",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000003",city:"南京",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000004",city:"南京",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000005",city:"苏州",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000006",city:"扬州",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"}
			]
		}
		public static var sheetInfoDatas:Object = {
			totalRowCount:"6",
			datas:[
				{sheetno:"1000001",city:"南京",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000002",city:"南京",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000003",city:"南京",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000004",city:"南京",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000005",city:"苏州",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"},
				{sheetno:"1000006",city:"扬州",phone_name:"li",phone_number:"18372648375",phone_time:"2014-0717"}
			]
		}
			
		public static var columnsDatas:ArrayCollection = new ArrayCollection([
			{field_name:"网管告警ID",field_desc:"nmsalarmid"}, 
			{field_name:"告警来源",field_desc:"systemname"}, 
			{field_name:"网元名称",field_desc:"nename"}, 
			{field_name:"设备类型",field_desc:"equipmentclass"},
			{field_name:"告警发生时间",field_desc:"eventtime"},
			{field_name:"派单状态",field_desc:"sheetsendstatus"}, 
			{field_name:"工单号",field_desc:"sheetno"},
			{field_name:"网管告警级别",field_desc:"alarmseverity"},
			{field_name:"告警标题",field_desc:"alarmtitle"},
			{field_name:"地市",field_desc:"alarmregion"},
			{field_name:"网管告警流水号",field_desc:"alarmuniqueid"},
			{field_name:"告警类别",field_desc:"nmsalarmtype"},
			{field_name:"厂家",field_desc:"vendor"},
			{field_name:"确认人",field_desc:"ackuser"},
			{field_name:"电路类型" ,field_desc:"circ_service_type"},
			{field_name:"客户名称",field_desc:"groupcustomer"},
			{field_name:"网络类型",field_desc:"nettype_name"},
			{field_name:"业务保障等级",field_desc:"safelevel"},
			{field_name:"网元别名",field_desc:"nealias"},
			{field_name:"MSCPOOL归属信息",field_desc:"mscpool"},
			{field_name:"客户级别",field_desc:"customerclass"},
			{field_name:"蜂窝类型",field_desc:"combtype"},
			{field_name:"确认时间",field_desc:"acktime"},
			{field_name:"目的网元",field_desc:"destnename"},
			{field_name:"集客区县",field_desc:"custcounty"},
			{field_name:"告警清除时间",field_desc:"canceltime"}
			]);
		
		
		
		public static var warnDatas:Object = {
			totalRowCount:"3",
			datas:[
				{nmsalarmid:"1000001",systemname:"南京",nename:"li",equipmentclass:"18372648375",eventtime:"2014-0717",sheetsendstatus:"",sheetno:"",alarmuniqueid:"00|1446935424",daltime:"1405596812",daltime_old:"1405596812"},
				{nmsalarmid:"1000001",systemname:"南京",nename:"li",equipmentclass:"18372648375",eventtime:"2014-0717",sheetsendstatus:"",sheetno:"",alarmuniqueid:"00|1446935431",daltime:"1405596812",daltime_old:"1405596812"},
				{nmsalarmid:"1000001",systemname:"南京",nename:"li",equipmentclass:"18372648375",eventtime:"2014-0717",sheetsendstatus:"",sheetno:"",alarmuniqueid:"00|1446935426",daltime:"1405596812",daltime_old:"1405596812"}
			]
		}
		public static var datas:ArrayCollection = new ArrayCollection(
			[	{moId:"wangguan1",moName:"行业网关1",moTypeName:"短信业务",kpiIndustryUplinkSucc:"98%",kpiIndustryUplinkSuccAlarmStatus:"异常",kpiIndustryUplinkSuccLastStatus:"上升",kpiIndustrySystem:"20%",kpiIndustrySystemAlarmStatus:"正常",kpiIndustrySystemLastStatus:"上升",kpiIndustryUplinkFailure:"2条",kpiIndustryUplinkFailureAlarmStatus:"正常",kpiIndustryUplinkFailureLastStatus:"上升",kpiSMSIssued:"3ms",kpiEffectSetOff:"集客A，集客B..."},
				{moId:"wangguan2",moName:"行业网关2",moTypeName:"短信业务",kpiIndustryUplinkSucc:"88%",kpiIndustryUplinkSuccAlarmStatus:"正常",kpiIndustryUplinkSuccLastStatus:"下降",kpiIndustrySystem:"25%",kpiIndustrySystemAlarmStatus:"正常",kpiIndustrySystemLastStatus:"上升",kpiIndustryUplinkFailure:"1条",kpiIndustryUplinkFailureAlarmStatus:"正常",kpiIndustryUplinkFailureLastStatus:"下降",kpiSMSIssued:"7ms",kpiEffectSetOff:"集客C，集客D..."},
				{moId:"wangguan3",moName:"行业网关3",moTypeName:"短信业务",kpiIndustryUplinkSucc:"93%",kpiIndustryUplinkSuccAlarmStatus:"正常",kpiIndustryUplinkSuccLastStatus:"上升",kpiIndustrySystem:"21%",kpiIndustrySystemAlarmStatus:"异常",kpiIndustrySystemLastStatus:"上升",kpiIndustryUplinkFailure:"8条",kpiIndustryUplinkFailureAlarmStatus:"正常",kpiIndustryUplinkFailureLastStatus:"上升",kpiSMSIssued:"6ms",kpiEffectSetOff:"集客E，集客F..."},
				{moId:"wangguan4",moName:"行业网关4",moTypeName:"短信业务",kpiIndustryUplinkSucc:"95%",kpiIndustryUplinkSuccAlarmStatus:"异常",kpiIndustryUplinkSuccLastStatus:"下降",kpiIndustrySystem:"28%",kpiIndustrySystemAlarmStatus:"异常",kpiIndustrySystemLastStatus:"下降",kpiIndustryUplinkFailure:"5条",kpiIndustryUplinkFailureAlarmStatus:"正常",kpiIndustryUplinkFailureLastStatus:"上升",kpiSMSIssued:"3ms",kpiEffectSetOff:"集客H，集客G..."}
			]
		);
		public static var columns:ArrayCollection = new ArrayCollection(
				[   {dataField:"moName","headerText":"设备名称"},
					{dataField:"moTypeName","headerText":"业务类型"},
					{dataField:"kpiIndustryUplinkSucc","headerText":"行业网关上行成功率"},
					{dataField:"kpiEffectSetOff","headerText":"关联集客"}
			   ]
		);
		public static var kpiViewdata:Object = {
			moId:"mo124214",
			moName:"行业网关2",
			queryKPIForm:[
							{selectFlag:"true",kpiId:"v1234",showName:"行业网关上行成功率",kpiName:"行业网关上行成功率",moId:"1234"},
							{selectFlag:"false",kpiId:"v3456",showName:"行业网关系统容量占用率",kpiName:"行业网关系统容量占用率",moId:"1234"},
							{selectFlag:"false",kpiId:"v5678",showName:"行业网关上行失败量",kpiName:"行业网关上行失败量",moId:"1234"},
							{selectFlag:"false",kpiId:"v1111",showName:"短信下发平均时延",kpiName:"短信下发平均时延",moId:"1234"}
						],
			KPIDetails:[
				{
					showName:"行业网关上行成功率",
					threshold:{lineValue:"90"},
					datas:[{time:"0",kpiValue:"96"},
						{time:"1",kpiValue:"92"},
						{time:"2",kpiValue:"90"},
						{time:"3",kpiValue:"87"},
						{time:"4",kpiValue:"86"},
						{time:"5",kpiValue:"85"},
						{time:"6",kpiValue:"87"},
						{time:"7",kpiValue:"90"},
						{time:"8",kpiValue:"93"},
						{time:"9",kpiValue:"91"},
						{time:"10",kpiValue:"92"},
						{time:"11",kpiValue:"93"},
						{time:"12",kpiValue:"94"},
						{time:"13",kpiValue:"96"},
						{time:"14",kpiValue:"97"},
						{time:"15",kpiValue:"99"},
						{time:"16",kpiValue:"97"},
						{time:"17",kpiValue:"93"},
						{time:"18",kpiValue:"92"},
						{time:"19",kpiValue:"90"},
						{time:"20",kpiValue:"88"},
						{time:"21",kpiValue:"84"},
						{time:"22",kpiValue:"83"},
						{time:"23",kpiValue:"80"}
					]
				},
				{
					showName:"行业网关系统容量占用率",
					threshold:{lineValue:"90"},
					datas:[{time:"0",kpiValue:"96"},
						{time:"1",kpiValue:"92"},
						{time:"2",kpiValue:"90"},
						{time:"3",kpiValue:"87"},
						{time:"4",kpiValue:"86"},
						{time:"5",kpiValue:"85"},
						{time:"6",kpiValue:"87"},
						{time:"7",kpiValue:"90"},
						{time:"8",kpiValue:"93"},
						{time:"9",kpiValue:"91"},
						{time:"10",kpiValue:"92"},
						{time:"11",kpiValue:"93"},
						{time:"12",kpiValue:"94"},
						{time:"13",kpiValue:"96"},
						{time:"14",kpiValue:"97"},
						{time:"15",kpiValue:"99"},
						{time:"16",kpiValue:"97"},
						{time:"17",kpiValue:"93"},
						{time:"18",kpiValue:"92"},
						{time:"19",kpiValue:"90"},
						{time:"20",kpiValue:"88"},
						{time:"21",kpiValue:"84"},
						{time:"22",kpiValue:"83"},
						{time:"23",kpiValue:"80"}
					]
				}
				
			]
			
		}
		/**
		 * 集客设备业务性能监控模拟数据
		 **/ 
		public static var groupBusinessData:Object = {
			monitorLevelsRep:[
				{businessType:"跨省",speechSounds:"0",internetWork:"0",transmission:"2",gprs:"0",shortMMS:"0"},
				{businessType:"省级重点",speechSounds:"2",internetWork:"7",transmission:"1",gprs:"4",shortMMS:"5"},
				{businessType:"省级",speechSounds:"3",internetWork:"2",transmission:"4",gprs:"3",shortMMS:"6"},
				{businessType:"地市",speechSounds:"3",internetWork:"9",transmission:"7",gprs:"4",shortMMS:"9"},
				{businessType:"合计",speechSounds:"9",internetWork:"22",transmission:"20",gprs:"12",shortMMS:"23"}
			],
			supportLevelsRep:[
				{businessType:"AAA",speechSounds:"0",internetWork:"0",transmission:"2",gprs:"0",shortMMS:"0"},
				{businessType:"AA",speechSounds:"2",internetWork:"7",transmission:"1",gprs:"4",shortMMS:"5"},
				{businessType:"A",speechSounds:"3",internetWork:"2",transmission:"4",gprs:"3",shortMMS:"6"},
				{businessType:"普通",speechSounds:"3",internetWork:"9",transmission:"7",gprs:"4",shortMMS:"9"},
				{businessType:"合计",speechSounds:"9",internetWork:"22",transmission:"20",gprs:"12",shortMMS:"23"}
			]
		}
			
		
		public static var businessReportDatas:Object = [{
			reportTitle:"GPRS流量日统计报表（GB）",
			columnChartTitle:"GPRS流量地市柱状图",
			lineChartTitle:"全省",
			reportColumns:["地市","2013/7/22","2013/7/23","2013/7/24","2013/7/25","2013/7/26"],
			reportdatas:[
				{"地市":"南京","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"苏州","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"无锡","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"常州","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"南通","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"镇江","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"扬州","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"泰州","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"徐州","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"盐城","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"淮安","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"连云港","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"宿迁","2013/7/22":15000,"2013/7/23":9000,"2013/7/24":8000,"2013/7/25":8000,"2013/7/26":8660},
				{"地市":"合计","2013/7/22":150000,"2013/7/23":90000,"2013/7/24":80000,"2013/7/25":80000,"2013/7/26":86600}
			],
			columndatas:[
				{"cityId":"南京","value":9660},
				{"cityId":"苏州","value":8660},
				{"cityId":"无锡","value":6660},
				{"cityId":"常州","value":8560},
				{"cityId":"南通","value":8260},
				{"cityId":"镇江","value":7660},
				{"cityId":"扬州","value":7660},
				{"cityId":"泰州","value":7260},
				{"cityId":"徐州","value":6260},
				{"cityId":"盐城","value":6960},
				{"cityId":"淮安","value":8960},
				{"cityId":"连云港","value":9660},
				{"cityId":"宿迁","value":5660}
			],
			linedatas:[
				{"time":"7月22日","value":150000},
				{"time":"7月23日","value":90000},
				{"time":"7月24日","value":80000},
				{"time":"7月25日","value":80000},
				{"time":"7月26日","value":86600}
			] 
		},
			{
				reportTitle:"GPRS在线终端数",
				columnChartTitle:"GPRS在线终端数地市柱状图",
				lineChartTitle:"全省",
				reportColumns:["地市","2013/7/22","2013/7/23","2013/7/24","2013/7/25","2013/7/26"],
				reportdatas:[
					{"地市":"南京","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"苏州","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"无锡","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"常州","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"南通","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"镇江","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"扬州","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"泰州","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"徐州","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"盐城","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"淮安","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"连云港","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"宿迁","2013/7/22":150,"2013/7/23":160,"2013/7/24":150,"2013/7/25":170,"2013/7/26":150},
					{"地市":"合计","2013/7/22":1600,"2013/7/23":1900,"2013/7/24":1600,"2013/7/25":2100,"2013/7/26":1600}
				],
				columndatas:[
					{"cityId":"南京","value":140},
					{"cityId":"苏州","value":130},
					{"cityId":"无锡","value":110},
					{"cityId":"常州","value":70},
					{"cityId":"南通","value":66},
					{"cityId":"镇江","value":57},
					{"cityId":"扬州","value":42},
					{"cityId":"泰州","value":40},
					{"cityId":"徐州","value":36},
					{"cityId":"盐城","value":50},
					{"cityId":"淮安","value":56},
					{"cityId":"连云港","value":54},
					{"cityId":"宿迁","value":60}
				],
				linedatas:[
					{"time":"7月22日","value":1600},
					{"time":"7月23日","value":1900},
					{"time":"7月24日","value":1500},
					{"time":"7月25日","value":2100},
					{"time":"7月26日","value":1600}
				] 
			}
		];	
	}
}