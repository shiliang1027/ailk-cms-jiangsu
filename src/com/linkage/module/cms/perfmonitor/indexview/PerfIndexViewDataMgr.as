package com.linkage.module.cms.perfmonitor.indexview
{
	import com.linkage.module.cms.components.advanceddatagrid.AdvancedDataGrid;
	import com.linkage.module.cms.components.advanceddatagrid.SubClasses.AdvancedDataGridColumn;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.controls.Alert;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumnGroup;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class PerfIndexViewDataMgr
	{
		private static const destination:String = "flexdestination_cms_perfmonitor_subject_mainPageServ";
		private static const src:String = "com.linkage.module.cms.performance.monitor.subject.serv.mainpage.SubjectMainPageServImp";
		private static var endpoint:String = "messagebroker/amf";
		
		//日志
		private static var log:ILogger = Log.getLogger("com.linkage.module.cms.perfmonitor.devfperf.PerfIndexViewDataMgr");
		
		public static function setContext(context:String):void
		{
			endpoint = context + endpoint;
			
			log.info("-----init PerfIndexViewDataMgr----- destination : " + destination);
			log.info("-----init PerfIndexViewDataMgr----- src : " + src);
			log.info("-----init PerfIndexViewDataMgr----- endpoint : " + endpoint);
		}
		
		//加载 设备性能劣化概况
		public static function getBadEquipList(success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getBadEquipList :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getBadEquipList :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getBadEquipList");
			
			log.info("-----getBadEquipList  加载设备性能劣化概况.");
			remote.getBadEquipList();
			remote = null;
		}
		
		//加载 设备性能劣化详情
		public static function getBadEquipPerf(success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getBadEquipPerf :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getBadEquipPerf :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getBadEquipPerf");
			
			log.info("-----getBadEquipPerf  加载设备性能劣化详情");
			remote.getBadEquipPerf();
			remote = null;
		}
		
		//加载 业务性能和专题监控性能数据信息列表
		public static function getPerfInfo(success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getPerfInfo :成功返回！");
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getPerfInfo :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getPerfInfo");
			
			log.info("-----getPerfInfo  加载业务性能和专题监控性能数据信息列表。");
			remote.getPerfInfo();
			remote = null;
		}
		
		//加载 专题监控性能指标问题网元详情列表
		public static function getNeDetailList(success:Function, error:Function = null):void
		{
			var remote:RemoteObject = BlazeDSUtil.newService(destination, src, endpoint, 
				function(result:Object):void
				{
					log.info("-----getNeDetailList :成功：" + (result == null? "0" : result.length));
					success.call(null, result);
					result = null;
				}, 
				function(event:FaultEvent):void
				{
					log.error("-----getNeDetailList :失败：" + event.fault.faultString);
					error.call(null, event);
				}, 
				true, 
				"getNeDetailList");
			
			log.info("-----getNeDetailList  加载专题监控性能指标问题网元详情列表");
			remote.getNeDetailList();
			remote = null;
		}
		
		//业务性能概况表格
		public static function getAdvDg():AdvancedDataGrid
		{
			var advd:AdvancedDataGrid = new AdvancedDataGrid();
			advd.draggableColumns = false;
			
			var colGroup:AdvancedDataGridColumnGroup = new AdvancedDataGridColumnGroup();
			colGroup.headerText = '全省业务性能概况';
			var svcNameCol:AdvancedDataGridColumn = new AdvancedDataGridColumn();
			svcNameCol.headerText = '业务类型';
			svcNameCol.dataField = 'svcName';
			colGroup.children.push(svcNameCol);
			
			var perfNameCol:AdvancedDataGridColumn = new AdvancedDataGridColumn();
			perfNameCol.headerText = '业务指标';
			perfNameCol.dataField = 'perfName';
			colGroup.children.push(perfNameCol);
			
			var perfValueCol:AdvancedDataGridColumn = new AdvancedDataGridColumn();
			perfValueCol.headerText = '指标值';
			perfValueCol.dataField = 'perfValue';
			colGroup.children.push(perfValueCol);
			
			var perfBaseCol:AdvancedDataGridColumn = new AdvancedDataGridColumn();
			perfBaseCol.headerText = '指标基准';
			perfBaseCol.dataField = 'perfBase';
			colGroup.children.push(perfBaseCol);
			
			var cityNumCol:AdvancedDataGridColumn = new AdvancedDataGridColumn();
			cityNumCol.headerText = '问题地市数量';
			cityNumCol.dataField = 'cityNum';
			cityNumCol.width = 120;
			colGroup.children.push(cityNumCol);
			
			advd.groupedColumns = [colGroup];
			advd.setStyle('textAlign',"left");
			advd.draggableColumns = false;
			return advd;
		}
	}
}