package com.linkage.module.cms.scenedaily.serv.functionchain
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.functionchain.FunctionChainDao;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.domain.functionchain.FunctionChainDM;
	import com.linkage.module.cms.scenedaily.event.functionchain.FunctionChainEvent;

	import flashx.textLayout.formats.Float;

	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	public class FunctionChainLoadDateCmd
	{
		private var log:ILogger = Log.getLoggerByClass(FunctionChainLoadDateCmd);

		[Inject("functionChainDao")]
		public var functionChainDao:FunctionChainDao;

		[Inject("user")]
		public var user:IUser;

		[Inject("functionChainDM")]
		public var functionChainDM:FunctionChainDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:FunctionChainEvent):AsyncToken
		{
			log.info("功能链接  cmd execute！");
			return functionChainDao.loadData(e.param);
		}

		public function result(data:Object):void
		{
			log.info("功能链接 cmd 加载数据成功！" + data['hangOutNum'] + "  " + data['pickPercent']);

			functionChainDM.hangOutShingleCount = "挂牌总数：" + data['hangOutNum'];
			functionChainDM.pickShingleRate = "摘牌率：" + data['pickPercent'];

			// modified by hurw,  at 20121009, reason: style modified 
//			functionChainDM.hangOutShingleCount = data['hangOutNum'];
//			functionChainDM.pickShingleRate = data['pickPercent'];
		}

		public function error(f:Fault):void
		{
			functionChainDM.hangOutShingleCount = '0';
			functionChainDM.pickShingleRate = '0';

			log.error("链接功能cmd 加载数据错误：" + f.faultString + "\n" + f.faultString);
		}
	}
}

