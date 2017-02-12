package com.linkage.module.cms.gsscene.view.components.roam.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
	import com.linkage.module.cms.gsscene.view.components.roam.RoamDM;
	import com.linkage.module.cms.gsscene.view.components.roam.event.RoamEvent;
	
	import flash.events.Event;
	
	import flashx.textLayout.debug.assert;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RoamCmd
	{
		private var log:ILogger = Log.getLoggerByClass(RoamCmd);

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[Inject("roamDM")]
		public var roamDM:RoamDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:RoamEvent):AsyncToken
		{
			log.debug("[漫游数据：]cmd命令捕获execute开始执行...");
			return scenePanelDao.getSceneRoamInfo();

		}

		public function result(data:Object):void
		{
			log.debug("[漫游数据：]cmd命令成功返回结果集");
//			log.debug(ObjectUtil.copy(data['国际漫游']));
//			log.debug(ObjectUtil.copy(data['国内漫游']));
//			log.debug(ObjectUtil.copy(data['省内漫游']));
			roamDM.roamArray.addItem(ObjectUtil.copy(data['国际漫游']) as ArrayCollection);
			roamDM.roamArray.addItem(ObjectUtil.copy(data['国内漫游']) as ArrayCollection);
			roamDM.roamArray.addItem(ObjectUtil.copy(data['省内漫游']) as ArrayCollection);

			log.debug("[漫游数据：]cmd命令成功返回结果集执行完毕 SHOW_ROAM_DATA：" + roamDM.roamArray.length);
			msgDispatcher(new RoamEvent(RoamEvent.SHOW_ROAM_DATA));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[漫游数据：]cmd命令返回失败error..." + f.faultString + "\n" + f.faultDetail);
			var temp:ArrayCollection = new ArrayCollection([{"国际漫游": [{"roamName": "华盛顿", "roamNum": "10"}, {"roamName": "日本", "roamNum": "20"}, {"roamName": "‘伦敦", "roamNum": "30"}, {"roamName": "曼谷", "roamNum": "40"}, {"roamName": "巴黎", "roamNum": "50"}], "国内漫游": [{"roamName": "江苏", "roamNum": "40"}, {"roamName": "湖北", "roamNum": "100"}, {"roamName": "‘安徽", "roamNum": "100"}, {"roamName": "浙江", "roamNum": "100"}, {"roamName": "广东", "roamNum": "100"}], "省内漫游": [{"roamName": "徐州", "roamNum": "20"}, {"roamName": "镇江", "roamNum": "100"}, {"roamName": "‘台州", "roamNum": "100"}, {"roamName": "徐州", "roamNum": "100"}, {"roamName": "苏州", "roamNum": "100"}]}]);
			roamDM.roamResultData = temp;
			var tempArr:ArrayCollection = new ArrayCollection();
			tempArr.addItem(temp[0]['国际漫游']);
			tempArr.addItem(temp[0]['国内漫游']);
			tempArr.addItem(temp[0]['省内漫游']);
			roamDM.roamArray = tempArr;
			msgDispatcher(new RoamEvent(RoamEvent.SHOW_ROAM_DATA));
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

	}
}

