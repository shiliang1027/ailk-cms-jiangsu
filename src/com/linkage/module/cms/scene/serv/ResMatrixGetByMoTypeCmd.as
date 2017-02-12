package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IResMatrixDAO;
	import com.linkage.module.cms.scene.domain.ResMatrixDM;
	import com.linkage.module.cms.scene.event.ResMatrixEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-4-2
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ResMatrixGetByMoTypeCmd
	{
		private var log:ILogger = Log.getLoggerByClass(ResMatrixGetByMoTypeCmd);

		[Inject("resMatrixDAO")]
		public var dao:IResMatrixDAO;

		[Inject("resMatrixDM")]
		public var dm:ResMatrixDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:ResMatrixEvent):AsyncToken
		{
			return dao.getAlarmInfoByMoType(e.data);
		}

		public function result(obj:Object):void
		{
			log.info("调用接口获取[资源矩阵指定类型告警详情]数据结果 success!");
			log.info(obj);
			var e:ResMatrixEvent = new ResMatrixEvent(ResMatrixEvent.CMS_SCENE_EMGYRESOURCE_SHOWDETAILBYMOTYPENAME);
			e.data = new Object();
			e.data = obj;
			dispatchMsg(e);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[资源矩阵指定类型详情]数据错误：" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));

		}
	}
}