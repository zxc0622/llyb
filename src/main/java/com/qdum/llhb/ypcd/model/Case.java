package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * @author ZhouXiang
 * @Title: Case
 * @Description: 云图管理-->成功案例
 * @date 2016年5月16日下午3:06:24
 */
public class Case extends Model<Case> {

    private static final long serialVersionUID = 1L;
    public static Case dao = new Case();

    /**
     * @param userID
     * @return
     * @date 2016年5月16日下午3:16:05
     */
    public List<Record> getCaseByUserID(String userID) {
        String sql = "select * from inma_case_info ici where ici.del_flag=0 and ici.user_id= '" + userID + "' order by ici.create_date desc";
        return Db.find(sql);
    }

    /**
     * 通过id查询case
     *
     * @param caseID
     * @return
     * @date 2016年5月17日上午9:53:51
     */
    public Case getCaseByID(String caseID) {
        String sql = "select * from inma_case_info ici where ici.id= " + caseID;
        return Case.dao.findFirst(sql);
    }

    /**
     * 通过id查询case
     *
     * @param caseID
     * @return
     * @date 2016年5月17日下午5:45:16
     */
    public Record getCaseRecordByID(String caseID) {
        String sql = "select * from inma_case_info ici where ici.id= " + caseID;
        return Db.findFirst(sql);
    }

    /**
     * 获取所有的成功案例
     *
     * @param user_id
     * @return
     * @date 2016年5月17日上午9:54:02
     */
    public List<Record> getAllCase(String user_id) {
        String sql = "select ici.* from inma_case_info ici left join sys_user su on ici.user_id = su.id where ici.del_flag=0 and ici.user_id=" + user_id;
        return Db.find(sql);
    }

    /**
     * 分页查询所有的成功案例
     *
     * @param user_id
     * @return
     * @date 2016年5月17日下午5:55:47
     */
    public Page<Record> getFullRecords(int pageNumber, int pageSize, Long user_id) {
        Page<Record> records = null;
        String sql = "from inma_case_info ici left join sys_user su on ici.user_id = su.id where ici.del_flag=0 and ici.user_id =  " + user_id + " order by ifnull(ici.update_date,ici.create_date) desc";
        records = Db.paginate(pageNumber, pageSize, "select ici.* ", sql);
        return records;
    }

    /**
     * 通过创建时间和省份查询
     *
     * @param time
     * @param prov
     * @return
     * @date 2016年5月18日下午3:01:33
     */
    public List<Record> getCaseByCDAndProv(String time, String prov, String user_id) {
        StringBuffer sql = new StringBuffer("select * from inma_case_info ici where ici.del_flag=0 and ici.user_id = " + user_id);
        String dateWhere = " and ici.create_date like '" + time + "%'";
        String provWhere = " and ici.prov_id = " + prov;
        if (time != null && time.length() > 0) {
            sql.append(dateWhere);
        }
        if (prov != null && prov.length() > 0) {
            sql.append(provWhere);
        }
        return Db.find(sql.toString());
    }

    /**
     * 通过case_name和企业Id获取case
     * created by zhouxiang on 2016/08/05
     * @param name
     * @param enterpriseId
     * @return case集合
     */
    public List<Record> getCaseByNameAndEId(String name, String enterpriseId) {
        String sql = "select ici.* from inma_case_info ici  " +
                "inner join sys_company sc on sc.user_id=ici.user_id " +
                "where sc.id='" + enterpriseId + "' and ici.del_flag='0' and ici.sta='2' and ici.case_name like '%" + name + "%'";
        return Db.find(sql);
    }

}
