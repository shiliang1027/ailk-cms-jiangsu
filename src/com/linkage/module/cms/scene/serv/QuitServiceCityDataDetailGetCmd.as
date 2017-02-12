package com.linkage.module.cms.scene.serv
{

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-10
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IQuitServiceDao;
	import com.linkage.module.cms.scene.domain.QuitServiceDM;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.compenent.QuitServiceEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class QuitServiceCityDataDetailGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(QuitServiceCityDataDetailGetCmd);

		[Inject("quitServiceDao")]
		public var dao:IQuitServiceDao;

		[Inject("quitServiceDM")]
		public var dm:QuitServiceDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;
		public function execute(e:QuitServiceEvent):AsyncToken
		{
			log.debug("获取退服统计中地市查询的详情信息");
			return dao.queryCityDataDetail(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("获取退服统计中地市查询的详情信息");
			log.debug(data);
			dm.qssDetail.removeAll();
			dm.qssDetail.addAll(data as IList);
			dm.qssDetail.refresh();
			log.debug(dm.qssDetail);
			log.debug("退服统计 地市查询 详情信息！");
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[退服统计 地市查询]详情数据错误：" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}