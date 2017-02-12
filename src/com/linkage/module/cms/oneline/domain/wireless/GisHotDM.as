package com.linkage.module.cms.oneline.domain.wireless
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.oneline.event.wireless.GisHotEvent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.filters.GlowFilter;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	
	import spark.filters.GradientGlowFilter;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-12-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GisHotDM
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotDM);
		
		[Embed(source="../../assets/perf_0_big.png")]
		private var perf_0_big:Class;
		[Embed(source="../../assets/perf_1_big.png")]
		private var perf_1_big:Class;
		[Embed(source="../../assets/perf_2_big.png")]
		private var perf_2_big:Class;
		[Embed(source="../../assets/perf_3_big.png")]
		private var perf_3_big:Class;
		[Embed(source="../../assets/perf_4_big.png")]
		private var perf_4_big:Class;
		
		[Embed(source="../../../perfmonitor/subject/img/cell_0.png")]
		private var hot_0:Class;
		[Embed(source="../../../perfmonitor/subject/img/cell_1.png")]
		private var hot_1:Class;
		[Embed(source="../../../perfmonitor/subject/img/cell_2.png")]
		private var hot_2:Class;
		[Embed(source="../../../perfmonitor/subject/img/cell_3.png")]
		private var hot_3:Class;
		[Embed(source="../../../perfmonitor/subject/img/cell_4.png")]
		private var hot_4:Class;
		
		[Embed(source="../../../scene/img/mo/CELL_0.png")]
		private var cell_0:Class;
		[Embed(source="../../../scene/img/mo/CELL_1.png")]
		private var cell_1:Class;
		[Embed(source="../../../scene/img/mo/CELL_2.png")]
		private var cell_2:Class;
		[Embed(source="../../../scene/img/mo/CELL_3.png")]
		private var cell_3:Class;
		[Embed(source="../../../scene/img/mo/CELL_4.png")]
		private var cell_4:Class;
		
		[Embed(source="../../../scene/img/mo/UTRANCELL_0.png")]
		private var utrancell_0:Class;
		[Embed(source="../../../scene/img/mo/UTRANCELL_1.png")]
		private var utrancell_1:Class;
		[Embed(source="../../../scene/img/mo/UTRANCELL_2.png")]
		private var utrancell_2:Class;
		[Embed(source="../../../scene/img/mo/UTRANCELL_3.png")]
		private var utrancell_3:Class;
		[Embed(source="../../../scene/img/mo/UTRANCELL_4.png")]
		private var utrancell_4:Class;
		
		[Bindable]
		[Embed(source="../../view/components/wireless/assets/flag_green.png")]
		public var flag_green:Class;
		
		[Bindable]
		public var citys:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var hotspots:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public var hotspots1:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public var hotspots2:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public var hotspots3:ArrayCollection = new ArrayCollection();//汪炜，2013-8-12,历史热点数据。
		
		[Bindable]
		public var phone2Gdata:ArrayCollection = new ArrayCollection();//小区拨打2G(110,119,120)数据。
		
		[Bindable]
		public var phone3Gdata:ArrayCollection = new ArrayCollection();//小区拨打3G(110,119,120)数据。
		
//		[Bindable]
//		public var phone2G110data:ArrayCollection = new ArrayCollection();//小区拨打2G110数据。
//		
//		[Bindable]
//		public var phone2G119data:ArrayCollection = new ArrayCollection();//小区拨打2G119数据。
//		
//		[Bindable]
//		public var phone2G120data:ArrayCollection = new ArrayCollection();//小区拨打2G120数据。
//		
//		[Bindable]
//		public var phone3G110data:ArrayCollection = new ArrayCollection();//小区拨打3G110数据。
//		
//		[Bindable]
//		public var phone3G119data:ArrayCollection = new ArrayCollection();//小区拨打3G119数据。
//		
//		[Bindable]
//		public var phone3G120data:ArrayCollection = new ArrayCollection();//小区拨打3G120数据。 
		
		[Bindable]
		public var infoTabs:ArrayCollection = new ArrayCollection(["性能指标"]);
		[Bindable]
		public var kpiData:Object = new Object();
		[Bindable]
		public var gisInfos:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var moInfos:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var cellRadius:Number = 0;
		[Bindable]
		public var biaoji:Number = 0;
		[Bindable]
		public var regionPints:String="";
		[Bindable]
		public var kpiChartData:ArrayCollection = new ArrayCollection();
		[Bindable]
		public var kpis:ArrayCollection = new ArrayCollection();
		
		public var levelColorMap:Object={'4': 0X4169E1, '3': 0XFED701, '2': 0XEE9800, '1': 0XFF0000,'0':0X00FF00};
		
		public var levelColorFilterMap:Object={'4': new GradientGlowFilter(0, 180, [0xffffff, 0X4169E1, 0X4169E1, 0X4169E1], [0, 0.9, 0.9, 0.9], [0, 63, 126, 255], 100, 100, 10, BitmapFilterQuality.HIGH),'3': new GradientGlowFilter(0, 180, [0xffffff, 0XFED701, 0XFED701, 0XFED701], [0, 0.9, 0.9, 0.9], [0, 63, 126, 255], 100, 100, 10, BitmapFilterQuality.HIGH), '2':new GradientGlowFilter(0, 180, [0xffffff,0XEE9800,0XEE9800,0XEE9800], [0, 0.9, 0.9, 0.9], [0, 63, 126, 255], 100, 100, 10, BitmapFilterQuality.HIGH), '1': new GradientGlowFilter(0, 180, [0xffffff,0XFF0000,0XFF0000,0XFF0000], [0, 0.9, 0.9, 0.9], [0, 63, 126, 255], 100, 100, 10, BitmapFilterQuality.HIGH)};
		
		public var levelColorFilterIconMap:Object={'4': new GlowFilter(0X4169E1,0.9,50,50,2,BitmapFilterQuality.HIGH,false,false),'3': new GlowFilter(0XFED701,0.9,50,50,2,BitmapFilterQuality.HIGH,false,false), '2':new GlowFilter(0XEE9800,0.9,50,50,2,BitmapFilterQuality.HIGH,false,false), '1': new GlowFilter(0XFF0000,0.9,50,50,2,BitmapFilterQuality.HIGH,false,false)};
		
		public var levelIconMap:Object={"0":{"0":perf_0_big,"1":perf_1_big,"2":perf_2_big,"3":perf_3_big,"4":perf_4_big},"101":{"0":cell_0,"1":perf_1_big,"2":perf_2_big,"3":perf_3_big,"4":cell_4},"102":{"0":utrancell_0,"1":perf_1_big,"2":perf_2_big,"3":perf_3_big,"4":utrancell_4}};
		
		public var saveSceneResult:Object;
		
		public var saveSceneResultURl:Object;
		
		public var queryGisInfoFlag:Boolean = true;//是否查询的是实时热点，默认为true，2013-9-3，汪炜。
		[Bindable]
		public var picLayerList:ArrayCollection = new ArrayCollection();
		public function GisHotDM()
		{
		}
	}
}