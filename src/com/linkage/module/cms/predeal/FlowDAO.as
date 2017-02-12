package com.linkage.module.cms.predeal
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    import com.ailk.common.system.rpc.remoting.BlazeDSUtil;

    import mx.controls.Alert;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.remoting.RemoteObject;

    /*
     *说明：
     *作者：panyin
     *时间：2013-8-3上午10:59:53
     **/

    public class FlowDAO
    {
        private static var destination:String = "flexdestination_cms_alarmflow";
        private static var src:String = "";
        private static var endPoint:String = "messagebroker/amf";

        //日志
        private static var log:ILogger = Log.getLogger("com.linkage.module.cms.predeal.FlowDAO");


        public static function getAlarmFlow(context:String, param:Object, success:Function, error:Function = null):void
        {
            var remoteObj:RemoteObject = BlazeDSUtil.newService(
                destination, src, context + endPoint,
                //加载数据成功
                function(result:Object):void
                {
                    log.info("查询告警流程信息成功，记录数：");

                    for (var k:Object in result)
                        log.debug(k + ": " + result[k]);

                    success.call(null, result);
                },
                //加载数据异常 记录日志
                function(event:FaultEvent):void
                {
                    log.error(event.fault.faultString + "\n" + event.fault.faultDetail);
                });

            log.info("开始查询告警流程信息~");
            log.debug(param);
            remoteObj.getAlarmFlow(param);
        }

    }
}
