package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.gis.core.GisFeature;
	import com.ailk.common.ui.gis.core.metry.GisPoint;
	import com.ailk.common.ui.gis.core.metry.GisRectangle;
	import com.ailk.common.ui.gis.core.styles.GisFillPredefinedStyle;
	import com.ailk.common.ui.gis.core.styles.GisLinePredefinedStyle;
	import com.ailk.common.ui.gis.core.styles.GisLineStyle;
	import com.ailk.common.ui.gis.core.styles.GisMarkerPictureStyle;
	import com.linkage.module.cms.scene.domain.SportHistorySceneDM;
	import com.linkage.module.cms.scene.event.SportHistorySceneEvent;

	import flash.events.Event;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;

	import mx.collections.ArrayCollection;

	import org.spicefactory.parsley.core.messaging.impl.Selector;
	import org.spicefactory.parsley.messaging.MessageHandler;

	import spark.components.Group;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SportHistorySceneServ
	{

		private var log:ILogger = Log.getLoggerByClass(SportHistorySceneServ);

		[Inject("sportHistorySceneDM")]
		[Bindable]
		public var dm:SportHistorySceneDM;

		// 消息派发器
		[MessageDispatcher]
		public var dispatcherMsg:Function = null;

		[MessageHandler(selector="INIT_MINIMAPWORK_DM")]
		public function initDM(e:SportHistorySceneEvent):void
		{
			log.info("INIT_MINIMAPWORK_DM事件初始化数据");
			//记录缩略图数量
			dm.miniMapNum = 0;

			//记录当前移动的位置
			dm.curLocation = 1;

			//每屏显示的缩略图数量
			dm.showMapNum = 3;

			//缩略图宽度
			dm.miniMapWidth = 140;

			//缩略图之间空间
			dm.miniMapGap = 5;

			//缩略图高度
			dm.miniMapHeight = 100;

			//真实数据
			dm.dataList = new Object();

			//缓存所有的时间节点
			dm.timeArr.removeAll();

			//当前节点
			dm.curIndex = 0;

			//是否可以点击移动缩略图
			dm.isMoveabled = false;

			//调试标志
			dm.isDebug = false;

			//取消置顶的setTimeOut调用 并且清空timeoutIdcache
			for each(var tid:uint in dm.timeoutIdCache)
			{
				clearTimeout(tid);
			}

			dm.timeoutIdCache = new Object();

			dm.gisFeatureArr.removeAll();
			dm.gisPointArr.removeAll();
		}
	}
}