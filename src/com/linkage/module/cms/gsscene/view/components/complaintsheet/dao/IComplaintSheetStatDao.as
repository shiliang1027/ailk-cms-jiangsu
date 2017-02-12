package com.linkage.module.cms.gsscene.view.components.complaintsheet.dao
{
    import mx.rpc.AsyncToken;

    /*
     *说明：
     *作者：汪炜
     *时间：2014年6月17日16:18:02
     **/

    public interface IComplaintSheetStatDao
    {
        function loadComplaintSheetData():AsyncToken;
        function loadComplaintSheetAlarmsData(param:Object):AsyncToken;
    }
}

