package com.qdum.llhb.hbshop.controller;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.backmana.model.BusinessCollect;
import com.qdum.llhb.backmana.model.SupplyHotQuery;
import com.qdum.llhb.common.security.shiro.SystemAuthorizingRealm.Principal;
import com.qdum.llhb.common.utils.StringUtils;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.productmana.ProdTypeUtils;
import com.qdum.llhb.productmana.model.PraiseLabel;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.productmana.model.ProductPraise;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.DictUtils;
import com.qdum.llhb.sys.utils.UserUtils;
@ControllerBind(controllerKey="/hbshop")
public class HBShopController extends Controller{
	public static final long AREA_ROOT_ID = 1L;
	public  int pageSize = 8;
	public static final String de_order = "page_view";//默认热门排序，即浏览量
	public static final String com_order = "comprehensive";
	public static final String de_sort = "DESC";//默认倒序
	private static final long RIGHT_AD_LABEL_ID= 18L;//环保商城首页列表右侧广告的label id
	private static final long ENTERPRISE_AD_LABEL_ID= 17L;//环保商城详情页面推荐企业的label id
 	//@ActionKey("mall")
	public void index_v1(){
		List<Map<String,Object>> typeList = ProdTypeUtils.selectType();
		setAttr("typeList",typeList);
		Area.dao.setId(AREA_ROOT_ID);
		List<Area> provList = Area.dao.getChildList();
		setAttr("provList",provList);
		String typeFirst = getPara("typeFirst");
		setAttr("typeFirst",typeFirst);
		String proName = getPara("proName");
		setAttr("proName",proName);
		List<Record> proList = Product.dao.findProduct(typeFirst, "", "", proName, "", de_order, de_sort, 0, pageSize);//默认倒序
		List<Product> proCountList = Product.dao.findProductCount("","", "", "", "");
	//	List<Map<String,Object>> mapList = mapList(proList,proCountList,0);
		int curPage = 0;
		int proCount = proCountList.size();
		if(proList != null && proCount > 0){
			curPage = 1;
		}else{
			curPage = 0;
		}
		setAttr("curPage",curPage);
		setAttr("proCount",proCount);
		setAttr("proList",proList);
		setAttr("countPage",(int)Math.ceil(proCount/(pageSize+0.0)));
		setAttr("pageSize",pageSize);
		//列表右侧广告
		List<AdImages> adImgList = AdImages.dao.getImgListByLabelID(RIGHT_AD_LABEL_ID);
		setAttr("adImgList",adImgList);
		List<Record> ads = AdLable.dao.getIndexImg();//搜索框右侧广告
		setAttr("ads",ads);
		
		//获取链接里面带的参数
		String urlPara = getPara(0);
		if(StringUtils.isEmpty(urlPara)){
			urlPara = "";
		}
		setAttr("urlPara",urlPara);
		render("hbShop.jsp");
	}
	
	
	/**
	 *查询子类 
	 */
	public void selectSubType(){
		String parentId = getPara("parentId");
		List<DictPcr> list = null;
		if(parentId != null && !parentId.equals("")){
			list = DictPcr.dao.getChildList(Long.parseLong(parentId));
			List<Map<String,Object>> mapList =Lists.newArrayList();
			for(int i=0; i<list.size(); i++){
				DictPcr e = list.get(i);
				if(e!=null){
					Map<String, Object> map = Maps.newHashMap();
					map.put("id",e.getId());
					map.put("pId",e.getParentId());
					map.put("pIds",e.getParentIds());
					map.put("type", e.getType());
					map.put("name",e.getName());
					mapList.add(map);
				}
			}
			renderJson(mapList);
		}
	}
	
	/**
	 *查询方法 
	 */
	public void searchProduct(){
		String typeFirst = getPara("typeFirst");
		String typeSecond = getPara("typeSecond");
		String typeThird = getPara("typeThird");
		String provId = getPara("provId");
		String proName = getPara("proName");
		String orderBy = getPara("orderBy");
		if(orderBy == null || orderBy.equals("") || orderBy.equals("undefined")){
			orderBy = de_order;
		}
		String sort = getPara("sort");
		String curPageString = getPara("curPage");
		String view = getPara("view");
		if(view!= null && !view.equals("") && view.equals("bigPic")){
			pageSize = 20;//在大图模式下每页的数量
		}
		int pageIndex = 0;
		int curPage = 0;
		if(curPageString!=null && !curPageString.equals("") && !curPageString.equals("undefined")){
			pageIndex = (Integer.parseInt(curPageString)-1)*pageSize;
			if(pageIndex <0){
				pageIndex = 0;
			}
			curPage = (pageIndex/pageSize) + 1;
		}
		/******添加热门搜索数据**********/
		if(typeFirst != null && !typeFirst.equals("") && proName != null && !proName.equals("")){
			String hbType = "P";//设置环保商城类型，P
			SupplyHotQuery result = SupplyHotQuery.dao.findHot(hbType, typeFirst,proName);//查询热门搜索中有该条
			if(result != null && !result.equals("")){
				long count = result.get("query_count");
				count++;
				result.set("query_count", count);
				result.update();
			}else{
				SupplyHotQuery hq = new SupplyHotQuery();
				hq.set("type", hbType);
				hq.set("type_id", typeFirst);
				hq.set("query_word", proName);
				hq.set("query_count", 1);
				hq.save();
			}
		}
	
		List<Record> proList = Product.dao.findProduct(typeFirst, typeSecond, typeThird, proName, provId, orderBy, sort, pageIndex, pageSize);
		if(proList != null){
			for(int i=0;i<proList.size();i++){
				if(null == proList.get(i).get("company_name")){
					proList.get(i).set("company_name","");//处理公司名为null的情况
				}
			}
		}
		List<Product> proCountList = Product.dao.findProductCount(typeFirst, typeSecond, typeThird, proName, provId);
		List<Map<String,Object>> mapList = mapList(proList,proCountList,curPage);
		renderJson(mapList);
	}
	/**
	 *查询列表包装类 
	 */
	public List<Map<String,Object>> mapList(List<Record> proList,List<Product> countAudit, int curPage){
		List<Map<String,Object>> mapList =Lists.newArrayList();
		int proCount = countAudit.size();
		if(proList != null && proList.size() >0){
			for (Record e : proList) {
				if(e!=null){
					Map<String,Object> map = Maps.newHashMap();
					map.put("id", e.get("id"));
					map.put("pic1", e.get("pic1"));	
					map.put("pic2", e.get("pic2"));
					map.put("pic3", e.get("pic3"));
					map.put("company_name",e.get("company_name"));
					map.put("auth_flag",e.get("auth_flag"));
					map.put("youyi_flag",e.get("youyi_flag"));
					map.put("c_id",e.get("c_id"));
					map.put("per_flag", e.get("per_flag"));
					map.put("pro_name",e.get("pro_name"));
					map.put("pro_desc", e.get("pro_desc"));
					map.put("prov_name",e.get("prov_name"));
					map.put("city_name",e.get("city_name"));
					map.put("curPage",curPage);
					map.put("proCount",proCount);
					mapList.add(map);
				}
			}
		}else{
			Map<String,Object> map = Maps.newHashMap();
			curPage = 0;
			map.put("curPage",curPage);
			map.put("proCount",proCount);
			mapList.add(map);
		}
		return mapList;
	}
	/**
	 *环保商城详情 
	 */

	public void detail_v1(){
        String id = getPara();
        if(StringUtils.isBlank(id)){
            id = getPara("id");
        }
		if(id!=null && !id.equals("")){
			if(id.matches("[0-9]+")){
				long proId = -1L;
				proId = Long.parseLong(id);
				if(proId >= 0L){
					Record product = Product.dao.findProById(proId);
					if(product != null){
						setAttr("pro",product);
                        setAttr("proDesc", DictUtils.delHTMLTag(product.getStr("pro_desc")));
						//获取商品类别
						List<Map<String,Object>> typeList = ProdTypeUtils.selectType();
						setAttr("typeList",typeList);
						//获取评价标签
						List<Dict> praiseLabel = Dict.dao.getDictsByType("praise_type"); //放入二级
						setAttr("praiseLabel",praiseLabel);
						//商家是否在线
						String loginName = product.get("login_name");
						int status = isOnline(loginName);
						setAttr("status",status);
						//记录浏览次数
						long pageView =Long.valueOf(product.get("page_view").toString());
						Product.dao.findById(proId).set("page_view", pageView+1).update();//bug：每次刷新页面，记录增加两条
						long proCreateBy = Long.valueOf(product.get("create_by").toString());
						//其他产品
						List<Record> otherPro = Product.dao.findByCreateBy(proId, proCreateBy);
						setAttr("otherPro",otherPro);
						//其他公司的相似商品
						long proTypeFirst = Long.valueOf(product.get("type_first").toString());
						List<Record> otherProBus = Product.dao.findByType(proTypeFirst, proCreateBy);
						setAttr("otherProBus",otherProBus);
						//评价分页
						String praNum ="";
						Page<Record> praiseList = ProductPraise.dao.findPraiseByPraNum(1, pageSize, proId,praNum);//放入二级页面
						if(!(praiseList.getList().isEmpty())){
							List<Object> list = mapPraList(praiseList.getList());
							setAttr("praiseList",list);
							setAttr("recordPage",praiseList);
						}
						//各个评价总数
						List<ProductPraise> praCountList = ProductPraise.dao.getPraiseCount(proId);//放入二级页面
						if(!praCountList.isEmpty()){
							for (ProductPraise e : praCountList) {
								String praNumTemp = e.get("pra_num").toString();
								if(praNumTemp.equals("5")){
									setAttr("goodCount", e.get("pra_count").toString());
								}else if(praNumTemp.equals("3")){
									setAttr("mediumCount", e.get("pra_count").toString());
								}else if(praNumTemp.equals("1")){
									setAttr("badCount", e.get("pra_count").toString());
								}
							}
						}else{
							setAttr("goodCount","0");
							setAttr("mediumCount","0");
							setAttr("badCount","0");
						}
						//热门商品
						List<Record> hs = Product.dao.findHotPrdoducts();
						setAttr("hs",hs);
						//热门供应
						/*List<Record> hs = SupplyInfo.dao.getHotSupply();
						setAttr("hs",hs);*/
						List<Record> ads = AdLable.dao.getIndexImg();//搜索框右侧广告
						setAttr("ads",ads);
						//推荐企业广告
						List<AdImages> adImgList = AdImages.dao.getImgListByLabelID(ENTERPRISE_AD_LABEL_ID);
						setAttr("companyAdList",adImgList);
						render("hbShopDetail.jsp");
					}else{
						render("/WEB-INF/views/error/404.jsp");
					}
				}else{
					render("/WEB-INF/views/error/404.jsp");
				}
			}else{
				render("/WEB-INF/views/error/404.jsp");
			}
		}else{
			render("/WEB-INF/views/error/404.jsp");
		}
		
	}

	/**
	 *判断目标用户是否在线 
	 */
	public int isOnline(String loginName){
		int status = 0;
		org.apache.shiro.web.mgt.DefaultWebSecurityManager sm = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
		DefaultWebSessionManager dsm = (DefaultWebSessionManager) sm.getSessionManager();
		SessionDAO dao = dsm.getSessionDAO();
		//获取当前系统中所有有效session
		Collection<Session> sessions = dao.getActiveSessions();
		for (Session se : sessions) {
			SimplePrincipalCollection spc = (SimplePrincipalCollection)(se.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));
			if(null != spc){
				Principal p = (Principal)(spc.getPrimaryPrincipal());
				if(p.getLoginName().equals(loginName)){
					status = 1;
					break;
				}
			}
		}
		return status;
	}
	/**
	 *收藏商品
	 */
	public void businessCollect(){
		String type = getPara("type");
		String collectId = getPara("collectId");
		Date date = new Date();
		User user = UserUtils.getUser();
		BusinessCollect busCollect = null;
		if(collectId != null){
			busCollect = BusinessCollect.dao.findCollet(type, collectId,user.getId());
			if(busCollect != null && !busCollect.equals("")){//表示已经收藏
				renderJson(false);
				
			}else{
				BusinessCollect busiCollect = new BusinessCollect();
				busiCollect.set("collect_id",collectId);
				busiCollect.set("type",type);
				busiCollect.set("create_by",user.getId());
				busiCollect.set("create_date",date);
				busiCollect.save();
				new PointController().dailyCollectStore("product", Long.parseLong(collectId));//收藏商品获取积分
				renderJson(true);
			}
		}else{
			renderJson("error");
		}
	}
	/**
	 *添加其他商品 
	 */
	public void addOtherPro(){
		String idString = getPara("id");
		String createByString = getPara("createBy");
		long id = 0L;
		long createBy = 0L;
		if(idString != null && !idString.equals("") && !idString.equals("undefined")){
			id = Long.parseLong(idString);
		}
		if(createByString != null && !createByString.equals("") && !createByString.equals("undefined")){
			createBy = Long.parseLong(createByString);
		}
		List<Record> otherProList = Product.dao.findByCreateBy(id,createBy);
		List<Map<String,Object>> mapOtherProList = mapOtherProList(otherProList);
		renderJson(mapOtherProList);
	}
	/**
	 *添加其他商品包装类 
	 */
	public List<Map<String,Object>> mapOtherProList(List<Record> proList){
		 int show_other_pro_num = 12;//显示其他商品的个数
		List<Map<String,Object>> mapList =Lists.newArrayList();
		if(proList != null && proList.size() >0){
			for (int i=0; i<show_other_pro_num; i++) {
				Record e = proList.get(i);
				if(e!=null){
					Map<String,Object> map = Maps.newHashMap();
					map.put("id", e.get("id"));
					map.put("pic1", e.get("pic1"));	
					map.put("pic2", e.get("pic2"));
					map.put("pic3", e.get("pic3"));
					map.put("pro_name",e.get("pro_name"));
					map.put("auth_flag", e.get("auth_flag"));
					mapList.add(map);
				}
			}
		}
		return mapList;
	}
	/**
	 *我要评价 
	 */
	public void willPraise(){
		User user = UserUtils.getUser();
		if(user.getId()!=null && !user.getId().equals("")){
			long proId = getParaToLong("proId");
			String praNumString = getPara("praNum");
			int praNum = 0;//5：好评  3：中评  1：差评
			if(praNumString!=null && !praNumString.equals("") && !praNumString.equals("undefined")){
				praNum = Integer.parseInt(praNumString);	
			}
			String labelText = getPara("labelText");
			String praDesc = getPara("praDesc");
			int isNiMing = getParaToInt("isNiMing");
			long createBy = getParaToLong("createBy");//产品的创建人
			String pics = getPara("imgSrcs");
			Date curDate = new Date();
			if(user.getId() == createBy){
				renderJson(false);
			}else{
				ProductPraise praise = new ProductPraise();
				praise.setProductId(proId);
				praise.setPraNum(praNum);
				praise.setPraDesc(praDesc);
				praise.setPraImgs(pics);
				praise.setIsNiMing(isNiMing);
				praise.setCreateBy(user.getId());
				praise.setCreateDate(curDate);
				boolean isPraise = praise.save();
				if(isPraise){
					new PointController().commentProduct(praise.getId());//评论增加积分
				}
				long praiseId = praise.getId();
				if(labelText != null && labelText.length() >1){
					labelText = labelText.substring(0, labelText.length()-1);
					String[] labelString = labelText.split(",");
					for (String e : labelString) {
						PraiseLabel label = new PraiseLabel();
						label.setPraiseId(praiseId);
						label.setLabelTextm(e);
						label.setCreateBy(user.getId());
						label.setCreateDate(curDate);
						label.save();
					}
				}
				List<Map<String,Object>> list = Lists.newArrayList();
				Map<String,Object> map = Maps.newHashMap();
				//评价总数
				List<ProductPraise> praCountList = ProductPraise.dao.getPraiseCount(proId);
				if(!praCountList.isEmpty()){
					for (ProductPraise e : praCountList) {
						String praNumTemp = e.get("pra_num").toString();
						if(praNumTemp.equals("5")){
							map.put("goodCount", e.get("pra_count"));
						}else if(praNumTemp.equals("3")){
							map.put("mediumCount", e.get("pra_count"));
						}else if(praNumTemp.equals("1")){
							map.put("badCount", e.get("pra_count"));
						}
					}
				}else{
					map.put("goodCount",0);
					map.put("mediumCount",0);
					map.put("badCount",0);
				}
				list.add(map);
				renderJson(list);
			}
		}else{
			renderJson("0");//用户未登陆
		}
	}
	/**
	 *查询累计评价列表 
	 */
	public void allPraise(){
		long proId = getParaToLong("proId");
		int curPage = getParaToInt("curPage");
		String praNum = getPara("praNum");
		Page<Record> praiseList = ProductPraise.dao.findPraiseByPraNum(curPage,pageSize,proId,praNum);
		if(!(praiseList.getList().isEmpty())){
			List<Object> list = mapPraList(praiseList.getList());
			list.add(praiseList);
			renderJson(list);
		}else{
			renderJson(false);
		}
	}
	/**
	 *分类查询累计评价列表 
	 */
	public void praiseByPraNum(){
		long proId = getParaToLong("proId");
		int curPage = getParaToInt("curPage");
		String praNum = getPara("praNum");
		Page<Record> praiseList = ProductPraise.dao.findPraiseByPraNum(curPage, pageSize, proId, praNum);
		if(!(praiseList.getList().isEmpty())){
			List<Object> list = mapPraList(praiseList.getList());
			Map<String,Object> map = Maps.newHashMap();
			/*map.put("recordPage", praiseList);
			list.add(map);*/
			renderJson(list);
		}
	}
	/**
	 *累计评价包装类 
	 */
	public List<Object> mapPraList(List<Record> proList){
		List<Object> mapList =Lists.newArrayList();
		if(proList != null && proList.size() >0){
			for (Record e : proList) {
				if(e!=null){
					Map<String,Object> map = Maps.newHashMap();
					map.put("id", e.get("id"));
					//取评论图片
					String imgs = "";
					if(e.get("pra_imgs")!=null && !e.get("pra_imgs").equals("")){
						String pics = e.get("pra_imgs").toString();
						pics = pics.substring(0, pics.length()-1);
						String[] pic = pics.split(",");
						for (String s:pic) {
							imgs +="<img src='"+s+"' style='width:44px; height:44px;'/>";
						}
					}
					map.put("login_name",e.get("login_name"));
					map.put("pra_desc",e.get("pra_desc"));
					map.put("create_date",e.get("create_date"));
					map.put("is_niming", e.get("is_niming"));
					map.put("imgs", imgs);
					mapList.add(map);
				}
			}
		}
		return mapList;
	}
	/**
	 *查询评价标签的数量 
	 */
	public void praiseLabelCount(){
		String proIdStr = getPara("proId");
		if(proIdStr != null && !proIdStr.equals("")){
			if(proIdStr.matches("[0-9]+")){
				long proId = getParaToLong("proId");
				List<Record> labelList = ProductPraise.dao.getPraiseLabel(proId);
				List<Map<String,Object>> list = Lists.newArrayList();
				for (Record e : labelList) {
					if(e!=null){
						Map<String,Object> map = Maps.newHashMap();
						map.put("value", e.get("label_text"));
						map.put("count", Long.valueOf(e.get("label_count").toString()));
						list.add(map);
					}
				}
				renderJson(list);
				
			}else{
				render("/WEB-INF/views/error/404.jsp");
			}
		}else{
			render("/WEB-INF/views/error/404.jsp");
		}
		
	}
	
	
	//===============================================================
	@ActionKey("mall")
	public void index(){
		//获取商品分类
		List<Map<String,Object>> typeList = ProdTypeUtils.selectType();
		setAttr("typeList",typeList);
		
		//获取大分类下的一级分类
		List<Record> type0 = Db.find("select * from sys_dict_pcr where del_flag='0' and parent_id = ?",typeList.get(0).get("id"));
		List<Record> type1 = Db.find("select * from sys_dict_pcr where del_flag='0' and parent_id = ?",typeList.get(1).get("id"));
		List<Record> type2 = Db.find("select * from sys_dict_pcr where del_flag='0' and parent_id = ?",typeList.get(2).get("id"));
		setAttr("t0", type0);
		setAttr("t1", type1);
		setAttr("t2", type2);
		
		//查询省份
		Area.dao.setId(AREA_ROOT_ID);
		List<Area> provList = Area.dao.getChildList();
		setAttr("provList",provList);
		
		//查询商品
		pageSize = 20;
		List<Record> proList = Product.dao.findProduct("", "", "", "", "", com_order, de_sort, 0, pageSize);//默认倒序
		if(proList != null){
			for(int i=0;i<proList.size();i++){
				if(null == proList.get(i).get("company_name")){
					proList.get(i).set("company_name","");//处理公司名为null的情况
				}
			}
		}
		setAttr("proList",proList);
		
		
		//查询总数量及处理分页信息
		List<Product> proCountList = Product.dao.findProductCount("","", "", "", "");
		int curPage = 0;
		int proCount = proCountList.size();
		if(proList != null && proCount > 0){
			curPage = 1;
		}else{
			curPage = 0;
		}
		setAttr("curPage",curPage);
		setAttr("proCount",proCount);
		setAttr("countPage",(int)Math.ceil(proCount/(pageSize+0.0)));
		setAttr("pageSize",pageSize);
		
		//用于页面点击指定商品分类
		String typeStr=getPara(0);
		String prodType=null;
		if(typeStr!=null){
			String [] types=typeStr.split(",");
			prodType=types[0];
			if(types.length>1){
				prodType=types[1];
			}
			setAttr("prodType",prodType);
		}
		
		//广告
		List<AdImages> adImgList = AdImages.dao.getImgListByLabelID(RIGHT_AD_LABEL_ID);
		setAttr("adImgList",adImgList);
		
		render("../v2/hbshop/hbshop.jsp");
	}
	
	
    @ActionKey("/mall/detail")
	public void detail(){
		 String id = getPara();
	        if(StringUtils.isBlank(id)){
	            id = getPara("id");
	        }
			if(id!=null && !id.equals("")){
				if(id.matches("[0-9]+")){
					long proId = -1L;
					proId = Long.parseLong(id);
					if(proId >= 0L){
						Record product = Product.dao.findProById(proId);
						if(product != null){
							setAttr("pro",product);
	                        setAttr("proDesc", DictUtils.delHTMLTag(product.getStr("pro_desc")));
							//获取商品类别
							List<Map<String,Object>> typeList = ProdTypeUtils.selectType();
							setAttr("typeList",typeList);
							//获取评价标签
							List<Dict> praiseLabel = Dict.dao.getDictsByType("praise_type"); //放入二级
							setAttr("praiseLabel",praiseLabel);
							//商家是否在线
							String loginName = product.get("login_name");
							int status = isOnline(loginName);
							setAttr("status",status);
							//记录浏览次数
							long pageView =Long.valueOf(product.get("page_view").toString());
							Product.dao.findById(proId).set("page_view", pageView+1).update();//bug：每次刷新页面，记录增加两条
							long proCreateBy = Long.valueOf(product.get("create_by").toString());
							//其他产品
							List<Record> otherPro = Product.dao.findByCreateBy_v2(proId, proCreateBy,3);
							setAttr("otherPro",otherPro);
							//其他公司的相似商品
							long proTypeFirst = Long.valueOf(product.get("type_first").toString());
							List<Record> otherProBus = Product.dao.findByType(proTypeFirst, proCreateBy);
							setAttr("otherProBus",otherProBus);
							//评价分页
							String praNum ="";
							Page<Record> praiseList = ProductPraise.dao.findPraiseByPraNum(1, pageSize, proId,praNum);//放入二级页面
							if(!(praiseList.getList().isEmpty())){
								List<Object> list = mapPraList(praiseList.getList());
								setAttr("praiseList",list);
								setAttr("recordPage",praiseList);
							}
							//各个评价总数
							List<ProductPraise> praCountList = ProductPraise.dao.getPraiseCount(proId);//放入二级页面
							if(!praCountList.isEmpty()){
								for (ProductPraise e : praCountList) {
									String praNumTemp = e.get("pra_num").toString();
									if(praNumTemp.equals("5")){
										setAttr("goodCount", e.get("pra_count").toString());
									}else if(praNumTemp.equals("3")){
										setAttr("mediumCount", e.get("pra_count").toString());
									}else if(praNumTemp.equals("1")){
										setAttr("badCount", e.get("pra_count").toString());
									}
								}
							}else{
								setAttr("goodCount","0");
								setAttr("mediumCount","0");
								setAttr("badCount","0");
							}
							//热门商品
							List<Record> hs = Product.dao.findHotPrdoducts();
							setAttr("hs",hs);
							//热门供应
							/*List<Record> hs = SupplyInfo.dao.getHotSupply();
							setAttr("hs",hs);*/
							List<Record> ads = AdLable.dao.getIndexImg();//搜索框右侧广告
							setAttr("ads",ads);
							//推荐企业广告
							List<AdImages> adImgList = AdImages.dao.getImgListByLabelID(ENTERPRISE_AD_LABEL_ID);
							setAttr("companyAdList",adImgList);
							
							//是否登录
							SecurityUtils.getSubject().isAuthenticated();
							if(SecurityUtils.getSubject().isAuthenticated()== true){
								setAttr("loginFlag", "1");
								User user = UserUtils.getUser();
								List<Record> collect = Db.find("SELECT * FROM ms_business_collect c"
										+ " WHERE c.del_flag=0 and c.type='4' AND c.collect_id='"+proId+"'"
												+ " AND c.create_by='"+user.getId()+"'");
								if(collect != null){
									setAttr("collectFlag", "1");
								}else{
									setAttr("collectFlag", "0");
								}
							}else{
								setAttr("loginFlag", "0");
								setAttr("collectFlag", "0");
							}
							
							
							render("../v2/hbshop/hbShopDetail.jsp");
						}else{
							render("/WEB-INF/views/error/404.jsp");
						}
					}else{
						render("/WEB-INF/views/error/404.jsp");
					}
				}else{
					render("/WEB-INF/views/error/404.jsp");
				}
			}else{
				render("/WEB-INF/views/error/404.jsp");
			}
		
	}
	
	
}
