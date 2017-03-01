package com.qdum.llhb.environmentRequrie.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import com.jfinal.core.ActionKey;
import com.qdum.llhb.common.utils.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.Quirement;
import com.qdum.llhb.backmana.service.QuirementService;
import com.qdum.llhb.common.security.shiro.SystemAuthorizingRealm.Principal;
import com.qdum.llhb.qiugou.model.CostRecord;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.vo.AjaxBean;

import net.sf.json.JSONObject;
/**
 * @author zhangwn
 * 环保业务需求信息
 */
@ControllerBind(controllerKey="/environmentDetail")
public class environmentDetails extends Controller {
	@ActionKey("/supply-demand/details")
	public void details(){
		User user = UserUtils.getUser();
		String id = getPara();
        if(StringUtils.isBlank(id)){
            id = getPara("requirementId");
        }
		Record re = User.dao.getRequirementById(id);
		if(user.getId()!=null){
			Record u = User.dao.getUserbyId(user.getId());
			setAttr("unLoginUser", "0");//登录的用户.
			Record c;
			if(user.getId()!=null){
				c = CostRecord.dao.getByRequire(id, user.getId());
				if(c!= null){
					setAttr("flag", "0");//已经支付
				}else{
					setAttr("flag", "1");//没有支付
				}
				setAttr("money",u.get("money"));
				}
		}else{
			setAttr("flag", "1");//没有支付
			setAttr("unLoginUser","1");//没有登录的用户.
		}
		setAttr("requirement", re);
		render("detail.jsp");
	}
	
	public void show(){
		User user = UserUtils.getUser();
		String id = getPara();
        if(StringUtils.isBlank(id)){
            id = getPara("requirementId");
        }
		Quirement qrm = Quirement.dao.getRequirementById(id);
		JSONObject jo = new JSONObject();
		
		if(user.getId()!=null){
			Record u = User.dao.getUserbyId(user.getId());
			jo.put("unLoginUser", "0");//已登录
			Record c;
			if(user.getId()!=null){
				c = CostRecord.dao.getByRequire(id, user.getId());
				if(c!= null){
					jo.put("flag", "0");//已经支付
				}else{
					QuirementService.qrmFilter(qrm);
					jo.put("flag", "1");//没有支付
				}
				jo.put("money",u.get("money"));
			}
		}else{
			QuirementService.qrmFilter(qrm);
			jo.put("flag", "1");//没有支付
			jo.put("unLoginUser","1");//没有登录的用户.
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String create_time = sdf.format(qrm.getDate("create_date"));
		jo.put("create_time", create_time);
		jo.put("company_name", qrm.get("company_name"));
		jo.put("name", qrm.get("name"));
		jo.put("phone", qrm.get("phone"));
		jo.put("trade_status", qrm.get("trade_status"));
		jo.put("requirement_describe", qrm.get("requirement_describe"));
		jo.put("id", qrm.get("id"));
		
		renderJson(jo);
	}
	
	/**
	 * 支付优蚁币
	 */
	public void paymoney(){
		User user = UserUtils.getUser();//本地用户 
		String requirementId = getPara("requireUserId");
		JSONObject aj = new JSONObject();
		if(user.getId() != null){
			User u = User.dao.findById(user.getId());//本地用户的id
			if(u.get("money")==null){
				aj.put("msg","余额不足");
				//余额在小于10和大于0之间.为'余额不足'
			}else if(((((BigDecimal)u.get("money")).compareTo(BigDecimal.valueOf(10d)))==-1)&&((((BigDecimal)u.get("money")).compareTo(BigDecimal.valueOf(0)))==1)){
				aj.put("msg","余额不足");
			}else if((((BigDecimal)u.get("money")).compareTo(BigDecimal.valueOf(0)))==0){
				aj.put("msg","余额为零");
			}else{
				u.set("money",((BigDecimal) u.get("money")).subtract(BigDecimal.valueOf(10d)));
				u.update();
				CostRecord r = new CostRecord();
				r.set("user_id", user.getId());
				r.set("hb_id", requirementId);
				r.set("costs", 10);
				r.set("create_by", user.getId());
				r.set("create_time", new Date());
				r.set("remain",u.get("money"));
				r.save();
				Record re = User.dao.getEnviromentCountById(requirementId);
				long count = re.get("usercount");
				Quirement qu = Quirement.dao.findById(requirementId);
				aj.put("comName", qu.get("company_name"));
				aj.put("contact", qu.get("name"));
				aj.put("phone", qu.get("phone"));
				if(count>=3){
					qu.set("trade_status", "洽谈中").update();
				}
				//根据用户ID获取money.
				Record userM = User.dao.getUserbyId(user.getId());
				aj.put("money",userM.get("money"));
				aj.put("msg","ok"); //支付成功
			}
		}else{
			aj.put("msg","请先登录"); 
		}
		renderJson(aj);
	}
	
	/**
	 * 支付优蚁币
	 */
	public void paymoney_v1(){
		User user = UserUtils.getUser();//本地用户 
		String requirementId = getPara("requireUserId");
		AjaxBean aj = new AjaxBean();
		aj.setMsg("");
		if(user.getId() != null){
			User u = User.dao.findById(user.getId());//本地用户的id
			if(u.get("money")==null){
				aj.setMsg("余额不足");
				//余额在小于10和大于0之间.为'余额不足'
			}else if(((((BigDecimal)u.get("money")).compareTo(BigDecimal.valueOf(10d)))==-1)&&((((BigDecimal)u.get("money")).compareTo(BigDecimal.valueOf(0)))==1)){
				aj.setMsg("余额不足");
			}else if((((BigDecimal)u.get("money")).compareTo(BigDecimal.valueOf(0)))==0){
				aj.setMsg("余额为零");
			}else{
				u.set("money",((BigDecimal) u.get("money")).subtract(BigDecimal.valueOf(10d)));
				u.update();
				CostRecord r = new CostRecord();
				r.set("user_id", user.getId());
				r.set("hb_id", requirementId);
				r.set("costs", 10);
				r.set("create_by", user.getId());
				r.set("create_time", new Date());
				r.set("remain",u.get("money"));
				r.save();
				Record re = User.dao.getEnviromentCountById(requirementId);
				long count = re.get("usercount");
				if(count>=3){
					Quirement qu = new Quirement();
					Quirement.dao.findById(requirementId).set("trade_status", "洽谈中").update();
				}
				//根据用户ID获取money.
				Record userM = User.dao.getUserbyId(user.getId());
				aj.setObj(userM.get("money"));
				aj.setMsg("成功支付"); 
			}
		}else{
			aj.setMsg("请先登录"); 
		}
		renderJson(aj);
	}
		
		
	
}
