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

	public class SceneIntroLoadTrafficDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneIntroLoadTrafficDataCmd);

		[Inject("sceneIntroDao")]
		public var dao:ISceneIntroDao;

		[Inject("user")]
		public var user:IUser;

		[Inject("sceneIntroDM")]
		public var sceneIntroDM:SceneIntroDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		private var systime:Number = 0;

		public function execute(e:SceneIntroEvent):AsyncToken
		{
			log.info("场景介绍 ：话务量详情 加载数据！");
			return dao.loadTrafficData();
		}

		public function result(data:Object):void
		{
			log.info("场景介绍 ：话务量详情 加载数据成功！");
			sceneIntroDM.sceneIntroTrafficData = data;
			var evt:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENE_TRAFFIC_DATA_SUCC);
			dispatchMsg(evt);
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.info("场景介绍 ：用户数详情  LOAD_SCENE_TRAFFIC_DATA_SUCC事件！");
			
		}

		public function error(f:Fault):void
		{
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
//			sceneIntroDM.sceneIntroTrafficData = DemoDatas._data;
			log.error("场景介绍 ：话务量详情 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

