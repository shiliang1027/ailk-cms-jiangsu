package com.linkage.module.cms.scene.event
{
    import flash.events.Event;

    public class WorstCellPanelEvent extends Event
    {

        public var param:Object = {};

        public function WorstCellPanelEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }


        public static const LOAD_DATA:String = "LOAD_DATA";
        public static const LOAD_DATA_SUCC:String = "LOAD_DATA_SUCC";
    }
}
