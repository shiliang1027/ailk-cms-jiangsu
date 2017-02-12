package com.linkage.module.cms.gsscenecfg.common
{

    public class CommonUtil
    {
        [Embed(source = '../img/35/jizhan_2G.png')]
        private static var jizhan_2G_35:Class;

        [Embed(source = '../img/35/jizhan_3G.png')]
        private static var jizhan_3G_35:Class;

        [Embed(source = '../img/35/wlan.png')]
        private static var wlan_35:Class;

        [Embed(source = '../img/35/jizhan.png')]
        private static var jizhan_35:Class;

        [Embed(source = '../img/35/site.png')]
        private static var site_35:Class;

        [Embed(source = '../img/35/eNodeB.png')]
        private static var eNodeB:Class;

        //向下迭代
        public static function forEachTreeDown(node:XML, callback:Function = null):void
        {
            for each (var child:XML in node.children())
            {
                if (callback is Function)
                {
                    callback.call(null, child);
                }

                if (child.hasComplexContent())
                {
                    forEachTreeDown(child, callback);
                }
            }
        }

        //向上迭代
        public static function forEachTreeUp(node:XML, callback:Function = null):void
        {
            var parent:XML = node.parent();

            if (Boolean(String(parent)))
            {
                if (callback is Function)
                {
                    callback.call(null, parent);
                }

                if (parent.parent() && parent != null && Boolean(String(parent.parent())))
                {
                    forEachTreeUp(parent, callback);
                }
            }
        }

        public static function getIcon(type:String, sco:Number):Class
        {
            if (type == "jz_16")
            {
                return jizhan_2G_35;
            }
            else if (type == "jz_28")
            {
                return jizhan_3G_35;
            }
            else if (type == "jz_320")
            {
                return eNodeB;
            }
            else if (type.indexOf("host_") >= 0 || type.indexOf("80") >= 0 || type.indexOf("201") >= 0)
            {
                return wlan_35;
            }
            else if (type == "site_")
            {
                return site_35;
            }
            else
            {
                return jizhan_35;
            }
        }

    }
}
