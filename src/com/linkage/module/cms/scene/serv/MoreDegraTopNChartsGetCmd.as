package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.domain.MoreDegraTopNDM;
	import com.linkage.module.cms.scene.event.MoreDegraTopNEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

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
	public class MoreDegraTopNChartsGetCmd
	{

		private var log:ILogger = Log.getLoggerByClass(MoreDegraTopNChartsGetCmd);

		[Inject("moreDegraTopNDM")]
		[Bindable]
		public var dm:MoreDegraTopNDM;

		[Inject("scenePanelDao")]
		public var dao:IScenePanelDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function MoreDegraTopNChartsGetCmd()
		{
		}

		public function execute(event:MoreDegraTopNEvent):AsyncToken
		{
			return dao.getSceneConfigTopN(event.param);
		}

		public function result(data:Object):void
		{
			log.info("[多指标topn chart展示]获取返回结果成功");
			if (data != null)
			{
				dm.colNum = data["col"];
				dm.topnCharts.removeAll();
				dm.topnCharts.addAll(data["datas"] as IList);
				dm.topnCharts.refresh();
				log.info(dm.colNum);
				log.info(dm.topnCharts);
			}
			log.info("抛出事件，展示topn chart图表");
			msgDispatcher(new MoreDegraTopNEvent(MoreDegraTopNEvent.CMS_SCENE_MOREDEGRATOPN_CHARTSSHOWHANDLER));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[多指标topn chart展示]:获取数据返回失败faultString:{0};\r\n faultDetail:{1}", f.faultString, f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));

		}
	}
}