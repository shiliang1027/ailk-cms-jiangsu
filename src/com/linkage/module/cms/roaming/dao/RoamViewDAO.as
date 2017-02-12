package com.linkage.module.cms.roaming.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.system.rpc.remoting.BlazeDSUtil;

    import mx.rpc.events.FaultEvent;
    import mx.rpc.remoting.RemoteObject;

    public class RoamViewDAO
    {
        private static var instance:RoamViewDAO;

        public var context:String = "/cms/";

        private static var log:ILogger = Log.getLoggerByClass(RoamViewDAO);

        private var destination:String = "flexdestination_cms_roaming_roamingservice";
        private var src:String = "";
        private var endPoint:String = "messagebroker/amf";

        public static function getInstance():RoamViewDAO
        {
            if (instance == null)
                instance = new RoamViewDAO;

            return instance;
        }


        public function getRoamDatas(param:Object, successCallBack:Function, errorCallBack:Function = null):void
        {
            var rmt:RemoteObject = BlazeDSUtil.newService(
                destination, src, context + endPoint,
                function(result:Object):void
                {
                    log.info("加载漫游数据成功");
                    log.info(result);

                    successCallBack.call(this, result);
                },
                function(e:FaultEvent):void
                {
                    log.error("加载漫游数据失败：" + e.message);

                    if (errorCallBack != null)
                        errorCallBack.call(this, e);
                }
                );

            log.info("加载漫游数据~~");
            log.debug(param);

            rmt.getRoamDatas(param);
        }
    }
}
