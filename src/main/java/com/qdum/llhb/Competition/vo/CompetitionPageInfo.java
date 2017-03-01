package com.qdum.llhb.Competition.vo;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;
import java.util.Map;

/**
 * 竞品详情首页VO
 * Created by rongchao on 2015/12/23.
 */
public class CompetitionPageInfo {

    /**
     * 竞品详细信息
     */
    //private Record competitionDetail;
    private Map<String, Object> competitionDetail;

    /**
     * 竞品竞买记录
     */
    private Page<Record> competitionRecords;

    public Map<String, Object> getCompetitionDetail() {
        return competitionDetail;
    }

    public void setCompetitionDetail(Map<String, Object> competitionDetail) {
        this.competitionDetail = competitionDetail;
    }

    public Page<Record> getCompetitionRecords() {
        return competitionRecords;
    }

    public void setCompetitionRecords(Page<Record> competitionRecords) {
        this.competitionRecords = competitionRecords;
    }
}
