package com.linkage.module.cms.gsscene.view.components.kpisituation.serv
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.linkage.module.cms.gsscene.view.components.common.dao.IScenePanelDao;
    import com.linkage.module.cms.gsscene.view.components.kpisituation.KPISituationDM;
    import com.linkage.module.cms.gsscene.view.components.kpisituation.event.KPISituationEvent;
    
    import flash.events.Event;
    
    import mx.collections.ArrayCollection;
    import mx.collections.IList;
    import mx.rpc.AsyncToken;
    import mx.rpc.Fault;
    import mx.utils.ObjectUtil;

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
    public class KPISituationCmd
    {
        private var log:ILogger = Log.getLoggerByClass(KPISituationCmd);

        [Inject("scenePanelDao")]
        public var scenePanelDao:IScenePanelDao;

        [Inject("kPISituationDM")]
        public var kpiSituationDM:KPISituationDM;

        [MessageDispatcher]
        public var msgDispatcher:Function;

        private var systime:Number = 0;

        public function execute(e:KPISituationEvent):AsyncToken
        {
            log.debug("[指标概况：]cmd命令捕获execute开始执行...");
            systime = (new Date()).getTime();
            return scenePanelDao.getSceneKpiGeneralInfo();
        }

        public function result(data:Object):void
        {
            log.warn("耗时：{0}", (new Date).getTime() - systime);
            log.debug("[指标概况]result info ...");

            kpiSituationDM.kpiSituationArr.removeAll();
            kpiSituationDM.kpiSituationArr.addAll(data as IList);
            kpiSituationDM.kpiSituationArr.refresh();

            msgDispatcher(new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_SHOW_DATA));
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
        }

        public function error(f:Fault):void
        {
			msgDispatcher(new Event("REQUEST_COMPLETE"));
            log.error("[指标概况：]cmd命令返回失败error..." + f.faultString + "\n" + f.faultDetail);
        }
    }
}

