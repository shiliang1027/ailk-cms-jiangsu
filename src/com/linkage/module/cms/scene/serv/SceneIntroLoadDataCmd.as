package com.linkage.module.cms.scene.serv
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.ISceneIntroDao;
	import com.linkage.module.cms.scene.domain.SceneIntroDM;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.compenent.SceneIntroEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;
	import mx.utils.StringUtil;
	
	import org.spicefactory.lib.collection.Map;

	public class SceneIntroLoadDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneIntroLoadDataCmd);

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
			log.info("场景介绍 cmd 加载数据！");
			systime = (new Date()).getTime();
			return dao.loadData();
		}

		public function result(data:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info("场景介绍 cmd 加载数据成功！");

			if (data && data.hasOwnProperty("sceneImgUrl"))
				sceneIntroDM.sceneImgUrl = user.context + data['sceneImgUrl'];

			//场景介绍标题
			log.info("--" + String(data.hasOwnProperty('sceneInfo')).length);
			if (data && data.hasOwnProperty('sceneInfo'))
			{
				log.info(data.sceneInfo);
				sceneIntroDM.sceneInfo = StringUtil.trim(data.sceneInfo);
			}

			sceneIntroDM.activities.removeAll();

			if (data && data.hasOwnProperty("activities"))
				sceneIntroDM.activities.addAll(data['activities'] as IList);

			sceneIntroDM.activities.refresh();

			sceneIntroDM.kpiData = ObjectUtil.copy(data['kpis']);

			dispatchMsg(new SceneIntroEvent(SceneIntroEvent.SHOW_SCENE_GAME_ACTIVE));
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("场景介绍 cmd 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}
	}
}

