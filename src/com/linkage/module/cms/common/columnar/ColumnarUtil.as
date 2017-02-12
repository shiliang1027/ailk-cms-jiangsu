package com.linkage.module.cms.common.columnar
{

	public class ColumnarUtil
	{
		/**
		 * 格式化数据
		 * @param num
		 * @param dts 保留小数点后几位
		 * @return
		 *
		 */
		public static function formart(num:String, dts:int):String
		{
			if (num == null)
			{
				return "";
			}
			var idx:int = num.indexOf(".");
			if (idx == -1 || idx + dts >= num.length - 1)
			{
				return num;
			}
			return num.substr(0, idx + dts + 1);
		}

		/**
		 *计算柱状图的高度
		 * @param num 指标值
		 * @param max 指标最大值
		 * @param maxHeight 最大高度
		 * @return
		 *
		 */
		public static function countHeight(num:Number, max:Number, maxHeight:int):Number
		{
			if (max > 0)
			{
				return Number(formart(String((num * maxHeight) / max), 2));
			}
			return 1;
		}

		/**
		 *计算增加幅度
		 * @param showValue 显示值
		 * @param cycleNum 循环次数
		 * @param dts 数据点
		 * @return
		 *
		 */
		public static function countStep(showValue:Number, cycleNum:int, dts:int):Number
		{
			return Number(formart(String(showValue / cycleNum), dts));
		}
	}
}