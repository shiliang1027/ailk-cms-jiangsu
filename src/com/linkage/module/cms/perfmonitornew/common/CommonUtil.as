package com.linkage.module.cms.perfmonitornew.common
{

    public class CommonUtil
    {
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

    }
}
