package com.linkage.module.cms.scene.serv.areaquickconfig
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.AreaQuickConfigDao;
	import com.linkage.module.cms.scene.domain.AreaQuickConfigDM;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.AreaQuickConifgEvent;

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
	public class LoadPicUrlCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadPicUrlCmd);

		[Inject("areaQuickConfigDM")]
		public var dm:AreaQuickConfigDM;

		[Inject("areaQuickConfigDao")]
		public var dao:AreaQuickConfigDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("user")]
		public var user:IUser;

		public function execute(e:AreaQuickConifgEvent):AsyncToken
		{
			log.info("[加载图片url]areaName:" + e.areaName);
			return dao.getThumbnail(e.areaName);
		}

		//test
		public function test(data:Object):void
		{
			log.info("加载图片url返回");
			log.info(data.url);
			dm.picUrl=user.context + data.url;
			dm.path=user.context + data.path;
		}

		public function result(data:Object):void
		{
			log.info("加载图片url返回");
			log.info(data);
			dm.picUrl=user.context + data.url;
			dm.path=user.context + data.path;
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result={"url": "asdfsdf", "path": "cms/cms/cms"};
				test(result);
			}
		}
	}
}