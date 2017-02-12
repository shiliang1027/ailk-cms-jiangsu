package com.linkage.module.cms.gsscene.view.components.scenethumbnail
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
    import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
    import com.linkage.module.cms.gsscene.view.components.scenethumbnail.SceneThumbnailDM;
    import com.linkage.module.cms.gsscene.view.components.scenethumbnail.event.SceneThumbnailEvent;
    
    import flash.events.MouseEvent;
    
    import mx.controls.Alert;

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
    public class SceneThumbnailCompPM
    {

        private var log:ILogger = Log.getLoggerByClass(SceneThumbnailCompPM);

        [Inject("user")]
        public var user:IUser;

        [Inject("sceneThumbnailDM")]
        [Bindable]
        public var stdm:SceneThumbnailDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

        [MessageDispatcher]
        public var dispatchMsg:Function;

        private var lastClickTime:Number = new Date().getTime();

        //获取缩略滚动信息
        public function getSceneAreaList():void
        {
			log.info("SCENE_AREA_LIST事件！");
            var evt:SceneThumbnailEvent = new SceneThumbnailEvent(SceneThumbnailEvent.SCENE_AREA_LIST);
//            dispatchMsg(evt);
			requestServerUtil.addRequest(evt);
        }

        //点击节点触发事件获取节点信息并且抛出事件
        public function getSceneInfo(e:MouseEvent=null):void
        {
            if (new Date().getTime() - lastClickTime < 5000)
                return;

            lastClickTime = new Date().getTime();


            log.info("CHANGE_VIEW 击节点触发事件获取节点信息并且抛出事件,参数如下：" + e.currentTarget.id);
            var ug:Object = e.currentTarget as Object;
            var param:Object = ug["param"];
            log.info(param);
            user.cityId = ug["name"];

            if (param)
            {
                if (user.sceneId == "1004" && param.hasOwnProperty("flag") && param["flag"] == "1")
                {
                    log.info("点击假数据，直接抛出事件，不改任何数据，直接刷新！！！");

                    if (param["areaId"] == 1)
                    {
                        dispatchMsg(evt);
                    }
                    else
                    {
                        Alert.show("尚未配置……", "提示");
                    }
                    return;
                }
				
//				if(user.level == "2"){
//					evt = new SceneEvent(SceneEvent.CHANGE_MAPVIEW);
//				}
//				user.areaId = param.areaId;
//                user.level = "2";
//                user.currentMapType = "0";
//                user.layerurl = param.layerUrl;
//                user.layerId = param.layerId;
//                evt.param = new Object();
//                evt.param = param;
//                log.info(user);
//                dispatchMsg(evt);
				
				log.info("CHANGE_VIEW 击节点触发事件获取节点信息并且抛出事件,参数如下：");
				var evt:SceneEvent = new SceneEvent("DEAL_SCENE_CHANGE");
				evt.param = new Object();
				evt.param.id = param.areaId;
				evt.param.name = param.areaName;
				evt.param.level = "2";
				evt.param.cityId = '';
				evt.param.layerurl = param.layerUrl;
				evt.param.layerId = param.layerId;
				evt.param.centerlongitude = param.centerlongitude;
				evt.param.centerlatitude = param.centerlatitude;
				dispatchMsg(evt);
            }
        }

        public function deleteImgData(param:Object):void
        {
            var evt:SceneThumbnailEvent = new SceneThumbnailEvent(SceneThumbnailEvent.CMS_SCENE_SCENETHUMBNAIL_DELETEIMGDATA);
            evt.data = new Object();
            evt.data = param;
//            dispatchMsg(evt);
			requestServerUtil.addRequest(evt);
        }

        public function startImgGetData():void
        {
            log.info("获取地市tree数据");
            var evt:SceneThumbnailEvent = new SceneThumbnailEvent(SceneThumbnailEvent.CMS_SCENE_SCENETHUMBNAIL_STARTIMGGETDATA);
            evt.data = new Object();
            evt.data.sceneId = user.initSceneId;
            evt.data.cityId = "00";
            evt.data.name = "";
//            dispatchMsg(evt);
			requestServerUtil.addRequest(evt);
        }

        public function cityTreeGetData():void
        {
            log.info("获取地市tree数据");
            var evt:SceneThumbnailEvent = new SceneThumbnailEvent(SceneThumbnailEvent.CMS_SCENE_SCENETHUMBNAIL_CITYTREEGETDATA);
            evt.data = new Object();
            evt.data.sceneId = user.initSceneId;
            evt.data.level = "1";
            evt.data.flag = "1";
            evt.data.cityId = "00";
//            dispatchMsg(evt);
			requestServerUtil.addRequest(evt);
        }
    }
}

