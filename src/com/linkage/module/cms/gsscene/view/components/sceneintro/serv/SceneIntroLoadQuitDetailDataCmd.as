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

	public class SceneIntroLoadQuitDetailDataCmd
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

		public function execute(e:SceneIntroEvent):AsyncToken
		{
			log.info("场景介绍 ：退服基站统计详情 加载数据！");
			return dao.loadQuitDetailData(e.params);
		}
		
		public function result(data:Object):void
		{
			log.info("场景介绍 ：退服基站统计详情 加载数据成功！");
			sceneIntroDM.sceneIntroQuitDetailData = data;
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			sceneIntroDM.sceneIntroQuitDetailData['datas'] = [];
			dispatchMsg(new Event("REQUEST_COMPLETE"));
//			sceneIntroDM.sceneIntroQuitDetailData = DemoDatas._quitData;
			log.error("场景介绍 ：退服基站统计详情 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

