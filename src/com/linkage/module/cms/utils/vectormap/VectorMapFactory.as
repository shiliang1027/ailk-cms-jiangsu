package com.linkage.module.cms.utils.vectormap
{
	public class VectorMapFactory
	{
		
		private static var mapDictionary:MapDictionary;
		public function VectorMapFactory()
		{
		}
		
		public static function getMapDictionary(vectorMapID:String,configBaseUrl:String):MapDictionary{
			if(!mapDictionary){
				switch(vectorMapID){
					case "jiangsu":
						mapDictionary = new MapDictionary_JiangSu(configBaseUrl);
						break;
					case "jiangsu_ltetopo":
						mapDictionary = new MapDictionary_JiangSu_LTETopo(configBaseUrl);
						break;
//					case "xinjiang":
//						mapDictionary = new MapDictionary_XinJiang(configBaseUrl);
//						break;
//					case "shandong":
//						mapDictionary = new MapDictionary_ShanDong(configBaseUrl);
//						break;
//					case "shanxi_jing":
//						mapDictionary = new MapDictionary_ShanXi_jing(configBaseUrl);
//						break;
					default:
						break;
				}
			}
			return mapDictionary;
		}
	}
}