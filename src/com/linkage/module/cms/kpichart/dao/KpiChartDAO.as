package com.linkage.module.cms.kpichart.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;

    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

    public class KpiChartDAO implements IKpiChartDAO
    {
        public function KpiChartDAO()
        {
        }

        private var log:ILogger = Log.getLoggerByClass(KpiChartDAO);

        private var _destination:String;
        private var _endpoint:String;

        private var rmtObj:RemoteObject;

        public function init():void
        {
            if (rmtObj == null)
            {
                rmtObj = new RemoteObject(_destination);
                rmtObj.endpoint = _endpoint;
                rmtObj.showBusyCursor = false;
            }
        }

        public function queryKpiChartDatas(param:Object):AsyncToken
        {
            init();
            return rmtObj.getBigScreenValue(param);
        }

        public function queryKpiMuTypeChartDatas(type:Object):AsyncToken
        {
            init();
            return rmtObj.getBigScreenValueforOne({"type": type});
        }

        public function set destination(value:String):void
        {
            _destination = value;
        }

        public function set endpoint(value:String):void
        {
            _endpoint = value;
        }
    }
}
