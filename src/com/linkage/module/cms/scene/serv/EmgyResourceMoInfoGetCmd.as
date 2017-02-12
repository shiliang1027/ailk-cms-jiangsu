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
	 * @date 2013-1-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class EmgyResourceMoInfoGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(ResMatrixCMD);

		[Inject("resMatrixDAO")]
		public var dao:IResMatrixDAO;

		[Inject("resMatrixDM")]
		public var dm:ResMatrixDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:ResMatrixEvent):AsyncToken
		{
			log.info("调用接口[设备资源-网元信息]获取数据:");
			log.info(e.data);
			return dao.getMoInfoByMoTypeId(e.data);
		}

		public function result(obj:Object):void
		{
			log.info("调用接口[设备资源-网元信息]获取数据结果 success!");
			dm.moInfoList.removeAll();
			dm.moInfoList.addAll(obj as IList);
			dm.moInfoList.refresh();

			dispatchMsg(new ResMatrixEvent(ResMatrixEvent.CMS_SCENE_EMGYRESOURCE_SHOWMOINFOLIST));
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[设备资源-网元信息]数据错误：" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));

		}
	}
}