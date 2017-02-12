package com.linkage.module.cms.scene.serv.areaquickconfig
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IMapViewDao;
	import com.linkage.module.cms.scene.event.AreaQuickConifgEvent;

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
	public class LoadTudoByMoIdAndMoCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadTudoByMoIdAndMoCmd);

		[Inject("mapViewDao")]
		public var mapViewDao:IMapViewDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:AreaQuickConifgEvent):AsyncToken
		{
			log.info("获取网元gis定位数据~!");
			log.debug(e.param.dataList);
			return mapViewDao.getMultiMoLatitudeByMoId(e.param.dataList);
		}

		public function result(data:Object):void
		{
			log.info("获取网元gis定位数据~ success!");
			log.info(data);
			var evt:AreaQuickConifgEvent=new AreaQuickConifgEvent(AreaQuickConifgEvent.QUERY_TUDE_BY_MOID_AND_MOTYPEID_COMP);
			evt.param=data;
			msgDispatcher(evt);
		}

		public function error(f:Fault):void
		{
			log.error("获取网元gis定位数据~ error:" + f.faultString + "\n" + f.faultDetail);
		}

	}
}