package com.linkage.module.cms.gsscene.view.components.mapview.dao
{
	import mx.rpc.AsyncToken;

	public interface IMapViewDao
	{
		function getRegionImgs():AsyncToken;
		function getScenePolygonData():AsyncToken;
		function getCityGisId():AsyncToken;
		function getSceneImpKpi():AsyncToken;
		function getOutServerReason():AsyncToken;
		function getCityRoadIndicatorLight():AsyncToken;

		/**
		 * 单个网元gis定位 moId 网元id
		 * */
		function getMoLatitudeByMoId(param:Object):AsyncToken;
		/**
		 * 多个网元gis定位 moId 网元id
		 * */
		function getMultiMoLatitudeByMoId(param:Object):AsyncToken;
		function queryMoByCon(p:Object):AsyncToken;
		function queryMoContains(p:Object):AsyncToken;
	}
}

