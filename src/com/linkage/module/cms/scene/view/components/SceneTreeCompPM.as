package com.linkage.module.cms.scene.view.components
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.components.requestserver.RequestServerUtil;
    import com.linkage.module.cms.scene.domain.SceneTreeDM;
    import com.linkage.module.cms.scene.domain.common.IUser;
    import com.linkage.module.cms.scene.event.SceneEvent;
    import com.linkage.module.cms.scene.event.SceneTreeEvent;
    
    import mx.controls.Alert;
    import mx.controls.Tree;
    import mx.events.ListEvent;

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
    public class SceneTreeCompPM
    {
        private var log:ILogger = Log.getLoggerByClass(SceneTreeCompPM);

        [Inject("user")]
        public var user:IUser;

        [Inject("sceneTreeDM")]
        [Bindable]
        public var stdm:SceneTreeDM;

        [MessageDispatcher]
        public var dispatchMsg:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
        //获取导航tree
        public function getSceneAreaList():void
        {
            var evt:SceneTreeEvent = new SceneTreeEvent(SceneTreeEvent.SCENE_AREA_XML);
//            dispatchMsg(evt);
			requestServerUtil.addRequest(evt);
        }

        //点击节点触发事件获取节点信息并且抛出事件
        public function getSceneInfo(event:ListEvent):void
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

            user.lastTimeStamp = nowTime;

            var obj:XML = Tree(event.currentTarget).selectedItem as XML;
			var evt:SceneEvent = new SceneEvent(SceneEvent.CHANGE_MAPVIEW);

            if (obj.attribute("name") == "高速")
            {
                obj = stdm.treeData;
            }
            else if (obj.attribute("name") == "国道" || obj.attribute("name") == "省道" || obj.attribute("name") == "城市道路")
            {
                Alert.show("尚未配置……", "提示");
                return;
            }

			var currentMapType:String="0";
			var cityId:String="00";
			var param:Object;
            //level 1:场景   2：区域    3：地市
            if ("1" == obj.attribute("level"))
            {
                user.sceneId = String(obj.@id);
                user.level = obj.attribute("level");
				cityId = "00";
				currentMapType = user.mapType;
            }
            else if ("2" == obj.attribute("level"))
            {
                user.sceneId = String(obj.@id);
                user.level = obj.attribute("level");
				cityId = obj.attribute("cityId");
				currentMapType = "0";
                param = new Object();
                param.centerlongitude = String(obj.@centerlongitude);
                param.centerlatitude = String(obj.@centerlatitude);
            }
            else if ("3" == obj.attribute("level"))
            {
                if (obj.parent() && false)
                {
                    log.info("tree 如果进入地市，那么父节点为{0}", obj.parent());
                    user.sceneId = (obj.parent() as XML).attribute("id");
                }
                else
                {
                    log.info("直接parent找不到父节点");
                    user.sceneId = stdm.treeData.attribute("id");
                }
                user.level = obj.attribute("level");
				cityId = obj.attribute("id");
				currentMapType = "0";
                param = new Object();
                param.centerlongitude = String(obj.@centerlongitude);
                param.centerlatitude = String(obj.@centerlatitude);
            }
            else
            {
                log.error("level 设置错误，当前选择节点:[{0}]。", obj);
            }
			log.info("点击tree节点,currentMapType:{0},cityId:{1},user.cityId:{2}",currentMapType,cityId,user.cityId);
			user.refreshPolygon = false;
			if(user.currentMapType && currentMapType == user.currentMapType){
				log.info("层次相同！CHANGE_MAPVIEW");
//				if(user.cityId && cityId!=user.cityId){
					user.cityId=cityId;
					evt = new SceneEvent(SceneEvent.CHANGE_MAPVIEW);
					evt.param = param;
					log.info("点击tree节点，抛出事件,{0}",evt.type);
					dispatchMsg(evt);
//				}
			}else{
				log.info("层次不同！CHANGE_VIEW");
				user.cityId=cityId;
				user.currentMapType=currentMapType;
				evt = new SceneEvent(SceneEvent.CHANGE_VIEW);
				evt.param = param;
				log.info("点击tree节点，抛出事件,{0}",evt.type);
				dispatchMsg(evt);
			}
			log.info(user);

            /*if (stdm.treeData == obj)
               {
               user.level = "1";
               }
               else
               {
               user.level = "2";
               evt.param = new Object();
               evt.param.centerlongitude = String(obj.@centerlongitude);
               evt.param.centerlatitude = String(obj.@centerlatitude);
               }

               user.sceneId = String(obj.@id);
               user.layerurl = String(obj.@layerUrl);
               user.layerId = String(obj.@layerId);
               log.info("CHANGE_VIEW 点击tree节点，抛出事件");
               log.info(user);
             */
			
//			dispatchMsg(evt);
        }

    }
}

