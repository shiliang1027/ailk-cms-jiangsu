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
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ResMatrixCMD
	{

		private var log:ILogger = Log.getLoggerByClass(ResMatrixCMD);

		[Inject("resMatrixDAO")]
		public var dao:IResMatrixDAO;

		[Inject("resMatrixDM")]
		public var dm:ResMatrixDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		private var systime:Number = 0;


		public function execute(e:ResMatrixEvent):AsyncToken
		{
			systime = (new Date()).getTime();
			return dao.getResMatrixList();
		}

		public function result(obj:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info("调用接口[设备资源]获取数据结果 success!");
			log.info(obj);
			dm.resData.removeAll();
			dm.resData.addAll(obj as IList);
			dm.resData.refresh();
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("加载[设备资源]数据错误：" + f.faultString + "\n" + f.faultDetail);

		}

	}
}

