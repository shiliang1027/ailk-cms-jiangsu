package com.linkage.module.cms.kpichart.dao
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

        function queryKpiMuTypeChartDatas(type:Object):AsyncToken;
    }
}
