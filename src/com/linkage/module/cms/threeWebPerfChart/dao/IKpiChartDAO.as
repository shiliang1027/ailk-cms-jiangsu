package com.linkage.module.cms.threeWebPerfChart.dao
{
    import mx.rpc.AsyncToken;

    public interface IKpiChartDAO
    {
        /**
         * 获取指标数据
         * @param param
         * @return
         */
        function queryKpiChartDatas(param:Object):AsyncToken;

        function getBigScreenValueforOne(param:Object):AsyncToken;
		
        function getNetCompareValue(param:Object):AsyncToken;
		
        function queryTreeDatas():AsyncToken;
    }
}
