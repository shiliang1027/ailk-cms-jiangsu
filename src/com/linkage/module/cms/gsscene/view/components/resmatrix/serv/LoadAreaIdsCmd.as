package com.linkage.module.cms.gsscene.view.components.resmatrix.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.emgyresource.event.EmpyEvent;
	import com.linkage.module.cms.gsscene.view.components.resmatrix.ResMatrixDM;
	import com.linkage.module.cms.gsscene.view.components.resmatrix.dao.IResMatrixDAO;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2013-1-9
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadAreaIdsCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadAreaIdsCmd);

		[Inject("resMatrixDAO")]
		public var dao:IResMatrixDAO;

		[Inject("resMatrixDM")]
		public var dm:ResMatrixDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:EmpyEvent):AsyncToken
		{
			log.info("调用接口[加载区域名称]获取数据:");
			return dao.getAreaList();
		}

		public function result(obj:Object):void
		{
			log.info("调用接口[加载区域名称]获取数据结果 success!");
			dm.areaList.removeAll();
			dm.areaList.addAll(obj as IList);
			dm.areaList.refresh();
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.error("加载[设备资源-网元信息]数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}