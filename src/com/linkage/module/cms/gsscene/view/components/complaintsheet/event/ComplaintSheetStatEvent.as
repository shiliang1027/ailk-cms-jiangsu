package com.linkage.module.cms.gsscene.view.components.complaintsheet.event
{
    import flash.events.Event;

    public class ComplaintSheetStatEvent extends Event
    {

        public var param:Object = {};

        public function ComplaintSheetStatEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
        }

        public static const LOAD_COMPLAINTSHEET_DATA:String = "LOAD_COMPLAINTSHEET_DATA";
        public static const LOAD_COMPLAINTSHEET_DATA_SUCC:String = "LOAD_COMPLAINTSHEET_DATA_SUCC";
        public static const LOAD_COMPLAINTSHEET_ALARMS:String = "LOAD_COMPLAINTSHEET_ALARMS";
        public static const LOAD_COMPLAINTSHEET_ALARMS_SUCC:String = "LOAD_COMPLAINTSHEET_ALARMS_SUCC";
    }
}
