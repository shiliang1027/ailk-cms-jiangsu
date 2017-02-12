package com.linkage.module.cms.gsscene.view.components.sheetstat.dao
{
    import mx.rpc.AsyncToken;

    /*
     *说明：
     *作者：panyin
     *时间：2012-11-28上午10:24:24
     **/

    public interface ISheetStatDao
    {
        function loadSheetData():AsyncToken;
        function loadSheetAlarmsData(param:Object):AsyncToken;
        function loadSheetDataMotype(p:Object):AsyncToken;
    }
}

