package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IResMatrixDAO;
	import com.linkage.module.cms.scene.domain.ResMatrixDM;
	import com.linkage.module.cms.scene.event.ResMatrixEvent;
	
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
		public var dispatchMsg:Function;

		private var systime:Number = 0;


		public function execute(e:ResMatrixEvent):AsyncToken
		{
			systime = (new Date()).getTime();
			log.warn("[设备资源]开始：{0}", new Date().toString());
			return dao.getResMatrixList();
		}

		public function result(obj:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.warn("[设备资源]结束：{0}", new Date().toString());
			log.info("调用接口[设备资源]获取数据结果 success!");
			dm.resData.removeAll();
			dm.resData.addAll(obj as IList);
			dm.resData.refresh();
			
			dispatchMsg(new ResMatrixEvent(ResMatrixEvent.CMS_SCENE_EMGYRESOURCE_LOAD_COMPLETE));
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[设备资源]数据错误：" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));

		}

	}
}

