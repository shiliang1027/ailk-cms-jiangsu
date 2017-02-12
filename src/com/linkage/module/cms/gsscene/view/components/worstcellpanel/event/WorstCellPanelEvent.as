package com.linkage.module.cms.gsscene.view.components.worstcellpanel.event
{
    import flash.events.Event;

    public class WorstCellPanelEvent extends Event
    {

        public var param:Object = {};

        public function WorstCellPanelEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }

        public static const LOAD_WORSTCELL_DATA:String = "LOAD_WORSTCELL_DATA";
        public static const LOAD_WORSTCELL_DATA_SUCC:String = "LOAD_WORSTCELL_DATA_SUCC";
    }
}
