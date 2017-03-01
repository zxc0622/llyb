package com.qdum.llhb.integration.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class IntergrationIssue extends Model<IntergrationIssue> {
	/**
	 * 积分发放记录实体
	 */
	private static final long serialVersionUID = 1L;
	public static IntergrationIssue dao = new IntergrationIssue();

	/**
	 * 分页迭代出积分发放记录商品
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<Record> getAll(int pageNumber, int pageSize) {
		String select = "SELECT u.*, p.phone, mp.point_num ";
		String sqlExceptSelect = "FROM sys_user u "
				+ "LEFT JOIN sys_person p ON p.user_id = u.id "
				+ "LEFT JOIN mp_point_main mp ON mp.user_id = u.id ";

		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);

	}

	/**
	 * 分页查询出所需的商品记录。
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @param userName
	 * @param tel
	 * 
	 */
	public Page<Record> getAllSelect(int pageNumber, int pageSize,
			String userName, String tel) {
		String select = "SELECT *";
		String sqlExceptSelect = " from (SELECT u.*, p.phone,mp.point_num FROM sys_user u "
				+ "LEFT JOIN sys_person p ON p.user_id = u.id "
				+ "LEFT JOIN mp_point_main mp ON mp.user_id = u.id)as m ";
		if (!userName.equals("") && tel.equals("")) {
			sqlExceptSelect += " where m.login_name like '%" + userName + "%'";
		} else if (userName.equals("") && !tel.equals("")) {
			sqlExceptSelect += " where m.phone like '%" + tel + "%'";
		} else if (!userName.equals("") && !tel.equals("")) {

			sqlExceptSelect += " where m.login_name like '%" + userName
					+ "%' and " + "m.phone like '%" + tel + "%' ";
		}

		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);

	}

	/**
	 * 分页查询积分发放记录商品明细
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<Record> getAllProduct(int pageNumber, int pageSize, int id) {

		String select = "select d.remarks item, d.*, u.login_name, p.item_desc ";
		String sqlExceptSelect = "from mp_point_change_detail d "
				+ "left join sys_user u on d.create_by = u.id  "
				+ "left join mp_item_point p on d.item_type = p.item_type "
				+ "where d.del_flag = 0 and u.id = ? order by d.create_date desc";
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect, id);

	}
}
