package com.linkage.module.cms.quitstatnew.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.dao.IThresHoldDyeDAO;
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-28
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ThresHoldDyeSaveCMD
	{
		private var log:ILogger = Log.getLoggerByClass(ThresHoldDyeSaveCMD);

		[Inject("thresHoldDyeDAO")]
		public var dao:IThresHoldDyeDAO;

		[Inject("quitStatDM")]
		public var dm:QuitStatDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:QuitStatEvent):AsyncToken
		{
			log.info("[指标阈值配置]保存指定指标数据,{0}",e.param.name);
			log.debug(e.param.dataList);
			return dao.saveTresHoldConfig(e.param.name, e.param.dataList);
		}

		public function result(obj:Object):void
		{
			log.info("[指标阈值配置]调用接口保存数据结果:");
			log.debug(obj);
			if (obj && obj.success && obj.success == "1")
			{
				Alert.show("保存成功！", "提示");
				dm.saveFlag=true;
			}
			else
			{
				Alert.show("保存失败。", "错误");
			}
		}

		public function error(f:Fault):void
		{
			log.info("保存[指标阈值配置]数据错误：" + f.faultString);
			Alert.show("[保存失败!]"+f.faultString, "错误");
		}

	}
}