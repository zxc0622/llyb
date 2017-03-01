package com.qdum.llhb.hyzl.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Record;
import com.oreilly.servlet.Base64Decoder;
import com.qdum.llhb.common.TempFileRender;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.hyzl.model.DictPcr;
import com.qdum.llhb.hyzl.model.Enterprise;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 企业资料
 *
 * @author wcl
 * @time 2015年10月9日 11:55:23
 */
@ControllerBind(controllerKey = "/hyzl")
public class EnterpriseController extends Controller {
	/**
	 * 初始化页面
	 */
	public void EnterpriseDataZero() {
		// 0-一般 1--产废 2--处置
		User user = UserUtils.getUser();
		List<CompanyZl> list = CompanyZl.dao.findCompany(user.getId());
		if (!(list.isEmpty())) {
			setAttr("companyZl", list.get(0));
		}
		setAttr("order", 0);
		render("EnterpriseData.jsp");
	}

	public void EnterpriseDataOne() {
		// 0-一般 1--产废 2--处置
		User user = UserUtils.getUser();
		List<CompanyZl> list = CompanyZl.dao.findCompany(user.getId());
		if (!(list.isEmpty())) {
			setAttr("companyZl", list.get(0));
		}
		setAttr("order", 1);
		render("EnterpriseData.jsp");
	}

	public void EnterpriseDataTwo() {
		// 0-一般 1--产废 2--处置
		User user = UserUtils.getUser();
		List<CompanyZl> list = CompanyZl.dao.findCompany(user.getId());
		if (!(list.isEmpty())) {
			setAttr("companyZl", list.get(0));
		}
		setAttr("order", 2);
		render("EnterpriseData.jsp");
	}

	/**
	 * 行业类别下拉列表
	 */
	public void searchCategory() {
		List<Record> list = DictPcr.dao.findAllList("category_type");
		renderJson(list);
	}

	/**
	 * 所在地区下拉列表
	 */
	public void searchLocProv() {
		String id = "1";
		List<Record> areaList = Area.dao.getChildList2(id);
		renderJson(areaList);
	}

	/**
	 * 所在地区子列表
	 */
	public void searchLocProvZLB() {
		String id = getPara("id");
		List<Record> areaList = Area.dao.getChildList2(id);
		renderJson(areaList);
	}

	/**
	 * 处废物下拉列表
	 */
	public void searchChuFei() {
		String cfid = "346";
		List<Record> list = DictPcr.dao.findChuFeiList(cfid);
		renderJson(list);
	}

	/**
	 * 处废物下拉列表子级
	 */
	public void searchChuFeiZJ() {
		String cfid = getPara("cfid");
		List<Record> list = DictPcr.dao.findChuFeiList(cfid);
		renderJson(list);
	}

	/**
	 * 保存
	 */
	public void saveEnterprise() {
		String hbCompanyType[] = getParaValues("hbCompanyType");//环保公司类型
		String companyName = getPara("companyName");
		String enterpriseType = getPara("enterpriseType");
		String performImg = getPara("performImg");
		String logoImg = getPara("logoImg");
		String sheng = getPara("sheng");
		String shi = getPara("shi");
		String address = getPara("address");
		String postalcode = getPara("postalcode");
		String phoneEnterprise = getPara("phoneEnterprise");
		String companyFax = getPara("companyFax");
		String eMail = getPara("eMail");
		String licenseImg = getPara("licenseImg");
		String companyUrl = getPara("companyUrl");
		String category = getPara("category");
		String major = getPara("major");
		String companyCode = getPara("companyCode");
		String qualImg = getPara("qualImg");
		String waste = getPara("waste");
		String zjcfName = getPara("zjcfName");
		String zjcfName3 = getPara("zjcfName3");
		String Xmapcode = getPara("Xmapcode");
		String Ymapcode = getPara("Ymapcode");

		String fwNAME = getPara("fwNAME");
		String czNAME = getPara("czNAME");
		String hbNAME = getPara("hbNAME");
		String qtNAME = getPara("qtNAME");

		User user = UserUtils.getUser();
		CompanyZl company = new CompanyZl();

		if (fwNAME != "" && fwNAME != null) {
			company.setType(fwNAME);
		}
		if (czNAME != "" && czNAME != null) {
			company.setType(czNAME);
		}
		if (hbNAME != "" && hbNAME != null) {
			company.setType(hbNAME);
		}
		if (qtNAME != "" && qtNAME != null) {
			company.setType(qtNAME);
		}
		
		String hbct = "";
		if(hbCompanyType != null){
			int len = hbCompanyType.length;
			for(int i=0;i<len;i++){
				hbct += hbCompanyType[i]+",";
			}
		}
		company.setHbcompanytype(hbct);
		company.setCompanyname(companyName);
		company.setEnterprisetype(enterpriseType);
		company.setPerformimg(performImg);
		company.setLogoimg(logoImg);
		company.setSheng(Long.parseLong(sheng));
		company.setShi(Long.parseLong(shi));
		company.setAddress(address);
		company.setPostalcode(postalcode);
		company.setPhoneenterprise(phoneEnterprise);
		company.setCompanyfax(companyFax);
		company.setEmail(eMail);
		company.setLicenseimg(licenseImg);
		company.setCompanyurl(companyUrl);
		company.setCategory(Long.parseLong(category));
		company.setMajor(major);
		company.setCompanycode(companyCode);
		if (companyCode != "" && companyCode != null) {
			company.setCompanycode(companyCode);
		} else {
			company.setCompanycode("");
		}
		if (qualImg != "" && qualImg != null) {
			company.setQualimg(qualImg);
		} else {
			company.setQualimg("");
		}
		if (waste != null && waste != "0") {
			company.setWaste(Long.parseLong(waste));

		} else {
			company.setWaste(0L);
		}
		if (zjcfName != null && zjcfName != "0") {
			company.setZjcfname(Long.parseLong(zjcfName));
		} else {
			company.setZjcfname(0L);
		}

		if (zjcfName3 != null && zjcfName3 != "0") {
			company.setZjcfname3(Long.parseLong(zjcfName3));
		} else {
			company.setZjcfname3(0L);
		}
		company.setXmapcode(Xmapcode);
		company.setYmapcode(Ymapcode);
		company.setDelflag(Integer.parseInt("0"));
		company.setAuthflag(Integer.parseInt("0"));
		company.setCreateby(user.getId());
		company.setUserid(user.getId());
		company.setCreatedate("" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		CompanyZl.dao.saveorUpdate(company);
		CompanyZl.dao.updateUserRole(UserUtils.getUser().getId(), company.getType());

		user = User.dao.findById(user.getId());//user会缓存
		boolean flag = false;
		/*Float money = Float.parseFloat(user.get("money").toString());
		if (money == null || money == 0) {
			money=0f;
			money+=1000;
			BigDecimal mon = new BigDecimal(money);
			user.setMoney(mon);
			user.update();
			flag = true;
		}*/
		renderText("" + flag);
		// redirect("/hyzl/EnterpriseDataZero?flag=0");
	}

	/**
	 * 公司名称校验
	 */
	public void jyEnterpriseName() {
		String companyName = getPara("companyName").trim();
		List<Record> list = Enterprise.dao.enterpriseJy(companyName);
		boolean flag = true;
		flag = list.isEmpty();
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("flag", flag);
		renderJson(values);
	}

	/**
	 * WCL</br>
	 * 二〇一五年十月十二日 15:17:45</br>
	 * 添加</br>
	 * 获取图片资源</br>
	 */
	public void findImgResources() {
		String url = this.getPara("imgUrl");

		this.renderFile(new File(url));
	}

//	public void findImgResourcesURL() {
//		String url = PropKit.get("uploadDir") + this.getPara("str");
//		if (PropKit.get("virtualMode").toString().equals("true")) {
//			this.redirect("/pic/" + this.getPara("str"));
//		} else {
//			this.renderFile(new File(url));
//		}
//	}
	
	public void uploadFile() {
		String url = PropKit.get("uploadDir") + this.getPara("str");
		if (PropKit.get("virtualMode").toString().equals("true")) {
			this.redirect("/pic/" + this.getPara("str"));
		} else {
			getResponse().setHeader("Content-Disposition","attachment;filename=文件.jpg");
			this.renderFile(new File(url));
		}
	}
	
	public void findImgResourcesURL() {
		String url = PropKit.get("uploadDir") + this.getPara("str");
		String fileName = this.getPara("filename");
		if(fileName!=null){
			try {
				fileName = URLDecoder.decode(this.getPara("filename"),"UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		File file= new File(url);
		
		//设置头部实现重命名
		//getResponse().setHeader("Content-Disposition","attachment;filename="+fileName);
		/**重命名 start 通过临时文件实现**/
		String copyUrl = null;
		File copyFile=null;
		if(fileName!=null){
			try {
				copyUrl=url.substring(0, url.lastIndexOf("/")+1).concat(fileName);
				copyFile=new File(copyUrl);
				FileUtils.copyFile(file, copyFile);
				this.render(new TempFileRender(copyFile));
				return ;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/**重命名 end**/
		
		if (PropKit.get("virtualMode").toString().equals("true")) {
			this.redirect("/pic/" + this.getPara("str"));
		} else {
			this.renderFile(file);
		}
	}
	
}
