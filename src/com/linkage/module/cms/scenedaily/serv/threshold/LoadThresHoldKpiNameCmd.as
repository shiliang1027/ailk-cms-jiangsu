package com.linkage.module.cms.scenedaily.serv.threshold
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.threshold.ThresHoldDao;
	import com.linkage.module.cms.scenedaily.domain.threshold.ThresHoldDM;
	import com.linkage.module.cms.scenedaily.event.threshold.ThresHoldEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-6
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadThresHoldKpiNameCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadThresHoldKpiNameCmd);

		[Inject("thresHoldDM")]
		public var dm:ThresHoldDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("thresHoldDao")]
		public var dao:ThresHoldDao;

		public function execute(e:ThresHoldEvent):AsyncToken
		{
			log.info("获取的指标组参数");
			log.info(e.param);
			return dao.getPerfGroup(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("获取的指标组返回值");
			log.info(data);
//			if ("1" == data.resType)
//			{
//				if ("1" == data.perfType)
//				{
//					dm.proKpiNames1.removeAll();
//					dm.proKpiNames1.addAll(data.dataList as IList);
//					dm.proKpiNames1.refresh();
//				}
//				else if ("2" == data.perfType)
//				{
//					dm.proKpiNames2.removeAll();
//					dm.proKpiNames2.addAll(data.dataList as IList);
//					dm.proKpiNames2.refresh();
//				}
//				else if ("3" == data.perfType)
//				{
//					dm.proKpiNames3.removeAll();
//					dm.proKpiNames3.addAll(data.dataList as IList);
//					dm.proKpiNames3.refresh();
//				}
//				else if ("4" == data.perfType)
//				{
//					dm.proKpiNames4.removeAll();
//					dm.proKpiNames4.addAll(data.dataList as IList);
//					dm.proKpiNames4.refresh();
//				}
//				else if ("5" == data.perfType)
//				{
//					dm.proKpiNames5.removeAll();
//					dm.proKpiNames5.addAll(data.dataList as IList);
//					dm.proKpiNames5.refresh();
//				}
//			}
//			else if ("2" == data.resType)
//			{
//				if ("1" == data.perfType)
//				{
//					dm.cityKpiNames1.removeAll();
//					dm.cityKpiNames1.addAll(data.dataList as IList);
//					dm.cityKpiNames1.refresh();
//				}
//				else if ("2" == data.perfType)
//				{
//					dm.cityKpiNames2.removeAll();
//					dm.cityKpiNames2.addAll(data.dataList as IList);
//					dm.cityKpiNames2.refresh();
//				}
//				else if ("3" == data.perfType)
//				{
//					dm.cityKpiNames3.removeAll();
//					dm.cityKpiNames3.addAll(data.dataList as IList);
//					dm.cityKpiNames3.refresh();
//				}
//				else if ("4" == data.perfType)
//				{
//					dm.cityKpiNames4.removeAll();
//					dm.cityKpiNames4.addAll(data.dataList as IList);
//					dm.cityKpiNames4.refresh();
//				}
//				else if ("5" == data.perfType)
//				{
//					dm.cityKpiNames5.removeAll();
//					dm.cityKpiNames5.addAll(data.dataList as IList);
//					dm.cityKpiNames5.refresh();
//				}
//			}
//			else if ("3" == data.resType)
//			{
//				if ("1" == data.perfType)
//				{
//					dm.moKpiNames1.removeAll();
//					dm.moKpiNames1.addAll(data.dataList as IList);
//					dm.moKpiNames1.refresh();
//				}
//				else if ("2" == data.perfType)
//				{
//					dm.moKpiNames2.removeAll();
//					dm.moKpiNames2.addAll(data.dataList as IList);
//					dm.moKpiNames2.refresh();
//				}
//				else if ("3" == data.perfType)
//				{
//					dm.moKpiNames3.removeAll();
//					dm.moKpiNames3.addAll(data.dataList as IList);
//					dm.moKpiNames3.refresh();
//				}
//				else if ("4" == data.perfType)
//				{
//					dm.moKpiNames4.removeAll();
//					dm.moKpiNames4.addAll(data.dataList as IList);
//					dm.moKpiNames4.refresh();
//				}
//				else if ("5" == data.perfType)
//				{
//					dm.moKpiNames5.removeAll();
//					dm.moKpiNames5.addAll(data.dataList as IList);
//					dm.moKpiNames5.refresh();
//				}
//			}
			var evt:ThresHoldEvent = new ThresHoldEvent(ThresHoldEvent.LOAD_KPI_NAMES_COMP);
			evt.param = data;
			dispatchMsg(evt);
		}

		public function result(data:Object):void
		{
			log.info("获取的指标组返回值");
			log.info(data);
			var evt:ThresHoldEvent = new ThresHoldEvent(ThresHoldEvent.LOAD_KPI_NAMES_COMP);
			evt.param = data;
			dispatchMsg(evt);
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			Alert.show("加载指标名称数据失败");

			var isTest:Boolean = false;
			if (isTest)
			{
				var result:Object;
				result = new ArrayCollection([{"perfGroupId": "001", "perfGroupName": "GMS语音业务感知接通率", "unit": "%"}, {"perfGroupId": "002", "perfGroupName": "GMS语音业务感知接通率2", "unit": "$"}, {"perfGroupId": "003", "perfGroupName": "GMS语音业务感知接通率3", "unit": "*"}, {"perfGroupId": "004", "perfGroupName": "GMS语音业务感知接通率4", "unit": "%"}]);
				test(result);
			}
		}
	}
}