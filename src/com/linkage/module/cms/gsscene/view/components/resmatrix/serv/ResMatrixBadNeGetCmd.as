package com.linkage.module.cms.gsscene.view.components.resmatrix.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.resmatrix.ResMatrixDM;
	import com.linkage.module.cms.gsscene.view.components.resmatrix.dao.IResMatrixDAO;
	import com.linkage.module.cms.gsscene.view.components.resmatrix.event.ResMatrixEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-12
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ResMatrixBadNeGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(ResMatrixBadNeGetCmd);

		[Inject("resMatrixDAO")]
		public var dao:IResMatrixDAO;

		[Inject("resMatrixDM")]
		public var dm:ResMatrixDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		private var systime:Number = 0;

		public function execute(e:ResMatrixEvent):AsyncToken
		{
			systime = (new Date()).getTime();
			return dao.getBadNeList();
		}

		public function result(obj:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info("调用接口获取[重点关注网元]数据结果 success!");
			dm.badData.removeAll();
			dm.badData.addAll(obj as IList);
			dm.badData.refresh();

			dispatchMsg(new ResMatrixEvent(ResMatrixEvent.CREATE_BADMATRIX_GRID));
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.error("加载[滚动缩略图]数据错误：" + f.faultString + "\n" + f.faultDetail);

		}
	}
}

