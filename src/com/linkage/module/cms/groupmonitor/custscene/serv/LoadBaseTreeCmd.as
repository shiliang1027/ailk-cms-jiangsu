package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustSceneDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;

	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadBaseTreeCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadBaseTreeCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("can shu ");
			log.info(e.param);
			return dao.loadBaseTree(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("基础数返回值");
			log.info(data);
			try
			{
				dm.treeData=new XML(data);
				var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.CUST_PANEL_INIT_DATA);
				dispatchMsg(evt);
			}
			catch (e:Error)
			{
				log.error(e.message.toString(), "ERROR");
				return;
			}
		}

		public function result(data:Object):void
		{
			log.info("基础数返回值");
			log.info(data);
			try
			{
				dm.treeData=new XML(data);
				var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.CUST_PANEL_INIT_DATA);
				dispatchMsg(evt);
			}
			catch (e:Error)
			{
				log.error(e.message.toString(), "ERROR");
				return;
			}

		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result='<R A="行业"><N A="银行"></N><N A="酒店"></N></R>';
				test(result);
			}
		}
	}
}