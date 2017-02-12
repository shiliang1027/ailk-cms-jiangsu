package com.linkage.module.cms.gsscene.view.components.sheetstat.event
{
    import flash.events.Event;

    public class SheetStatEvent extends Event
    {

        public var param:Object = {};

        public function SheetStatEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }


        public static const LOAD_SHEET_DATA:String = "LOAD_SHEET_DATA";
        public static const LOAD_SHEET_DATA_SUCC:String = "LOAD_SHEET_DATA_SUCC";
        public static const LOAD_SHEET_DATA_MOTYPE:String = "LOAD_SHEET_DATA_MOTYPE";
        public static const LOAD_SHEET_DATA_MOTYPE_SUCC:String = "LOAD_SHEET_DATA_MOTYPE_SUCC";
        public static const LOAD_SHEET_ALARMS:String = "LOAD_SHEET_ALARMS";
        public static const LOAD_SHEET_ALARMS_SUCC:String = "LOAD_SHEET_ALARMS_SUCC";
    }
}
