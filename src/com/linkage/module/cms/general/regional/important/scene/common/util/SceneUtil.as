package com.linkage.module.cms.general.regional.important.scene.common.util
{
	import com.adobe.serialization.json.JSON;

	/**
	 *场景工具类
	 * @author mengqiang
	 *
	 */
	public class SceneUtil
	{
		/**
		 *字符串转换为JSON对象
		 * @param str 字符串
		 * @return JSON对象
		 *
		 */
		public static function jsonDecode(str:String):Object
		{
			return JSON.decode(str.replace(/\'/g, "\""));
		}

		/**
		 *获取XY轴坐标信息
		 * @param croodXY XY轴坐标
		 * @return XY轴坐标信息
		 *
		 */
		public static function getCroodXY(croodXY:String):String
		{
			return (croodXY == null || croodXY == '' || croodXY == 'undefinded') ? '0' : croodXY;
		}
	}
}