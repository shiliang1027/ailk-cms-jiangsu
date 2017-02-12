package com.linkage.module.cms.scene.serv.areaquickconfig
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.AreaQuickConfigDao;
	import com.linkage.module.cms.scene.domain.AreaQuickConfigDM;
	import com.linkage.module.cms.scene.event.AreaQuickConifgEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-12-24
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class QueryCityNames
	{
		private var log:ILogger=Log.getLoggerByClass(QueryCityNames);

		[Inject("areaQuickConfigDM")]
		public var dm:AreaQuickConfigDM;

		[Inject("areaQuickConfigDao")]
		public var dao:AreaQuickConfigDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:AreaQuickConifgEvent):AsyncToken
		{
			return dao.getCityList();
		}

		//test
		public function test(data:Object):void
		{
			log.info("加载地市名称返回");
			log.info(data);
			dm.cityListArr.removeAll();
			dm.cityListArr.addAll(data as IList);
			dm.cityListArr.refresh();
			msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_CITY_NAMES_COMP));

		}

		public function result(data:Object):void
		{
			log.info("加载地市名称返回");
			log.info(data);
			dm.cityListArr.removeAll();
			dm.cityListArr.addAll(data as IList);
			dm.cityListArr.refresh();
			msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_CITY_NAMES_COMP));

//			var evt:AreaQuickConifgEvent=new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_BASE_TREE);
//			evt.param=new Object();
//			evt.param.cp="1";
//			evt.param.moName="";
//			evt.param.cityId=dm.cityListArr[0].cityId;
//			msgDispatcher(evt);
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
		}
	}
}