package com.linkage.module.cms.scene.serv
{

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.ISceneTreeDAO;
	import com.linkage.module.cms.scene.domain.SceneTreeDM;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.SceneTreeEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.collections.XMLListCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneTreeCMD
	{
		private var log:ILogger = Log.getLoggerByClass(SceneTreeCMD);

		[Inject("sceneTreeDAO")]
		public var dao:ISceneTreeDAO;

		[Inject("sceneTreeDM")]
		public var dm:SceneTreeDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SceneTreeEvent):AsyncToken
		{
			log.info("SceneTreeCMD execute");
			return dao.getSceneAreaList();
		}

		public function result(data:Object):void
		{
			log.info("SceneTreeCMD result" + (ObjectUtil.copy(data.xml)));
			dm.treeData = new XML(ObjectUtil.copy(data.xml));
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[区域导航树]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}
	}
}

