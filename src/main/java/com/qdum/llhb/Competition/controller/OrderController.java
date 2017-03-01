package com.qdum.llhb.Competition.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.qdum.llhb.Competition.model.CompetitionMargin;
import com.qdum.llhb.Competition.model.CompetitionMarginBack;
import com.qdum.llhb.Competition.model.CompetitionRecord;
import com.qdum.llhb.Competition.model.TmCompOrder;
import com.qdum.llhb.Competition.model.TmTradeRecord;
import com.qdum.llhb.Competition.vo.OrderStaEnum;
import com.qdum.llhb.fund.model.Fund;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.vo.AjaxBean;

import java.util.Date;
import java.util.List;

/**
 * 类com.qdum.llhb.Competition.controller.OrderController的功能描述：
 *
 * @author wangfeng
 * @date 2016/1/18.
 */
@ControllerBind(controllerKey = "/competition/order")
public class OrderController extends Controller{

    public void index(){
        long uid = UserUtils.getUser().getId();
        String text = getPara("text");
        setAttr("text",text);
        List<Record> zs = TmCompOrder.dao.getOrdersByUser(uid,text);
        setAttr("zs",zs);
        render("order.jsp");
    }
    public void order(){
        long uid = UserUtils.getUser().getId();
        String text = getPara("text");
        setAttr("text",text);
        List<Record> rs = TmCompOrder.dao.getAllRecordByUserId(uid,text);
        setAttr("rs",rs);
        render("ordersecond.jsp");
    }
    public void competiting(){
    	String compTitle = getPara("compTitle");
    	setAttr("compTitle",compTitle);
    	setAttr("startOrderList",TmCompOrder.dao.getStartOrder(UserUtils.getUser().getId(), compTitle));
    	render("postOrder.jsp");
    }
    public void competited(){
    	String compTitle = getPara("compTitle");
    	setAttr("compTitle",compTitle);
    	setAttr("startOrderList",TmCompOrder.dao.getStartOrder(UserUtils.getUser().getId(), compTitle));
    	//render("postOrder.jsp");
    	render("postOrderSecond.jsp");
    }
    //支付
    @Before(Tx.class)//事务拦截
    public void pay(){
    	long id = getParaToLong("id");
    	User user = UserUtils.getUser();
    	TmCompOrder tco = TmCompOrder.dao.findById(id);
    	if(tco==null){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("该订单不存在，请确认后付款");
    		renderJson(ajax);
    		return;
    	}
    	Fund fund = Fund.dao.queryUserFund(user.getId());
    	if(fund==null){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("您的账户资金为0，请充值后付款");
    		renderJson(ajax);
    		return;
    	}
    	double fundAll = fund.getBigDecimal("fund").doubleValue();
    	double amount = tco.getBigDecimal("amount").doubleValue();
    	if(fundAll < amount){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("您的账户资金不足，请充值后付款");
    		renderJson(ajax);
    		return;
    	}
    	//修改订单状态
    	boolean isUpdate = tco.set("order_sta", OrderStaEnum.WAIT_SEND.getValue())
    			.set("update_by",user.getId())
    			.set("update_date", new Date())
    			.update();
    	if(!isUpdate){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("支付失败，请重新付款");
    		renderJson(ajax);
    		return;
    	}
    	//判断是否已付款
    	Record TTR = TmTradeRecord.dao.getOrder(id, user.getId(), "OUT");
    	if(TTR != null){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("您已支付，请勿重复提交");
    		renderJson(ajax);
    		return;
    	}
    	boolean isPay = fund.set("fund", fundAll - amount)
    		.set("update_by",user.getId())
    		.set("update_date", new Date())
    		.update();
    	//退回保证金
    	long compID = tco.getLong("comp_id");
    	Record margin = CompetitionMargin.dao.getMargin(compID, user.getId());
    	double marginMoney = margin.getBigDecimal("margin_money").doubleValue();
    	Fund backFund = Fund.dao.queryUserFund(user.getId());
    	double curFund = backFund.getBigDecimal("fund").doubleValue();
    	boolean backSuccess = backFund.set("fund", marginMoney + curFund).set("update_by",user.getId()).update();
    	if(!backSuccess){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("支付失败,请重新支付");
    		renderJson(ajax);
    		return;
    	}
    	//生成退回保证金记录
    	new CompetitionMarginBack().set("margin_id",margin.getLong("id"))
    	.set("user_id", margin.getLong("user_id"))
    	.set("comp_id", compID)
    	.set("margin_money", marginMoney)
    	.set("remain_sum", marginMoney + curFund)
    	.set("create_user", user.getId())
    	.set("create_time", new Date()).save();
    	/*修改保证金表状态为已退*/
    	new CompetitionMargin().updateSta(margin.getLong("id"));
    	
    	if(!isPay){//支付未成功
    		//生成交易记录
    		new TmTradeRecord().set("user_id",user.getId())
    			.set("order_id",id)
    			.set("record_type", "OUT")//表示支付
    			.set("amount",tco.get("amount"))
    			.set("pay_sta","F")//表示支付不成功
    			.set("remain_amount",fundAll)
    			.set("create_by", user.getId())
    			.set("create_date",new Date())
    			.save();
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("支付失败，请重新支付");
    		renderJson(ajax);
    		return;
    	}
    	//生成交易记录
    	new TmTradeRecord().set("user_id",user.getId())
    		.set("order_id",id)
    		.set("record_type", "OUT")//表示支付
    		.set("amount",tco.get("amount"))
    		.set("pay_sta","S")//表示支付成功
    		.set("remain_amount",fundAll-amount)
    		.set("create_by", user.getId())
    		.set("create_date",new Date())
    		.save();
    	AjaxBean ajax = new AjaxBean();
		ajax.setIsSuccess(true);
		ajax.setMsg("支付成功，保证金已退回，请等待对方发货");
		renderJson(ajax);
    }
    
    /**
     * 发货
     * */
    @Before(Tx.class)//事务拦截
    public void send(){
    	long id = getParaToLong("id");
    	TmCompOrder tco = TmCompOrder.dao.findById(id);
    	if(tco==null){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("该订单不存在，请确认后发货");
    		renderJson(ajax);
    		return;
    	}
    	//修改订单状态
    	boolean isUpdate = tco.set("order_sta", OrderStaEnum.WAIT_RECEIVE.getValue())
    			.set("update_by",UserUtils.getUser().getId())
    			.set("update_date", new Date())
    			.update();
    	if(!isUpdate){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("发货失败，请重新发货");
    		renderJson(ajax);
    		return;
    	}
    	AjaxBean ajax = new AjaxBean();
		ajax.setIsSuccess(true);
		ajax.setMsg("发货成功，请等待对方确认收货");
		renderJson(ajax);
    }
    /**
     * 确认收货
     * */
    @Before(Tx.class)//事务拦截
    public void confirm(){
    	long id = getParaToLong("id");
    	TmCompOrder tco = TmCompOrder.dao.findById(id);
    	if(tco==null){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("该订单不存在，请确认后操作");
    		renderJson(ajax);
    		return;
    	}
    	
    	//修改订单状态
    	boolean isUpdate = tco.set("order_sta", OrderStaEnum.TRADE_END.getValue())
    			.set("update_by",UserUtils.getUser().getId())
    			.set("update_date", new Date())
    			.update();
    	if(!isUpdate){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("确认失败，请重新确认");
    		renderJson(ajax);
    		return;
    	}
    	//判断是否已确认收货
    	Record orderRecord = TmCompOrder.dao.getOrderById(id);//获取卖家信息
    	Record TTR = TmTradeRecord.dao.getOrder(id, orderRecord.getLong("sell_user_id"), "IN");
    	if(TTR != null){
    		AjaxBean ajax = new AjaxBean();
    		ajax.setIsSuccess(false);
    		ajax.setMsg("您已收货，请勿重复提交");
    		renderJson(ajax);
    		return;
    	}
    	Fund fund = Fund.dao.queryUserFund(orderRecord.getLong("sell_user_id"));
    	double fundAll = 0;
    	double amount = tco.getBigDecimal("amount").doubleValue();
    	boolean isSave = false;
    	if(fund == null){
    		fund = new Fund();
	    	if(fund.getBigDecimal("fund")!=null){
	    		fundAll = fund.getBigDecimal("fund").doubleValue();
	    	}
	    	isSave = fund.set("user_id", orderRecord.getLong("sell_user_id"))
			.set("fund",fundAll + amount)
			.set("create_by", UserUtils.getUser().getId())
			.set("create_date",new Date())
			.set("del_flag",0)
			.save();
    	}else{
	    	if(fund.getBigDecimal("fund")!=null){
	    		fundAll = fund.getBigDecimal("fund").doubleValue();
	    	}
	    	isSave = fund.set("user_id", orderRecord.getLong("sell_user_id"))
			.set("fund",fundAll + amount)
			.set("update_by", UserUtils.getUser().getId())
			.set("update_date",new Date())
			.set("del_flag",0)
			.update();
    	}
    	if(!isSave){
    		//生成交易记录
        	new TmTradeRecord().set("user_id", orderRecord.getLong("sell_user_id"))
        		.set("order_id",id)
        		.set("record_type", "IN")//表示支付
        		.set("amount",tco.get("amount"))
        		.set("pay_sta","F")//表示支付成功
        		.set("remain_amount",fundAll-amount)
        		.set("create_by", UserUtils.getUser().getId())
        		.set("create_date",new Date())
        		.save();
    	}
    	//生成交易记录
    	new TmTradeRecord().set("user_id", orderRecord.getLong("sell_user_id"))
    		.set("order_id",id)
    		.set("record_type", "IN")//表示收入
    		.set("amount",tco.get("amount"))
    		.set("pay_sta","S")//表示收款不成功
    		.set("remain_amount",fundAll+amount)
    		.set("create_by", UserUtils.getUser().getId())
    		.set("create_date",new Date())
    		.save();
    	AjaxBean ajax = new AjaxBean();
		ajax.setIsSuccess(true);
		ajax.setMsg("确认成功");
		renderJson(ajax);
    }
}
