package com.qdum.llhb.qyk.model;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Library extends Model<Library>{

	/**
	 * 企业库实体
	 */
	private static final long serialVersionUID = 1L;
	public static Library dao = new Library();

	/**
	 * 查询企业资料
	 */
	public Page<Record> searchEnterpriseLibrary(int pageNumber,int pageSize,String prov,String fenlei,String descSj,String descRq,String enterprise){
		String sql=
						" FROM (SELECT"+
						" t.id,"+
						" t.company_name AS companyName,"+
						" t.address,"+
						" t.major,"+
						" t.perform_img AS performImg,"+
						" s. NAME AS prov,"+
						" m. NAME AS city,"+
						" t.phone,"+
						" t.auth_flag AS authFlag,"+
						" t.youyi_flag AS youyiFlag,"+
						" t.x_flag AS xFlag,"+
						" f.zixun_num AS zixunNum,"+
						" f.com_label AS comLabel,"+
						" t.logo_img AS logoImg,"+
						" t.update_date AS updateDate,"+
						" '-1' AS sex"+
						" FROM"+
					" inma_query_ranking q"+
						" LEFT JOIN sys_company t on q.bid_id=t.id"+
							" and t.del_flag='0' and t.auth_flag='1' "+
							" LEFT JOIN sys_area s ON t.loc_prov_id = s.id"+
							" AND s.del_flag = '0'"+
							" LEFT JOIN sys_area m ON t.loc_city_id = m.id"+
							" AND m.del_flag = '0'"+
							" INNER JOIN cs_settings_basic f ON t.user_id = f.user_id"+
							" AND f.del_flag = '0'"+
							" WHERE"+
							" q.del_flag = '0'"+
								" AND q.rank_type = 'E'"+
							" AND q.NAME = '"+enterprise+"'"+
							" union all"+
					" SELECT"+
					"  t.id,"+
					  "  t.company_name AS companyName,"+
					  " t.address,"+
						" t.major,"+
						" t.perform_img AS performImg,"+
						" s. NAME AS prov,"+
						" m. NAME AS city,"+
						" t.phone,"+
						" t.auth_flag AS authFlag,"+
						" 	t.youyi_flag AS youyiFlag,"+
						" t.x_flag AS xFlag,"+
						" f.zixun_num AS zixunNum,"+
						" f.com_label AS comLabel,"+
						" t.logo_img AS logoImg,"+
						" t.update_date AS updateDate,"+
						" '1' AS sex"+
						" 	FROM"+
					" sys_company t"+
						" LEFT JOIN sys_area s ON t.loc_prov_id = s.id"+
							" AND s.del_flag = '0'"+
							" LEFT JOIN sys_area m ON t.loc_city_id = m.id"+
							" AND m.del_flag = '0'"+
							" INNER JOIN cs_settings_basic f ON t.user_id = f.user_id"+
							" AND f.del_flag = '0'"+
							" WHERE"+
					" t.del_flag = '0' and t.auth_flag='1' ";
					if(prov!=null&&!(prov.equals("0"))){
						sql+=" and t.loc_prov_id='"+prov+"'";
					}
					if(fenlei!=null){
						if(fenlei.equals("产生废物")){
							sql+=" and t.type='3'";
						}else if(fenlei.equals("处置废物")){
							sql+=" and t.type='4'";
						}else if(fenlei.equals("环保服务")){
							sql+=" and t.type='5'";
						}else if(fenlei.equals("其他")){
							sql+=" and t.type='6'";
						}
					}
					if(enterprise!=null&&!(enterprise.equals(""))){
						sql+=" and t.company_name like '%"+enterprise+"%'";
					}
					sql+=" ) as s";
					if(descSj!=null){
						if(descSj.equals("1")){
							sql+=" order by s.sex,s.updateDate ";
						}else if(descSj.equals("2")){
							sql+=" order by s.sex,s.updateDate desc";
						}
					}else if(descRq!=null){
						if(descRq.equals("1")){
							sql+=" order by s.sex,s.zixunNum";
						}else if(descRq.equals("2")){
							sql+=" order by s.sex,s.zixunNum desc";
						}
					}else{
						sql+=" order by s.sex,s.zixunNum desc";
					}
		
		//return Db.paginate(pageNumber, pageSize, "select DISTINCT 	s.id,	s. companyName,	s.address,	s.major,	s.performImg,	s.prov,	s.city,	s.phone,	s.authFlag,	s.youyiFlag,	s.xFlag,	s.zixunNum,	s.comLabel,	s.logoImg", sql);
		return Db.paginate(pageNumber, pageSize, "select DISTINCT 	s.id,	s. companyName,	s.address,	s.major,	s.performImg,	s.prov,	s.city,	s.phone,	s.authFlag,	s.youyiFlag,	s.xFlag,	s.zixunNum,	s.comLabel,	s.logoImg, s.sex", sql);
		
	}
	
	//v2 版本新增
	public Page<Record> searchEnterpriseLibrary(int pageNumber,int pageSize,String prov,String type,String enterprise){
		String sql=
			" FROM (SELECT"+
			" t.id,"+
			" t.user_id,"+
			" t.company_name AS companyName,"+
			" t.address,"+
			" t.major,"+
			" t.hbCompany_type,"+
			" t.perform_img AS performImg,"+
			" s. NAME AS prov,"+
			" m. NAME AS city,"+
			" t.phone,"+
			" dict.label as typeName,"+
			" t.auth_flag AS authFlag,"+
			" t.youyi_flag AS youyiFlag,"+
			" t.x_flag AS xFlag,"+
			" f.zixun_num AS zixunNum,"+
			" f.com_label AS comLabel,"+
			" t.logo_img AS logoImg,"+
			" t.update_date AS updateDate,"+
			" '-1' AS sex"+
			" FROM"+
			" inma_query_ranking q"+
			" LEFT JOIN sys_company t on q.bid_id=t.id"+
			" and t.del_flag='0' and t.auth_flag='1' "+
			" LEFT JOIN sys_area s ON t.loc_prov_id = s.id"+
			" AND s.del_flag = '0'"+
			" LEFT JOIN sys_area m ON t.loc_city_id = m.id"+
			" AND m.del_flag = '0'"+
			" LEFT JOIN sys_dict dict ON t.hbCompany_type = dict.value and dict.type='hbCompany_type'"+
			" INNER JOIN cs_settings_basic f ON t.user_id = f.user_id"+
			" AND f.del_flag = '0'"+
			" WHERE"+
			" q.del_flag = '0'"+
			" AND q.rank_type = 'E'"+
//			" AND q.NAME = '"+enterprise+"'"+
			" union all"+
			" SELECT"+
			" t.id,"+
			" t.user_id,"+
			" t.company_name AS companyName,"+
			" t.address,"+
			" t.major,"+
			" t.hbCompany_type,"+
			" t.perform_img AS performImg,"+
			" s. NAME AS prov,"+
			" m. NAME AS city,"+
			" t.phone,"+
			" dict.label as typeName,"+
			" t.auth_flag AS authFlag,"+
			" t.youyi_flag AS youyiFlag,"+
			" t.x_flag AS xFlag,"+
			" f.zixun_num AS zixunNum,"+
			" f.com_label AS comLabel,"+
			" t.logo_img AS logoImg,"+
			" t.update_date AS updateDate,"+
			" '1' AS sex"+
			" FROM"+
			" sys_company t"+
			" LEFT JOIN sys_area s ON t.loc_prov_id = s.id"+
			" AND s.del_flag = '0'"+
			" LEFT JOIN sys_area m ON t.loc_city_id = m.id"+
			" AND m.del_flag = '0'"+
			" LEFT JOIN sys_dict dict ON t.hbCompany_type = dict.value and dict.type='hbCompany_type'"+
			" INNER JOIN cs_settings_basic f ON t.user_id = f.user_id"+
			" AND f.del_flag = '0'"+
			" WHERE"+
			" t.del_flag = '0' and t.auth_flag='1' ";
		if(StringUtils.isNotBlank(prov)&&!(prov.equals("0"))){
			sql+=" and t.loc_prov_id='"+prov+"'";
		}
		if(StringUtils.isNotBlank(type)){
			if("0".equals(type)){
				sql+=" and (t.hbCompany_type IS NULL or t.hbCompany_type='')";
			}else{
				sql+=" and t.hbCompany_type like '%"+type+"%'";
			}
		}
		if(StringUtils.isNotBlank(enterprise)){
			sql+=" and t.company_name like '%"+enterprise+"%'";
		}
		sql+=" ) as s";
		sql+=" LEFT JOIN (SELECT img.cover_img,basic.user_id FROM cs_manage_image_host img LEFT JOIN cs_settings_basic basic ON img.shop_id = basic.id GROUP BY basic.user_id) photo ON s.user_id=photo.user_id";
		return Db.paginate(pageNumber, pageSize, "select DISTINCT s.id,s.companyName,s.address,s.major,s.typeName,s.performImg,s.prov,s.city,s.phone,s.authFlag,s.youyiFlag,s.xFlag,s.zixunNum,s.comLabel,s.logoImg,s.sex,photo.cover_img img", sql);
	}
	
	
}
