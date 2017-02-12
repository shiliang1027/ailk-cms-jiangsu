package com.linkage.module.cms.perfmonitornew.common
{
    import flash.filters.GlowFilter;
    import flash.text.TextFieldAutoSize;

    import mx.controls.Button;
    import mx.controls.ButtonLabelPlacement;


    public class VButton extends Button
    {
        public function VButton()
        {
            super();
        }

        override public function initialize():void
        {
            super.initialize();
            buttonMode = true;
            textField.wordWrap = true;
            this.labelPlacement = ButtonLabelPlacement.TOP;
            textField.autoSize = TextFieldAutoSize.CENTER;
            this.setStyle("paddingBottom", 0);
            this.setStyle("paddingLeft", 0);
            this.setStyle("paddingRight", 0);
            this.setStyle("paddingTop", 0);
        }

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
        {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            textField.y = (height - textField.height) / 2;
            textField.x = (width - textField.width) / 2;
        }
    }
}
