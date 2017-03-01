package com.jfinal.ext.interceptor;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.PrototypeInterceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.ext.kit.Filter;
import com.jfinal.ext.kit.PageInfo;
import com.jfinal.ext.kit.Reflect;
import com.jfinal.kit.StringKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

public abstract class PageInfoInterceptor extends PrototypeInterceptor {

    private static final String OPERATOR_SUFFIX = "_op";

    private static final String FILTER_PREFIX = "f_";

    private Class<? extends Model> model;

    private Map<Class<? extends Model>, String> relations = Maps.newLinkedHashMap();

    public abstract void config();

    public PageInfoInterceptor setModel(Class<? extends Model> model) {
        this.model = model;
        return this;
    }

    public PageInfoInterceptor addRelation(Class<? extends Model> model, String condition) {
        relations.put(model, condition);
        return this;
    }

    @SuppressWarnings({ "rawtypes" })
    public void doIntercept(ActionInvocation ai) {
        config();
        Controller controller;
        controller = ai.getController();
        PageInfo pageInfo = injectPageInfo(StringKit.firstCharToLowerCase(model.getSimpleName()), controller);
        pageInfo.setPageNumber(controller.getParaToInt("pageNumber", 1));
        pageInfo.setPageSize(controller.getParaToInt("pageSize", PageInfo.DEFAULT_PAGE_SIZE));
        Page page = page(pageInfo);
        controller.setAttr("pageInfo", pageInfo);
        controller.setAttr("page", page);
        controller.keepPara();
        ai.invoke();
    }

    @SuppressWarnings("rawtypes")
    public Page page(PageInfo pageInfo) {
        Table tableinfo = TableMapping.me().getTable(model);
        Map<String, Class<?>> columnTypeMap = Reflect.on(tableinfo).get("columnTypeMap");
        String select = "select ";
        Set<String> set = columnTypeMap.keySet();
        for (String item : set) {
            select += StringKit.firstCharToLowerCase(model.getSimpleName()) + "." + item + " ";
            if (!relations.isEmpty()) {
                select += StringKit.firstCharToLowerCase(model.getSimpleName()) + "_" + item;
            }
            select += ",";
        }
        if (!relations.isEmpty()) {
            Set<Class<? extends Model>> modelClasses = relations.keySet();
            for (Class<? extends Model> modelClass : modelClasses) {
            	Table relationTableinfo = TableMapping.me().getTable(modelClass);
                Map<String, Class<?>> relationColumnTypeMap = Reflect.on(relationTableinfo).get("columnTypeMap");
                set = relationColumnTypeMap.keySet();
                for (String item : set) {
                    select += StringKit.firstCharToLowerCase(modelClass.getSimpleName()) + "." + item + " "
                            + StringKit.firstCharToLowerCase(modelClass.getSimpleName()) + "_" + item + ",";
                }
            }
        }
        List<Object> paras = Lists.newArrayList();
        String sqlExceptSelect = "from " + tableinfo.getName();
        Set<Entry<Class<? extends Model>, String>> entry = relations.entrySet();
        for (Entry<Class<? extends Model>, String> relation : entry) {
            String tableName = TableMapping.me().getTable(relation.getKey()).getName();
            String val = relation.getValue();
            sqlExceptSelect += " join " + tableName + " on ( " + val + ") ";
        }
        sqlExceptSelect += " where 1=1 ";
        List<Filter> filters = pageInfo.getFilters();
        for (Filter filter : filters) {
            String fieldName = filter.getFieldName();
            Object value = filter.getValue();
            if (value == null) {
                continue;
            }
            if (filter.getOperater().equals(Filter.OPERATOR_LIKE)) {
                paras.add("%" + value + "%");
            } else {
                paras.add(value);
            }
            sqlExceptSelect += " and " + fieldName + " " + filter.getOperater() + " ?";
        }
        String sorterField = pageInfo.getSorterField();
        if (sorterField != null) {
            sqlExceptSelect += " order by " + sorterField + " " + pageInfo.getSorterDirection();
        }
        select = select.substring(0, select.length() - 1);
        if (relations.isEmpty()) {
            Model modelInstance = Reflect.on(model).create().get();
            return modelInstance.paginate(pageInfo.getPageNumber(), pageInfo.getPageSize(), select, sqlExceptSelect,
                    paras.toArray(new Object[] {}));
        } else {
            return Db.paginate(pageInfo.getPageNumber(), pageInfo.getPageSize(), select, sqlExceptSelect,
                    paras.toArray(new Object[] {}));
        }
    }

    private PageInfo injectPageInfo(String modelName, Controller controller) {
        PageInfo pageInfo = new PageInfo();
        Map<String, String> model = Maps.newHashMap();
        Map<String, Record> modelPara = Maps.newHashMap();
        List<String> modelNames = Lists.newArrayList();
        modelNames.add(modelName);
        modelPara.put(modelName, new Record());
        Set<Class<? extends Model>> modelClasses = relations.keySet();
        for (Class<? extends Model> modelClasse : modelClasses) {
            String tableName = TableMapping.me().getTable(modelClasse).getName();
            modelNames.add(tableName);
        }

        Map<String, String[]> parasMap = controller.getRequest().getParameterMap();
        for (Entry<String, String[]> e : parasMap.entrySet()) {
            String paraKey = e.getKey();
            for (String entry : modelNames) {
                if (paraKey.startsWith(entry + ".")) {
                    String[] paraValue = e.getValue();
                    String value = paraValue[0] != null ? paraValue[0] + "" : null;
                    model.put(paraKey, value);
                }
            }
        }
        // filter
        Map<String, String> filter = Maps.newLinkedHashMap();
        Set<Entry<String, String>> entries = model.entrySet();
        for (Entry<String, String> entry : entries) {
            String key = entry.getKey();
            for (String item : modelNames) {
                if (key.startsWith(item + "." + FILTER_PREFIX)) { // 过滤条件
                    int index = key.indexOf(FILTER_PREFIX);
                    String value = entry.getValue();
                    if (StringKit.isBlank(value)) {
                        continue;
                    }
//                    int manyIndex = propertyName.lastIndexOf("0");
//                    if(manyIndex < 0)
//                        filterName = propertyName.substring("f_".length());
//                    else
//                        filterName = propertyName.substring("f_".length(),manyIndex);
                    filter.put(key.substring(0, index) + key.substring(index + FILTER_PREFIX.length()), value);
                }
            }
        }
        List<Filter> filters = Lists.newArrayList();
        for (Entry<String, String> entry : filter.entrySet()) {
            String key = entry.getKey();
            if (key.endsWith(OPERATOR_SUFFIX)) { // 操作符
                continue;
            }
            String operater = filter.get(key + OPERATOR_SUFFIX);
            if (StringKit.isBlank(operater)) {
                operater = Filter.OPERATOR_EQ;
            }
            int index = key.indexOf(".");
            modelPara.get(key.substring(0, index)).set(FILTER_PREFIX + key.substring(index + 1, key.length()),
                    entry.getValue());
            filters.add(new Filter(key, entry.getValue(), operater));
        }
        pageInfo.setFilters(filters);
        // sorter
        String sorterField = controller.getRequest().getParameter("sorterField");
        if (StringKit.notBlank(sorterField)) {
            String sorterDirection = controller.getRequest().getParameter("sorterDirection");
            if (StringKit.isBlank(sorterDirection)) {
                sorterDirection = "desc";
            }
            pageInfo.setSorterField(sorterField);
            pageInfo.setSorterDirection(sorterDirection);
        }
        for (Entry<String, Record> item : modelPara.entrySet()) {
            controller.setAttr(item.getKey(), item.getValue());
        }
        return pageInfo;
    }
}
