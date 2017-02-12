package com.linkage.module.cms.scene.serv
{
    /**
     *
     *
     * @author xudx (69291)
     * @version 1.0
     * @date 2012-7-26
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.scene.dao.IQuitServiceDao;
    import com.linkage.module.cms.scene.domain.QuitServiceDM;
    import com.linkage.module.cms.scene.domain.common.IUser;
    import com.linkage.module.cms.scene.event.compenent.QuitServiceEvent;
    
    import flash.events.Event;
    
    import mx.collections.ArrayCollection;
    import mx.collections.IList;
    import mx.controls.Alert;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    public class QuitServiceLoadDataCmd
    {
        private var log:ILogger = Log.getLoggerByClass(QuitServiceLoadDataCmd);

        [Inject("quitServiceDao")]
        public var dao:IQuitServiceDao;

        [Inject("quitServiceDM")]
        public var dm:QuitServiceDM;

        [Inject("user")]
        public var user:IUser;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        private var systime:Number = 0;

        public function execute(e:QuitServiceEvent):AsyncToken
        {
            log.info("加载退服统计数据！");
            systime = (new Date()).getTime();
			log.warn("[退服统计]: 开始：{0}", new Date().toString());
            return dao.loadData();
        }

        public function result(data:Object):void
        {
            log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.warn("[退服统计]: 结束：{0}", new Date().toString());
            log.info("加载退服统计数据成功:" + data.length);
            dm.dataList.removeAll();

            if (data.length > 0)
            {
                if (user.initSceneId != "1011")
                {
                    dm.dataList.addItem({"key": "2G退服基站数", "value": data.getItemAt(0)["2G退服基站数"]});
                    dm.dataList.addItem({"key": "TD退服基站数", "value": data.getItemAt(0)["TD退服基站数"]});
                }

                dm.dataList.addItem({"key": "eNodeB退服基站数", "value": data.getItemAt(0)["eNodeB退服基站数"]});
                dm.dataList.addItem({"key": "一次下电基站退服数", "value": data.getItemAt(0)["一次下电基站数"]});
                dm.dataList.addItem({"key": "市电停电基站退服数", "value": data.getItemAt(0)["市电停电基站数"]});
                dm.dataList.addItem({"key": "直流欠压基站退服数", "value": data.getItemAt(0)["直流欠压基站数"]});
                dm.dataList.addItem({"key": "蓄电池供电基站退服数", "value": data.getItemAt(0)["蓄电池供电基站数"]});
                dm.dataList.addItem({"key": "水浸基站退服数", "value": data.getItemAt(0)["水浸基站数"]});
                dm.dataList.addItem({"key": "烟感基站退服数", "value": data.getItemAt(0)["烟感基站数"]});
                dm.dataList.addItem({"key": "传输中断基站退服数", "value": data.getItemAt(0)["传输中断基站数"]});

                if (user.initSceneId != "1011")
                {
                    dm.quitServiceDetail.list0 = data.getItemAt(0)["2G退服基站数_detail"];
                    dm.quitServiceDetail.list1 = data.getItemAt(0)["TD退服基站数_detail"];
                    dm.quitServiceDetail.list2 = data.getItemAt(0)["eNodeB退服基站数_detail"];
                    dm.quitServiceDetail.list3 = data.getItemAt(0)["一次下电基站数_detail"];
                    dm.quitServiceDetail.list4 = data.getItemAt(0)["市电停电基站数_detail"];
                    dm.quitServiceDetail.list5 = data.getItemAt(0)["直流欠压基站数_detail"];
                    dm.quitServiceDetail.list6 = data.getItemAt(0)["蓄电池供电基站数_detail"];
                    dm.quitServiceDetail.list7 = data.getItemAt(0)["水浸基站数_detail"];
                    dm.quitServiceDetail.list8 = data.getItemAt(0)["烟感基站数_detail"];
                    dm.quitServiceDetail.list9 = data.getItemAt(0)["传输中断基站数_detail"];
                }
                else
                {
                    dm.quitServiceDetail.list0 = data.getItemAt(0)["eNodeB退服基站数_detail"];
                    dm.quitServiceDetail.list1 = data.getItemAt(0)["一次下电基站数_detail"];
                    dm.quitServiceDetail.list2 = data.getItemAt(0)["市电停电基站数_detail"];
                    dm.quitServiceDetail.list3 = data.getItemAt(0)["直流欠压基站数_detail"];
                    dm.quitServiceDetail.list4 = data.getItemAt(0)["蓄电池供电基站数_detail"];
                    dm.quitServiceDetail.list5 = data.getItemAt(0)["水浸基站数_detail"];
                    dm.quitServiceDetail.list6 = data.getItemAt(0)["烟感基站数_detail"];
                    dm.quitServiceDetail.list7 = data.getItemAt(0)["传输中断基站数_detail"];
                }

            }

            dm.dataList.refresh();

            log.info("退服统计 地市查询！" + (new Date().getTime() - systime));
            dm.cityQuitDataList.removeAll();
            dm.cityQuitDataList.addAll(data as IList);
            log.info(dm.cityQuitDataList);


            dm.cityQuitDataList.refresh();

            if (user.kpiId == null)
            {
                log.info("退服统计，派发显示退服图表的事件：QuitServiceEvent.SHOW_QUIT_CHART");
                log.debug(dm.cityQuitDataList);
                var e:QuitServiceEvent = new QuitServiceEvent(QuitServiceEvent.SHOW_QUIT_CHART);
                e.quitData.removeAll();
                e.quitData.addAll(data as IList);
                msgDispatcher(e);
            }
			
			msgDispatcher(new QuitServiceEvent(QuitServiceEvent.LOAD_QUIT_DATA_SUCCESS));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
            log.error("加载[退服统计]表格数据错误：" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }
    }
}

