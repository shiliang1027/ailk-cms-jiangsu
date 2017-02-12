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
	 * @date 2012-12-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadTudeCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadTudeCmd);

		[Inject("areaQuickConfigDM")]
		public var dm:AreaQuickConfigDM;

		[Inject("areaQuickConfigDao")]
		public var dao:AreaQuickConfigDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:AreaQuickConifgEvent):AsyncToken
		{
			log.info("加载经纬度");
			log.info(e.param);
			return dao.getAreaTrack(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("加载经纬度返回");
			log.info(data);
			dm.chooseList.removeAll();
			dm.chooseList.addAll(data.dataList as IList);
			dm.chooseList.refresh();
			dm.countRow=Number(data.rowCount);
			msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.QUERY_TUDE_BY_MOID_COMP));
		}

		public function result(data:Object):void
		{
			log.info("加载经纬度返回");
			log.info(data.dataList as IList);
			dm.chooseList.removeAll();
			dm.chooseList.addAll(data.dataList as IList);
			dm.chooseList.refresh();
			dm.countRow=Number(data.rowCount);
			msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.QUERY_TUDE_BY_MOID_COMP));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result=new ArrayCollection([{"name": "aaa", "pointlongitude": "118.275499", "pointlatitude": "33.962"}, {"name": "bbb", "pointlongitude": "118.275499", "pointlatitude": "33.962"}, {"name": "cvv", "pointlongitude": "118.275499", "pointlatitude": "33.962"}, {"name": "cccd", "pointlongitude": "118.275499", "pointlatitude": "33.962"}]);
				test(result);
			}
		}
	}
}