package com.linkage.module.cms.gsscene.view.components.mapview.dao
{
    import com.ailk.common.system.logging.ILogger;
    import com.ailk.common.system.logging.Log;
    
    import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;
    
    
    /**
    *说明：
    *作者：panyin
    *时间：2012-11-28下午2:41:24
    */
    
	
    public class LineGisInfoDao implements ILineGisInfoDao
    {
        private var log:ILogger = Log.getLoggerByClass(LineGisInfoDao);
        
        private var _destination:String;
        private var _endpoint:String;
        
        private var rmtObj:RemoteObject;
        
        [Init]
        public function initDao():void
        {
            rmtObj = new RemoteObject(_destination);
            rmtObj.endpoint = _endpoint;
			rmtObj.showBusyCursor= false;
        }      
        
        public function loadLineGisInfo(circName:String):AsyncToken
        {
            log.info("加载管线GIS撒点信息：" +　circName);
            
            return rmtObj.devLocate("circuit", "{'model':'2','circName':'" + circName + "','device':'1'}");
        }
        
        public function get destination():String
        {
            return _destination;
        }
        
        public function set destination(value:String):void
        {
            _destination = value;
        }
        
        public function get endpoint():String
        {
            return _endpoint;
        }
        
        public function set endpoint(value:String):void
        {
            _endpoint = value;
        }
    }
}