package com.linkage.module.cms.gsscene.view.components.sceneintro.serv
{
	/**
	 *
	 */

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.SceneIntroDM;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.dao.ISceneIntroDao;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.demo.DemoDatas;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.event.SceneIntroEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;
	import mx.utils.StringUtil;
	
	import org.spicefactory.lib.collection.Map;

	public class SceneIntroLoadAlarmStatsDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneIntroLoadAlarmStatsDataCmd);

		[Inject("sceneIntroDao")]
		public var dao:ISceneIntroDao;

		[Inject("user")]
		public var user:IUser;

		[Inject("sceneIntroDM")]
		public var sceneIntroDM:SceneIntroDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneIntroEvent):AsyncToken
		{
			log.info("场景介绍 ：告警网元的统计（按性能和设备统计） 加载数据！");
			return dao.loadAlarmStatsData();
		}
		
		public function result(data:Object):void
		{
			log.info("场景介绍 ：告警网元的统计（按性能和设备统计） 加载数据成功！");
			sceneIntroDM.sceneIntroAlarmStatsData = data;
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
//			sceneIntroDM.sceneIntroAlarmStatsData = DemoDatas._alarmStatsData;
			log.error("场景介绍 ：告警网元的统计（按性能和设备统计） 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

