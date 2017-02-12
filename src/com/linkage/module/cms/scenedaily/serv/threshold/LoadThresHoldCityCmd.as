package com.linkage.module.cms.scenedaily.serv.threshold
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.threshold.ThresHoldDao;
	import com.linkage.module.cms.scenedaily.domain.threshold.ThresHoldDM;
	import com.linkage.module.cms.scenedaily.event.threshold.ThresHoldEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-9
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadThresHoldCityCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadThresHoldCityCmd);

		[Inject("thresHoldDM")]
		public var dm:ThresHoldDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("thresHoldDao")]
		public var dao:ThresHoldDao;

		public function execute(e:ThresHoldEvent):AsyncToken
		{
			log.info("加载地市参数");
			log.info(e.param);
			return dao.selectCitys();
		}

		//test
		public function test(data:Object):void
		{
			log.info("加载地市返回值");
			log.info(data);
			dm.cityList.removeAll();
			dm.cityList.addAll(data as IList);
			dm.cityList.refresh();
		}

		public function result(data:Object):void
		{
			log.info("加载地市返回值");
			log.info(data);
			dm.cityList.removeAll();
			dm.cityList.addAll(data as IList);
			dm.cityList.refresh();

		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			var isTest:Boolean = false;
			if (isTest)
			{
				var result:Object;
				result = new ArrayCollection([{"cityId": "0100", "cityName": "南京"}, {"cityId": "0200", "cityName": "苏州"}, {"cityId": "0300", "cityName": "无锡"}, {"cityId": "0400", "cityName": "常州"}, {"cityId": "0500", "cityName": "南通"}]);
				test(result);
			}
		}
	}
}