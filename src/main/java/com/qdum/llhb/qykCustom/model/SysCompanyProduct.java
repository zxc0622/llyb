package com.qdum.llhb.qykCustom.model;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import net.sf.json.JSONObject;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.productmana.model.Product;

/**
 * 企业自定义-产品信息
 */
public class SysCompanyProduct extends
		Model<SysCompanyProduct> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyProduct dao = new SysCompanyProduct();
	private Page<Record> prodList;

	/**
	 * 根据user_id查询前8条商品信息
	 */
	public List<Record> findPrdoductByUserId(long user_id){
		String sql = "SELECT * FROM inma_product_info WHERE del_flag = 0 AND sta = 2 AND create_by = ? ORDER BY create_date DESC LIMIT 8";
		return Db.find(sql,user_id);
	}

	//获取产品分类
	public List<Record> getProdTypeByTypeId(int typeId){
		return Db.find("SELECT id,`name` FROM `sys_dict_pcr` WHERE type='equipment_type' and parent_id=? and del_flag=0",typeId);
	}
	
	//根据一级分类和用户id分页获取产品列表
	public Page<Record> getProdByFirstType(Object firstTypeId,int pageSize,int pageNumber,Object userId){
		prodList = Db.paginate(pageNumber, pageSize, "SELECT id,pic1,pro_name", "FROM `inma_product_info` WHERE type_first=? and create_by=?",firstTypeId,userId);
		return prodList;
	}
	
	//更新产品
	public String updateProd(JSONObject prodJson){
		String prodId = prodJson.getString("prodId");
		Product product;
		boolean status=false;
		if("add".equals(prodId)){
			product=new Product();
			setProd(product,prodJson);
			status=product.save();
			prodId=product.get("id").toString();
		}else{
			product=Product.dao.findById(prodId);
			setProd(product,prodJson);
			status=product.update();
		}
		return status?prodId:"false";
	}
	
	//设置产品信息
	private void setProd(Product product,JSONObject prodJson){
		product.set("type_first", prodJson.getInt("firstType"));
		product.set("type_second", prodJson.getInt("secondType"));
		product.set("type_third", prodJson.get("thirdType"));
		product.set("pro_name", prodJson.get("prodName"));
		product.set("prov_id", prodJson.getInt("firstArea"));
		product.set("city_id", prodJson.getInt("secondArea"));
		product.set("pro_desc", prodJson.get("prodDesc"));
		String prodPic = prodJson.getString("pic");
		if(prodPic!=null){
			String [] pics = prodPic.split(",");
			int lenght=pics.length;
			for (int i=0;i<lenght;i++) {
				product.set("pic"+(i+1), pics[i]);
			}
		}
		String pastDate = prodJson.getString("pastDate");
		product.set("past_date", StringUtils.isBlank(pastDate)?"9999-01-01 00:00:00":pastDate);
		product.set("low_price", empyuToNull(prodJson.get("lowPrice")));
		product.set("high_price", empyuToNull(prodJson.get("highPrice")));
		product.set("unit", prodJson.get("prodUnit"));
		product.set("unit_desc", prodJson.get("prodUnitDesc"));
		product.set("amount", empyuToNull(prodJson.get("amount")));
		product.set("create_by", prodJson.getInt("userId"));
		//默认产品审核通过
		product.set("sta", 2);
	}
	
	//空字符串转null
	private static Object empyuToNull(Object obj){
		return "".equals(obj)?null:obj;
	}
	
}
