package com.linkage.module.cms.gsscene.view.components.emgyresource.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.gis.core.ILayer;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.emgyresource.EmgyResourceDM;
	import com.linkage.module.cms.gsscene.view.components.emgyresource.event.EmpyEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-1
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class EmpyDetailCmd
	{
		private var log:ILogger = Log.getLoggerByClass(EmpyDetailCmd);

		[Inject("emgyResourceDM")]
		public var emgyResourceDM:EmgyResourceDM;

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;
		
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:EmpyEvent):AsyncToken
		{
			log.debug("[应急概况]:应急详情数据execute开始执行...");
			return scenePanelDao.getSceneEmgyDetail(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("[应急概况]:应急详情数据加载成功!");
			log.debug(data);
			this.emgyResourceDM.emgyResourceDetail.removeAll();
			this.emgyResourceDM.emgyResourceDetail.addAll(data as IList);
			this.emgyResourceDM.emgyResourceDetail.refresh();
			log.debug(emgyResourceDM.emgyResourceDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[应急概况]:应急详情返回失败，使用测试数据 error..." + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

