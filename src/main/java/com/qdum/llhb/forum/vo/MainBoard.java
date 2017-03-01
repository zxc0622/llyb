package com.qdum.llhb.forum.vo;

import java.util.List;

/**
 * Created by chao on 2016/1/15.
 */
public class MainBoard {

    private Long mainID;

    private String mainName;

    private String masterName;

    private List<ChildBoard> childBoard;

    public Long getMainID() {
        return mainID;
    }

    public void setMainID(Long mainID) {
        this.mainID = mainID;
    }

    public String getMainName() {
        return mainName;
    }

    public void setMainName(String mainName) {
        this.mainName = mainName;
    }

    public String getMasterName() {
        return masterName;
    }

    public void setMasterName(String masterName) {
        this.masterName = masterName;
    }

    public List<ChildBoard> getChildBoard() {
        return childBoard;
    }

    public void setChildBoard(List<ChildBoard> childBoard) {
        this.childBoard = childBoard;
    }

    public void putChildBoard(ChildBoard childBoard) {
        this.childBoard.add(childBoard);
    }
}
