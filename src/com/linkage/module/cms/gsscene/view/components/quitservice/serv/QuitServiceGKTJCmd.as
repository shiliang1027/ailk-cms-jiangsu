package com.linkage.module.cms.gsscene.view.components.quitservice.serv
{
	/**
	 *
	 *
	 * @author zhangcc (69207)
	 * @version 1.0
	 * @date 2013-6-04
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.quitservice.QuitServiceDM;
	import com.linkage.module.cms.gsscene.view.components.quitservice.dao.IQuitServiceDao;
	import com.linkage.module.cms.gsscene.view.components.quitservice.event.QuitServiceEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class QuitServiceGKTJCmd
	{
		private var log:ILogger = Log.getLoggerByClass(QuitServiceGKTJCmd);

		[Inject("quitServiceDao")]
		public var dao:IQuitServiceDao;

		[Inject("quitServiceDM")]
		public var dm:QuitServiceDM;

		[Inject("user")]
		public var user:IUser;

		[MessageDispatcher]
		public var msgDispatcher:Function;


		public function execute(e:QuitServiceEvent):AsyncToken
		{
			log.debug("加载概括统计数据！");
			return dao.querySceneDevSheet();
		}

		public function result(data:Object):void
		{
			log.debug("加载概括统计数据成功！" + data.length);
			log.info(data);
			dm.gktjList.removeAll();
			dm.gktjList.addAll(data as IList);
			dm.gktjList.refresh();
			log.debug("退服统计 地市查询！");
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("加载[概括统计]表格数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

