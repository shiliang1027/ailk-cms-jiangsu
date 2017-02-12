package com.linkage.module.cms.quitstatnew.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.dao.IMultKpiDAO;
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-10-25
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MultKpiRenderSaveCMD
	{
		private var log:ILogger = Log.getLoggerByClass(MultKpiRenderSaveCMD);
		
		[Inject("multKpiDAO")]
		public var dao:IMultKpiDAO;
		[Inject("quitStatDM")]
		public var dm:QuitStatDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		private var now:Number=0;
		
		public function MultKpiRenderSaveCMD()
		{
		}
		
		public function execute(e:QuitStatEvent):AsyncToken
		{
			log.debug("[保存多指标渲染配置列表]");
			now = new Date().getMilliseconds();
			var dataList:ArrayCollection = new ArrayCollection();
			for each(var render:Object in dm.renders){
				dataList.addItem({"isRender":"1","columnEn":render.name});
			}
			for each(var unRender:Object in dm.unRenders){
				dataList.addItem({"isRender":"0","columnEn":unRender.name});
			}
			return dao.saveThresHoldRenderConfig(dataList);
			
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			if (obj && obj.success && obj.success == "1")
			{
				Alert.show("保存成功！", "提示");
				dm.saveFlag=true;
				dispatchMsg(new QuitStatEvent(QuitStatEvent.LOAD_QUOTASH_CONFIGDATA));
			}
			else
			{
				Alert.show("保存失败。", "错误");
			}
		}
		
		public function error(f:Fault):void
		{
			log.error("[保存多指标渲染配置列表]失败：" + f.faultString);
		}
	}
}