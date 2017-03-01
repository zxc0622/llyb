package com.qdum.llhb.common.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.google.common.collect.Ordering;
import com.jfinal.core.Controller;

/**
 * 基础controller
 *
 * @author rongchao
 */
public class CommonController extends Controller {

    /**
     * 获取前端传来的数组对象并响应成Model列表
     *
     * @param modelClass
     * @param modelName
     * @return
     * @author yongtree
     * @date 2013-9-26上午10:22:38
     */
    public <T> List<T> getModels(Class<T> modelClass, String modelName) {
        List<String> nos = sort(getModelsNoList(modelName));
        List<T> list = new ArrayList<T>();
        for (String no : nos) {
            T m = getModel(modelClass, modelName + "[" + no + "]");
            if (m != null) {
                list.add(m);
            }
        }
        return list;
    }

    /**
     * 提取model对象数组的标号
     *
     * @param modelName
     * @return
     * @author yongtree
     * @date 2013-9-26上午10:17:14
     */
    @SuppressWarnings("unchecked")
    public List<String> getModelsNoList(String modelName) {
        // 提取标号
        List<String> list = new ArrayList<String>();
        String modelNameAndLeft = modelName + "[";
        Map<String, String[]> parasMap = getRequest().getParameterMap();
        for (Entry<String, String[]> e : parasMap.entrySet()) {
            String paraKey = e.getKey();
            if (paraKey.startsWith(modelNameAndLeft)) {
                String no = paraKey.substring(paraKey.indexOf("[") + 1, paraKey.indexOf("]"));
                if (!list.contains(no)) {
                    list.add(no);
                }
            }
        }
        return list;
    }

    private List<String> sort(List<String> list) {
        Ordering<String> naturalOrdering = Ordering.natural().reverse();
        return naturalOrdering.sortedCopy(list);
    }

    // private class NumComparator implements Comparator<Integer> {
    //
    // @Override
    // public int compare(Integer o1, Integer o2) {
    // return o1 > o2 ? 1 : (o1 == o2 ? 0 : -1);
    // }
    //
    // }

}
