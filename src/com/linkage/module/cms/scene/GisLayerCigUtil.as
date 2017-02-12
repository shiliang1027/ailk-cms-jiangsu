package com.linkage.module.cms.scene
{
    import com.ailk.common.ui.gis.utils.IPUtil;

    import mx.core.FlexGlobals;
    import mx.utils.URLUtil;

    public class GisLayerCigUtil
    {
        private var innerMap:Object = {};
        private var outerMap:Object = {};


        public function getLsyerByCityId(cityId:String):String
        {
            if (IPUtil.isInnerIP(URLUtil.getServerName(FlexGlobals.topLevelApplication.url)))
                return innerMap[cityId];
            else
                return outerMap[cityId];
        }
    }
}
