package com.qdum.llhb.recruitment.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 招聘信息
 * Created by Zhouxiang on 2016/8/19.
 */
public class RecuitmentInfomation extends Model<RecuitmentInfomation> {
    public static final RecuitmentInfomation dao = new RecuitmentInfomation();

    /**
     * 根据用户id获取招聘信息列表并分页
     **/
    public Page<Record> getRecuPage(Long createId, int pageNum, int pageSize) {
        String select = "SELECT nhd.* ";
        String sqlExceptSelect = "from nm_hr_detail nhd where nhd.del_flag='0' order by nhd.create_date desc";
        return Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
    }

    /**
     * @param pageNum
     * @param pageSize
     * @return
     */
    public Page<Record> getAllRecuPage(int pageNum, int pageSize) {
        String select = "SELECT nhd.*,concat(a.name,b.name) as location  ";
        String sqlExceptSelect = "from nm_hr_detail nhd left join sys_area a on nhd.prov_id = a.id left join sys_area b on nhd.city_id = b.id where  nhd.del_flag='0' order by nhd.create_date desc";
        return Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
    }

    public boolean isDelete(String[] ids, Long userId) {
        String sql = "update nm_hr_detail set del_flag=1,update_by=" + userId + ",update_date='" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + "' where ";
        for (String s : ids) {
            sql += " id=" + s + " or";
        }
        sql = sql.substring(0, sql.lastIndexOf("or"));//删除多余的or
        int result = Db.update(sql);
        //更新成功返回更新条数
        return result > 0;
    }

    /**
     * 通过ID获取model
     */
    public Record getById(String id) {
        String sql = "select *from nm_hr_detail where del_flag=0 and id=" + id;
        Record result =  Db.findFirst(sql);
        String salary = result.get("salary");
        String salary1 = "";
        String salary2 = "";
        String salary3 = "";
        if("面议".equals(salary)){
            salary3 = "面议";
        }else{
            String sal[] = salary.split("-");
            if(sal.length == 1){
                salary1 = sal[0];
                salary2 = sal[0];
            }else if (sal.length == 2){
                salary1 = sal[0];
                salary2 = sal[1];
            }
        }
        result.set("salary1",salary1);
        result.set("salary2",salary2);
        result.set("salary3",salary3);
        return result;

    }

    /**
     * 通过岗位名称分页查询
     *
     * @param userId
     * @param jobName
     * @param pageNum
     * @param pageSize
     * @return
     */
    public Page<Record> getByJobName(Long userId, String jobName, int pageNum, int pageSize) {
        String select = "SELECT nhd.*   ";
        String sqlExceptSelect = "from nm_hr_detail nhd " +
                "where nhd.create_by = '" + userId + "' and nhd.del_flag='0' and nhd.position like '%" + jobName + "%' " +
                "order by nhd.create_date desc";

        return Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
    }

    /**
     * 获取最新的招聘信息
     *
     * @param length 信息条数
     * @return
     */
    public List<Record> getLastest(int length) {
        String sql = "select * from  nm_hr_detail nhd where nhd.del_flag=0 order by nhd.create_date desc limit 0," + length;
        return Db.find(sql);
    }
    
    public List<Record> getLastest_v2(int length) {
        String sql = "select a.name as cname,h.* from  nm_hr_detail h LEFT JOIN sys_area a ON h.city_id=a.id where h.del_flag=0 order by h.create_date desc limit 0," + length;
        return Db.find(sql);
    }

    /**
     * 通过职位名称获取招聘信息
     * @param pageNum
     * @param pageSize
     * @param position
     * @return
     */
    public Page<Record> getRecuPageByPosition(int pageNum, int pageSize,String position) {
        String select = "SELECT nhd.* ";
        String sqlExceptSelect = "from nm_hr_detail nhd where nhd.position like '%"+position+"%' and nhd.del_flag='0' order by nhd.create_date desc";
        return Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
    }

}

