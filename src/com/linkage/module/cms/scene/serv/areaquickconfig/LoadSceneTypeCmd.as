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
	 * @date 2012-12-19
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadSceneTypeCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadSceneTypeCmd);

		[Inject("areaQuickConfigDM")]
		public var dm:AreaQuickConfigDM;

		[Inject("areaQuickConfigDao")]
		public var dao:AreaQuickConfigDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;


		public function execute(e:AreaQuickConifgEvent):AsyncToken
		{
			log.info("加载场景类型");
			return dao.getSceneTypeList();
		}

		//test
		public function test(data:Object):void
		{
			log.info("加载场景类型返回");
			log.info(data);
			dm.sceneTypeList.removeAll();
			dm.sceneTypeList.addAll(data as IList);
			dm.sceneTypeList.refresh();
			msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_SCENES_TYPE_COMP));
		}

		public function result(data:Object):void
		{
			log.info("加载场景类型返回");
			log.info(data);
			dm.sceneTypeList.removeAll();
			dm.sceneTypeList.addAll(data as IList);
			dm.sceneTypeList.refresh();
			msgDispatcher(new AreaQuickConifgEvent(AreaQuickConifgEvent.LOAD_SCENES_TYPE_COMP));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result=new ArrayCollection([{"sceneTypeid": "1", "sceneTypeName": "日常1"}, {"sceneTypeid": "2", "sceneTypeName": "日常2"}, {"sceneTypeid": "3", "sceneTypeName": "日常3"}, {"sceneTypeid": "4", "sceneTypeName": "日常4"}, {"sceneTypeid": "5", "sceneTypeName": "日常5"}]);
				test(result);
			}
		}
	}
}