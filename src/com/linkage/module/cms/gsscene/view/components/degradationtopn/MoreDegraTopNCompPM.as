package com.linkage.module.cms.gsscene.view.components.degradationtopn
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.degradationtopn.event.MoreDegraTopNEvent;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-2
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MoreDegraTopNCompPM
	{

		private var log:ILogger = Log.getLoggerByClass(MoreDegraTopNCompPM);

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("moreDegraTopNDM")]
		[Bindable]
		public var dm:MoreDegraTopNDM;

		[Inject("user")]
		public var user:IUser;

		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		/**
		 * 获取多个topn 的指标信息，一屏展示
		 * */
		public function getTopNCharts():void
		{

			log.info("组装参数，请求后台获取数据");
			var event:MoreDegraTopNEvent = new MoreDegraTopNEvent(MoreDegraTopNEvent.CMS_SCENE_MOREDEGRATOPN_CHARTSGETHANDLER);
			event.param = new Object();
			event.param.sceneId = user.sceneId;
			event.param.cityId = user.cityId;
			event.param.userName = user.account;
			event.param.level = user.level;
			event.param.initSceneId = user.initSceneId;
//			msgDispatcher(event);
			requestServerUtil.addRequest(event);

		}

		/**
		 * 保存多指标图表配置数据信息
		 * */
		public function saveMoreDegraTopNConfig(param:Object):void
		{
			log.info("组装数据，请求后台保存配置信息");
			var event:MoreDegraTopNEvent = new MoreDegraTopNEvent(MoreDegraTopNEvent.CMS_SCENE_MOREDEGRATOPN_SAVETOPNCONFIG);
			event.param = param;
			if (event.param == null)
				event.param = new Object();
			event.param.sceneId = user.sceneId;
			event.param.cityId = user.cityId;
			event.param.userName = user.account;
			event.param.level = user.level;
			event.param.initSceneId = user.initSceneId;

			log.info(event.param);
//			msgDispatcher(event);
			requestServerUtil.addRequest(event);

		}

		public function getTopNConfigData():void
		{
			log.info("组装数据，请求后台获取配置信息");
			var event:MoreDegraTopNEvent = new MoreDegraTopNEvent(MoreDegraTopNEvent.CMS_SCENE_MOREDEGRATOPN_GETTOPNCONFIG);
			event.param = new Object();
			event.param.sceneId = user.sceneId;
			event.param.cityId = user.cityId;
			event.param.userName = user.account;
			event.param.level = user.level;
			event.param.initSceneId = user.initSceneId;

			log.info(event.param);
//			msgDispatcher(event);
			requestServerUtil.addRequest(event);
		}

		public function MoreDegraTopNCompPM()
		{
		}
	}
}