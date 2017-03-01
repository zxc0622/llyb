package com.qdum.llhb.hyzl.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Role;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

import java.util.List;

/**
 * 企业实体
 */
public class Member extends Model<Member> {

    private static final long serialVersionUID = 1L;

    public  static  Member member = new Member();


    public List<Record> getNewComs() {
        String sql = " select m.company_name,m.remarks from t_member m order by m.create_date desc ";
        return Db.find(sql);
    }
}
