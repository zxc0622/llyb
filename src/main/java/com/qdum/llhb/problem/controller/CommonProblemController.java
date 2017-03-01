package com.qdum.llhb.problem.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.problem.model.Problem;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
@ControllerBind(controllerKey = "/questions")
public class CommonProblemController extends Controller{

	/**
	 *  常见问题维护初始化
	 */
	public void CommonProblemWH(){
		String quesTitle =getPara("quesTitle");
		String quesContent =getPara("quesContent");
		String quesType=getPara("quesType");
		String showOrder=getPara("showOrder");
		setAttr("quesTitle", quesTitle);
		setAttr("quesContent", quesContent);
		setAttr("quesType", quesType);
		setAttr("showOrder", showOrder);
		String id =getPara("id");
		if(id!=null&&!(id.equals(""))){
			List<Record> list =Problem.dao.findProblemId(id);
			setAttr("ProblemList",list.get(0));
		}
		List<DictPcr> dict =DictPcr.dao.findCategoryList("self_help");
		if(dict!=null){
			setAttr("dictList", dict);
		}
		render("problemAdd.jsp");
	}
	
	/**
	 *  常见问题列表初始化
	 */
	public void CommonProblemList(){
		String pageSize = getPara("pageSize");
		if(null == pageSize || "".equals(pageSize)){
			pageSize = "8";
		}
		String selectName=getPara("selectName");
		setAttr("selectName",selectName);
		Page<Record> list = Problem.dao.findProblem(getParaToInt(0, 1),Integer.valueOf(pageSize),selectName);
		if(!(list.getList().isEmpty())){
			setAttr("problemList", list.getList());
			setAttr("recordPage", list);
		}
		List<DictPcr> dict =DictPcr.dao.findCategoryList("self_help");
		if(dict!=null){
			setAttr("dictList", dict);
		}
		render("problemManage.jsp");
	}
	/**
	 *  常见问题预览初始化
	 */
	public void CommonProblemYL(){
		String quesTitle =getPara("quesTitle");
		String quesContent =getPara("quesContent");
		String quesType=getPara("quesType");
		String showOrder=getPara("showOrder");
		setAttr("quesTitle", quesTitle);
		setAttr("quesContent", quesContent);
		setAttr("quesType", quesType);
		setAttr("showOrder", showOrder);
		String quesId =getPara("quesId");
		if(quesId!=null&&!(quesId.equals(""))){
			List<Record> list =Problem.dao.findProblemId(quesId);
			setAttr("ProblemList",list.get(0));
			setAttr("quesId", quesId);
		}
		render("problemPreview.jsp");
	}
	/**
	 * 常见问题发布
	 */
	public void saveProblem(){
		String quesTitle =getPara("quesTitle");
		String quesContent =getPara("quesContent");
		String quesType=getPara("quesType");
		String showOrder=getPara("showOrder");
		String quesId=getPara("quesId");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		User user = UserUtils.getUser();
		if(quesId!=null&&!(quesId.equals(""))){
			Problem problem =new Problem();
			problem.set("id", quesId);
			problem.set("ques_title", quesTitle);
			problem.set("ques_type", quesType);
			problem.set("ques_content", quesContent);
			problem.set("update_date", sdf.format(new Date()));
			problem.set("show_order", showOrder);
			problem.update();
		}else{
			Problem problem =new Problem();
			problem.set("ques_title", quesTitle);
			problem.set("ques_content", quesContent);
			problem.set("ques_type", quesType);
			problem.set("create_date", sdf.format(new Date()));
			problem.set("create_by",user.getId());
			problem.set("show_order", showOrder);
			problem.save();
		}
		redirect("/questions/CommonProblemList");
	}
	/**
	 * 批量删除常见问题
	 */
	public void delProblem(){
		String[] choose=getParaValues("choose");
		if(choose!=null&&choose.length!=0){
			for (int i = 0; i < choose.length; i++) {
				Problem problem=new Problem();
				problem.set("id", choose[i]);
				problem.set("del_flag", "1");
				problem.update();
			}
		}
		redirect("/questions/CommonProblemList");
	}
	/**
	 * 单条删除常见问题
	 */
	public void delQues(){
		String id =getPara("id");
		String flag="";
		try {
			Problem problem=new Problem();
			problem.set("id", id);
			problem.set("del_flag", "1");
			problem.update();
			flag="0";
		} catch (Exception e) {
			flag="1";
		}
		renderJson(flag);
	}
}
