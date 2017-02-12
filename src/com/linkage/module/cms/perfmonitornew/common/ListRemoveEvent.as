package com.linkage.module.cms.perfmonitornew.common
{
    import flash.events.Event;

    public class ListRemoveEvent extends Event
    {
        public static var LIST_REMOVE = "LIST_REMOVE";
        public var data:Object;

        public function ListRemoveEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }
    }
}
