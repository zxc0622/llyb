package com.qdum.llhb.zixun.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.infomaintain.model.InfoMaintAttachment;
import com.qdum.llhb.infomaintain.model.InfoMaintain;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.recruitment.model.RecuitmentInfomation;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.utils.DictUtils;

import net.sf.json.JSONArray;

@ControllerBind(controllerKey="/zixun")
public class ZiXunController extends Controller{
	public static final long RIGHT_AD_LABEL_ID = 20;//资讯首页广告轮播五张
	public static final long BUSS_AD_LABEL_ID = 21;//资讯首页广告推荐商家
	public static final long MID_AD_LABEL_ID = 33;//资讯首页中间横幅广告
	
	public static final String DEF_INFO_TYPE = "ep_news";//设置首页默认展示类型
	/*public void index(){  ///原资讯首页
		List<Record> infoList = InfoMaintain.dao.getInfoList();
		if(infoList!=null){
			setAttr("newsList", mapList(infoList,"ep_news"));
			setAttr("knowList", mapList(infoList,"ep_know"));
			setAttr("showList", mapList(infoList,"ep_show"));
			setAttr("isTopList",newList(infoList,"isTop"));
			setAttr("isPicList",newList(infoList,"isPic"));
			setAttr("isNewShowList",newList(infoList,"isNewShow"));
			//列表右侧广告
			List<AdImages> adImgList = AdImages.dao.getImgListByLabelID(RIGHT_AD_LABEL_ID);
			setAttr("adImgList",adImgList);
			List<AdImages> bussAdImgList = AdImages.dao.getImgListByLabelID(BUSS_AD_LABEL_ID);
			setAttr("bussAdImgList",bussAdImgList);
			List<AdImages> mediuAdImgList = AdImages.dao.getImgListByLabelID(mediu_AD_LABEL_ID);
			setAttr("mediuAdImgList",mediuAdImgList);
			render("zixun.jsp");
		}
	}*/
	public void index_v1(){  ///资讯首页
		//List<Record> infoList = InfoMaintain.dao.getInfoList();
        List<Record> newsList = InfoMaintain.dao.getInfoListByType("ep_news");
        List<Record> knowList = InfoMaintain.dao.getInfoListByType("ep_know");
        List<Record> showList = InfoMaintain.dao.getInfoListByType("ep_show");
        List<Record> bidsList = InfoMaintain.dao.getInfoListByType("pr_bids");
        //List<Record> hireList = InfoMaintain.dao.getInfoListByType("pe_hire");
        List<Record> hireList = RecuitmentInfomation.dao.getLastest(8);
		List<Record> youyiList = InfoMaintain.dao.getInfoListByType("youyi_news");
        setAttr("newsList", mapList(newsList,"ep_news"));
        setAttr("knowList", mapList(knowList,"ep_know"));
        setAttr("showList", mapList(showList,"ep_show"));
        setAttr("bidsList",	mapList(bidsList,"pr_bids"));
        //setAttr("hireList",	mapList(hireList,"pe_hire"));
        setAttr("hireList",	hireList);
        setAttr("youyiList",mapList(youyiList, "youyi_news"));
        //列表右侧广告
        List<AdImages> adImgList = AdImages.dao.getImgListByLabelID(RIGHT_AD_LABEL_ID);
        setAttr("adImgList",adImgList);
        render("zixunIndex.jsp");
	}
	/*类别包装类*/
	public List<Map<String, Object>> mapList(List<Record> infoList,String type){
		List<Map<String, Object>> list = Lists.newArrayList();
		if(infoList!=null && infoList.size()>0){
			for (Record e : infoList) {
				if(type.equals(e.get("new_type"))){
					Map<String,Object> map = Maps.newHashMap();
					map.put("id", e.get("id"));
					map.put("source", e.get("source"));
					map.put("new_title", e.get("new_title"));
					map.put("small_img", e.get("small_img"));
					String i = "";
					if(e.get("new_content")!=null){
						i = e.get("new_content").toString();
					}
					map.put("new_content",DictUtils.delHTMLTag(i));
					map.put("time", e.get("time"));
					map.put("update_date", e.get("update_date"));
					list.add(map);
				}
			}
		}
		return list;
	}
	/**
	 *头条、资讯图片、展会信息
	 *@param type:头条、资讯图片、展会信息的数据库字段
	 * 头条：isTop 资讯图片：isPic 展会信息：isNewShow
	 */
	public static List<Map<String, Object>> newList(List<Record> infoList,String type){
		List<Map<String, Object>> list = Lists.newArrayList();
		if(infoList!=null && infoList.size()>0){
			for (Record e : infoList) {
				if(e.get(type)!=null && e.getBoolean(type)){//该字段不为空且为1
					Map<String,Object> map = Maps.newHashMap();
					map.put("id", e.get("id"));
					map.put("source", e.get("source"));
					map.put("new_title", e.get("new_title"));
					map.put("small_img", e.get("small_img"));
					map.put("hold_place", e.get("hold_place"));
					map.put("hold_time", e.get("hold_time"));
					String i = "";
					if(e.get("new_content")!=null){
						i = e.get("new_content").toString();
					}
					map.put("new_content",DictUtils.delHTMLTag(i));
					map.put("create_date", e.get("create_date"));
					map.put("update_date", e.get("update_date"));
					list.add(map);
				}
			}
		}
		return list;
	}
	
	public List<Map<String, Object>> list(List<Record> infoList){
		List<Map<String, Object>> list = Lists.newArrayList();
		if(infoList!=null && infoList.size()>0){
			for (Record e : infoList) {
				Map<String,Object> map = Maps.newHashMap();
				map.put("id", e.get("id"));
				map.put("source", e.get("source"));
				map.put("new_title", e.get("new_title"));
				map.put("small_img", e.get("small_img"));
				map.put("hold_place", e.get("hold_place"));
				map.put("hold_time", e.get("hold_time"));
				map.put("time", e.get("time"));
				String i = "";
				if(e.get("new_content")!=null){
					i = e.get("new_content").toString();
				}
				map.put("new_content",DictUtils.delHTMLTag(i));
				map.put("create_date", e.get("create_date"));
				map.put("update_date", e.get("update_date"));
				list.add(map);
			}
		}
		return list;
	}
	/***
	 * 更多资讯
	 * 
	 * @time 修改时间：2015年11月30日10:07:15
	 * @author zhaoyl
	 * 修改内容，将原来资讯更多页面修改为资讯首页     方法名：more ——>  index
	 * */
    @ActionKey("/news/more")
	public void more(String args){
		String type = args == null ? getPara("type") : args;
		if(type==null || type.equals("")){
			type = DEF_INFO_TYPE;
		}
		setAttr("type",type);
		int pageNumber = 1;
		String temp = getPara();
		if(temp!=null && !temp.equals("") && temp.matches("[0-9]+")){
			pageNumber = Integer.parseInt(temp);
		}
		
		int pageSize = 20;//每页条数
		Page<Record> infoPage = InfoMaintain.dao.getInfoBytype(pageNumber, pageSize, type);
		if(infoPage!=null){
			setAttr("infoList",list(infoPage.getList()));
			setAttr("recordPage",infoPage);
		}
		//List<Record> infoList = InfoMaintain.dao.getInfoList();
        List<Record> isPicList = InfoMaintain.dao.getInfoListByAttr("isPic");
        List<Record> isNewShowList = InfoMaintain.dao.getInfoListByAttr("isNewShow");
        setAttr("isPicList",newList(isPicList,"isPic"));//资讯图片
        setAttr("isNewShowList",newList(isNewShowList,"isNewShow"));//最新展会
        List<AdImages> mediuAdImgList = AdImages.dao.getImgListByLabelID(MID_AD_LABEL_ID);
        setAttr("mediuAdImgList",mediuAdImgList);
		render("zxMore.jsp");
	}

    public void youyiNews(){
        more("youyi_news");
    }

    public void more2(){
        more("ep_news");
    }
    
    public void more3(){
        more("ep_know");
    }
    public void more4(){
        more("ep_show");
    }
    @ActionKey("/news/project-biding")
    public void more5(){
        more("pr_bids");
    }
    
    public void more6(){
       // more("pe_hire");
		String type = "pe_hire";
		setAttr("type",type);

		int pageNumber = 1;
		String temp = getPara();
		if(temp!=null && !temp.equals("") && temp.matches("[0-9]+")){
			pageNumber = Integer.parseInt(temp);
		}

		int pageSize = 20;//每页条数



		String pageSizeStr = getPara("pageSize");
		setAttr("pageSize",pageSizeStr);
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		Page<Record> infoPage = RecuitmentInfomation.dao.getAllRecuPage(getParaToInt(0,1),pageSize);

		if(infoPage!=null){
			setAttr("infoList",infoPage.getList());
			setAttr("recordPage",infoPage);
		}

		List<AdImages> mediuAdImgList = AdImages.dao.getImgListByLabelID(MID_AD_LABEL_ID);
		setAttr("mediuAdImgList",mediuAdImgList);
		List<Record> isPicList = InfoMaintain.dao.getInfoListByAttr("isPic");
		List<Record> isNewShowList = InfoMaintain.dao.getInfoListByAttr("isNewShow");
		setAttr("isPicList",newList(isPicList,"isPic"));//资讯图片
		setAttr("isNewShowList",newList(isNewShowList,"isNewShow"));//最新展会

		render("/WEB-INF/views/infomaintain/recuitment/recuInfoMore.jsp");
    }


	/**
	 * 资讯详情
	 * */

	public void detail_v1(){
		String id = getPara();
        if(StringUtils.isBlank(id)){
            id = getPara("id");
        }
		if(id!=null && !id.equals("") && id.matches("[0-9]+")){
			List<Record> infoList = InfoMaintain.dao.getInfoList();
			if(infoList!=null){
				/*取出本条信息、上一篇和下一篇*/
				for(int i=0; i<infoList.size(); i++){
					String temp =infoList.get(i).get("id").toString(); 
					if(id.equals(temp)){
						if(i!=0){
							setAttr("prevInfo",infoList.get(i-1));
						}
						if(i!=infoList.size()-1){
							setAttr("nextInfo",infoList.get(i+1));
						}
					}
				}
				setAttr("isPicList",newList(infoList,"isPic"));//资讯图片
			}
            Record r = InfoMaintain.dao.getInfoById(id);
            setAttr("info",r);
            setAttr("deal_content",DictUtils.delHTMLTag(null ==  r ? "": r.getStr("new_content")));
            List<Dict> dictList = Dict.dao.getDictsByType("new_type");
			setAttr("dictList",dictList);
			List<Record> attachList = InfoMaintAttachment.dao.getAttachmentById(id);
			setAttr("attachList",attachList);

			//增加浏览量
			long old_count = r.getLong("page_view")==null?0:r.getLong("page_view");
			long new_count = old_count + 1;
			Db.update("UPDATE nm_news_detail SET page_view=? WHERE id=? AND del_flag=0",new_count,id);
			setAttr("pageview", new_count);
			
			render("zxDetail.jsp");
		}else{
			render("/WEB-INF/views/error/404.jsp");
		}
	}
	/**
	 * 资讯搜索
	 * */
	public void search_v1(){
		String title = getPara("title");
		setAttr("title",title);
		int pageNumber = 1;
		String temp = getPara("pageNumber");
		if(temp!=null && !temp.equals("") && temp.matches("[0-9]+")){
			pageNumber = Integer.parseInt(temp);
		}
		int pageSize = 20;//每页条数
		Page<Record> infoPage = InfoMaintain.dao.getInfoByTitle(pageNumber, pageSize, title);
		if(infoPage!=null){
			setAttr("infoList",list(infoPage.getList()));
			setAttr("recordPage",infoPage);
		}
		List<Record> infoList = InfoMaintain.dao.getInfoList();
		if(infoList!=null){
			setAttr("isPicList",newList(infoList,"isPic"));//资讯图片
			setAttr("isNewShowList",newList(infoList,"isNewShow"));//最新展会
		}
		List<AdImages> mediuAdImgList = AdImages.dao.getImgListByLabelID(MID_AD_LABEL_ID);
		setAttr("mediuAdImgList",mediuAdImgList);
		render("searchResult.jsp");
	}
	/**
	 * 分享获取积分
	 * */
	public void share(){
		String href = getPara("href");
		renderJson(new PointController().shareHref(href));
	}
	
	//=============================wyp 2017-01-12=========================================
	/**
	 * 资讯详情
	 */
    @ActionKey("/news/newsitem")
	public void detail(){
		String id = getPara();
        if(StringUtils.isBlank(id)){
            id = getPara("id");
        }
		if(id!=null && !id.equals("") && id.matches("[0-9]+")){
			List<Record> infoList = InfoMaintain.dao.getInfoList();
			if(infoList!=null){
				/*取出本条信息、上一篇和下一篇*/
				for(int i=0; i<infoList.size(); i++){
					String temp =infoList.get(i).get("id").toString(); 
					if(id.equals(temp)){
						if(i!=0){
							setAttr("prevInfo",infoList.get(i-1));
						}
						if(i!=infoList.size()-1){
							setAttr("nextInfo",infoList.get(i+1));
						}
					}
				}
				setAttr("isPicList",newList(infoList,"isPic"));//资讯图片
			}
            Record r = InfoMaintain.dao.getInfoById(id);
            setAttr("info",r);
            setAttr("deal_content",DictUtils.delHTMLTag(null ==  r ? "": r.getStr("new_content")));
            List<Dict> dictList = Dict.dao.getDictsByType("new_type");
			setAttr("dictList",dictList);
			List<Record> attachList = InfoMaintAttachment.dao.getAttachmentById(id);
			setAttr("attachList",attachList);

			//增加浏览量
			long old_count = r.getLong("page_view")==null?0:r.getLong("page_view");
			long new_count = old_count + 1;
			Db.update("UPDATE nm_news_detail SET page_view=? WHERE id=? AND del_flag=0",new_count,id);
			setAttr("pageview", new_count);
			
			//获取今日热门
	        List<Record> today = InfoMaintain.dao.getLatest(4);
	        for(int i=0;i<today.size();i++){
				if(today.get(i).get("content")!=null){
					String con = today.get(i).get("content").toString();
					today.get(i).set("content",DictUtils.delHTMLTag(con));
				}
			}
	        setAttr("today",today);
			
			render("../v2/zixun/detail.jsp");
		}else{
			render("/WEB-INF/views/error/404.jsp");
		}
	}
	
	@ActionKey("/news")
	public void index(){
		List<Record> news = InfoMaintain.dao.getIndexInfo_v2("ep_news", 16);//行业资讯-环保动态
		List<Record> know = InfoMaintain.dao.getIndexInfo_v2("ep_know", 7);//常见环保问题-环保知识
		List<Record> show = InfoMaintain.dao.getIndexInfo_v2("ep_show", 2);//展会信息
		List<Record> youyiList = InfoMaintain.dao.getIndexInfo_v2("youyi_news",16);//优蚁资讯
		for(int i=0;i<news.size();i++){
			if(news.get(i).get("content")!=null){
				String con = news.get(i).get("content").toString();
				news.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
		for(int i=0;i<know.size();i++){
			if(know.get(i).get("content")!=null){
				String con = know.get(i).get("content").toString();
				know.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
		for(int i=0;i<show.size();i++){
			if(show.get(i).get("content")!=null){
				String con = show.get(i).get("content").toString();
				show.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
		for(int i=0;i<youyiList.size();i++){
			if(youyiList.get(i).get("content")!=null){
				String con = youyiList.get(i).get("content").toString();
				youyiList.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
		setAttr("news",news);
		setAttr("know",know);
		setAttr("show",show);
		setAttr("youyiList",youyiList);
		
		//人才招聘
		List<Record> hireList = RecuitmentInfomation.dao.getLastest_v2(5);
		if(hireList!=null){
			for(int i=0;i<hireList.size();i++){
				//招聘人数为0则显示若干
				if(hireList.get(i).get("person_number").equals("0")){
					hireList.get(i).set("person_number","若干");
				}
			}
		}
		setAttr("hireList", hireList);
		
		//轮播广告
		List<Record> adImgList = InfoMaintain.dao.getLatest(3);
        setAttr("adImgList",adImgList);
        
        //新闻排行榜
        List<Record> rank = InfoMaintain.dao.getRankList(10);
        setAttr("rank",rank);
        //获取今日排行
        List<Record> today = InfoMaintain.dao.getTodayList(10);
        setAttr("today",today);
        
      //获取本周排行(如果查询不到数据，最多查询近四周的数据)
        List<Record> week;
        for(int i=-7;i>-30;i-=7){
        	week = InfoMaintain.dao.getWeekList(10, i);
        	if(week.size() > 0){
        		setAttr("week",week);
        		break;
        	}
        }
        
      //获取本月排行(如果查询不到数据，最多查询近三个月的数据)
        List<Record> month;
        for(int i=-30;i>-100;i-=30){
        	month = InfoMaintain.dao.getWeekList(10, i);
        	if(month.size() > 0){
        		setAttr("month",month);
        		break;
        	}
        }
		
		render("../v2/zixun/zixun.jsp");
	}
	
	//环保动态
	@ActionKey("/news/environmental-information")
	public void environmentalInformation(){
		int pageNumber = 1;
		int pageSize = 8;
		String type = "ep_news";
		Page<Record> infoPage = InfoMaintain.dao.getInfoBytype(pageNumber, pageSize, type);
		if(infoPage != null){
			List<Record> infoList = infoPage.getList();
			for(int i=0;i<infoList.size();i++){
				if(infoList.get(i).get("new_content")!=null){
					String con = infoList.get(i).get("new_content").toString();
					infoList.get(i).set("new_content",DictUtils.delHTMLTag(con));
				}
			}
			setAttr("infoList", infoPage.getList());
			setAttr("pageNumner", infoPage.getPageNumber());
			setAttr("totalPage", infoPage.getTotalPage());
		}
		
		//获取今日热门
        List<Record> today = InfoMaintain.dao.getTodayList(4);
        for(int i=0;i<today.size();i++){
			if(today.get(i).get("content")!=null){
				String con = today.get(i).get("content").toString();
				today.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
        setAttr("today",today);
        
		render("../v2/zixun/environmentalInformation.jsp");
	}
	
	//优蚁资讯
	@ActionKey("/news/youyi-news")
	public void youyiInformation(){
		int pageNumber = 1;
		int pageSize = 8;
		String type = "youyi_news";
		Page<Record> infoPage = InfoMaintain.dao.getInfoBytype(pageNumber, pageSize, type);
		if(infoPage != null){
			List<Record> infoList = infoPage.getList();
			for(int i=0;i<infoList.size();i++){
				if(infoList.get(i).get("new_content")!=null){
					String con = infoList.get(i).get("new_content").toString();
					infoList.get(i).set("new_content",DictUtils.delHTMLTag(con));
				}
			}
			setAttr("infoList", infoPage.getList());
			setAttr("pageNumner", infoPage.getPageNumber());
			setAttr("totalPage", infoPage.getTotalPage());
		}
		
		//获取今日热门
        List<Record> today = InfoMaintain.dao.getTodayList(4);
        for(int i=0;i<today.size();i++){
			if(today.get(i).get("content")!=null){
				String con = today.get(i).get("content").toString();
				today.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
        setAttr("today",today);
		render("../v2/zixun/youyiInformation.jsp");
	}
	
	//环保知识
	@ActionKey("/news/knowledge")
	public void knowledge(){
		int pageNumber = 1;
		int pageSize = 8;
		String type = "ep_know";
		Page<Record> infoPage = InfoMaintain.dao.getInfoBytype(pageNumber, pageSize, type);
		if(infoPage != null){
			List<Record> infoList = infoPage.getList();
			for(int i=0;i<infoList.size();i++){
				if(infoList.get(i).get("new_content")!=null){
					String con = infoList.get(i).get("new_content").toString();
					infoList.get(i).set("new_content",DictUtils.delHTMLTag(con));
				}
			}
			setAttr("infoList", infoPage.getList());
			setAttr("pageNumner", infoPage.getPageNumber());
			setAttr("totalPage", infoPage.getTotalPage());
		}
		
		//获取今日热门
        List<Record> today = InfoMaintain.dao.getTodayList(4);
        for(int i=0;i<today.size();i++){
			if(today.get(i).get("content")!=null){
				String con = today.get(i).get("content").toString();
				today.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
        setAttr("today",today);
		render("../v2/zixun/knowledge.jsp");
	}
	
	//展会信息
	@ActionKey("/news/exhibition-information")
	public void exhibitionInformation(){
		int pageNumber = 1;
		int pageSize = 8;
		String type = "ep_show";
		Page<Record> infoPage = InfoMaintain.dao.getInfoBytype(pageNumber, pageSize, type);
		if(infoPage != null){
			List<Record> infoList = infoPage.getList();
			for(int i=0;i<infoList.size();i++){
				if(infoList.get(i).get("new_content")!=null){
					String con = infoList.get(i).get("new_content").toString();
					infoList.get(i).set("new_content",DictUtils.delHTMLTag(con));
				}
			}
			setAttr("infoList", infoPage.getList());
			setAttr("pageNumner", infoPage.getPageNumber());
			setAttr("totalPage", infoPage.getTotalPage());
		}
		
		//获取今日热门
        List<Record> today = InfoMaintain.dao.getTodayList(4);
        for(int i=0;i<today.size();i++){
			if(today.get(i).get("content")!=null){
				String con = today.get(i).get("content").toString();
				today.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
        setAttr("today",today);
		render("../v2/zixun/exhibitionInformation.jsp");
	}
	
	/**
	 *  资讯列表页ajax方法
	 */
	public void getInfoPage(){
		int pageSize = 8;
		int pageNumber = Integer.valueOf(getPara("pageNumber"));
		String type = getPara("type");
		Page<Record> infoPage = InfoMaintain.dao.getInfoBytype(pageNumber, pageSize, type);
		List<Record> list = null;
		if (infoPage != null) {
			list = infoPage.getList();
			for(int i=0;i<list.size();i++){
				//去除html标签
				if(list.get(i).get("new_content") != null){
					String con = list.get(i).get("new_content").toString();
					list.get(i).set("new_content",DictUtils.delHTMLTag(con));
				}
			}
		}
		renderJson(JSONArray.fromObject(list));
	}
	
	/**
	 * 资讯搜索
	 * */
    @ActionKey("/news/search")
	public void search(){
    	String title = getPara("title");
		setAttr("title",title);
		int pageNumber = 1;
		int pageSize = 8;//每页条数
		Page<Record> infoPage = InfoMaintain.dao.getInfoByTitle(pageNumber, pageSize, title);
		if(infoPage!=null){
			List<Record> infoList = infoPage.getList();
			for(int i=0;i<infoList.size();i++){
				if(infoList.get(i).get("new_content")!=null){
					String con = infoList.get(i).get("new_content").toString();
					infoList.get(i).set("new_content",DictUtils.delHTMLTag(con));
				}
			}
			setAttr("infoList", infoPage.getList());
			setAttr("pageNumner", infoPage.getPageNumber());
			setAttr("totalPage", infoPage.getTotalPage());
		}
		

		//获取今日热门
        List<Record> today = InfoMaintain.dao.getTodayList(4);
        for(int i=0;i<today.size();i++){
			if(today.get(i).get("content")!=null){
				String con = today.get(i).get("content").toString();
				today.get(i).set("content",DictUtils.delHTMLTag(con));
			}
		}
        setAttr("today",today);
        
    	render("../v2/zixun/searchResult.jsp");
    }
    
    /**
	 *  资讯搜索翻页ajax方法
	 */
	public void getSearchInfoPage(){
		int pageSize = 8;
		int pageNumber = Integer.valueOf(getPara("pageNumber"));
		String title = getPara("title");
		Page<Record> infoPage = InfoMaintain.dao.getInfoByTitle(pageNumber, pageSize, title);
		List<Record> list = null;
		if (infoPage != null) {
			list = infoPage.getList();
			for(int i=0;i<list.size();i++){
				//去除html标签
				if(list.get(i).get("new_content") != null){
					String con = list.get(i).get("new_content").toString();
					list.get(i).set("new_content",DictUtils.delHTMLTag(con));
				}
			}
		}
		renderJson(JSONArray.fromObject(list));
	}
    
	/**
	 * 人才招聘列表
	 */
	@ActionKey("/news/hiring")
    public void hiring(){
		String type = "pe_hire";
		setAttr("type",type);

		int pageNumber = 1;
		String temp = getPara();
		if(temp!=null && !temp.equals("") && temp.matches("[0-9]+")){
			pageNumber = Integer.parseInt(temp);
		}

		int pageSize = 10;//每页条数

		String pageSizeStr = getPara("pageSize");
		setAttr("pageSize",pageSizeStr);
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		Page<Record> infoPage = RecuitmentInfomation.dao.getAllRecuPage(getParaToInt(0,1),pageSize);
		List<Record> list = null;
		if(infoPage!=null){
			list = infoPage.getList();
			for(int i=0;i<list.size();i++){
				//招聘人数为0则显示若干
				if(list.get(i).get("person_number").equals("0")){
					list.get(i).set("person_number","若干");
				}
			}
			
			setAttr("infoList",list);
			setAttr("recordPage",infoPage);
			setAttr("pageNumner", infoPage.getPageNumber());
			setAttr("totalPage", infoPage.getTotalPage());
		}

		render("/WEB-INF/views/v2/infomaintain/recuitment/recuInfoMore.jsp");
    }
	
	/**
	 *  人才招聘列表翻页ajax方法
	 */
	public void getHiringPage(){
		int pageSize = 10;
		int pageNumber = Integer.valueOf(getPara("pageNumber"));
		Page<Record> infoPage = RecuitmentInfomation.dao.getAllRecuPage(pageNumber,pageSize);
		List<Record> list = null;
		if(infoPage!=null){
			list = infoPage.getList();
			for(int i=0;i<list.size();i++){
				//招聘人数为0则显示若干
				if(list.get(i).get("person_number").equals("0")){
					list.get(i).set("person_number","若干");
				}
			}
		}
		renderJson(JSONArray.fromObject(list));
	}
}
