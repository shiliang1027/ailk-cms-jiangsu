package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.domain.MoreDegraTopNDM;
	import com.linkage.module.cms.scene.event.MoreDegraTopNEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-4
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MoreDegraTopNConfigSaveCmd
	{
		private var log:ILogger = Log.getLoggerByClass(MoreDegraTopNConfigSaveCmd);

		[Inject("moreDegraTopNDM")]
		[Bindable]
		public var dm:MoreDegraTopNDM;

		[Inject("scenePanelDao")]
		public var dao:IScenePanelDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function MoreDegraTopNConfigSaveCmd()
		{
		}

		public function execute(event:MoreDegraTopNEvent):AsyncToken
		{
			return dao.topnKpiConfig(event.param);
		}

		public function result(data:Object):void
		{
			log.info("[多指标topn 配置数据]保存结果成功");
			if (data != null && data == "success")
			{
				Alert.show("多指标topN配置数据保存成功", "成功");
				msgDispatcher(new MoreDegraTopNEvent(MoreDegraTopNEvent.CMS_SCENE_MOREDEGRATOPN_SAVETOPNCONFIGCOMPLETE));
			}
			else
			{
				Alert.show("多指标topN配置数据保存失败", "错误");

			}
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[多指标topn 配置数据]:保存数据失败faultString:{0};\r\n faultDetail:{1}", f.faultString, f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}