/**requireJs js模块管理主文件
 */

console.log("js loading.......");

require.config({
	paths : {
		jquery : '../jquery-1.11.2.min',
		jqui : '../jquery-ui',
		bglp : '../jquery.bigcolorpicker.min',
		afu : '../ajaxfileupload',
		flexslider : ctxStatic+'/flexslider/jquery.flexslider',
		mainPl : '../main-pl',
		layer : ctxStatic+'/layer/layer',
		common : 'common',
		library :'library',
		llhbCommon :ctxStatic+'/js/llhb/common'
	},
	shim : {
		jqui : [ 'jquery' ],
		'scroll' : [ 'jquery' ],
		bglp : [ 'jquery' ],
		afu : [ 'jquery' ],
		flexslider : [ 'jquery' ],
		layer : ['jquery'],
		library : ['common'],
		llhbCommon : ['jquery']
	}
});

require([ 'jquery', 'jqui', 'flexslider', 'afu', 'scroll', 'bglp','layer'], function($) {
	require(['common','index','library','llhbCommon'],function($){
		console.log("js loaded.......");
	});
});
