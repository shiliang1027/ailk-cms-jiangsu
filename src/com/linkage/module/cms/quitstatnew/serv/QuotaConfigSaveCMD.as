package com.linkage.module.cms.quitstatnew.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.dao.IQuotaConfigDAO;
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;
	
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class QuotaConfigSaveCMD
	{
		private var log:ILogger = Log.getLoggerByClass(QuotaConfigSaveCMD);

		[Inject("quotaConfigDAO")]
		public var dao:IQuotaConfigDAO;

		[Inject("quitStatDM")]
		public var dm:QuitStatDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:QuitStatEvent):AsyncToken
		{
			var i:int=1;
			for each(var data:Object in dm.selList){
				data.show_order=i;
				i++;
			}
			log.debug(dm.selList);
			return dao.saveShConfig(dm.selList);
		}

		public function result(obj:Object):void
		{
			log.info("[指标显隐配置]调用接口保存数据结果 success!");
			log.debug(obj);
			if (obj && obj.success && obj.success == "1")
			{
				Alert.show("保存成功！", "提示");
				dm.saveFlag=true;
				dispatchMsg(new QuitStatEvent(QuitStatEvent.LOAD_MULTKPI_CONFIGDATA));
			}
			else
			{
				Alert.show("保存失败！", "错误");
			}
		}

		public function error(f:Fault):void
		{
			log.info("保存[指标显隐配置]数据错误：" + f.faultString);
		}
	}
}