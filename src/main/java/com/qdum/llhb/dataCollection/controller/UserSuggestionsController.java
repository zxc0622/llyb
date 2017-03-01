package com.qdum.llhb.dataCollection.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.suggestion.model.Suggestion;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.User;

import java.util.List;

/**
 *类UserSuggestionsController的功能描述:查询用户建议列表
 *@author yaoyt
 *@time 16/2/29 上午9:45
 */
@ControllerBind(controllerKey="/dataCollection/userSuggestions")
public class UserSuggestionsController extends Controller {
    
    /**
     *方法index的功能描述:默认处理方法
     *@author yaoyt
     *@time 16/2/29 上午9:46
     */ 
	public void index(){
        int pageSize = 8;
        String temp = getPara("pageSize");
        if(temp!=null && !"".equals(temp) && temp.matches("[0-9]+")){
            pageSize = Integer.parseInt(temp);
        }
        String queryWord = getPara("queryWord") == null ? "" : getPara("queryWord") ;
        Page<Record> recordPage = Suggestion.dao.getAllSuggestions(getParaToInt(0, 1),pageSize,queryWord);
        setAttr("recordPage",recordPage);
        setAttr("queryWord",queryWord);
        render("userSuggestionsList.jsp");

	}

}
