package com.linkage.module.cms.gsscene.view.components.sceneview.dao
{
    import mx.rpc.AsyncToken;

    public interface ISceneViewDao
    {
        function getSceneCfgData():AsyncToken;
        function getSceneImg():AsyncToken;
        function getSceneImgBySceneId(param:Object):AsyncToken;
        function queryAreaCount():AsyncToken;

        /**
         * 保存用户面板配置
         * @param map{sceneTypeId:场景类型ID, accName:当前登录用户名, panels:[{},{}]配置的面板,level:场景级别}
         * @return String success 成功, failure 失败
         */
        function savePanelsAccountCfg(param:Object):AsyncToken;
    }
}
