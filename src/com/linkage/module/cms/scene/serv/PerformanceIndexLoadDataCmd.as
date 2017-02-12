package com.linkage.module.cms.scene.serv
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IPerformanceIndexDao;
	import com.linkage.module.cms.scene.domain.PerformanceIndexDM;
	import com.linkage.module.cms.scene.event.compenent.PerformanceIndexEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	import org.spicefactory.lib.collection.Map;

	public class PerformanceIndexLoadDataCmd
	{

		private var log:ILogger = Log.getLoggerByClass(PerformanceIndexLoadDataCmd);

		[Inject("performanceIndexDao")]
		public var dao:IPerformanceIndexDao;

		[Inject("performanceIndexDM")]
		public var performanceIndexDM:PerformanceIndexDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:PerformanceIndexEvent):AsyncToken
		{
			log.info("float data cmd!");
			//业务性能指标
			performanceIndexDM.servPerfDP.removeAll();
			performanceIndexDM.servPerfDP.refresh();

			//设备性能指标  moKpiList
			performanceIndexDM.moPerfDP.removeAll();
			performanceIndexDM.moPerfDP.refresh();

			//客户性能指标  custKpiList
			performanceIndexDM.custPerfDP.removeAll();
			performanceIndexDM.custPerfDP.refresh();

			//告警信息 alarmInfo
			performanceIndexDM.alarmDP.removeAll();
			performanceIndexDM.alarmDP.refresh();
			return dao.loadData();
		}

		public function result(data:Object):void
		{
			log.info("float data success!" + data['servPerfKpiList'].length + "_" + data['moKpiList'].length + "_" + data['custKpiList'].length + "_" + data['alarmInfo'].length + "_" + data['badKpiList'].length);

			performanceIndexDM.kpiDatas = data;

			//业务性能指标
			performanceIndexDM.servPerfDP.removeAll();
			performanceIndexDM.servPerfDP.addAll(data['servPerfKpiList'] as IList);
			performanceIndexDM.servPerfDP.refresh();

			//设备性能指标  moKpiList
			performanceIndexDM.moPerfDP.removeAll();
			performanceIndexDM.moPerfDP.addAll(data['moKpiList'] as IList);
			performanceIndexDM.moPerfDP.refresh();

			//客户性能指标  custKpiList
			performanceIndexDM.custPerfDP.removeAll();
			performanceIndexDM.custPerfDP.addAll(data['custKpiList'] as IList);
			performanceIndexDM.custPerfDP.refresh();

			//告警信息 alarmInfo
			performanceIndexDM.alarmDP.removeAll();
			performanceIndexDM.alarmDP.addAll(data['alarmInfo'] as IList);
			performanceIndexDM.alarmDP.refresh();

			//劣化指标信息  badKpiList
			performanceIndexDM.badKpiDP.removeAll();
			performanceIndexDM.badKpiDP.addAll(data['badKpiList'] as IList);
			performanceIndexDM.badKpiDP.refresh();

			log.info(performanceIndexDM.servPerfDP);
			log.info(performanceIndexDM.moPerfDP);
			log.info(performanceIndexDM.custPerfDP);
			log.info(performanceIndexDM.alarmDP);
			log.info(performanceIndexDM.badKpiDP);

			msgDispatcher(new PerformanceIndexEvent(PerformanceIndexEvent.CMS_SCENE_PERFORMANCEINDEX_SHOWORHIDDENDATAGRID));

			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("float data error：" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

