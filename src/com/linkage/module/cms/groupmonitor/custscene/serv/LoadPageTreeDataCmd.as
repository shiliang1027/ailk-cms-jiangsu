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
	 * @date 2012-10-12
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadPageTreeDataCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadPageTreeDataCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		//private var cp:String="0";

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("分页参数");
			log.info(e.param);
			//cp=e.param.cp;
			return dao.loadPageTree(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("分页树返回值");
			log.info(data);
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_PAGE_TREE_DATA_COMP);
			evt.param.child=data;
			dispatchMsg(evt);
		}

		public function result(data:Object):void
		{
			log.info("分页树返回值");
			log.info(data);
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_PAGE_TREE_DATA_COMP);
			evt.param.child=data;
			dispatchMsg(evt);
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				result='<N A="银行" cp="1" tp="4"><N A="大客户一" cust_id="1"/><N A="大客户二" cust_id="2"/></N>';
				test(result);
			}
		}
	}
}