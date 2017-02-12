package com.linkage.module.cms.scene.view.components
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.linkage.module.cms.scene.domain.SceneThumbnailDM;
    import com.linkage.module.cms.scene.domain.common.IUser;
    import com.linkage.module.cms.scene.event.SceneEvent;
    import com.linkage.module.cms.scene.event.SceneThumbnailEvent;
    import com.linkage.module.cms.scene.event.SceneTreeEvent;
    
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

        [MessageDispatcher]
        public var dispatchMsg:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
        //获取缩略滚动信息
        public function getSceneAreaList():void
        {
            var evt:SceneThumbnailEvent = new SceneThumbnailEvent(SceneThumbnailEvent.SCENE_AREA_LIST);
//            dispatchMsg(evt);
			requestServerUtil.addRequest(evt);
        }

        //点击节点触发事件获取节点信息并且抛出事件
        public function getSceneInfo(e:MouseEvent):void
        {
            var nowTime:Number = new Date().getTime();

//            if (isNaN(user.lastTimeStamp))
//                user.lastTimeStamp = nowTime;
//
//            if (nowTime - user.lastTimeStamp < 8000)
//            {
//                Alert.show("上次切换/刷新正在进行，请稍后 " + (8000 - (nowTime - user.lastTimeStamp)) / 1000 + "s 再操作。");
//                log.warn("距离上次切换/刷新时间小于30秒，暂不让切换。");
//                return;
//            }
//
//            user.lastTimeStamp = nowTime;


            log.info("CHANGE_VIEW 击节点触发事件获取节点信息并且抛出事件,参数如下：e.currentTarget.id:{0},user.currentMapType:{1}",e.currentTarget.id,user.currentMapType);
            var ug:GroupTip = e.currentTarget as GroupTip;
            var evt:SceneEvent = user.currentMapType=="1"?new SceneEvent(SceneEvent.CHANGE_VIEW):new SceneEvent(SceneEvent.CHANGE_MAPVIEW);
            var param:Object = ug.param;
            log.info(param);
            user.cityId = ug.name;

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
                user.sceneId = param.areaId;
                user.level = "2";
                user.currentMapType = "0";

                user.layerurl = param.layerUrl;
                user.layerId = param.layerId;

                evt.param = new Object();
                evt.param = param;
                log.info(user);

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

