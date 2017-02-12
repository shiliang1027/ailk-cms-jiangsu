package com.linkage.module.cms.gsscene.view.components.degradationtopn.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.degradationtopn.MoreDegraTopNDM;
	import com.linkage.module.cms.gsscene.view.components.degradationtopn.event.MoreDegraTopNEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
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
	public class MoreDegraTopNConfigGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(MoreDegraTopNChartsGetCmd);

		[Inject("moreDegraTopNDM")]
		[Bindable]
		public var dm:MoreDegraTopNDM;

		[Inject("scenePanelDao")]
		public var dao:IScenePanelDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function MoreDegraTopNConfigGetCmd()
		{
		}

		public function execute(event:MoreDegraTopNEvent):AsyncToken
		{
			return dao.queryTopnKpiConfig(event.param);
		}

		public function result(data:Object):void
		{
			log.info("[多指标topn 配置数据]获取返回结果成功");
			if (data != null)
			{
				dm.colNum = data["col"];
				dm.renders.removeAll();
				dm.renders.addAll(data["selectedList"] as IList);
				dm.renders.refresh();

				dm.unrenders.removeAll();
				dm.unrenders.addAll(data["noSelectedList"] as IList);
				dm.unrenders.refresh();

			}
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[多指标topn 配置数据]:获取数据返回失败faultString:{0};\r\n faultDetail:{1}", f.faultString, f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}