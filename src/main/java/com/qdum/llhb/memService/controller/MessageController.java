package com.qdum.llhb.memService.controller;


import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.render.Render;
import com.jfinal.upload.UploadFile;
import com.qdum.llhb.backmana.controller.HomeController;
import com.qdum.llhb.common.utils.PageUtils;
import com.qdum.llhb.common.utils.SystemServiceUtil;
import com.qdum.llhb.common.utils.UploadFileUtils;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.memService.model.Attachment;
import com.qdum.llhb.memService.model.BlackList;
import com.qdum.llhb.memService.model.Message;
import com.qdum.llhb.memService.model.MessageText;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.sys.model.*;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.WsUtils;
import com.qdum.llhb.ws.enumvalue.EPAuditStatusEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.OperationLogs;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceMain;
import com.qdum.llhb.ypcd.model.Banner;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 信件类
 * @author wf
 *
 */
@ControllerBind(controllerKey = "/memSerevice/message")
@Before(AdminInterceptor.class)
public class MessageController extends Controller {
	private ServiceMain serviceMainDao = ServiceMain.dao;
	/**
	 * 发送信件 草稿箱的信件内容展示
	 */
	public void index(){
		String uid = getPara("uid");
		if(uid != null){
			User u = User.dao.findById(uid);
			setAttr("uname", u.getLoginName());
		}
		String serviceId = getPara("serviceId");
		setAttr("serviceId", serviceId);
		String source = getPara("source");
		setAttr("source", source);
		String messId = getPara("id");
		if(messId != null){
			String mm = "SELECT mm.*,mt.title,mt.text,mt.id as mid,mt.create_date as mcd,su.login_name FROM ms_mail_message mm LEFT JOIN ms_mail_messagetext mt ON(mm.text_id=mt.id) LEFT JOIN sys_user su ON(mm.rec_id=su.id) WHERE mt.del_flag='0' and su.del_flag='0' and mm.id="+getParaToLong("id");
			Record m = Db.findFirst(mm);
			String sqllist  = "SELECT ma.attach_name,ma.attach_url FROM ms_mail_message mm inner JOIN ms_mail_messagetext mt on(mm.text_id=mt.id) inner JOIN ms_mail_attachment ma on(ma.text_id=mt.id) WHERE  mm.send_del_flag = '0' and mm.id="+getParaToLong("id");
			List<Record> attList = Db.find(sqllist);
			if(attList != null){
				setAttr("attList", attList);
			}
			setAttr("mt", m);
			setAttr("mmid", messId);

			String ss  = "SELECT ma.attach_name,ma.attach_url FROM ms_mail_message mm inner JOIN ms_mail_messagetext mt on(mm.text_id=mt.id) inner JOIN ms_mail_attachment ma on(ma.text_id=mt.id) WHERE  mm.send_del_flag = '0' and mm.id="+getParaToLong("id");
			List<Record> sslist = Db.find(ss);
			JSONArray a = JSONArray.fromObject(sslist);
			setAttr("fs",a);
		}
        User user = UserUtils.getUser();
        String role = user.getRoleNames();
        String admin = "";
        if(role.indexOf("系统管理员")!= -1){
            admin = "admin";
        }
        setAttr("admin",admin);
		render("send.jsp");
	}

    public void saveQunFaInfo(){
        User user = UserUtils.getUser();
        String email = getPara("email");
        String read  = getPara("read");
        String status  = getPara("status");
        String qunfa = getPara("qunfa");
        String qunType = "";
        if("环保公司".equals(email) && qunfa!= null && !"".equals(qunfa)){
            qunType = "5";
        }else if("生产型企业".equals(email) && qunfa!= null && !"".equals(qunfa)){
            qunType = "3";
        }else if("个人会员".equals(email) && qunfa!= null && !"".equals(qunfa)){
            qunType = "1";
        }

        // 设置消息内容表,并保存
        MessageText messageText = new MessageText();
        messageText.set("title", getPara("name"));
        messageText.set("text", getPara("content"));
        messageText.set("create_by", user.getId());
        messageText.set("create_date", new Date());
        messageText.save();

        //消息附件内容初始化并保存
        String attachment = getPara("attachment");
        saveAttachmentsUtil(user,messageText,attachment);

        //保存消息记录表,获取所有消息人
        List<Record> receiveUsers = User.dao.findUserByType(qunType);
        for (Record r: receiveUsers){
            Message message = new Message();
            saveMessageUtil(user,messageText,message,r.getBigInteger("user_id").longValue(),read,status);
        }
        renderText("ok");

    }

    private void saveMessageUtil(User user,MessageText messageText, Message message,Long reid,String read,String status){
        message.set("rec_id", reid);
        message.set("send_id", user.getId());
        message.set("text_id", messageText.getId());
        if(!read.equals("undefined")){
            message.set("receipt", true);//回执
        }else{
            message.set("receipt", false);
        }
        if(status.equals("01")){
            message.set("send_sta", false);
        }else{
            message.set("send_sta", true);
        }
        message.set("create_by", user.getId());
        message.set("create_date", new Date());
        message.save();
    }

    /**
     * 保存附件通用方法
     * @param user
     * @param messageText
     * @param attachment
     */
    private void saveAttachmentsUtil(User user,MessageText messageText, String attachment){
        if(!attachment.equals("")){
            String [] attach = attachment.split(",");
            String [] as = getPara("atts").split(",");
            for(int i=0;i<attach.length;i++){
                Attachment a = new Attachment();
                a.set("text_id", messageText.getId());
                a.set("attach_name", attach[i]);
                a.set("attach_url", as[i]);
                a.set("create_by", user.getId());
                a.set("create_date", new Date());
                a.save();
            }
        }
        //将保存的附件ID更新到messageText表中.
        List<Attachment> atts = Attachment.dao.getAttachByTextId(messageText.getId());
        String ids  = "";
        for(Attachment a:atts){
            ids+=a.get("id");
            ids+=",";
        }
        if(!attachment.equals("")){
            messageText.set("attachment_ids", ids);
        }else{
            messageText.set("attachment_ids","");
        }
        messageText.update();

    }

	/*
	 * 保存信件内容
	 */
	public void saveInfo(){
		User user = UserUtils.getUser();
		String email = getPara("email");
		String msg = "";
		boolean fl = false;
        String sqll = "SELECT * FROM sys_user WHERE del_flag='0' and login_name = ? and login_name != ? ";
        //String sqll = "SELECT * FROM sys_user WHERE del_flag='0' and login_name = ? and login_name = ? ";
        List<User> res = User.dao.find(sqll,email,user.getLoginName());
        if(res.size() == 0){
            renderText("already");
            return;
        }

		String messId = getPara("id");
		boolean flag = false;
		Message message = Message.dao.findById(messId);
		MessageText messageText = null;
		Attachment acmt = new Attachment();
		if(message == null){
			message  = new Message();
			messageText = new MessageText();
			flag = false;
		}else{
			String sql = "SELECT mt.* FROM ms_mail_messagetext mt LEFT JOIN ms_mail_message mm on(mm.text_id=mt.id) WHERE mt.del_flag='0' and mm.id="+getParaToLong("id");
			messageText = MessageText.dao.findFirst(sql);
			flag = true;
			String ee = "SELECT mt.id FROM ms_mail_messagetext mt LEFT JOIN ms_mail_message mm ON(mm.text_id=mt.id) WHERE mm.id="+getParaToLong("id");
			String ss = "DELETE FROM ms_mail_attachment WHERE text_id ="+Db.findFirst(ee).get("id");
			Db.update(ss);
			
		}
		String read  = getPara("read");
		String status  = getPara("status");
		messageText.set("title", getPara("name"));
		messageText.set("text", getPara("content"));
		String attachment = getPara("attachment");
		
		if(flag == true){
			messageText.set("update_by", user.getId());
			messageText.set("update_date", new Date());
			messageText.update();
		}else{
			messageText.set("create_by", user.getId());
			messageText.set("create_date", new Date());
			messageText.save();
		}
		//附件保存
        saveAttachmentsUtil(user,messageText,attachment);

		//message类保存
		Long reid = User.dao.getIdByName(getPara("email")).getId();
		message.set("rec_id", reid);
		message.set("send_id", user.getId());
		message.set("text_id", messageText.getId());
		if(!read.equals("undefined")){
			message.set("receipt", true);//回执
		}else{
			message.set("receipt", false);
		}
		if(status.equals("01")){
			message.set("send_sta", false);
		}else{
			message.set("send_sta", true);
		}
		if(flag == true){
			message.set("update_by", user.getId());
			message.set("update_date", new Date());
			message.update();
		}else{
			message.set("create_by", user.getId());
			message.set("create_date", new Date());
			message.save();
		}
		//危废
		Long serviceId = getParaToLong("serviceId");
		String source = getPara("source");
		if(serviceId!=null){
			//环保方上传报价
			if(source.equals("offer")){
				EpOperation e = EpOperation.dao.getEpOpByServiceIDre(serviceId);
				if(e==null){
					e = new EpOperation();
					e.set("service_id", serviceId);
					e.set("offer_upload","1");
					e.set("create_by",user.getId());
					e.set("create_date",new Date()).save();
				}else{
					e.set("offer_upload","1").update();
				}
				PwOperation p = PwOperation.dao.getPwOpByServiceIDre(serviceId);
				if(p != null){
					if(p.get("offer_agree").equals(0)){
						p.set("offer_agree", null).update();
						
					}
				}
				//审核通过 发送报价 环保方 短信
				/*List<Record> rs = DictPcr.dao.getCodeList();
				for (Record r:rs){
					String code = r.getStr("code");
					if(null != code&&!"".equals(code)){
						ValiCode.sendCheckCode(code,"尊敬的用户，您的危废清单已审核通过。优蚁环保平台已根据废物种类为您提供了报价，请登录到您的用户首页查看新邮件。");
					}
				}*/
                Record r = PwOperation.dao.getPhone(serviceId);
				ValiCode.sendCheckCode( r.getStr("phone"),"尊敬的用户，您的危废清单已审核通过。"+ r.getStr("cName") +"已根据废物种类为您提供了报价，请登录到您的用户首页查看新邮件。",r.getStr("email"));
				OperationLogs opLog = new OperationLogs(); 
				opLog.set("service_id", serviceId);
				opLog.set("type", "PW");
				opLog.set("detail_type", "offer_upload");
				opLog.set("result", "1");
				opLog.set("create_by", user.getId());
				opLog.set("create_date", new Date());
				opLog.set("del_flag", 0);
				opLog.save();
			}else if(source.equals("contract")){
				//主表改为查阅合同
				ServiceMain se = serviceMainDao.findById(serviceId);
				se.setPwStep(PwStepStatusEnum.CONTRACT_STEP.getValue());
				se.update();
				//上传合同 环保方 短信
				/*List<Record> rs = DictPcr.dao.getCodeList();
				for (Record r:rs){
					String code = r.getStr("code");
					if(null != code&&!"".equals(code)){
						ValiCode.sendCheckCode(code,"尊敬的用户，优蚁环保平台已将《合同》发至您的站内信，请登录到您的用户首页查看新邮件确认合同信息。");
					}
				}*/
                Record r = PwOperation.dao.getPhone(serviceId);
				ValiCode.sendCheckCode(r.getStr("phone"),"尊敬的用户，"+ r.getStr("cName") +"已将《合同》发至您的站内信，请登录到您的用户首页查看新邮件确认合同信息。",r.getStr("email"));

			}else if(source.equals("scan")){
				//扫描发送
				PwOperation.dao.findByServiceId(serviceId).set("scan_sta","1").update();
                ServiceMain main = ServiceMain.dao.findById(serviceId);
				String m = main.getCompName();
				if(null == m||"".equals(m)){
					m = user.getLoginName();
				}
                //通知处置公司,用户已上传备案好的管理计划表
                WsUtils.sendMsg("用户"+m+"已上传备案好的管理计划表，请登录平台查看。",main);
			}
		}
		renderText("ok");
	}
	//发件箱 收件箱 草稿箱 回收站
	public void mailbox(){
		String index= getPara("index");
		User user = UserUtils.getUser();
		String conditon = getPara("conditon");
		List<Long> ids = new ArrayList<Long>();
		if(index.equals("2")){
			BlackList blacks = BlackList.dao.getByUserid(user.getId());
			if(blacks != null){
				String black = blacks.get("black_list");
				String [] bls = black.split(" ");
				String sql = "SELECT id FROM sys_user WHERE del_flag='0' and login_name=?";
				int i=0;
				for(String bl :bls){
					User r = User.dao.findFirst(sql,bl);
					if(r != null){
						ids.add(r.getId());
					}
				}
			}
			
		}
		
		List<Record> messages = MessageText.dao.getMessage(user.getId(), index,conditon,ids);
		setAttr("seeContract", getPara("seeContract"));
		setAttr("preUrl",  getRequest().getContextPath());
		setAttr("jumpurl", getSession().getAttribute("sourceUrl"));
		setAttr("messageList", messages);
		setAttr("recordPage", messages);
		setAttr("conditon", conditon);
		setAttr("index", index);
		render("mailbox.jsp");
	}
	
	//删除选中
	public void delete(){
		User user = UserUtils.getUser();
		String [] numbers = getPara("number").split(",");
		Long[] numInt = new Long[numbers.length];
		for(int i=0;i<numbers.length;i++){
			numInt[i]=Long.parseLong(numbers[i].toString());
			Message mt  = Message.dao.getMessageById(Long.parseLong(numbers[i]));
			String index = getPara("index");
			if(index.equals("2")){
				mt.set("recer_del_flag", true);
			}else if(index.equals("0")||index.equals("1")){
				mt.set("send_del_flag", true);
			}else{
				if(user.getId() ==mt.get("send_id")){
					mt.set("send_del_flag", true);
				}else{
					mt.set("recer_del_flag", true);
				}
				
			}
			mt.update();
		}
		renderText("ok");
	}
	/**
	 * 放入回收站
	 * 
	 */
	public void recycle(){
		String [] numbers = getPara("number").split(",");
		Long[] numInt = new Long[numbers.length];
		for(int i=0;i<numbers.length;i++){
			numInt[i]=Long.parseLong(numbers[i].toString());
			Message mt  = Message.dao.getMessageById(numInt[i]);
			String index = getPara("index");
			if(index.equals("2")){
				mt.set("recer_del_sta", true);
			}else{
				mt.set("send_del_sta", true);
			}
			mt.update();
		}
		renderText("ok");
	}
	/**
	 * 标记已读
	 * 
	 */
	public void isRead(){
		String [] numbers = getPara("number").split(",");
		Long[] numInt = new Long[numbers.length];
		for(int i=0;i<numbers.length;i++){
			numInt[i]=Long.parseLong(numbers[i].toString());
			Message mt  = Message.dao.getMessageById(numInt[i]);
			mt.set("rec_sta", true);
			mt.update();
		}
		renderText("ok");
	}
	/**
	 * 清空
	 */
	public void emptydate(){
		User user = UserUtils.getUser();
		String index = getPara("index");
		//List<Message> mes = Message.dao.getMessageByType(index,user.getId());
		List<Message> res = Message.dao.getMessageList(user.getId(), index);
		/*for(Message m:mes){
			if(index.equals("2")){
				m.set("recer_del_sta", true);
			}else if(index.equals("0")||index.equals("1")){
				m.set("send_del_sta", true);
			}else{
				if((Long)user.getId()==m.get("send_id")){
					m.set("send_del_flag", true);
				}else{
					m.set("recer_del_flag", true);
				}
				
			}
			m.update();
		}*/
		for(Message re:res){
			if(index.equals("0")||index.equals("1")){
				re.set("send_del_sta", true);
			}else if(index.equals("2")){
				re.set("recer_del_sta", true);
			}else{
				if(user.getId() ==re.get("send_id")){
					re.set("send_del_flag", true);
				}else{
					re.set("recer_del_flag", true);
				}
			}
			re.update();	
		}
		renderText("ok");
	}
	/**
	 * 信件内容
	 */
	public void content(){
		User user = UserUtils.getUser();
		//String sql="SELECT * FROM ms_mail_messagetext WHERE del_flag = '0' and id="+getParaToLong("id");
		//Record mt = Db.findFirst(sql);
		String mm = "SELECT mm.*,mt.title,mt.text,mt.id as mid,mt.create_date as mcd,u.login_name FROM ms_mail_message mm LEFT JOIN ms_mail_messagetext mt ON(mm.text_id=mt.id) LEFT JOIN sys_user u on mm.rec_id = u.id WHERE mt.del_flag='0' and mm.id="+getParaToLong("id");
		Record m = Db.findFirst(mm);
		String sqllist  = "SELECT ma.attach_name,ma.attach_url FROM ms_mail_message mm LEFT JOIN ms_mail_messagetext mt on(mm.text_id=mt.id) LEFT JOIN ms_mail_attachment ma on(ma.text_id=mt.id) WHERE  mm.id="+getParaToLong("id");
		String index = getPara("index");
		if(index.equals("0")||index.equals("1")){
			sqllist+=" and mm.send_del_flag = '0' ";
		}else if(index.equals("2")){
			sqllist+=" and mm.recer_del_flag = '0' ";
		}else{
			if(user.getId() ==m.get("send_id")){
				sqllist+=" and mm.send_del_flag = '0' ";
			}else{
				sqllist+=" and mm.recer_del_flag = '0' ";
			}
		}
		List<Record> attList = Db.find(sqllist);
		if(index.equals("2")){
			Message mt  = Message.dao.getMessageById(getParaToLong("id"));
			mt.set("rec_sta", true);
			mt.update();
		}
		if(attList != null){
			setAttr("attList", attList);
		}
		setAttr("index", index);
		setAttr("mt", m);
		render("content.jsp");
	}
	//上传附件
	public void fileUploadServer() {
        long attachment_file = 0;
        try {
            //attachment_file = getFile("attachment_file").getFile().length();
            /*if(attachment_file>1024*1024*10){
                renderText("false");
            }else{*/
                UploadFileUtils uploadFileImg	=new  UploadFileUtils();
                String fileName =getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+getRequest().getContextPath()+"/hyzl/findImgResourcesURL?str="+uploadFileImg.UploadFileMain(getFile("attachment_file"),null);
                renderText(fileName);
            //}
        } catch (Exception e) {
            renderText("false");
        }


	}
	//清理
	public void clean(){
		render("clean.jsp");
	}
	
	//设置
	public void setup(){
		User user = UserUtils.getUser();
		Record bl = BlackList.dao.getRecordByUserid(user.getId());
		setAttr("bl", bl);
		render("setup.jsp");
	}
	/**
	 * 清理
	 */
	public void cleanS(){
		User user = UserUtils.getUser();
		List<Message> res = Message.dao.getMessageList(user.getId(), getPara("ss"));
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date begin = null;
		Date end  = null;
		Calendar calendar =new GregorianCalendar();
		//String zhuan = getParaToBoolean();
		try {
			begin = df.parse(getPara("begin"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			end = df.parse(getPara("end"));
			calendar.setTime(end);
			calendar.add(Calendar.DATE,1);
			end=calendar.getTime(); 
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String index = getPara("ss");
		for(Message re:res){
			Date cu = re.get("create_date");
			if((cu.getTime()<end.getTime())&&(cu.getTime()>begin.getTime())){
				if(index.equals("0")||index.equals("1")){
					re.set("send_del_flag", true);
				}else if(index.equals("2")){
					re.set("recer_del_flag", true);
				}else{
					if(user.getId() ==re.get("send_id")){
						re.set("send_del_flag", true);
					}else{
						re.set("recer_del_flag", true);
					}
				}
				//re.set("redirect", value)
				re.update();
			}
		}
		renderText("ok");
	}
	/*
	 * 设置中的保存
	 */
	public void saveSetup(){
		User user = UserUtils.getUser();
		BlackList bl = BlackList.dao.getByUserid(user.getId());
		boolean flag = false;
		if(bl == null){
			bl = new BlackList();
			flag = true;
		}
		/*if(!getPara("radios").equals("undefined")){
			bl.set("redirect", getPara("radios"));
		}*/
		bl.set("user_id", user.getId());
		bl.set("black_list", getPara("names"));
		if(flag == false){
			bl.set("update_by", user.getId());
			bl.set("update_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			bl.update();
		}else{
			bl.set("create_by", user.getId());
			bl.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			bl.save();
			
		}
		renderText("ok");
	}
	/**
	 * 校验要发送的人
	 */
	public void userExists(){
		User user = UserUtils.getUser();
		String name = getPara("name");
		boolean flag = false;
		String sql = "SELECT * FROM sys_user WHERE del_flag='0' ";
		List<User> res = User.dao.find(sql);
		for(User u:res){
			if(name.equals(u.get("login_name"))&&!(user.getLoginName().equals(name))){
				flag = true;
				break;
			}
		}
		if(flag == true){
			renderText("ok");
		}else{
			renderText("error");
		}
	}
	/**
	 * 附件下载
	 */
	public void download(){
		String sql = "SELECT * FROM ms_mail_attachment WHERE del_flag='0' and attach_name='"+getPara("name")+"'";
		String filename = Attachment.dao.findFirst(sql).get("attach_url");
		renderText(filename);
	}
	/**
	 * 回收站里的信件还原
	 */
	public void huanyuan(){
		String [] numbers = getPara("number").split(",");
		Long[] numInt = new Long[numbers.length];
		for(int i=0;i<numbers.length;i++){
			numInt[i]=Long.parseLong(numbers[i].toString());
			Message mt  = Message.dao.getMessageById(numInt[i]);
			String index = getPara("index");
			boolean a = mt.get("recer_del_sta");
			boolean b = mt.get("send_del_sta");
			if(a == true){
				mt.set("recer_del_sta", false);
			}else if(b == true){
				mt.set("send_del_sta", false);
			}
			mt.update();
		}
		renderText("ok");
	}
	/**
	 * 附件列表
	 */
	public void fujianlist(){
		String sqllist  = "SELECT ma.* FROM ms_mail_message mm LEFT JOIN ms_mail_messagetext mt on(mm.text_id=mt.id) LEFT JOIN ms_mail_attachment ma on(ma.text_id=mt.id) WHERE  mm.send_del_flag = '0' and mm.id="+getParaToLong("id");
		List<Record> attList = Db.find(sqllist);
		/*String a = attList.get(0).get("attach_name");
		String b = attList.get(0).get("attach_url");
		if(attList.size()==1&&a==null&&b==null){
			renderNull();
		}else{
			
		}*/

		renderJson(attList);
		
	}
	/**
	 * 返回危废
	 */
	public void weifei(){
		getSession().removeAttribute("sourceUrl");
		renderText("ok");
	}
	/**
	 * 信件保存
	 */
	public void messageSave(){
		User user = UserUtils.getUser();
		String name = getPara("name");
		String msg = "";
		boolean flag = false;
		String sql = "SELECT * FROM sys_user WHERE del_flag='0' ";
		List<User> res = User.dao.find(sql);
		for(User u:res){
			if(name.equals(u.get("login_name"))&&!(user.getLoginName().equals(name))){
				flag = true;
				break;
			}
		}
		if(flag == false){
			renderText("请输入有效的收件人地址");
			return;
		}


	}
	
}
