package com.linkage.module.cms.viewperformance.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.system.utils.StringUtils;
	import com.linkage.module.cms.viewperformance.dao.ViewPerformanceDAO;
	import com.linkage.module.cms.viewperformance.domain.ViewPerformanceDM;
	import com.linkage.module.cms.viewperformance.event.ViewPerformanceEvent;
	import com.linkage.system.core.lk_internal;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-11-03
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ViewPerfQueryDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(ViewPerfQueryDataCMD);
		
		[Inject("viewPerformanceDAO")]
		public var dao:ViewPerformanceDAO;
		
		[Inject("viewPerformanceDM")]
		public var dm:ViewPerformanceDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var now:Number=0;
		
		public function execute(event:ViewPerformanceEvent):AsyncToken
		{
			log.debug("[查询查看性能数据]");
			log.debug(dm.queryParam);
			now=new Date().getMilliseconds();
			return dao.queryPerfData(dm.queryParam);
		}
		
		public function result(result:Object):void
		{
			log.debug("[查询查看性能数据]成功!耗时：{0}ms", (new Date().getMilliseconds() - now));
			log.debug(result);
			dm.viewPerfConfidData.removeAll();
			dm.viewPerfData.removeAll();
			dm.leftMenuData.removeAll();
			dm.viewPerfCharData.removeAll();
			dm.rateKeyNameData.removeAll();
			dm.newViewPerfChartData.removeAll();
			if(result.length<=0)
			{
				Alert.show("没有数据","提示：");
				return;
			}
			
			//固定表格字段的定义
			var constConfig:ArrayCollection;
			//type =1或为空的情况下表示的是端口 ；2表示的是队列
			if (StringUtils.isEmpty(dm.queryParam.type) || "1" == dm.queryParam.type)
			{
				constConfig = new ArrayCollection([{kpi_id:"gather_time",show_name:"  时间   ",unit:""},
					{kpi_id:"mo_name",show_name:"  电路名称  ",unit:""}]);
				
				var tempConfig:ArrayCollection = result.config as ArrayCollection;
				var tempChart:ArrayCollection = result.chart_data as ArrayCollection;
				var resultConfig:ArrayCollection = new ArrayCollection();
				
				//Alert.show("tempChart:9" + tempChart.length + "+tempConfig:13" + tempConfig.length);
				
				//遍历下，过滤掉队列属性，只展示端口的字段
				for(var i:int=0;i<tempConfig.length;i++)
				{
					var str:String = tempConfig[i].show_name;
					if(-1 ==str.indexOf("队列"))//不包含队列字样的字段即为端口的字段
					{
						resultConfig.addItem(tempConfig[i]);
						//dm.viewPerfCharData.addItem(tempChart[i]);
					}
				}
				dm.viewPerfConfidData.addAll(constConfig);//将固定字段添加表字段中
				dm.viewPerfConfidData.addAll(resultConfig);//将动态字段添加表字段中。
				//图表左侧的菜单赋值
				dm.leftMenuData.addAll(getLeftMenuData(resultConfig,tempChart));
			}
			if ("2" == dm.queryParam.type)
			{
				constConfig = new ArrayCollection([{kpi_id:"gather_time",show_name:"  时间   ",unit:""},
					{kpi_id:"mo_name",show_name:"  设备名称  ",unit:""},
					{kpi_id:"mo_name2",show_name:" 对端设备名称 ",unit:""},
					{kpi_id:"queue_name",show_name:"  队列名称  ",unit:""}]);
				dm.viewPerfConfidData.addAll(constConfig);
				dm.viewPerfConfidData.addAll(result.config);
				//图表左侧的菜单赋值
				dm.leftMenuData.addAll(getLeftMenuData(result.config as ArrayCollection,result.chart_data as ArrayCollection));
			}
			dm.viewPerfData.addAll(result.list_data);
			
			dm.viewPerfCharData.addAll(result.chart_data);
			log.info(dm.viewPerfCharData);
			
			if(StringUtils.isEmpty(dm.queryParam.gather_time))
			{
				dm.gatherTime = DateField.dateToString(new Date(),"YYYY年MM月DD日");
				dm.queryParam.gather_time = DateField.dateToString(new Date(),"YYYY-MM-DD");
			}
			else
			{
				var newDate:Date = DateField.stringToDate(dm.queryParam.gather_time,"YYYY/MM/DD");
				dm.gatherTime = DateField.dateToString(newDate,"YYYY年MM月DD日");
			}
			dispatchMsg(new ViewPerformanceEvent("VIEWPERF_QUERYPERFDATA_SUCC"));
			dispatchMsg(new ViewPerformanceEvent("VIEWPERF_QUERYPERFDATA_SUCC2"));
		}
		
		/**
		 * 针对左侧菜单顺序问题进行修正  此方法正在端口中调用
		 * 
		 * @param arr1 修正的菜单，但是同char_data顺序不一致
		 * @param Arr2 char_data集合数组
		 * @return 新的菜单集合
		 * 
		 */
		public function getLeftMenuData(arr1:ArrayCollection,arr2:ArrayCollection):ArrayCollection
		{
			var resultLeftMenuData:ArrayCollection = new ArrayCollection();
			for(var i:int =0;i< arr2.length; i++)
			{
				var obji:Object = arr2[i];
				for(var j:int = 0;j < arr1.length; j++)
				{
					var objj:Object = arr1[j];
					if (obji.kpi_id == objj.kpi_id)
					{
						resultLeftMenuData.addItem(arr1[j]);
						break;
					}
				}
			}
			return resultLeftMenuData;
		}
		
		public function error(f:Fault):void
		{
			log.error("加载性能数据错误：" + f.faultString + "\n" + f.faultDetail);
			//模拟数据
			/**
			var dataResult:Object = {
				config:[
					{kpi_id:"101",show_name:"队列带宽（Mb）",unit:"Mb"},
					{kpi_id:"102",show_name:"队列流出速率(Mbps)",unit:"Mbps"},
					{kpi_id:"103",show_name:"队列流出带宽利用率(%)",unit:"%"},
					{kpi_id:"104",show_name:"队列带宽配置占比(%)",unit:"%"}
				],
				list_data:[
					{gather_time:"2014/7/9 10:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"154.6",103:"15.46",104:"10.0"},
					{gather_time:"2014/7/9 11:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"164.6",103:"16.46",104:"10.0"},
					{gather_time:"2014/7/9 12:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"174.6",103:"17.46",104:"10.0"},
					{gather_time:"2014/7/9 13:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"184.6",103:"18.46",104:"10.0"},
					{gather_time:"2014/7/9 14:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"154.6",103:"15.46",104:"10.0"},
					{gather_time:"2014/7/9 15:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"164.6",103:"16.46",104:"10.0"},
					{gather_time:"2014/7/9 16:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"174.6",103:"17.46",104:"10.0"},
					{gather_time:"2014/7/9 17:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"184.6",103:"18.46",104:"10.0"},
					{gather_time:"2014/7/9 18:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"154.6",103:"15.46",104:"10.0"},
					{gather_time:"2014/7/9 19:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"164.6",103:"16.46",104:"10.0"},
					{gather_time:"2014/7/9 20:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"174.6",103:"17.46",104:"10.0"},
					{gather_time:"2014/7/9 21:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"184.6",103:"18.46",104:"10.0"},
					{gather_time:"2014/7/9 22:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"154.6",103:"15.46",104:"10.0"},
					{gather_time:"2014/7/9 23:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"164.6",103:"16.46",104:"10.0"},
					{gather_time:"2014/7/9 0:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"174.6",103:"17.46",104:"10.0"},
					{gather_time:"2014/7/9 1:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"184.6",103:"18.46",104:"10.0"},
					{gather_time:"2014/7/9 2:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"154.6",103:"15.46",104:"10.0"},
					{gather_time:"2014/7/9 3:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"164.6",103:"16.46",104:"10.0"},
					{gather_time:"2014/7/9 4:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"174.6",103:"17.46",104:"10.0"},
					{gather_time:"2014/7/9 5:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"184.6",103:"18.46",104:"10.0"},
					{gather_time:"2014/7/9 6:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"154.6",103:"15.46",104:"10.0"},
					{gather_time:"2014/7/9 7:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"164.6",103:"16.46",104:"10.0"},
					{gather_time:"2014/7/9 8:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"174.6",103:"17.46",104:"10.0"},
					{gather_time:"2014/7/9 9:00",mo_name:"JSWX-MA-IPNET-RT08",mo_name2:"JSWX-PB-CMNet-RT02",queue_name:"路由协议",101:"1000",102:"184.6",103:"18.46",104:"10.0"}
				],
				chart_data:[
					{kpi_id:"101",data:[
						{queue_name:"路由协议",data:[
							{gather_time:10,value:"00"},
							{gather_time:11,value:"10"},
							{gather_time:12,value:"20"},
							{gather_time:13,value:"30"},
							{gather_time:14,value:"40"},
							{gather_time:15,value:"50"},
							{gather_time:16,value:"60"},
							{gather_time:17,value:"50"},
							{gather_time:18,value:"40"},
							{gather_time:19,value:"30"},
							{gather_time:20,value:"20"},
							{gather_time:21,value:"10"},
							{gather_time:22,value:"00"},
							{gather_time:23,value:"10"},
							{gather_time:0,value:"20"},
							{gather_time:1,value:"30"},
							{gather_time:2,value:"40"},
							{gather_time:3,value:"70"},
							{gather_time:4,value:"20"},
							{gather_time:5,value:"30"},
							{gather_time:6,value:"90"},
							{gather_time:7,value:"10"},
							{gather_time:8,value:"20"},
							{gather_time:9,value:"30"}
						]},
							{queue_name:"重要集客互联网专线",data:[
								{gather_time:10,value:"10"},
								{gather_time:11,value:"11"},
								{gather_time:12,value:"21"},
								{gather_time:13,value:"31"},
								{gather_time:14,value:"41"},
								{gather_time:15,value:"51"},
								{gather_time:16,value:"61"},
								{gather_time:17,value:"15"},
								{gather_time:18,value:"14"},
								{gather_time:19,value:"13"},
								{gather_time:20,value:"12"},
								{gather_time:21,value:"11"},
								{gather_time:22,value:"10"},
								{gather_time:23,value:"11"},
								{gather_time:0,value:"12"},
								{gather_time:1,value:"13"},
								{gather_time:2,value:"14"},
								{gather_time:3,value:"17"},
								{gather_time:4,value:"12"},
								{gather_time:5,value:"13"},
								{gather_time:6,value:"9"},
								{gather_time:7,value:"1"},
								{gather_time:8,value:"2"},
								{gather_time:9,value:"3"}
							]}
					]},
					{kpi_id:"102",data:[
						{queue_name:"重要集客互联网专线",data:[
							{gather_time:10,value:"10"},
							{gather_time:11,value:"11"},
							{gather_time:12,value:"21"},
							{gather_time:13,value:"31"},
							{gather_time:14,value:"41"},
							{gather_time:15,value:"51"},
							{gather_time:16,value:"61"},
							{gather_time:17,value:"15"},
							{gather_time:18,value:"14"},
							{gather_time:19,value:"13"},
							{gather_time:20,value:"12"},
							{gather_time:21,value:"11"},
							{gather_time:22,value:"10"},
							{gather_time:23,value:"11"},
							{gather_time:0,value:"12"},
							{gather_time:1,value:"13"},
							{gather_time:2,value:"14"},
							{gather_time:3,value:"17"},
							{gather_time:4,value:"12"},
							{gather_time:5,value:"13"},
							{gather_time:6,value:"9"},
							{gather_time:7,value:"1"},
							{gather_time:8,value:"2"},
							{gather_time:9,value:"3"}
						]}
					]}
				]
			};
			dm.viewPerfData = new ArrayCollection(dataResult["list_data"]);
			
			//固定表格字段的定义
			var constConfig:ArrayCollection;
			
			//队列固定情况
			if (StringUtils.isEmpty(dm.queryParam.type) || "1" == dm.queryParam.type)
			{
				constConfig = new ArrayCollection([{kpi_id:"gather_time",show_name:"  时间   ",unit:""},
					{kpi_id:"mo_name",show_name:"   设备名称   ",unit:""},
					{kpi_id:"mo_name2",show_name:"  对端设备名称  ",unit:""},
					{kpi_id:"queue_name",show_name:"  队列名称  ",unit:""}]);
			}
			dm.viewPerfConfidData.addAll(constConfig);
			dm.viewPerfConfidData.addAll(new ArrayCollection(dataResult["config"]));
			
			//图表左侧的菜单赋值
			dm.leftMenuData = new ArrayCollection(dataResult["config"]);
			
			
			dm.viewPerfCharData = new ArrayCollection(dataResult["chart_data"]);
			
			//dm.rateKeyNameData = new ArrayCollection(dataResult["config"]);
			dm.gatherTime = DateField.dateToString(new Date(),"YYYY年MM月DD日")
			dispatchMsg(new ViewPerformanceEvent("VIEWPERF_QUERYPERFDATA_SUCC"));
			dispatchMsg(new ViewPerformanceEvent("VIEWPERF_QUERYPERFDATA_SUCC2"));
			 * */
		}
	}
}