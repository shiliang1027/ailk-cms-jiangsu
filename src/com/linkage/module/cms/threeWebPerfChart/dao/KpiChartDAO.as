package com.linkage.module.cms.threeWebPerfChart.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    
    import mx.controls.Alert;
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
		
        private var rmtTreeObj:RemoteObject;

        public function init():void
        {
            if (rmtObj == null)
            {
                rmtObj = new RemoteObject(_destination);
                rmtObj.endpoint = _endpoint;
                rmtObj.showBusyCursor = true;
            }
        }
		
        public function initTree():void
        {
            if (rmtTreeObj == null)
            {
				log.info("initTree");
				rmtTreeObj = new RemoteObject("flexdestination_cms_scene_yog_BigScreenSTPServImpl");
				rmtTreeObj.endpoint = _endpoint;
				rmtTreeObj.showBusyCursor = false;
            }
        }

		public function queryTreeDatas():AsyncToken
		{
			var param:Object = new Object();
			initTree();
			param.flag = "0";
			param.level = "1";
			param.logicalType = "1";
			param.sceneTypeId = "6";
			param.sceneId = "1006";
			param.areaId = "1";
			param.cityId = "00";
			log.info("queryTreeDatas");
//			return rmtTreeObj.getSceneTree(param);
			return rmtTreeObj.getSceneTree(param);
		}
		
        public function queryKpiChartDatas(param:Object):AsyncToken
        {
            init();
            return rmtObj.getBigScreenValue(param);
        }

        public function getNetCompareValue(param:Object):AsyncToken
        {
            init();
            return rmtObj.getNetCompareValue(param);
        }
		
        public function getBigScreenValueforOne(param:Object):AsyncToken
        {
            init();
            return rmtObj.getBigScreenValueforOne(param);
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
