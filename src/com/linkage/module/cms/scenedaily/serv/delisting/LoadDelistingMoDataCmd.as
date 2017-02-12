package com.linkage.module.cms.scenedaily.serv.delisting
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.impkpi.ImpProKpiDao;
	import com.linkage.module.cms.scenedaily.domain.delisting.DelistingDM;
	import com.linkage.module.cms.scenedaily.event.delisting.DelistingEvent;

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
	 * @date 2012-8-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadDelistingMoDataCmd
	{

		private var log:ILogger = Log.getLoggerByClass(LoadDelistingMoDataCmd);

		[Inject("impProKpiDao")]
		public var dao:ImpProKpiDao;

		[Inject("delistingDM")]
		public var dm:DelistingDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:DelistingEvent):AsyncToken
		{
			log.info("调用加载摘牌网元列表方法传入参数");
			log.info(e.param);
//			var result:Object;
//			result=new ArrayCollection([{"cityName": " 南京", "moName": "网元一", "moTypeName": "类型一", "happenTime": "2012-09-09", "delistTime": "2012-10-11"}, {"cityName": " 南京", "moName": "网元一", "moTypeName": "类型一", "happenTime": "2012-09-09", "delistTime": "2012-10-11"}, {"cityName": " 南京", "moName": "网元一", "moTypeName": "类型一", "happenTime": "2012-09-09", "delistTime": "2012-10-11"}, {"cityName": " 南京", "moName": "网元一", "moTypeName": "类型一", "happenTime": "2012-09-09", "delistTime": "2012-10-11"}, {"cityName": " 南京", "moName": "网元一", "moTypeName": "类型一", "happenTime": "2012-09-09", "delistTime": "2012-10-11"}]);
//			test(result);
//			return null;
			return dao.loadDelistingMoData(e.param);
		}

		//test
		public function test(data:Object):void
		{
			if (data)
			{
				log.info(data);
			}
			else
			{
				log.info("摘牌网元列表 no data");
			}
			dm.delistingMoList.removeAll();
			dm.delistingMoList.addAll(data as IList);
			dm.delistingMoList.refresh();
		}

		public function result(data:Object):void
		{
			if (data)
			{
				log.info(data);
			}
			else
			{
				log.info("摘牌网元列表 no data");
			}
			dm.delistingMoList.removeAll();
			dm.delistingMoList.addAll(data as IList);
			dm.delistingMoList.refresh();

		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			Alert.show("加载表格数据错误");
		}

	}
}