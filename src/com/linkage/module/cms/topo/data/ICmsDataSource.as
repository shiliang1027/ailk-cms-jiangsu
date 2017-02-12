package com.linkage.module.cms.topo.data
{
	import mx.collections.IList;

	/**
	 * CMS拓扑的数据源接口
	 * @author duangr
	 *
	 */
	public interface ICmsDataSource
	{
		/**
		 * 查询权限范围内的属地<br>
		 * 返回XML格式为
		 * <pre>
		 * 	&ltcitys&gt&ltcity k='' v='' /&gt&lt/citys&gt
		 * </pre>
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryCitys(success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询1,2级全部的属地<br>
		 * 返回XML格式为
		 * <pre>
		 * 	&ltcitys&gt&ltcity k='' v='' /&gt&lt/citys&gt
		 * </pre>
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryAllCitys(success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询子属地列表<br>
		 * 返回XML格式为
		 * <pre>
		 * 	&ltcitys&gt&ltcity k='' v='' /&gt&lt/citys&gt
		 * </pre>
		 * @param cityId 属地id
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function querySubCitys(cityId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询集客服务级别(钻石服务等) <br/>
		 * 返回XML格式为
		 *
		 * <pre>
		 * &ltservlevels&gt&ltservlevel k='' v='' /&gt&lt/servlevels&gt
		 * </pre>
		 *
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryServLevels(success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询权限范围内的专业<br>
		 * 返回XML格式为
		 * <pre>
		 * 	&ltspecs&gt&ltspec k='' v='' /&gt&lt/specs&gt
		 * </pre>
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function querySpecs(success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询全部的专业<br>
		 * 返回XML格式为
		 * <pre>
		 * 	&ltspecs&gt&ltspec k='' v='' /&gt&lt/specs&gt
		 * </pre>
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryAllSpecs(success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询全部的网元类型<br>
		 * 返回XML格式为
		 * <pre>
		 * 	&ltmo_types&gt&ltmo_type k='类型id' v='类型名称' dc='类型描述' /&gt&lt/mo_types&gt
		 * </pre>
		 *
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryAllMoTypes(success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 根据专业id查询网元类型列表<br>
		 * 返回XML格式为
		 * <pre>
		 * 	&ltmo_types&gt&ltmo_type k='类型id' v='类型名称' dc='类型描述' /&gt&lt/mo_types&gt
		 * </pre>
		 *
		 * @param specId 专业id
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryMoTypesBySpec(specId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 根据网元类型查询对应属性id<br>
		 * <pre>
		 *	&ltattrs&gt&ltattr k='属性key' v='属性英文名' dc='属性中文名'/&gt&lt/attrs&gt
		 * </pre>
		 *
		 * @param moTypeId 网元类型id
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryMoTypeAttrId(moTypeId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 根据网元类型和属性id查找对应的属性值<br>
		 * <pre>
		 * &ltattrs&gt&ltattr v='属性值'/&gt&lt/attrs&gt
		 * </pre>
		 * @param moTypeId 网元类型id
		 * @param attrId 属性id
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryMoAttrValue(moTypeId:String, attrId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询权限内MO对象<br>
		 * <pre>
		 * &ltmos&gt
		 * 	&ltmo id='id' n='名称' an='别名'
		 * 	 c='属地id' cn='属地名称' s='专业id' sn='专业名称'
		 * 	 t='类型id' tn='类型名称'/&gt
		 * &lt/mos&gt
		 * </pre>
		 *
		 * @param moName 网元名称
		 * @param cityId 属地id(-1代表全部)
		 * @param specId 专业id(-1代表全部)
		 * @param moTypeId 网元类型id(-1代表全部)
		 * @param attrs 属性Map<属性key,属性值ArrayList>
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryAreaMos(moName:String, cityId:String, specId:String, moTypeId:String, attrs:Object, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询MO对象(无权限过滤)<br>
		 * <pre>
		 * &ltmos&gt
		 * 	&ltmo id='id' n='名称' an='别名'
		 *   c='属地id' cn='属地名称'
		 *   sc='区县id' scn='区县名称'
		 *   s='专业id' sn='专业名称'
		 *   t='类型id' tn='类型名称'/&gt
		 * &lt/mos&gt
		 * </pre>
		 *
		 * @param moName 网元名称
		 * @param upperMoName 上联网元名称
		 * @param cityId 属地id(-1代表全部)
		 * @param countyId 区县id(-1代表全部)
		 * @param specId 专业id(-1代表全部)
		 * @param moTypeId 网元类型id(-1代表全部)
		 * @param attrs 属性Map<属性key,属性值ArrayList>
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryMos(moName:String, upperMoName:String, cityId:String, countyId:String, specId:String, moTypeId:String, attrs:Object, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询MO的属性详情<br>
		 * <pre>
		 * &ltmo&gt
		 * 	&ltattr name='属性名称' value='属性值'/&gt
		 * &lt/mo&gt
		 * </pre>
		 * @param moId
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryMoAttr(moId:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询两个MO之间链路的属性详情<br>
		 * <pre>
		 * &ltlink&gt
		 * 	&ltattr name='属性名称' value='属性值'/&gt
		 * &lt/link&gt
		 * </pre>
		 * @param moId1
		 * @param moId2
		 * @param moTypeId1
		 * @param moTypeId2
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryLinkAttr(moId1:String, moId2:String, moTypeId1:String, moTypeId2:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询电路的属性详情 <br>
		 * <pre>
		 * &ltCircuit&gt
		 * 	&ltattr name='属性名称' value='属性值'/&gt
		 * &lt/Circuit&gt
		 * </pre>
		 *
		 * @param cuid
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryCircuitAttr(cuid:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 跟电路两端网元查询电路列表
		 * @param moId1 网元id1
		 * @param moId2 网元id2
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryCircuits(moId1:String, moId2:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 根据电路id(可为空)或电路编号查询电路列表
		 * @param circId 电路id
		 * @param circCode 电路编号
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryCircuitsByIdOrCode(circId:String, circCode:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查看光路列表
		 * @param cuId 电路id
		 * @param cuName 电路名称
		 * @param moA A端网元名称
		 * @param moZ Z端网元名称
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryOpticRoutes(cuId:String, cuName:String, moA:String, moZ:String, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询网元的工程状态
		 * @param moIds mo_id列表
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryWorkStatus(moIds:IList, success:Function, complete:Function = null, error:Function = null):void;

		/**
		 * 查询网元的传输关联关系<br>
		 *<pre>
		 *&ltrelations up_id='' up_name='' down_id='' down_name=''&gt
		 * &ltrelation id='电路id' name='电路名称'
		 *  serv_a_id='' serv_a_name='' serv_z_id='' serv_z_name=''
		 *  tran_a_id='' tran_a_name='' tran_z_id='' tran_z_name='' /&gt
		 *&lt/relations&gt
		 *</pre>
		 *
		 * @param moId1
		 * @param moId2
		 * @param success 成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 *
		 */
		function queryMoTranRelations(moId1:String, moId2:String, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询集客类型信息
		 * @param success  成功后回调函数,参数为 xml:XML <br/> 格式为: functin(data:XML):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 * 
		 */		
		function queryCustCommType(success:Function, error:Function = null):void;
		
		/**
		 * 查询集客数据信息
		 * @param success  成功后回调函数,参数为map:MAP <br/> 格式为: functin(data:Map):void{ ... }
		 * @param complete 不管成功还是失败,都要回调的函数,无参数<br/> 格式为: functin():void{ ... }
		 * @param error 失败后回调函数<br/> 格式为: functin():void{ ... }
		 * 
		 */		
		function queryResouceInfo(param:Object,success:Function,complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询动态作图的线路信息
		 * 
		 */
		function queryTopoLinkObjects(param:Object,success:Function,complete:Function=null,error:Function=null):void;
	}
}