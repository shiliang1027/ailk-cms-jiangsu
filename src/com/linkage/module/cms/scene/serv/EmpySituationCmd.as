package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.domain.EmgyResourceDM;
	import com.linkage.module.cms.scene.event.EmpyEvent;
	
	import flash.events.Event;
	import flash.system.System;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *应急概况命令处理类
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class EmpySituationCmd
	{
		private var log:ILogger = Log.getLoggerByClass(EmpySituationCmd);

		[Inject("emgyResourceDM")]
		public var emgyResourceDM:EmgyResourceDM;

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;
		[MessageDispatcher]
		public var dispatchMsg:Function;
		private var systime:Number = 0;

		public function execute(e:EmpyEvent):AsyncToken
		{
			log.debug("[应急概况]:应急概况数据execute开始执行...");
			systime = (new Date()).getTime();
			log.info("[应急概况] 开始时间："+new Date().toString());
			return scenePanelDao.getSceneEmgyInfo();
		}

		public function result(data:ArrayCollection):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info("[应急概况] 结束时间："+new Date().toString());
			log.debug("[应急概况]:应急概况数据  加载成功！" + data.length);
			this.emgyResourceDM.emgyResourceTotal = data;
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{

			log.error("耗时：{0}", (new Date).getTime() - systime);
			log.error("[应急概况]:应急概况返回失败 使用测试数据， 异常：" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));

		}
	}
}

