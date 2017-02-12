package com.linkage.module.cms.scene.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    
    import com.linkage.module.cms.scene.dao.IScenePanelDao;
    import com.linkage.module.cms.scene.domain.KPISituationDM;
    import com.linkage.module.cms.scene.event.KPISituationEvent;
    import com.linkage.module.cms.scene.event.SceneEvent;
    
    import flash.events.Event;
    
    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;

    /**
     *
     *
     * @author 张传存 (69207)
     * @version 1.0
     * @date 2012-7-30
     * @langversion 3.0
     * @playerversion Flash 11
     * @productversion Flex 4
     * @copyright Ailk NBS-Network Mgt. RD Dept.
     *
     */
    public class TopnDataCmd
    {
        private var log:ILogger = Log.getLoggerByClass(TopnDataCmd);

        [Inject("scenePanelDao")]
        public var scenePanelDao:IScenePanelDao;

        [Inject("kPISituationDM")]
        public var kpiSituationDM:KPISituationDM;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        private var systime:Number = 0;

        public function execute(e:KPISituationEvent):AsyncToken
        {
            log.debug("[劣化topn]:topn数据列表cmd捕获");
            systime = (new Date()).getTime();
			log.warn("[劣化topn]:topn 开始：{0}", new Date().toString());
            return scenePanelDao.getSceneTopN(e.selectTopnId, e.strMoTypeId);
        }

        public function result(data:Object):void
        {
            log.warn("耗时：{0}", (new Date).getTime() - systime);
            log.debug("[劣化topn：]result 返回结果集 " + data.length);
			log.warn("[劣化topn]:topn 结束：{0}", new Date().toString());
            this.kpiSituationDM.topNData.removeAll();
            this.kpiSituationDM.topNData.addAll(data as IList);

            if (data && data.length > 0)
            {
                log.debug("topn 有数据了！！！");
                log.debug(data);
                msgDispatcher(new SceneEvent(SceneEvent.CMS_SCENE_TOPNDATA_TOPNDATALENGTH));
                msgDispatcher(new KPISituationEvent(KPISituationEvent.SHOW_TOPN_DATA));
            }
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
            log.error("[劣化topn]:cmd命令返回失败error:" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }
    }
}

