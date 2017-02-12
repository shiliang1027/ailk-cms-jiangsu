package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.ui.gis.core.GisFeature;
    import com.ailk.common.ui.gis.core.GisLayer;
    import com.ailk.common.ui.gis.core.metry.GisLine;
    import com.ailk.common.ui.gis.core.metry.GisPoint;
    import com.ailk.common.ui.gis.core.styles.GisLinePredefinedStyle;
    import com.ailk.common.ui.gis.core.styles.GisLineStyle;
    import com.ailk.common.ui.gis.core.styles.GisMarkerPictureStyle;
    import com.ailk.common.ui.gis.core.styles.GisMarkerPredefinedStyle;
    import com.ailk.common.ui.gis.core.styles.GisMarkerStyle;
    import com.ailk.common.ui.gis.core.styles.GisTextStyle;
    import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
    import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
    import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
    import com.linkage.module.cms.gsscene.view.util.ImageFactory;

    import flash.events.ContextMenuEvent;
    import flash.events.MouseEvent;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;
    import flash.utils.setTimeout;

    import mx.collections.ArrayCollection;
    import mx.controls.Alert;

    public class MapViewServ
    {
        private var log:ILogger = Log.getLoggerByClass(MapViewServ);

        [Inject("mapViewDM")]
        public var mapViewDM:MapViewDM;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        [Inject("user")]
        public var user:IUser;

        private var colorMap:Object = {'1': 0XFF0000, '2': 0XEE9800, '3': 0XFED701, '4': 0X4169E1, '0': 0x00FF00, '5': 0x00FF00};

        private var mx:Number = -100;
        private var my:Number = -100;

        private var offsets:ArrayCollection = new ArrayCollection([{xOffSet: -23, yOffSet: -23},
                                                                   {xOffSet: 21, yOffSet: -25},
                                                                   {xOffSet: 35, yOffSet: 11},
                                                                   {xOffSet: 12, yOffSet: 36},
                                                                   {xOffSet: -23, yOffSet: 24},
                                                                   {xOffSet: -44, yOffSet: -1},
                                                                   {xOffSet: -1, yOffSet: -43},
                                                                   {xOffSet: 43, yOffSet: -48},
                                                                   {xOffSet: 56, yOffSet: -12},
                                                                   {xOffSet: 64, yOffSet: 22},
                                                                   {xOffSet: 43, yOffSet: 49},
                                                                   {xOffSet: 22, yOffSet: 71},
                                                                   {xOffSet: -9, yOffSet: 60},
                                                                   {xOffSet: -43, yOffSet: 47},
                                                                   {xOffSet: -65, yOffSet: 25},
                                                                   {xOffSet: -75, yOffSet: -13},
                                                                   {xOffSet: -53, yOffSet: -38},
                                                                   {xOffSet: -32, yOffSet: -61},
                                                                   {xOffSet: 21, yOffSet: -73},
                                                                   {xOffSet: 78, yOffSet: -37},
                                                                   {xOffSet: 87, yOffSet: 0}]);


        private var jingquLineOffset:Object = {
                "瘦西湖风景区": [new GisPoint(115.8510700120948, 34.33906117724467), new GisPoint(119.416515, 32.416085)],
                "镇江金山风景区": [new GisPoint(116.54738044502686, 33.73503284988191), new GisPoint(119.40514, 32.2124995)],
                "中山陵": [new GisPoint(117.29402657190585, 33.18134021646604), new GisPoint(118.844555, 32.0594085)],
                "夫子庙秦淮风光带": [new GisPoint(117.42825508909756, 32.45147265423603), new GisPoint(118.78116, 32.02152)],
                "常州天目湖山水园景区": [new GisPoint(117.18496590168758, 31.729658680383607), new GisPoint(119.43366, 31.320535)],
                "常州南山竹海景区": [new GisPoint(118.07422982808275, 31.480462506047392), new GisPoint(119.457849, 31.2012855)],
                "姜堰溱湖风景区": [new GisPoint(120.16316112687899, 34.95147878693193), new GisPoint(120.07801, 32.624635)],
                "留园西园山塘街": [new GisPoint(120.77557873656623, 34.29711476562226), new GisPoint(120.44947, 31.61149)],
                "常熟虞山尚湖风景区": [new GisPoint(121.21182141743934, 33.567247203392256), new GisPoint(120.695115, 31.65209)],
                "常熟沙家浜风景区": [new GisPoint(121.53900342809418, 32.88771533510914), new GisPoint(120.777245, 31.560975)],
                "虎丘": [new GisPoint(122.26887099032419, 32.51858691283189), new GisPoint(120.569910555, 31.335)],
                "拙政园狮子林": [new GisPoint(122.66316725957488, 31.80549791525085), new GisPoint(120.62861278, 31.326666665)],
                "苏州环金鸡湖景区": [new GisPoint(121.83262830945107, 31.22663743486153), new GisPoint(120.694884, 31.31436)]
            };

        private var offsetsIndex:Object = {};

        [MessageHandler(selector = "DEAL_SCENE_SNAPSHOTS")]
        public function dealSnapshot(e:SceneEvent):void
        {
            log.info("处理区域缩略图信息 。。。" + mapViewDM.snapshotList.length);

            mapViewDM.gisLayerMap['_img'] = new ArrayCollection();

            for each (var imgInfo:Object in mapViewDM.snapshotList)
            {
                log.debug("往地图上撒点缩略图：" + imgInfo['imgUrl']);
                log.debug(imgInfo);

                var w:Number = 60;
                var h:Number = 60;

                if (imgInfo.hasOwnProperty('left_longitude') && user.level != "2")
                    continue;

                var p:GisPoint = new GisPoint(Number(imgInfo['longitude']), Number(imgInfo['latitude']));

                var pic:GisMarkerPictureStyle;

                if (user.initSceneId != "1003")
                    pic = new GisMarkerPictureStyle(user.context + imgInfo['imgUrl'], w, h);
                else
                    pic = new GisMarkerPictureStyle(user.context + imgInfo['imgUrl'], 60, 40);

                var feature:GisFeature = new GisFeature(p, pic);

                if ((user.showMoLayer != "1" && user.level == "1") || user.level == "3")
                    feature.onClick = changeViewByGisImg;

                feature.buttonMode = true;

                feature.toolTip = imgInfo['areaName'];
                feature.attributes = imgInfo;
                feature.attributes['fType'] = 'img';
                feature.attributes['layerurl'] = (imgInfo['layerurl'] == null ? "" : imgInfo['layerurl']);
                feature.attributes['layerId'] = (imgInfo['layerId'] == null ? "" : imgInfo['layerId']);

                if (user.level == "2" && user.showMoLayer == "0")
                {
                    feature.attributes.left_longitude = imgInfo['left_longitude'];
                    feature.attributes.left_latitude = imgInfo['left_latitude'];
                    feature.attributes.right_longitude = imgInfo['right_longitude'];
                    feature.attributes.right_latitude = imgInfo['right_latitude'];
                }

//				log.debug("添加imgFeature 到 缩略图缓存");

                (mapViewDM.gisLayerMap['_img'] as ArrayCollection).addItem(feature);


                if (user.level != "2")
                {
                    {
                        //生成区域缩略图 性能等级图标（泡泡点）
                        if (user.initSceneId == "1003")
                        {
                            pic = new GisMarkerPictureStyle(getImgSmall(imgInfo['warn_level']));
                        }
                        else
                        {
                            pic = new GisMarkerPictureStyle(getImg(imgInfo['warn_level']));
                        }

                    }

                    var f:GisFeature = new GisFeature(p, pic);
                    (mapViewDM.gisLayerMap['_img'] as ArrayCollection).addItem(f);
                }
            }

            msgDispatcher(new SceneEvent(SceneEvent.SHOW_SCENE_SNAPSHOTS));
        }

        [MessageHandler(selector = "DEAL_SCENE_SNAPSHOTS_ALL")]
        public function dealSnapshotAll(e:SceneEvent):void
        {
            log.info("@@@处理所有区域缩略图信息 。。。" + mapViewDM.snapshotList.length);

            mapViewDM.gisLayerMap['_img'] = new ArrayCollection();
            mapViewDM.gisLayerMap['_img_0'] = new ArrayCollection();

            for each (var imgInfo:Object in mapViewDM.snapshotList)
            {
                log.debug("@@@往地图上撒点缩略图： -----> ");
                log.debug(imgInfo);

                var w:Number = 60;
                var h:Number = 60;

                var p:GisPoint = new GisPoint(Number(imgInfo['longitude']), Number(imgInfo['latitude']));

                var pic:GisMarkerPictureStyle;

                if (user.initSceneId != "1003")
                    pic = new GisMarkerPictureStyle(user.context + imgInfo['imgUrl'], w, h);
                else
                    pic = new GisMarkerPictureStyle(user.context + imgInfo['imgUrl'], 60, 40);

                var feature:GisFeature = new GisFeature(p, pic);

                if ((user.showMoLayer != "1" && user.level == "1") || user.level == "3")
                    feature.onClick = changeViewByGisImg;

                feature.buttonMode = true;

                feature.toolTip = imgInfo['areaName'];
                feature.attributes = imgInfo;
                feature.attributes['fType'] = 'img';
                feature.attributes['layerurl'] = (imgInfo['layerurl'] == null ? "" : imgInfo['layerurl']);
                feature.attributes['layerId'] = (imgInfo['layerId'] == null ? "" : imgInfo['layerId']);

                if (user.level == "2" && user.showMoLayer == "0")
                {
                    feature.attributes.left_longitude = imgInfo['left_longitude'];
                    feature.attributes.left_latitude = imgInfo['left_latitude'];
                    feature.attributes.right_longitude = imgInfo['right_longitude'];
                    feature.attributes.right_latitude = imgInfo['right_latitude'];
                }

                var labelFeature:GisFeature = new GisFeature(p, new GisTextStyle(String(imgInfo.areaName), 0x660099, true, 0x999900, true, 0x99CC00, 0, "middle", 0, -30));

                (mapViewDM.gisLayerMap['_img'] as ArrayCollection).addItem(feature);
                (mapViewDM.gisLayerMap['_img'] as ArrayCollection).addItem(labelFeature);

                //最小比例尺下  图片放在地图周围
                if (user.initSceneId == "1452" && user.level == "1")
                {
//                    var off:Object = jingquOffset[imgInfo['areaName']];
                    pic = new GisMarkerPictureStyle(user.context + imgInfo['imgUrl'], 80, 80);

                    var feature0:GisFeature = new GisFeature(jingquLineOffset[imgInfo['areaName']][0], pic);

                    if ((user.showMoLayer != "1" && user.level == "1") || user.level == "3")
                        feature0.onClick = changeViewByGisImg;

                    feature0.buttonMode = true;

                    feature0.toolTip = imgInfo['areaName'];
                    feature0.attributes = imgInfo;
                    feature0.attributes['fType'] = 'img';
                    feature0.attributes['layerurl'] = (imgInfo['layerurl'] == null ? "" : imgInfo['layerurl']);
                    feature0.attributes['layerId'] = (imgInfo['layerId'] == null ? "" : imgInfo['layerId']);

                    var labelFeature0:GisFeature = new GisFeature(jingquLineOffset[imgInfo['areaName']][0], new GisTextStyle(String(imgInfo.areaName), 0x660099, true, 0x999900, true, 0x99CC00, 0, "middle", 0, -30));
                    var cf1:GisFeature = new GisFeature(jingquLineOffset[imgInfo['areaName']][1], new GisMarkerPredefinedStyle(GisMarkerStyle.STYLE_CIRCLE, 6, getUserNumColor(imgInfo['areaName']), 0.8));
                    var cf2:GisFeature = new GisFeature(jingquLineOffset[imgInfo['areaName']][1], new GisMarkerPredefinedStyle(GisMarkerStyle.STYLE_CIRCLE, 12, getUserNumColor(imgInfo['areaName']), 0.6));
                    var cf3:GisFeature = new GisFeature(jingquLineOffset[imgInfo['areaName']][1], new GisMarkerPredefinedStyle(GisMarkerStyle.STYLE_CIRCLE, 20, getUserNumColor(imgInfo['areaName']), 0.5));
                    var lineFeature:GisFeature = new GisFeature(new GisLine(jingquLineOffset[imgInfo.areaName]), new GisLinePredefinedStyle(GisLineStyle.STYLE_DASHDOTDOT, 0XFF0099, .8, 3));

                    (mapViewDM.gisLayerMap['_img_0'] as ArrayCollection).addItem(cf1);
                    (mapViewDM.gisLayerMap['_img_0'] as ArrayCollection).addItem(cf2);
                    (mapViewDM.gisLayerMap['_img_0'] as ArrayCollection).addItem(cf3);
                    (mapViewDM.gisLayerMap['_img_0'] as ArrayCollection).addItemAt(lineFeature, 0);
                    (mapViewDM.gisLayerMap['_img_0'] as ArrayCollection).addItem(feature0);
                    (mapViewDM.gisLayerMap['_img_0'] as ArrayCollection).addItem(labelFeature0);
                }

                if (user.level != "2")
                {
                    {
                        //生成区域缩略图 性能等级图标（泡泡点）
                        if (user.initSceneId == "1003")
                        {
                            pic = new GisMarkerPictureStyle(getImgSmall(imgInfo['warn_level']));
                        }
                        else
                        {
                            pic = new GisMarkerPictureStyle(getImg(imgInfo['warn_level']));
                        }

                    }

                    var f:GisFeature = new GisFeature(p, pic);
                    (mapViewDM.gisLayerMap['_img'] as ArrayCollection).addItem(f);
                }
            }

            msgDispatcher(new SceneEvent(SceneEvent.SHOW_SCENE_SNAPSHOTS));
        }

        private function getUserNumColor(name:String):uint
        {
            switch (mapViewDM.userNumLevel[name])
            {
                case 1:
                case 2:
                case 3:
                    return 0XFF0000;
                case 4:
                case 5:
                case 6:
                    return 0XEE9800;
                case 7:
                case 8:
                case 9:
                    return 0XFED701;
                default:
                    return 0X4169E1;
            }
        }

        private var sectorOffSet2:ArrayCollection = new ArrayCollection([{'offx': 0, 'offy': 0}, {'offx': 20, 'offy': 0}]);

        private var sectorOffSet3:ArrayCollection = new ArrayCollection([{'offx': 1, 'offy': -5},
                                                                         {'offx': 9.66, 'offy': 10},
                                                                         {'offx': 18.32, 'offy': -5}]);
        private var backCellSet3:Object = {'offx': 10, 'offy': 0.5};

        private var sectorOffSet4:ArrayCollection = new ArrayCollection([{'offx': -1, 'offy': 0},
                                                                         {'offx': 10, 'offy': 11},
                                                                         {'offx': 21, 'offy': 0},
                                                                         {'offx': 10, 'offy': -11}]);
        private var backCellSet4:Object = {'offx': 11, 'offy': 0};

		
        //生成网元 gisFeature
        [MessageHandler(selector = "DEAL_SCENE_POLYGON")]
        public function dealPolygon(e:SceneEvent):void
        {
            log.info("处理区域网元和泰森多边形信息 。。。" + mapViewDM.polygonList.length);
            log.info(user);

            offsetsIndex = {};

            mapViewDM.moIdList.removeAll();
            mapViewDM.moIdFeatureMap = {};
            mapViewDM.gisFeatureList.removeAll();

            mapViewDM.gisIdList.removeAll();
            mapViewDM.gisIdListNodeB.removeAll();

            if (user.showBadMoPoints && !mapViewDM.gisLayerMap.hasOwnProperty('_mo_1234'))
                mapViewDM.gisLayerMap['_mo_1234'] = new GisLayer();

            for each (var moInfo:Object in mapViewDM.polygonList)
            {
                if (moInfo['moTypeName'] == "BTS")
                {
                    if (moInfo['gisId'])
                        mapViewDM.gisIdList.addItem(moInfo['gisId']);
                    else
                    {
                        log.error("错误的BTS，不存在gisId！");
                        log.error(moInfo);
                    }
                }
                else if (moInfo['moTypeName'] == "NodeB")
                {
                    if (moInfo['gisId'])
                        mapViewDM.gisIdListNodeB.addItem(moInfo['gisId']);
                    else
                    {
                        log.error("错误的NodeB，不存在gisId！");
                        log.error(moInfo);
                    }
                }

                mapViewDM.gisIdColorMap[moInfo['gisId']] = moInfo['color'];
                mapViewDM.gisIdKpiValueMap[moInfo['gisId']] = moInfo['kpiName'] + ":" + moInfo['kpiValue'];
                mapViewDM.gisIdPerfLevelMap[moInfo['gisId']] = moInfo['perfLevel'];
                mapViewDM.gisIdMoInfoMap[moInfo['gisId']] = moInfo;

                mapViewDM.moIdList.addItem(moInfo['moId']);

                var p:GisPoint = new GisPoint(Number(moInfo.longitude), Number(moInfo.latitude));

                var offset:Object = this.findOffset(moInfo.longitude + "-" + moInfo.latitude);

                var pic:GisMarkerPictureStyle;

                var obj:Object = {'quitType': moInfo['quitType'] ? moInfo['quitType'] : null,
                        'moId': moInfo['moId'],
                        'moName': moInfo['moName'],
                        'moTypeId': moInfo['moTypeId'],
                        'moTypeName': moInfo['moTypeName'],
                        'warnLevel': moInfo['warnLevel'] ? moInfo['warnLevel'] : '0',
                        'sceneId': user.sceneId,
                        'fType': 'mo'};

                //判断是否是基站，如果是基站，那么下面的小区多一层，也撒上
                if (moInfo['moTypeId'] == '16' || moInfo['moTypeId'] == '28' || moInfo['moTypeId'] == '320')
                {
//                    pic = new GisMarkerPictureStyle(ImageFactory.getImage("backCell", moInfo['warnLevel']), 0, 0, backCellSet3['offx'] + Number(offset['xOffSet']), backCellSet3['offy'] + Number(offset['yOffSet']));
					if (mapViewDM.emgCarMap.indexOf(moInfo["moId"]) != -1)
					{
						pic = new GisMarkerPictureStyle(ImageFactory.getImage('emgcar', moInfo['warnLevel']));
					}
					else if (mapViewDM.superBTSArray.indexOf(moInfo["moId"]) != -1)
					{
						pic = new GisMarkerPictureStyle(ImageFactory.getImage("backCell_S", moInfo['warnLevel']), 0, 0, backCellSet3['offx'] + Number(offset['xOffSet']), backCellSet3['offy'] + Number(offset['yOffSet']));
					}
					else
					{
						pic = new GisMarkerPictureStyle(ImageFactory.getImage("backCell_" + moInfo['moTypeName'], moInfo['warnLevel']), 0, 0, backCellSet3['offx'] + Number(offset['xOffSet']), backCellSet3['offy'] + Number(offset['yOffSet']));
					}

					obj.cells = moInfo['cells'];
                }
                else
                    pic = new GisMarkerPictureStyle(ImageFactory.getImage(moInfo['moTypeName'], moInfo['warnLevel']), 0, 0, Number(offset['xOffSet']), Number(offset['yOffSet']));

                var feature:GisFeature = new GisFeature(p, pic);

                //feature.onClick = readyShowKpiFloatMo;

                feature.attributes = obj;
                feature.toolTip = moInfo['moName'];

                if (mapViewDM.moIdFeatureMap.hasOwnProperty(moInfo['moId']))
                {
                    log.error(mapViewDM.moIdFeatureMap[moInfo['moId']].attributes);
                }
                mapViewDM.moIdFeatureMap[moInfo['moId']] = feature;
                mapViewDM.gisFeatureList.addItem(feature);


                if (moInfo['moTypeId'] == '16' || moInfo['moTypeId'] == '28' || moInfo['moTypeId'] == '320')
                {
                    var angle:int = 0;
                    var cellLen:int = moInfo['cells'].length;

                    if (cellLen == 3)
                    {
                        angle = -30;
                    }

                    for (var i:int = 0; i < moInfo['cells'].length && i < 4; i++)
                    {
                        var temp:Object = moInfo['cells'][i];

                        if (cellLen < 3)
                        {
                            pic = new GisMarkerPictureStyle(ImageFactory.getImage('sector', temp["warnLevel"]), 15, 20, sectorOffSet2[i]['offx'] + Number(offset['xOffSet']), sectorOffSet2[i]['offy'] + Number(offset['yOffSet']), 1, angle);
                            angle = angle + 180;
                        }
                        else if (cellLen == 3)
                        {
                            pic = new GisMarkerPictureStyle(ImageFactory.getImage('sector', temp["warnLevel"]), 15, 20, sectorOffSet3[i]['offx'] + Number(offset['xOffSet']), sectorOffSet3[i]['offy'] + Number(offset['yOffSet']), 1, angle);
                            angle = angle + 120;

                        }
                        else
                        {
                            pic = new GisMarkerPictureStyle(ImageFactory.getImage('sector', temp["warnLevel"]), 15, 20, sectorOffSet4[i]['offx'] + Number(offset['xOffSet']), sectorOffSet4[i]['offy'] + Number(offset['yOffSet']), 1, angle);
                            angle = angle + 90;
                        }

                        if (angle >= 360)
                            angle = angle - 360;

                        feature = new GisFeature(p, pic);
                        obj = {'quitType': temp['quitType'] ? temp['quitType'] : null,
                                'moId': temp['moId'],
                                'moName': temp['moName'],
                                'moTypeId': temp['moTypeId'],
                                'moTypeName': temp['moTypeName'],
                                'warnLevel': temp['warnLevel'] ? temp['warnLevel'] : '0',
                                'sceneId': user.sceneId,
                                'fType': 'mo'};

						//去悬浮框视图，暂时去掉，2014-7-18，mod by 汪炜。
//                        feature.onClick = readyShowKpiFloatMo;

                        feature.attributes = obj;
                        feature.toolTip = temp['moName'];

                        if (mapViewDM.moIdFeatureMap.hasOwnProperty(temp['moId']))
                        {
                            log.error(mapViewDM.moIdFeatureMap[temp['moId']].attributes);
                        }

                        mapViewDM.moIdFeatureMap[temp['moId']] = feature;
                        mapViewDM.gisFeatureList.addItem(feature);
                    }
                }
            }

            //抛掷显示网元图层 和 处理多边形的事件。
            log.info("派发 显示网元图层的事件！");
            var e:SceneEvent = new SceneEvent(SceneEvent.SHOW_SCENE_POLYGON);
            e.layerId = user.sceneId + '_mo';
            msgDispatcher(e);
        }

        private function findOffset(key:String):Object
        {
            var temp:Object;

            if (offsetsIndex.hasOwnProperty(key) && int(offsetsIndex[key]) < 21) //offsets对象中只有21个偏移点，2013-9-12，胡任吾
            {
                temp = offsets[offsetsIndex[key]];
                offsetsIndex[key] = int(offsetsIndex[key]) + 1;
            }
            else
            {
                offsetsIndex[key] = 0;
                temp = {xOffSet: 0, yOffSet: 0};
            }
            return temp;


        }

        private function changeViewByGisImg(gisFeature:GisFeature, event:MouseEvent):void
        {
            log.info("切换到区域视图：");
			var evt:SceneEvent = new SceneEvent("DEAL_SCENE_CHANGE");
			evt.param = new Object();
			evt.param.id = gisFeature.attributes.areaId;
			evt.param.name = '';
			evt.param.level = "2";
			evt.param.cityId = '';
			evt.param.layerurl = gisFeature.attributes.layerurl;
			evt.param.layerId = gisFeature.attributes.layerId;
            evt.param.centerlongitude = gisFeature.attributes.longitude;
            evt.param.centerlatitude = gisFeature.attributes.latitude;
            msgDispatcher(evt);
        }

        private function readyShowKpiFloatMo(gisFeature:GisFeature, event:MouseEvent):void
        {
            mx = event.stageX;
            my = event.stageY;

            showKpiFloat(mx, my, gisFeature);
        }



        private function readyShowKpiFloat(gisFeature:GisFeature, event:MouseEvent):void
        {
            mx = event.stageX;
            my = event.stageY;

            setTimeout(function():void
            {
                showKpiFloat(event.stageX, event.stageY, gisFeature);
            }, 2000);
        }


        private function showKpiFloat(oldX:Number, oldY:Number, gisFeature:GisFeature):void
        {
            if (mx != oldX || my != oldY)
            {
                return;
            }

            log.info("抛区域、网元指标悬浮框事件。 moId:" + gisFeature.attributes.moId + ' areaId:' + gisFeature.attributes.areaId);
            user.floatTime = null;
            var e:SceneEvent = new SceneEvent(SceneEvent.SHOW_PERFORMANCEINDEX);

            if (gisFeature.attributes.fType == "mo")
            {
                user.floatId = gisFeature.attributes.moId;
                user.floatLevel = "2";
            }
            else if (gisFeature.attributes.fType == "img")
            {
                user.floatId = gisFeature.attributes.areaId;
                user.floatLevel = "1";
            }
            else if (gisFeature.attributes.fType == "road")
            {
                user.floatId = gisFeature.attributes.areaId;
                user.floatLevel = "1";

                //更改gisfeature图片

                var pic:GisMarkerPictureStyle = new GisMarkerPictureStyle(getImgBig(gisFeature.attributes['warn_level']));
                gisFeature.gisStyle = pic;

                log.info("更新gisFeature事件~  UPDATE_GISFEATURE。")

                var event:SceneEvent = new SceneEvent(SceneEvent.UPDATE_GISFEATURE);
                event.param = gisFeature;
                msgDispatcher(event);
            }
            else
            {
                user.floatId = gisFeature.attributes.moId;
                user.floatLevel = "2";
                e.param.flag = "1";
            }

            e.param.toolTip = gisFeature.toolTip;

            e.mouseX = oldX;
            e.mouseY = oldY;

            msgDispatcher(e);
        }

        [MessageHandler(selector = "CMS_SCENE_MAPVIEW_SHOWKPIFLOAT")]
        public function showRightKpiFloat(evt:SceneEvent):void
        {
            var gisFeature:GisFeature = evt.param as GisFeature;
            log.info("抛区域、网元指标悬浮框事件。 moId:" + gisFeature.attributes.moId + ' areaId:' + gisFeature.attributes.areaId);
            user.floatTime = null;
            var e:SceneEvent = new SceneEvent(SceneEvent.SHOW_PERFORMANCEINDEX);
            e.param = new Object();

            if (gisFeature.attributes.fType == "mo")
            {
                user.floatId = gisFeature.attributes.moId;
                user.floatLevel = "2";
            }
            else if (gisFeature.attributes.fType == "img")
            {
                user.floatId = gisFeature.attributes.areaId;
                user.floatLevel = "1";
            }
            else if (gisFeature.attributes.fType == "road")
            {
                user.floatId = gisFeature.attributes.areaId;
                user.floatLevel = "1";

                //更改gisfeature图片

                var pic:GisMarkerPictureStyle = new GisMarkerPictureStyle(getImgBig(gisFeature.attributes['warn_level']));
                gisFeature.gisStyle = pic;

                log.info("更新gisFeature事件~  UPDATE_GISFEATURE。");
                var event:SceneEvent = new SceneEvent(SceneEvent.UPDATE_GISFEATURE);
                event.param = gisFeature;
                msgDispatcher(event);
            }
            else
            {
                user.floatId = gisFeature.attributes.moId;
                user.floatLevel = "2";
//				e.param.flag = "1";
            }

            e.param.toolTip = gisFeature.toolTip;
            msgDispatcher(e);
        }

        private function hideKpiFloat(gisFeature:GisFeature, event:MouseEvent):void
        {
            mx = -100;
            my = -100;

            if (gisFeature.attributes.fType == "road")
            {
                var pic:GisMarkerPictureStyle = new GisMarkerPictureStyle(getImg(gisFeature.attributes['warn_level']));
                gisFeature.gisStyle = pic;

                log.info("更新gisFeature事件~  UPDATE_GISFEATURE。")

                var e:SceneEvent = new SceneEvent(SceneEvent.UPDATE_GISFEATURE);
                e.param = gisFeature;
                msgDispatcher(e);
            }
        }

        [MessageHandler(selector = "DEAL_ROAD_PERF_MSG")]
        public function showRoadPerfMsg(e:SceneEvent):void
        {
            log.info("处理道路性能信息，显示到地图。");
            log.debug("添加imgFeature 到 道路性能信息缓存:{0}", mapViewDM.gisLayerMap.hasOwnProperty("_road"));
            log.info(mapViewDM.roadPerfList);

            if (!mapViewDM.gisLayerMap.hasOwnProperty('_road'))
                mapViewDM.gisLayerMap['_road'] = new ArrayCollection();

            for each (var obj:Object in mapViewDM.roadPerfList)
            {
                var p:GisPoint = new GisPoint(Number(obj['longitude']), Number(obj['latitude']));

                var pic:GisMarkerPictureStyle = new GisMarkerPictureStyle(getImg(obj['warn_level']));

                var f:GisFeature = new GisFeature(p, pic);

                //f.onMouseOver = readyShowKpiFloat;
                f.onMouseOut = hideKpiFloat;

                f.attributes = {'areaId': obj['areaId'],
                        'areaName': obj['areaName'],
                        'fType': 'road',
                        'warn_level': obj['warn_level'],
                        'layerId': obj['layerId'],
                        'layerUrl': obj['layerUrl'],
                        'centerlatitude': obj['latitude'],
                        'centerlongitude': obj['longitude']};
                f.toolTip = obj['areaName'];

                (mapViewDM.gisLayerMap['_road'] as ArrayCollection).addItem(f);
            }

            log.debug("处理道路性能信息数据完成，抛出显示事件：SHOW_ROAD_PERF_MSG");
            msgDispatcher(new SceneEvent(SceneEvent.SHOW_ROAD_PERF_MSG));
        }

        private function getImg(level:String):Object
        {
            switch (level)
            {
                case "1":
                    return perf_1;
                case "2":
                    return perf_2;
                case "3":
                    return perf_3;
                case "4":
                    return perf_4;
                default:
                    return perf_0;
            }
        }

        private function getImgSmall(level:String):Object
        {
            switch (level)
            {
                case "1":
                    return sperf_1;
                case "2":
                    return sperf_2;
                case "3":
                    return sperf_3;
                case "4":
                    return sperf_4;
                default:
                    return sperf_0;
            }
        }

        private function getImgBig(level:String):Object
        {
            switch (level)
            {
                case "1":
                    return perf_1_big;
                case "2":
                    return perf_2_big;
                case "3":
                    return perf_3_big;
                case "4":
                    return perf_4_big;
                default:
                    return perf_0_big;
            }
        }

        [Embed(source = "../../../../img/sperf_1.png")]
        [Bindable]
        private static var sperf_1:Class;

        [Embed(source = "../../../../img/sperf_2.png")]
        [Bindable]
        private static var sperf_2:Class;

        [Embed(source = "../../../../img/sperf_3.png")]
        [Bindable]
        private static var sperf_3:Class;

        [Embed(source = "../../../../img/sperf_4.png")]
        [Bindable]
        private static var sperf_4:Class;

        [Embed(source = "../../../../img/sperf_0.png")]
        [Bindable]
        private static var sperf_0:Class;

        [Embed(source = "../../../../img/perf_1.png")]
        [Bindable]
        private static var perf_1:Class;

        [Embed(source = "../../../../img/perf_2.png")]
        [Bindable]
        private static var perf_2:Class;

        [Embed(source = "../../../../img/perf_3.png")]
        [Bindable]
        private static var perf_3:Class;

        [Embed(source = "../../../../img/perf_4.png")]
        [Bindable]
        private static var perf_4:Class;

        [Embed(source = "../../../../img/perf_0.png")]
        [Bindable]
        private static var perf_0:Class;

        [Embed(source = "../../../../img/perf_1_big.png")]
        [Bindable]
        private static var perf_1_big:Class;

        [Embed(source = "../../../../img/perf_2_big.png")]
        [Bindable]
        private static var perf_2_big:Class;

        [Embed(source = "../../../../img/perf_3_big.png")]
        [Bindable]
        private static var perf_3_big:Class;

        [Embed(source = "../../../../img/perf_4_big.png")]
        [Bindable]
        private static var perf_4_big:Class;

        [Embed(source = "../../../../img/perf_0_big.png")]
        [Bindable]
        private static var perf_0_big:Class;
    }
}

